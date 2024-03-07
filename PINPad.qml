import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

 Rectangle {
    id: pinpad
    width: mainWindow.width
    height: mainWindow.height
    visible: true
    anchors.centerIn: parent

    property string passwordString: ""
    property string errorMessage: ""

    Rectangle {
        id: displayRect
        width: parent.width
        height: parent.height / 6
        color: "lightgrey"

        Text {
            id: displayText
            text: pinpad.passwordString
            anchors.centerIn: parent
        }
    }

    GridLayout {
        id: buttonsGrid
        width: parent.width
        height: parent.height - displayRect.height
        rows: 4
        columns: 3
        anchors.top: displayRect.bottom

        Repeater {
            model: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#"]

            Button {
                text: modelData
                onClicked: {
                    if (text !== "x") {
                        pinpad.passwordString += text
                    } else if (text === "x") {
                        pinpad.passwordString = ""
                    }
                }
            }
        }

        Button {
            text: "clear"
            onClicked: pinpad.passwordString = ""
        }

        Button {
            text: "enter"
            onClicked: passwordManager.checkPassword(pinpad.passwordString)
        }
    }

    Rectangle {
        id: errorRect
        width: parent.width
        height: parent.height
        color: "transparent"
        visible: pinpad.errorMessage !== ""

        Text {
            text: pinpad.errorMessage
            font.bold: true
            font.pixelSize: 20
            color: "red"
            anchors.centerIn: parent
        }
    }

    Connections {
        target: passwordManager

        function onCorrectPasswordEntered() {
            mainWindow.changeScreen("VideoViewer.qml")
            pinpad.errorMessage = ""
        }

        function onIncorrectPasswordEntered(errorText) {
            pinpad.errorMessage = errorText
        }
    }
}
