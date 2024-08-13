import QtQuick 2.15
import Qt.labs.folderlistmodel
import QtMultimedia

Rectangle {
    id: musicPlayerBox
    radius: 5
    color: "#f0f0f0"

    width: parent.width
    height: parent.height / 8
    anchors {
        bottom: parent.bottom
    }

    property int currentSongIndex: 0

    FolderListModel {
        id: musicFolderModel
        folder: "../assets/songs" // Replace with the path to your music folder
        nameFilters: ["*.mp3", "*.wav"] // Add more extensions as needed
    }

    MediaPlayer {
        id: mediaPlayer
        audioOutput: AudioOutput {
            id: audio
            source: musicFolderModel.get(currentSongIndex).fileURL
            muted: playbackController.muted
            volume: playbackController.volume
        }

        }

        // Audio {
        //     id: audioPlayer
        //     source: musicFolderModel.get(currentSongIndex).fileURL
        //     onStatusChanged: {
        //         if (status === Audio.Error) {
        //             console.log("Error: ", errorString)
        //         }
        //     }
        // }
        Row {
            id: songInfo
            spacing: 10
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 20
            }

            Image {
                id: songThumbnail
                source: "../assets/songThumb.png" // Default or empty source
                height: musicPlayerBox.height * 0.6
                width: songThumbnail.height
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: songName
                text: musicFolderModel.get(
                          currentSongIndex).fileName // Display the current song name
                font.pixelSize: 20
                color: "#333333"
                verticalAlignment: Text.AlignVCenter
            }
        }

        Image {
            id: playButton
            source: "../assets/play.png"
            height: musicPlayerBox.height * 0.2
            fillMode: Image.PreserveAspectFit
            anchors {
                centerIn: parent
            }
            visible: true
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // audioPlayer.play()
                    playButton.visible = false
                    pauseButton.visible = true
                }
            }
        }

        Image {
            id: pauseButton
            source: "../assets/pause.png"
            height: musicPlayerBox.height * 0.2
            fillMode: Image.PreserveAspectFit
            anchors {
                centerIn: parent
            }
            visible: false
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // audioPlayer.pause()
                    pauseButton.visible = false
                    playButton.visible = true
                }
            }
        }

        Image {
            id: nextButton
            source: "../assets/next.png"
            height: musicPlayerBox.height * 0.2
            fillMode: Image.PreserveAspectFit
            anchors {
                verticalCenter: parent.verticalCenter
                left: playButton.right
                leftMargin: 60
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (currentSongIndex < musicFolderModel.count - 1) {
                        currentSongIndex++
                    } else {
                        currentSongIndex = 0
                    }
                    audioPlayer.source = musicFolderModel.get(
                                currentSongIndex).fileURL
                    audioPlayer.play()
                    playButton.visible = false
                    pauseButton.visible = true
                }
            }
        }

        Image {
            id: previousButton
            source: "../assets/previous.png"
            height: musicPlayerBox.height * 0.2
            fillMode: Image.PreserveAspectFit
            anchors {
                verticalCenter: parent.verticalCenter
                right: playButton.left
                rightMargin: 60
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (currentSongIndex > 0) {
                        currentSongIndex--
                    } else {
                        currentSongIndex = musicFolderModel.count - 1
                    }
                    audioPlayer.source = musicFolderModel.get(
                                currentSongIndex).fileURL
                    audioPlayer.play()
                    playButton.visible = false
                    pauseButton.visible = true
                }
            }
        }
    }
}
