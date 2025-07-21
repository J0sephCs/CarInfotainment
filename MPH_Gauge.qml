import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.15
import QtQuick.Extras.Private 1.0
import QtGraphicalEffects 1.0




CircularGauge {

    id: gauge

    property real arcAngle: 180
    property real arcRadius: 90
    property string speedColor: "yellow"

    // function speedColor(value){
    //     if(value < 60){
    //         return "green"
    //     }
    //     else if(value > 60 && value < 150){
    //         return "yellow"
    //     }
    //     else{
    //         return "Red"
    //     }
    // }

    style: CircularGaugeStyle{
        labelStepSize: 10
        labelInset: outerRadius / 2.2
        tickmarkInset: outerRadius / 4.2

        minorTickmarkInset: outerRadius / 4.2
        minimumValueAngle: -155
        maximumValueAngle: 155

        background: Rectangle{
            implicitHeight: gauge.height
            implicitWidth: gauge.width
            color: "transparent"
            anchors.centerIn: parent
            radius: 360

            Component.onCompleted: {
                gauge.valueChanged.connect(function(){
                    circularCanva.requestPaint();
                    middleCanva.requestPaint();
                    innerCanva.requestPaint();

                })

            }



            Image {
                sourceSize: Qt.size(16,17)
                source: "qrc:/CarInfotainment/Images/maxLimit.svg"

                x: arcRadius * Math.cos(Math.PI * arcAngle / 180)
                y: arcRadius * Math.sin(Math.PI * arcAngle / 180)

                anchors.bottom: circularCanva.top
                anchors.horizontalCenter: parent.horizontalCenter

            }

            Canvas{
                id: circularCanva
                property int value: gauge.value
                anchors.fill: parent

                function degreesToRadians(degrees){
                    return degrees * (Math.PI / 180);
                }

                onPaint: {
                    var ctx= getContext("2d");
                    ctx.reset();

                    var gradientColors= ["yellow" ,"gold", "#ffbf00"];
                    var startAngle= degreesToRadians(valueToAngle(gauge.minimumValue) - 90);
                    var endAngle= degreesToRadians(valueToAngle(250) - 90);

                    var gradient= ctx.createRadialGradient(outerRadius, outerRadius, 5, outerRadius, outerRadius, outerRadius);

                    if(gradientColors.length > 1){
                        for(var i=0; i<gradientColors.length; i++){
                            gradient.addColorStop(i / (gradientColors.length -1), gradientColors[i]);
                        }
                    }

                    ctx.beginPath();
                    ctx.lineWidth= 2.5;
                    ctx.strokeStyle= gradient;
                    ctx.arc(outerRadius,
                            outerRadius,
                            outerRadius-57,
                            startAngle,
                            endAngle);
                    ctx.stroke();
                }
            }


            Canvas{
                id: middleCanva
                property int value: gauge.value
                anchors.fill: parent

                function degreesToRadians(degrees){
                    return degrees * (Math.PI / 180);
                }

                onPaint: {
                    var ctx= getContext("2d");
                    ctx.reset();

                    var gradientColors= ["#163546", "#163546"];
                    var startAngle= degreesToRadians(valueToAngle(gauge.minimumValue)- 90);
                    var endAngle= degreesToRadians(valueToAngle(250) - 90);

                    var gradient= ctx.createRadialGradient(outerRadius, outerRadius, 5, outerRadius, outerRadius, outerRadius);


                    if(gradientColors.length > 1){
                        for(var i=0; i<gradientColors.length; i++){
                            gradient.addColorStop(i / (gradientColors.length-1), gradientColors[i]);
                        }
                    }

                    ctx.beginPath();
                    ctx.lineWidth= outerRadius * 0.15
                    ctx.strokeStyle= gradient
                    ctx.arc(outerRadius,
                            outerRadius,
                            outerRadius - 75,
                            startAngle,
                            endAngle);
                    ctx.stroke();
                }
            }






            Canvas{
                id: innerCanva
                property int value: gauge.value
                anchors.fill: parent

                function degreesToRadians(degrees){
                    return degrees * (Math.PI/180);
                }

                onPaint:{
                    var ctx= getContext("2d");
                    ctx.reset();
                    //#6369FF

                   var gradientColors= ["#004999", "#63FFFF", "red"];

                    var startAngle= degreesToRadians(valueToAngle(gauge.minimumValue)-90);
                    var endAngle= degreesToRadians(valueToAngle(gauge.value)-90);

                    var gradient= ctx.createRadialGradient(outerRadius, outerRadius, 5, outerRadius, outerRadius, outerRadius);

                    for(var i=0; i<gradientColors.length; i++){
                        gradient.addColorStop(i / (gradientColors.length-1), gradientColors[i]);
                    }


                    ctx.beginPath();
                    ctx.lineWidth= outerRadius * 0.15;
                    ctx.strokeStyle= gradient;
                    ctx.arc(outerRadius,
                            outerRadius,
                            outerRadius-75,
                            startAngle,
                            endAngle);
                    ctx.stroke();

                }

            }

        }

        needle: Item{
            y: -outerRadius * 0.70
            height: outerRadius * 0.02
            Image{
                id: needle
                source: "qrc:/CarInfotainment/Images/needle_red.svg"
                width: height * 0.10
                asynchronous: true
                antialiasing: true

            }

            Glow{
                anchors.fill: needle
                radius: 5
                samples: 10
                color: "red"
                source: needle
            }
        }

        foreground: Item{
            anchors.centerIn: parent
            Image{
                anchors.centerIn: parent
                source: "qrc:/CarInfotainment/Images/NORM_gauge.svg"

                Image {
                    sourceSize: Qt.size(203,203)
                    anchors.centerIn: parent
                    source: "qrc:/CarInfotainment/Images/NORM_BACK.svg"

                    Image {
                        z: 2
                        sourceSize: Qt.size(147,147)
                        anchors.centerIn: parent
                        source: "qrc:/CarInfotainment/Images/Ellipse 6.svg"

                        ColumnLayout{
                            anchors.centerIn: parent
                            Label{
                                text: gauge.value.toFixed(0);
                                font.pixelSize: 65
                                font.family: "Inter"
                                color: "#C50212"
                                font.bold: Font.DemiBold
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Label{
                                text: "MPH"
                                font.pixelSize: 18
                                font.family: "Inter"
                                color: "#C50212"
                                font.bold: Font.Normal
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }
                    }
                }
            }
        }


        tickmarkLabel: Text{
            visible: false
            font.pixelSize: Math.max(6, outerRadius * 0.05)
            text: styleData.value
            color: styleData.value <= gauge.value ? "#FBFFFF" : "#777776"
            antialiasing: true
        }

        tickmark: Rectangle{
            implicitWidth: outerRadius * 0.008
            implicitHeight: outerRadius * 0.05

            antialiasing: true
            smooth: true
            color: styleData.value <= gauge.value ? "#FBFFFF" : "darkGray"
        }

        minorTickmark: Rectangle{
            implicitWidth:  outerRadius * 0.008
            implicitHeight: outerRadius * 0.05

            antialiasing: true
            smooth: true
            color: styleData.value <= gauge.value ? "#FBFFFF" : "darkGray"
        }
    }
}
