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
        if (settings.e === true) visualisation.visible = true;
        else visualisation.visible = false;
    }

    Settings {
        id: settings
        property alias a: cbLoop.checked
        property alias b: cbSequential.checked
        property alias c: cbRepeat.checked
        property alias d: cbRadom.checked
        property alias e: cbVisualisation.checked
    }

    ButtonGroup {
        //buttons: column.children
        id: group
    }

    Flickable {
        ScrollBar.vertical: ScrollBar { }
        id: listView
        anchors.fill: parent
        clip: true
        contentHeight: groupbox.height + 20

        GroupBox {
            id: groupbox
            title: " SETTINGS"
            width: parent.width
            y: 20
            background: Rectangle { color: "transparent" }

            Column {
                id: column
                anchors.fill: parent

                Text { text: qsTr("Playback Mode:"); anchors.horizontalCenter: parent.horizontalCenter }

                AbstractCheckBox {
                    id: cbLoop
                    checked: true
                    text: qsTr("Loop")
                    onClicked: mplayer.setPlaybackMode(3)
                    ButtonGroup.group: group
                }

                AbstractCheckBox {
                    id: cbSequential
                    text: qsTr("Sequential")
                    onClicked: mplayer.setPlaybackMode(2)
                    ButtonGroup.group: group
                }

                AbstractCheckBox {
                    id: cbRepeat
                    text: qsTr("Repeat")
                    onClicked: mplayer.setPlaybackMode(1)
                    ButtonGroup.group: group
                }

                AbstractCheckBox {
                    id: cbRadom
                    text: qsTr("Radom")
                    onClicked: mplayer.setPlaybackMode(4)
                    ButtonGroup.group: group
                }

                Text { text: qsTr("Enable | Disable:"); anchors.horizontalCenter: parent.horizontalCenter }

                AbstractCheckBox {
                    id: cbVisualisation
                    text: qsTr("Visualisation")
                    tristate: true

                    onCheckedChanged: {
                        if (checked) visualisation.visible = true;
                        else visualisation.visible = false;
                    }
                }
            }
        }
    }

    Button {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 10
        width: parent.width * 0.26
        height: parent.width * 0.26
        background: Image {
            id: btnIcon
            anchors.fill: parent
            source: "qrc:/icon/backward.png"
        }
        onClicked: stack.pop()
    }
}












