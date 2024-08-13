import QtQuick 2.15

Rectangle {
    id: bottomBar
    color: "black"
    height: parent.height / 12
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }

    Image {
        id: carSettingsIcon
        source: "../assets/car.png"
        anchors {
            left: parent.left
            leftMargin: 30
            verticalCenter: parent.verticalCenter
        }

        height: parent.height * 0.85
        fillMode: Image.PreserveAspectFit
    }

    HVACComponent {
        id: driverHVACControl
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: carSettingsIcon.right
            leftMargin: 150
        }
        hvacController: driverHVACHandler
    }

    VolumeControlComponent {
        id: volumeControl
        anchors {
            right: parent.right
            rightMargin: 10
            top: parent.top
            bottom: parent.bottom
        }
    }
    HVACComponent {
        id: passengerHVACControl
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: volumeControl.left
            rightMargin: 150
        }
        hvacController: passengerHVACHandler
    }
}
