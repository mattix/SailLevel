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
import "../items"

Page {
    id: page    

    SilicaFlickable {
        id: flickable
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Calibrate")
                onClicked: {
                    levelItem.levelSettings.calibrationFixX = -rotationSensor.reading.x
                    levelItem.levelSettings.calibrationFixY = -rotationSensor.reading.y
                }
            }
        }

        LevelItem {
            id: levelItem
        }

        Label {
            id: text
            text: ""
            anchors.margins: 20
            anchors.left: parent.left
            anchors.top: parent.top
        }
    }
}
