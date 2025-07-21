import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import QtLocation 5.15
import QtPositioning 5.15


Item {
    id: musicPlayer
    width: navMode ? 550 : 280
    height: navMode ? 380 : 280

    property bool navMode: false
    property var currentPos: QtPositioning.coordinate(29.424, -98.493)
    property var destinationPos: QtPositioning.coordinate(29.4249, -98.4864)


    Rectangle{
        anchors.fill: parent
        color: "black"
        radius: 10
        border.color: "#ffbf00"

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: navMode = true
            onExited: navMode = false
        }


        ColumnLayout{

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.margins: 10
            spacing: 10

            Text{
                text: navMode ? "Navigation Mode"  : "Currently Playing"
                color: "white"
                font.pixelSize: 18
                maximumLineCount: 1
                Layout.alignment: Qt.AlignHCenter
                Behavior on text {PropertyAnimation {duration: 200}}
            }

            StackLayout{
                id: modeStack
                anchors.horizontalCenter: parent.horizontalCenter
                width: navMode ? 530 : 220
                height: navMode ? 320 : 220
                currentIndex: navMode ? 1 : 0

                Behavior on width {NumberAnimation {duration: 300}}
                Behavior on height {NumberAnimation {duration: 300}}


                Rectangle{
                   // visible: !navMode
                    id: trackFrame
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 220
                    height: 220
                    color: "#004999"
                    radius: 10

                    ColumnLayout{
                        anchors.centerIn: parent
                        spacing: 10

                        Image {
                            id: albumCover
                            source: musicData.albumCover
                            sourceSize: Qt.size(110, 110)
                            Layout.alignment: Qt.AlignHCenter
                            fillMode: Image.PreserveAspectFit
                        }

                        Text{
                            id: songName
                            text: musicData.songName
                            Layout.alignment: Qt.AlignHCenter
                            color: "white"
                            font.pixelSize: 20
                            maximumLineCount: 1
                            elide: Text.ElideRight
                        }

                        Text{
                            id: artistName
                            text: musicData.artistName
                            Layout.alignment: Qt.AlignHCenter
                            color: "white"
                            font.pixelSize: 16
                            maximumLineCount: 1
                            elide: Text.ElideRight
                        }
                    }
                }


                Map{
                    id: mapView
                    visible: navMode
                    anchors.fill: parent
                    plugin: Plugin {name: "osm"}
                    center: currentPos
                    zoomLevel: 14


                    MapQuickItem{
                        coordinate: currentPos
                        anchorPoint.x: 16
                        anchorPoint.y: 32
                        sourceItem: Image {
                            source: "qrc:/CarInfotainment/Images/gps.png"
                            width: 32
                            height: 32
                        }
                    }


                    MapQuickItem{
                        coordinate: destinationPos
                        anchorPoint.x: 16
                        anchorPoint.y: 32
                        sourceItem: Image {
                            source: "qrc:/CarInfotainment/Images/gps.png"
                            height: 32
                            width: 32
                        }
                    }

                    MapPolyline{
                        path: [currentPos, destinationPos]
                        line.color: "blue"
                        line.width: 6
                    }
                }
            }
        }
    }
}
