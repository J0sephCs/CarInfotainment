import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    width: 400
    height: 100
    color: "#00091a"
    radius: 10
    focus: true

    property real tmpLvl: 0.5

    Image{
        source: "qrc:/CarInfotainment/Images/oil-temp.png"
        width: 30
        height: 30
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
    }

    Rectangle{
        width: parent.width - 60
        height: 20
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.verticalCenter: parent.verticalCenter
        color: "#333"
        radius: 10

        Rectangle{
            id: tempLvlBar
            width: (parent.width - 60) * tmpLvl
            height: parent.height
            radius: 10

            Behavior on width {NumberAnimation {duration: 1000; easing.type: Easing.OutQuad}}
            color:{
                if(tempLvlBar.width < (parent.width-60) *0.3) return "blue";
                if(tempLvlBar.width < (parent.width-60) * 0.7) return "limegreen";
                return "red";
            }
        }
    }

    Repeater{
        model: 5
        Rectangle{
            width: 2
            height: 15
            color: "white"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            x: 50 + index * ((parent.width-60) /4)

            Text{
                text: ["C", "", "", "", "H"][index]
                color: index === 0 ? "#006ee6" : index === 4 ? "red" : "transparent"
                font.pixelSize: 20
                anchors.top: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }



    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            tempLvlBar.width= Math.random() * (parent.width - 60)
        }
        onExited: {
            tempLvlBar.width= (parent.width -10)* tmpLvl
        }

    }


}
