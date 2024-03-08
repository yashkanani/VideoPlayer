import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Item {
    id: pinpad
    width: mainWindow.width
    height: mainWindow.height

    property string passwordString: ""
    property string errorMessage: ""

    Rectangle {
            id: pinComponentRect
            anchors.fill: parent
            color: "#DAE0E9"


            ColumnLayout {
                anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.top
                        topMargin: parent.height /6
                    }

                Text {
                    id: welcomeText
                    text: "Enter PIN code"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    font.pixelSize: 18
                    font.bold: true
                    color: "#1c344f"
                }

                Rectangle {
                    id: displayRect
                    Layout.preferredWidth: parent.width
                    Layout.alignment: Qt.AlignHCenter
                    height: 25
                    border.color: "#1c344f"
                    border.width: 1
                    radius: 2

                    Text {
                        id: displayText
                        anchors.centerIn: parent
                        text: maskPassword(pinpad.passwordString)
                        font.pixelSize: 18
                    }
                }

                Text {
                    id: errorText
                    anchors.top: displayRect.bottom
                    anchors.right: parent.right
                    text: pinpad.errorMessage
                    font.bold: false
                    font.pixelSize: 10
                    color: "red"
                    visible: pinpad.errorMessage !== ""
                }


                GridLayout {
                    id: buttonsGrid
                    Layout.alignment: Qt.AlignHCenter
                    anchors.top: errorText.bottom
                    rows: 4
                    columns: 3
                    anchors {
                            horizontalCenter: parent.horizontalCenter
                            topMargin: parent.height /15
                        }

                    Repeater {
                        model: [
                            { number: "1", centerText: "", subText: ""},
                            { number: "2", centerText: "", subText: "ABC" },
                            { number: "3", centerText: "", subText: "DEF" },
                            { number: "4", centerText: "", subText: "GHI" },
                            { number: "5", centerText: "", subText: "JKL" },
                            { number: "6", centerText: "", subText: "MNO" },
                            { number: "7", centerText: "", subText: "PQRS" },
                            { number: "8", centerText: "", subText: "TUV" },
                            { number: "9", centerText: "", subText: "WXYZ" },
                            { number: "", centerText: "Clear", subText: "" },
                            { number: "0", centerText: "", subText: "" },
                            { number: "", centerText: "Enter", subText: "" }
                        ]

                        KeypadDelegate {
                            number: modelData.number
                            centerText: modelData.centerText
                            subText: modelData.subText
                            onClicked: {
                                pinpad.errorMessage = ""
                                if (modelData.number !== "") {
                                    pinpad.passwordString += modelData.number;
                                } else if (modelData.centerText === "Clear") {
                                    pinpad.passwordString = ""
                                } else if (modelData.centerText === "Enter") {
                                    passwordManager.checkPassword(pinpad.passwordString)
                                }
                            }
                        }
                    }
                }
            }
    }

    function maskPassword(password) {
        return "*".repeat(password.length);
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
