import QtQuick 2.15

Rectangle {
    id: navSearchBox
    radius: 5
    color: "#f0f0f0"

    Image {
        id: searchIcon
        source: "../assets/searchIcon.png"
        fillMode: Image.PreserveAspectFit
        height: parent.height * 0.45

        anchors {
            left: parent.left
            leftMargin: 15
            verticalCenter: parent.verticalCenter
        }
    }

    Text {
        id: navPlaceHolderText
        color: "#636060"
        visible: navigationTextInput.text === ""
        anchors {
            left: searchIcon.right
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }

        font {
            // pointSize: 14
            bold: true
        }

        text: "Navigate"
    }

    TextInput {
        id: navigationTextInput
        clip: true
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: searchIcon.right
            leftMargin: 20
        }

        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 16
    }
}
