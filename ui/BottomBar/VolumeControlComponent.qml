import QtQuick 2.15

Item {
    property string fontColor: "#636060"
    width: 120 * (parent.width / 1280)

    Connections {
        target: audioController
        function onVolumeLevelChanged() {
            visibleTimer.stop()
            volumeLevelIcon.visible = false
            visibleTimer.start()
        }
    }

    Timer {
        id: visibleTimer
        interval: 1000
        repeat: false
        onTriggered: {
            volumeLevelIcon.visible = true
        }
    }

    Rectangle {

        id: decrementButton
        anchors {
            right: volumeLevelIcon.left
            rightMargin: 20

            top: parent.top
            bottom: parent.bottom
        }
        width: height / 2
        color: "black"

        Text {
            id: decrementText
            anchors.centerIn: parent
            text: "<"
            font.pixelSize: 35
            color: fontColor
        }

        MouseArea {
            anchors.fill: parent
            onClicked: audioController.incrementVolumeLevel(-1)
        }
    }
    Image {
        id: volumeLevelIcon
        height: parent.height * 0.5
        fillMode: Image.PreserveAspectFit
        anchors {
            right: incrementButton.left
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }

        source: {
            if (audioController.volumeLevel <= 1)
                return "../assets/volume0.png"
            else if (audioController.volumeLevel <= 50)
                return "../assets/volume1.png"
            else
                return "../assets/volume2.png"
        }
    }

    Text {
        id: volumeLabel

        visible: !volumeLevelIcon.visible

        anchors {
            centerIn: volumeLevelIcon
        }

        color: "white"
        font.pixelSize: 24
        text: audioController.volumeLevel
    }

    Rectangle {
        id: incrementButton
        anchors {
            right: parent.right
            rightMargin: 20
            top: parent.top
            bottom: parent.bottom
        }
        width: height / 2
        color: "black"

        Text {
            id: incrementText
            anchors.centerIn: parent
            text: ">"
            font.pixelSize: 35
            color: fontColor
        }

        MouseArea {
            anchors.fill: parent
            onClicked: audioController.incrementVolumeLevel(1)
        }
    }
}
