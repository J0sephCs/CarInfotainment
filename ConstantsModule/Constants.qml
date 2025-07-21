import QtQuick 2.15
pragma Singleton



QtObject {
    // readonly property int width: 1920
    // readonly property int height: 1080

    readonly property int width: 800
    readonly property int height: 600


    /* Edit this comment to add your custom font */
    readonly property string fontFamily: "DejaVu Sans"
    readonly property int regularFont: 24
    readonly property int largeFont: regularFont * 1.6

    readonly property color backgroundColor: "#00091a"


}
