import QtQuick 2.0

Rectangle {
    width: 100
    height: 100
    property int lineWidth: 4
    property string crossColor: "black"

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: parent.lineWidth
        color: parent.crossColor
    }

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: parent.lineWidth
        height: parent.height
        color: parent.crossColor
    }
}
