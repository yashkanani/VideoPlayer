import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia 5.15
import QtQuick.Layouts 1.12
import QtQuick.Window 2.15



Item {
    id: videoView
    width: mainWindow.width
    height: mainWindow.height

    property string videoSource: "qrc:/file_example_MP4_1920_18MG.mp4"

    ColumnLayout {
        anchors.fill: parent

        Text {
            id: welcomeText
            text: "Welcome to Video Player"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            font.pixelSize: 24
        }

        Rectangle {
            Layout.preferredHeight: parent.height * 0.8
            Layout.fillWidth: true

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
                onClicked:videoPlayer.play()
            }

            CustomIconButton {
                id: stopButton
                source: "qrc:/icons/stop.png"
                onClicked:videoPlayer.stop()
            }

            CustomIconButton {
                id: exitButton
                source: "qrc:/icons/exit.png"
                onClicked: Qt.quit()
            }

        }
    }


}
