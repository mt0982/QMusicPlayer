import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.2
import Qt.labs.settings 1.0
import "../abstract"

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
        buttons: column.children
    }

    GroupBox {
        title: " Playback Mode:"
        width: parent.width
        y: 20
        background: Rectangle { color: "transparent" }

        Column {
            id: column
            anchors.fill: parent

            AbstractCheckBox {
                id: cbLoop
                checked: true
                text: qsTr("Loop")
                onClicked: mplayer.setPlaybackMode(3)
            }

            AbstractCheckBox {
                id: cbSequential
                text: qsTr("Sequential")
                onClicked: mplayer.setPlaybackMode(2)
            }

            AbstractCheckBox {
                id: cbRepeat
                text: qsTr("Repeat")
                onClicked: mplayer.setPlaybackMode(1)
            }

            AbstractCheckBox {
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
        width: parent.width * 0.5
        height: parent.height * 0.1
        text: qsTr("OK")
        onClicked: stack.pop()
    }
}












