import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4

import "ui/BottomBar"
import "ui/RightScreen"
import "ui/LeftScreen"

Window {
    id: window
    width: 1280
    height: 720
    visible: true
    title: qsTr("Tesla Infotainment")

    RightScreen {
        id: rightScreen
    }

    LeftScreen {
        id: leftScreen
    }

    BottomBar {
        id: bottomBar
    }
}
