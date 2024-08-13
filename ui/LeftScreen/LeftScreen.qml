import QtQuick 2.15

Rectangle {
    id: leftScreen
    width: parent.width / 3
    color: "#e6e6e6"
    anchors {
        top: parent.top
        bottom: bottomBar.top
        left: parent.left
    }

    Image {
        id: carRender
        anchors.centerIn: parent
        width: parent.width * 0.75
        fillMode: Image.PreserveAspectFit
        source: "../assets/Tesla-Car-removebg-preview.png"

        Component.onCompleted: {
            console.log("Image width: " + carRender.width)
            console.log("Image height: " + carRender.height)
        }
    }
}
