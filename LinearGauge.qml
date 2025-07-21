import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Rectangle {
    width: 400
    height: 100
    color: "#00091a"
    radius: 10


    Image{
        //source: "qrc:/CarInfotainment/Images/fuel.png"
        source: "qrc:/CarInfotainment/Images/fuel.svg"

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
            id: gasLevel
            width: (parent.width -10)*0.5
            height: parent.height
            radius: 10
            Behavior on width {NumberAnimation {duration: 1000; easing.type: Easing.OutQuad}}

            color:{
                if(gasLevel.width < (parent.width-60) *0.3) return "red";
                if(gasLevel.width < (parent.width-60) * 0.7) return "#006ee6";
                return "limegreen";
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
            x: 50 + index * ((parent.width - 60) / 4)

            Text{
                text: ["E", "1/4", "1/2", "3/4", "F"][index]
                color: index === 0 ? "red" : index === 4 ? "limegreen" : "white"
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
            gasLevel.width= Math.random() * (parent.width - 60)
        }
        onExited: {
            gasLevel.width= (parent.width -10)*0.5
        }

    }

}
