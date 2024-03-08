import QtQuick 2.0

Item {
    id: gridcell

    property string number: ""
    property string centerText: ""
    property string subText: ""


    width: 60
    height: 30
    signal clicked()

    Rectangle {
        id: itemId
        anchors.fill: parent
        color: "#1c344f"
        border.color: Qt.lighter(color, 1.1)



        Text {
            id: numberText
            text: gridcell.number
            font.pixelSize: 20
            font.bold: true
            visible: gridcell.number !== ""
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 1
            anchors.leftMargin: 3
            color: "#f4f4f4"

        }

        Text {
            id: centerText
            text: gridcell.centerText
            font.pixelSize: 12
            visible: gridcell.centerText !== ""
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: "#f4f4f4"
        }

        Text {
            id: subText
            text: gridcell.subText
            font.pixelSize: 7
            visible: gridcell.subText !== ""
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 5
            anchors.rightMargin: 5
            color: "#f4f4f4"
        }

        MouseArea
        {
            anchors.fill: parent
            id:mousearea
            hoverEnabled: true;
            onPressed: {
                itemId.opacity = 0.8
            }

            onReleased: {
                itemId.opacity = 1.0
                gridcell.clicked()
            }
        }
    }


}
