import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia
import QtQuick.Layouts 1.12
import QtQuick.Window 2.15
import QtQuick.Dialogs


Item {
    id: videoView
    width: mainWindow.width
    height: mainWindow.height


    property string videoSource: "qrc:/file_example_MP4_1920_18MG.mp4"

    Rectangle {
            anchors.fill: parent
            color: "#1c344f"


    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10

        Text {
            id: welcomeText
            text: "Welcome to Video Player"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            font.pixelSize: 24
            color: "#f4f4f4"
        }

        Rectangle {
            Layout.preferredHeight: parent.height * 0.85
            Layout.fillWidth: true
            color: "#DAE0E9"
            radius: 20

            Video {
                id: videoPlayer
                anchors.fill: parent
                source: videoView.videoSource
                fillMode: VideoOutput.PreserveAspectFit
            }
        }

        RowLayout {
            id: controlBar
            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

            CustomIconButton {
                id: playButton
                source: "qrc:/icons/play.png"
                onClicked: videoPlayer.play()
            }

            CustomIconButton {
                id: stopButton
                source: "qrc:/icons/stop.png"
                onClicked: videoPlayer.stop()
            }

            CustomIconButton {
                id: openButton
                source: "qrc:/icons/addfile.png"
                onClicked: fileDialog.open()
            }

            CustomIconButton {
                id: exitButton
                source: "qrc:/icons/exit.png"
                onClicked: Qt.quit()
            }
        }
    }
}

    FileDialog {
        id: fileDialog
        title: "Please choose a video file"
        nameFilters: ["Video files (*.mp4 *.avi *.mkv *.mov *.wmv)"]
        onAccepted: videoView.videoSource = selectedFile
    }
}
