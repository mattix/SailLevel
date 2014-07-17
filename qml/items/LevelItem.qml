import QtQuick 2.0
import QtSensors 5.0
import mattix 1.0

Rectangle {
    width: 320
    height: 240
    property alias levelSettings: settings
    property string levelValues: ""

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
        }
    }

    onWidthChanged: {
        if (flickable.width < flickable.height) {
            levelBall.width = flickable.width / 2
        } else {
            levelBall.width = flickable.height / 2
        }
        levelBall.height = levelBall.width
    }

    Rectangle {
        id: levelTargetBall
        color: "gray"
        x: parent.width / 2 - width / 2
        y: parent.height / 2 - height / 2
        width: levelBall.width * 1.5
        height: levelBall.height * 1.5
        radius: width
    }

    Rectangle {
        id: levelBall
        property double offsetX: 0.0
        property double offsetY: 0.0
        x: parent.width / 2 - width / 2 - (offsetX / 90.0) * (parent.width / 2)
        y: parent.height / 2 - height / 2 - (offsetY / 90.0) * (parent.height / 2)
        radius: width
        color: "white"
    }

    Rectangle {
        id: levelTargetBorderBall
        color: "#00000000"
        x: parent.width / 2 - width / 2
        y: parent.height / 2 - height / 2
        width: levelBall.width
        height: levelBall.height
        radius: width
        border.color: "black"
        border.width: 5        }

    Cross {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
}
