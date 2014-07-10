/*
    Copyright (C) 2013 Matti Ahinko.
    Contact: Matti Ahinko <matti@ahinko.net>
    All rights reserved.

    This file is part of SailLevel.

    SailLevel is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    SailLevel is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with SailLevel.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import QtSensors 5.0

Page {
    id: page

    RotationSensor {
        id: rotationSensor
        dataRate: 100
        active: true

        onReadingChanged: {
            text.text = "x: " + reading.x.toFixed(2) + " y: " + reading.y.toFixed(2) + " z: " + reading.z.toFixed(2)
            levelBall.offsetY = reading.x
            levelBall.offsetX = reading.y
        }
    }

    SilicaFlickable {
        id: flickable
        anchors.fill: parent

        onWidthChanged: {
            if (flickable.width < flickable.height) {
                levelBall.width = flickable.width / 2
            } else {
                levelBall.width = flickable.height / 2
            }
            levelBall.height = levelBall.width
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

        Label {
            id: text
            text: "x: 0.00 y: 0.00 z: 0.00"
        }
    }
}
