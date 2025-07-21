import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.15
import QtQuick.Extras.Private 1.0
import QtGraphicalEffects 1.0



CircularGauge {

    id: rpm_gauge

    property real arcAngle: 180
    property real arcRadius: 90
   property string speedColor: "yellow"

    // function speedColorProvider(value){
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


    function speedColorProvider(value){
        if(value < 80){
            return "#ffbf00"
        }
        else{
            return "#C50212"
        }
    }



    style: CircularGaugeStyle{
        labelStepSize: 10
        labelInset: outerRadius * 0.4
        tickmarkInset: outerRadius / 4.2
        minorTickmarkInset: outerRadius / 4.2
        minimumValueAngle: -155
        maximumValueAngle: 155




        background: Rectangle{
            implicitHeight: rpm_gauge.height
            implicitWidth: rpm_gauge.width
            color: "transparent"
            anchors.centerIn: parent
            radius: 360

            Component.onCompleted: {
                rpm_gauge.valueChanged.connect(function(){
                    circularCanva.requestPaint();
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
                property int value: rpm_gauge.value
                anchors.fill: parent

                function degreesToRadians(degrees){
                    return degrees * (Math.PI / 180);
                }



                onPaint: {
                    var ctx= getContext("2d");
                    ctx.reset();

                    var gradientColors= ["#ffbf00", "white"];
                    var startAngle= degreesToRadians(valueToAngle(rpm_gauge.minimumValue) - 90);
                    var endAngle= degreesToRadians(valueToAngle(rpm_gauge.value) - 90);

                    var gradient= ctx.createRadialGradient(outerRadius, outerRadius, 5, outerRadius, outerRadius, outerRadius);

                    for(var i=0; i<gradientColors.length; i++){
                        var color= speedColorProvider(rpm_gauge.value);
                        speedColor= color;
                        gradient.addColorStop(i / (gradientColors.length -1), color);
                    }

                    ctx.beginPath();
                    ctx.lineWidth= outerRadius * 0.225;
                    ctx.strokeStyle= speedColor;
                    ctx.arc(outerRadius,
                            outerRadius,
                            outerRadius- ctx.lineWidth /2,
                            startAngle,
                            endAngle);
                    ctx.stroke();



                    var arcStart= degreesToRadians(valueToAngle(200) - 90);
                    var arcEnd= degreesToRadians(valueToAngle(250) - 90);

                    ctx.beginPath();
                    ctx.lineWidth= outerRadius * 0.020;
                    ctx.strokeStyle= "#C50212"
                    ctx.arc(outerRadius,
                            outerRadius,
                            outerRadius - (outerRadius / 4.2),
                            arcStart,
                            arcEnd);
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
                                text: rpm_gauge.value.toFixed(0);
                                font.pixelSize: 65
                                font.family: "Inter"
                                color: "#C50212"
                                font.bold: Font.DemiBold
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Label{
                                text: "RPM"
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
            visible: true
            font.pixelSize: Math.max(6, outerRadius * 0.07)
            text: styleData.value
            color: styleData.value >= 200 ? "#C50212" :  "#FBFFFF"
            antialiasing: true


        }

        tickmark: Rectangle{
            implicitWidth: outerRadius * 0.008
            implicitHeight: outerRadius * 0.05

            antialiasing: true
            smooth: true
            color: styleData.value >= 200 ? "#C50212" :  "#FBFFFF"
        }

        minorTickmark: Rectangle{
            implicitWidth:  outerRadius * 0.008
            implicitHeight: outerRadius * 0.05
            visible: styleData.value < 200
            antialiasing: true
            smooth: true
            color: styleData.value <= rpm_gauge.value ? "#FBFFFF" : "darkGray"
        }
    }


}
