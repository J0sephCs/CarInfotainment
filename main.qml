import QtQuick 2.15
import CustomControls 1.0
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import "./"

ApplicationWindow {
    width: 800
    height: 650
    // width: 1920
    // height: 960
    visible: true
    color: "#00091a"
    title: qsTr("Car DashBoard")
    property int nextSpeed: 60


    function generateRandom(maxLimit = 70){
        let rand= Math.random() * maxLimit;
        rand= Math.floor(rand);
        return rand;
    }


    function speedColor(value){
        if(value < 60){
            return "green"
        }
        else if(value > 60 && value < 150){
            return "yellow"
        }
        else{
            return "Red"
        }
    }


    Timer{
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            currentTime.text= Qt.formatDateTime(new Date(), "hh:mm AP")
        }
    }

    Timer{
        repeat: true
        interval: 3000
        running: true
        onTriggered: {
            nextSpeed= generateRandom()
        }
    }

    Shortcut{
        sequence: "Ctrl+Q"
        context: Qt.ApplicationShortcut
        onActivated: Qt.quit()
    }


    Image{
        id: dashboard
        width: parent.width
        height: parent.header
        anchors.centerIn: parent
    }

    //Top bar of screen
    Image{
        id: topBar
        //width: 1357
        width: parent.width
        source: "qrc:/CarInfotainment/Images/NORM_TOP.svg"

        anchors{
            top: parent.top
            topMargin: 26.50
            horizontalCenter: parent.horizontalCenter
        }

        Image{
            id: headLight
            property bool indicator: false
            width: 42.5
            height: 38.25
            anchors{
                top: parent.top
                topMargin: 25
                leftMargin: 230
                left: parent.left
            }

            source: indicator ? "qrc:/CarInfotainment/Images/Low beam headlights.svg" : "qrc:/CarInfotainment/Images/Low_beam_headlights_white.svg"
            Behavior on indicator {NumberAnimation{duration: 300}}
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    headLight.indicator= !headLight.indicator
                }
            }
        }

        Label{
            id: currentTime
            text: Qt.formatDateTime(new Date(), "hh:mm AP")
            font.pixelSize: 32
            font.family: "Inter"
            font.bold: Font.DemiBold
            color: "#FFFFFF"
            anchors.top: parent.top
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
        }



        Label{
            id: currentDate
            text: Qt.formatDateTime(new Date(), "MM/dd/yyyy")
            font.pixelSize: 32
            font.family: "Inter"
            font.bold: Font.DemiBold
            color: "#FFFFFF"
            anchors.right: parent.right
            anchors.rightMargin: 230
            anchors.top: parent.top
            anchors.topMargin: 25
        }
    }


    MPH_Gauge{
        id: rightGauge
        anchors{
            top: parent.top
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: parent.width / 7
        }
        property bool accelerating
        width: 400
        height: 400
        value: accelerating ? maximumValue : 0
        maximumValue: 250
        Component.onCompleted: forceActiveFocus()
        Behavior on value {NumberAnimation {duration: 2500}}

        Keys.onSpacePressed: accelerating = true
        Keys.onReturnPressed: leftGauge.accelerating = true
        Keys.onReleased: {
            if(event.key === Qt.Key_Space){
                accelerating= false;
                event.accepted= true;
            }
            else if(event.key === Qt.Key_Return){
                leftGauge.accelerating = false;
                event.accepted= true;
            }
        }


        // Controls Lights
        Keys.onPressed: {

            if(event.key === Qt.Key_V){
                firstRightIndicator.sheetBelt = !firstRightIndicator.sheetBelt
                event.accepted= true;
            }
            else if(event.key === Qt.Key_Z){
                event.accepted= true;
                secondRightIndicator.indicator = !secondRightIndicator.indicator
            }
            else if(event.key === Qt.Key_X){
                event.accepted= true;
                thirdRightIndicator.indicator = !thirdRightIndicator.indicator
            }
            else if(event.key === Qt.Key_M){
                fourthRightIndicator.indicator = !fourthRightIndicator.indicator
                event.accepted= true;
            }
            else if(event.key === Qt.Key_L){
                firstLeftIndicator.rareLightOn = !firstLeftIndicator.rareLightOn
                event.accepted= true;
            }
            else if(event.key === Qt.Key_N){
                secondLeftIndicator.headLightOn = !secondLeftIndicator.headLightOn
                event.accepted= true;
            }
            else if(event.key === Qt.Key_B){
                thirdLeftIndicator.lightOn = !thirdLeftIndicator.lightOn
                event.accepted= true;
            }
            else if(event.key === Qt.Key_C){
                fourthLeftIndicator.parkingLightOn = !fourthLeftIndicator.parkingLightOn
                event.accepted= true;
            }
        }

        Label{
            text: "🔋 Eco"
            font.bold: true
            font.weight: Font.Normal
            font.pixelSize: 22
            font.family: "TacticSans-Med"
            color: "#2BD150"
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -5
            anchors.verticalCenterOffset: parent.height * 0.2
            layer.effect: DropShadow{
                anchors.fill: parent
                horizontalOffset: 5
                verticalOffset: 5
                radius: 10
                samples: 16
                color: "white"
            }
        }

    }

    MusicPlayer{
        id: musicPlayer
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 210
    }

    TmpGauge{
        id: tmpGauge
        focus: true
        Component.onCompleted: forceActiveFocus()
        anchors{
            bottom: gears.top
            bottomMargin: 30
            horizontalCenter: gears.horizontalCenter

            right: parent.right
            rightMargin: parent.width / 10
        }
    }


    RPM_Gauge{
        id: leftGauge
        anchors{
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: parent.width / 7
        }
        property bool accelerating
        width: 400
        height: 400
        value: accelerating ? maximumValue : 0
        maximumValue: 250
        Component.onCompleted: forceActiveFocus()
        Behavior on value {NumberAnimation {duration: 3500}}


        Label{
            text: "🔋 Eco"
            font.bold: true
            font.weight: Font.Normal
            font.pixelSize: 22
            font.family: "TacticSans-Med"
            color: "#2BD150"
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -5
            anchors.verticalCenterOffset: parent.height * 0.5
            layer.effect: DropShadow{
                anchors.fill: parent
                horizontalOffset: 5
                verticalOffset: 5
                radius: 10
                samples: 16
                color: "white"
            }
        }
    }


    LinearGauge{
        id: gasGauge
        focus: true
        Component.onCompleted: forceActiveFocus()
        anchors{
            top: leftGauge.bottom
            horizontalCenter: leftGauge.horizontalCenter
            topMargin: 40

            left: parent.left
            leftMargin: parent.width / 7
        }


    }


    //Left side icons
    Image {
        id: fourthLeftIndicator
        property bool parkingLightOn: true
        width: 72
        height: 62
        anchors{
            left: parent.left
            leftMargin: 190
            bottom: thirdLeftIndicator.top
            bottomMargin: 5
        }
        Behavior on parkingLightOn {NumberAnimation {duration: 300}}
        source: parkingLightOn ? "qrc:/CarInfotainment/Images/Parking lights.svg" : "qrc:/CarInfotainment/Images/Parking_lights_white.svg"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                fourthLeftIndicator.parkingLightOn= !fourthLeftIndicator.parkingLightOn
            }
        }
    }


    Image{
        id: thirdLeftIndicator
        property bool lightOn: true
        width: 52
        height: 70.2
        anchors{
            left: parent.left
            leftMargin: 155
            bottom: secondLeftIndicator.top
            bottomMargin: 5
        }
        source: lightOn ? "qrc:/CarInfotainment/Images/Lights.svg" : "qrc:/CarInfotainment/Images/Light_White.svg"
        Behavior on lightOn {NumberAnimation {duration: 300}}

        MouseArea{
            anchors.fill: parent
            onClicked: {
                thirdLeftIndicator.lightOn= !thirdLeftIndicator.lightOn
            }
        }
    }



    Image{
        id: secondLeftIndicator
        property bool headLightOn: true
        width: 51
        height: 51
        anchors{
            left: parent.left
            leftMargin: 125
            bottom: firstLeftIndicator.top
            bottomMargin: 10
        }
        Behavior on headLightOn {NumberAnimation {duration: 300}}
        source: headLightOn ? "qrc:/CarInfotainment/Images/Low beam headlights.svg" : "qrc:/CarInfotainment/Images/Low_beam_headlights_white.svg"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                secondLeftIndicator.headLightOn= !secondLeftIndicator.headLightOn
            }
        }
    }


    Image{
        id: firstLeftIndicator
        property bool rareLightOn: false
        width: 51
        height: 51
        anchors{
            left: parent.left
            leftMargin: 100
            verticalCenter: rightGauge.verticalCenter
        }
        source: rareLightOn ? "qrc:/CarInfotainment/Images/Rare_fog_lights_red.svg" : "qrc:/CarInfotainment/Images/Rare fog lights.svg"
        Behavior on rareLightOn {NumberAnimation {duration: 300}}
        MouseArea{
            anchors.fill: parent
            onClicked: {
                firstLeftIndicator.rareLightOn= !firstLeftIndicator.rareLightOn
            }
        }
    }





    // Right side icons
    Image{
        id: fourthRightIndicator
        property bool indicator: true
        width: 56.83
        height: 36.17
        anchors{
            right: parent.right
            rightMargin: 190
            bottom: thirdRightIndicator.top
            bottomMargin: 20
        }

        source: indicator ? "qrc:/CarInfotainment/Images/FourthRightIcon.svg" : "qrc:/CarInfotainment/Images/FourthRightIcon_red.svg"
        Behavior on indicator {NumberAnimation {duration: 300}}
        MouseArea{
            anchors.fill: parent
            onClicked: {
                fourthRightIndicator.indicator= !fourthRightIndicator.indicator
            }
        }
    }


    Image{
        id: thirdRightIndicator
        property bool indicator: true
        width: 56.83
        height: 36.17
        anchors{
            right: parent.right
            rightMargin: 155
            bottom: secondRightIndicator.top
            bottomMargin: 25
        }
        source: indicator ? "qrc:/CarInfotainment/Images/thirdRightIcon.svg" : "qrc:/CarInfotainment/Images/thirdRightIcon_red.svg"
        Behavior on indicator {NumberAnimation{duration: 300}}
        MouseArea{
            anchors.fill: parent
            onClicked: {
                thirdRightIndicator.indicator= !thirdRightIndicator.indicator
            }
        }
    }


    Image{
        id: secondRightIndicator
        property bool indicator: true
        width: 56.83
        height: 36.17
        anchors{
            right: parent.right
            rightMargin: 120
            bottom: firstRightIndicator.top
            bottomMargin: 20
        }
        source: indicator ? "qrc:/CarInfotainment/Images/SecondRightIcon.svg" : "qrc:/CarInfotainment/Images/SecondRightIcon_red.svg"
        Behavior on indicator {NumberAnimation{duration: 300}}
        MouseArea{
            anchors.fill: parent
            onClicked: {
                secondRightIndicator.indicator= !secondRightIndicator.indicator
            }
        }
    }


    Image{
        id: firstRightIndicator
        property bool sheetBelt: true
        width: 36
        height: 45
        anchors{
            right: parent.right
            rightMargin: 100
            verticalCenter: rightGauge.verticalCenter
        }
        source: sheetBelt ? "qrc:/CarInfotainment/Images/FirstRightIcon.svg" : "qrc:/CarInfotainment/Images/FirstRightIcon_grey.svg"
        Behavior on sheetBelt {NumberAnimation{duration: 300}}
        MouseArea{
            anchors.fill: parent
            onClicked: {
                firstRightIndicator.sheetBelt= !firstRightIndicator.sheetBelt
            }
        }
    }






    // Speed Limit Label
    Rectangle{

        id: speedLimit
        width: 130
        height: 130
        radius: height / 2
        color: "#D9D9D9"
        //border.color: speedColor(maxSpeedlabel.text)
        border.color: "#C50212"
        border.width: 6

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50

        Label{

            id: maxSpeedLabel
            text: leftGauge.value.toFixed(0)
            font.pixelSize: 45
            font.family: "Inter"
            font.bold: Font.Bold
            color: "black"
            anchors.centerIn: parent


        }

    }


    Image{
        anchors{
            bottom: car.top
            bottomMargin: 30
            horizontalCenter: car.horizontalCenter
        }
        source: "qrc:/CarInfotainment/Images/Model 3.png"

    }


    Image{
        id: car
        anchors{
            bottom: speedLimit.top
            bottomMargin: 30
            horizontalCenter: speedLimit.horizontalCenter
        }
        source: "qrc:/CarInfotainment/Images/Car.svg"
    }



    // Right road
    Image{
        id: rightRoad
        width: 127
        height: 397
        anchors{
            right: speedLimit.right
            rightMargin: 100
            bottom: parent.bottom
            bottomMargin: 26.50
        }
        source: "qrc:/CarInfotainment/Images/Vector 1.svg"
    }



    //Left road
    Image {
        id: leftRoad
        width: 127
        height: 397
        anchors{
            left: speedLimit.left
            leftMargin: 140
            bottom: parent.bottom
            bottomMargin: 26.50
        }
        source: "qrc:/CarInfotainment/Images/Vector 2.svg"
    }


    RowLayout{
        spacing: 20
        Layout.topMargin: 800
        id: gears
        anchors{
            right: parent.right
            rightMargin: 250
            bottom: parent.bottom
            bottomMargin: 26.50 + 65

        }

        Label{
            text: "Ready"
            font.pixelSize: 32
            font.family: "Inter"
            font.bold: Font.Normal
            font.capitalization: Font.AllUppercase
            color: "#32D74B"
        }

        Label{
            text: "P"
            font.pixelSize: 32
            font.family: "Inter"
            font.bold: Font.Normal
            font.capitalization: Font.AllUppercase
            color: "#FFFFFF"
        }


        Label{
            text: "R"
            font.pixelSize: 32
            font.family: "Inter"
            font.bold: Font.Normal
            font.capitalization: Font.AllUppercase
            opacity: 0.2
            color: "#FFFFFF"
        }

        Label{
            text: "N"
            font.pixelSize: 32
            font.family: "Inter"
            font.bold: Font.Normal
            font.capitalization: Font.AllUppercase
            opacity: 0.2
            color: "#FFFFFF"
        }

        Label{
            text: "D"
            font.pixelSize: 32
            font.family: "Inter"
            font.bold: Font.Normal
            font.capitalization: Font.AllUppercase
            opacity: 0.2
            color: "#FFFFFF"
        }
    }


    RowLayout{
        spacing: 20
        anchors{
            left: parent.left
            leftMargin: 250
            bottom: parent.bottom
            bottomMargin: 26.50 + 65
        }

        RowLayout{
            spacing: 3
            Layout.topMargin: 800
            Label{
                text: "90.5"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                color: "#FFFFFF"
            }

            Label{
                text: "°F"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                opacity: 0.2
                color: "#FFFFFF"
            }
        }

        RowLayout{
            spacing: 1
            //Layout.topMargin: 600
            Layout.topMargin: 800

            Rectangle{
                width: 20
                height: 15
                color: leftGauge.value.toFixed(0) > 31.25 ? leftGauge.speedColor : "#01E6DC"
            }
            Rectangle{
                width: 20
                height: 15
                color: leftGauge.value.toFixed(0) > 62.5 ? leftGauge.speedColor : "#01E6DC"
            }
            Rectangle{
                width: 20
                height: 15
                color: leftGauge.value.toFixed(0) > 93.75 ? leftGauge.speedColor : "#01E6DC"
            }
            Rectangle{
                width: 20
                height: 15
                color: leftGauge.value.toFixed(0) > 125.25 ? leftGauge.speedColor : "#01E6DC"
            }
            Rectangle{
                width: 20
                height: 15
                color: leftGauge.value.toFixed(0) > 156.5 ? leftGauge.speedColor : "#01E6DC"
            }
            Rectangle{
                width: 20
                height: 15
                color: leftGauge.value.toFixed(0) > 187.75 ? leftGauge.speedColor : "#01E6DC"
            }
            Rectangle{
                width: 20
                height: 15
                color: leftGauge.value.toFixed(0) > 219 ? leftGauge.speedColor : "#01E6DC"
            }
        }

        Label{
            Layout.topMargin: 800
            text: leftGauge.value.toFixed(0) + "MPH"
            font.pixelSize: 32
            font.family: "Inter"
            font.bold: Font.Normal
            font.capitalization: Font.AllUppercase
            color: "#FFFFFF"
        }




         // Progreess bar
        RadialBar{
            id: radialBar
            visible: false
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: parent.width / 6
            }

            width: 338
            height: 338
            penStyle: Qt.RoundCap
            dialType: RadialBar.NoDial
            progressColor: "#01E4E0"
            backgroundColor: "transparent"
            dialWidth: 17
            startAngle: 3.6 * value
            minValue: 0
            maxValue: 100
            value: accelerating ? maxValue : 65
            textFont{
                family: "inter"
                italic: false
                bold: Font.Medium
                pixelSize: 60
            }
            showText: true
            suffixText: ""
            textColor: "#FFFFFF"
            property bool accelerating
            Behavior on value {NumberAnimation {duration: 1800}}

            ColumnLayout{
                anchors.centerIn: parent
                Label{
                    text: radialBar.value.toFixed(0) + "%"
                    font.pixelSize: 65
                    font.family: "Inter"
                    font.bold: Font.Normal
                    color: "#FFFFFF"
                    Layout.alignment: Qt.AlignHCenter
                }

                Label{
                    text: "Battery Charge"
                    font.pixelSize: 28
                    font.family: "Inter"
                    font.bold: Font.Normal
                    opacity: 0.8
                    color: "#FFFFFF"
                    Layout.alignment: Qt.AlignHCenter
                }

            }

        }



        ColumnLayout{
            visible: false
            spacing: 40

            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: parent.width / 6
            }

            RowLayout{
                spacing: 30
                Image{
                    width: 72
                    height: 50

                    source: "qrc:/CarInfotainment/Images/road.svg"

                }

                ColumnLayout{
                    Label{
                        text: "188 KM"
                        font.pixelSize: 30
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
                    Label{
                        text: "Distance"
                        font.pixelSize: 20
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
               }
            }

            RowLayout{
                spacing: 30
                Image{
                    width: 72
                    height: 78
                    source: "qrc:/CarInfotainment/Images/fuel.svg"
                }

                ColumnLayout{
                    Label{
                        text: "34 mpg"
                        font.pixelSize: 30
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }

                    Label{
                        text: "Avg. Fuel Usage"
                        font.pixelSize: 20
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
                }
            }

            RowLayout{
                spacing: 30
                Image{
                    width: 72
                    height: 72
                    source: "qrc:/CarInfotainment/Images/speedometer.svg"
                }

                ColumnLayout{
                    Label{
                        text: "78 mph"
                        font.pixelSize: 30
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color:  "#FFFFFF"
                    }

                    Label{
                        text: "Avg. Speed"
                        font.pixelSize: 20
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color:  "#FFFFFF"
                    }
                }
            }
        }
    }
}



