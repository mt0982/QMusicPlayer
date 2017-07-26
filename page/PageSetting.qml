import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.2

Item {

    visible: false

    ButtonGroup {
        buttons: column.children
    }

    GroupBox {
        title: "Playback Mode:"
        width: parent.width
        y: 20

        Column {
            id: column
            anchors.fill: parent

            CheckBox {
                checked: true
                text: qsTr("Loop")
                onClicked: mplayer.setPlaybackMode(3)
            }

            CheckBox {
                text: qsTr("Sequential")
                onClicked: mplayer.setPlaybackMode(2)
            }

            CheckBox {
                text: qsTr("Repeat")
                onClicked: mplayer.setPlaybackMode(1)
            }

            CheckBox {
                text: qsTr("Radom")
                onClicked: mplayer.setPlaybackMode(4)
            }
        }
    }

    Button {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 10
        onClicked: stack.pop()
        text: "OK"
    }
}












