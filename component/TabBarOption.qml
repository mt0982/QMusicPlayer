import QtQuick 2.0
import QtQuick.Controls 2.0
import "../abstract"

Item {

    TabBar {
        id: bar
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
            sourceChecked: "qrc:/icon/music_checked.png"
            sourceUnchecked: "qrc:/icon/music_unchecked.png"
        }
        AbstractTabBarButton {
            sourceChecked: "qrc:/icon/music_checked.png"
            sourceUnchecked: "qrc:/icon/music_unchecked.png"
        }
    }
}
