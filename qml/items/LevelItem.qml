import QtQuick 2.0
import QtSensors 5.0
import harbour.saillevel.settings 1.0

Rectangle {
    width: 320
    height: 240    
    color: "#00000000"
    property string levelValues: ""
    property bool sideWays: false

    function reloadSettings() {
        settings.loadSettings()
    }

    function calibrate() {
        settings.calibrationFixX = -rotationSensor.reading.x
        settings.calibrationFixY = -rotationSensor.reading.y
    }

    Settings {
        id: settings
    }

    RotationSensor {
        id: rotationSensor
        dataRate: 100
        active: true

        onReadingChanged: {
            levelValues = "x: " + (reading.x + settings.calibrationFixX).toFixed(2) + " y: " + (reading.y + settings.calibrationFixY).toFixed(2) + " z: " + reading.z.toFixed(2)
            levelBall.offsetY = reading.x + settings.calibrationFixX
            levelBall.offsetX = reading.y + settings.calibrationFixY
            sideWays = reading.y > 70 || reading.y < -70
        }
    }

    onWidthChanged: levelBall.setSize()

    onHeightChanged: levelBall.setSize()

    Rectangle {
        id: sideWaysRectangle
        anchors.fill: parent
        color: "#00000000"
        visible: sideWays
    }

    Rectangle {
        id: levelRectangle
        anchors.fill: parent
        color: "#00000000"
        visible: !sideWays

        Rectangle {
            id: levelTargetBall
            color: "#cc555555"
            x: parent.width / 2 - width / 2
            y: parent.height / 2 - height / 2
            width: levelBall.width * 1.5
            height: levelBall.height * 1.5
            radius: width
        }

        Rectangle {
            id: levelBall
            width: parent.width / 2
            height: width
            property double offsetX: 0.0
            property double offsetY: 0.0
            x: parent.width / 2 - width / 2 - (offsetX / 90.0) * (parent.width / 2)
            y: parent.height / 2 - height / 2 - (offsetY / 90.0) * (parent.height / 2)
            radius: width
            color: "#8484ffff"
            function setSize() {
                if (parent.width < parent.height) {
                    width = parent.width / 2
                } else {
                    width = parent.height / 2
                }
                height = width
            }

        }

        Rectangle {
            id: levelTargetBorderBall
            color: "#00000000"
            x: parent.width / 2 - width / 2
            y: parent.height / 2 - height / 2
            width: levelBall.width
            height: levelBall.height
            radius: width
            border.color: "#88000000"
            border.width: 5        }

        Cross {
            crossColor: "#88000000"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
