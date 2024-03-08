import QtQuick 2.15



Window {
    id: mainWindow
    width: 400
    height: 600
    visible: true
    title: "Video Player"

    Loader
    {
        id: mainloader
        anchors.fill: parent
        source: "VideoViewer.qml"
    }

    function changeScreen(value)
    {
        mainloader.setSource(value)
    }
}
