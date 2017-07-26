import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.2
import Qt.labs.settings 1.0

Item {

    visible: false

    Component.onCompleted: {
        if (settings.a === true) mplayer.setPlaybackMode(3)
        else if (settings.b === true) mplayer.setPlaybackMode(2)
        else if (settings.c === true) mplayer.setPlaybackMode(1)
        else if (settings.d === true) mplayer.setPlaybackMode(4)
    }

    Settings {
        id: settings
        property alias a: cbLoop.checked
        property alias b: cbSequential.checked
        property alias c: cbRepeat.checked
        property alias d: cbRadom.checked
    }

    ButtonGroup {
        id: aaa
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
                id: cbLoop
                checked: true
                text: qsTr("Loop")
                onClicked: mplayer.setPlaybackMode(3)
            }

            CheckBox {
                id: cbSequential
                text: qsTr("Sequential")
                onClicked: mplayer.setPlaybackMode(2)
            }

            CheckBox {
                id: cbRepeat
                text: qsTr("Repeat")
                onClicked: mplayer.setPlaybackMode(1)
            }

            CheckBox {
                id: cbRadom
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












