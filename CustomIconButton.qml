import QtQuick 2.0

Image {
    id: iconImage
    signal clicked()
    opacity: iconImageMouseArea.containsMouse ? 0.75 : 1

    MouseArea {
        id:iconImageMouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: iconImage.clicked()
    }
}

