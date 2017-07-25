import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
import "../abstract"

Item {

    property int currentIndex: bar.currentIndex

    TabBar {
        id: bar
        height: root.height * 0.1   //Static Android - 64, PC - default
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        background: Rectangle {
            anchors.fill: parent
            color: "transparent"
        }

        AbstractTabBarButton {
            sourceChecked: "qrc:/icon/music_checked.png"
            sourceUnchecked: "qrc:/icon/music_unchecked.png"
        }

        AbstractTabBarButton {
            sourceChecked: "qrc:/icon/playlist_checked.png"
            sourceUnchecked: "qrc:/icon/playlist_unchecked.png"
        }
    }
}








