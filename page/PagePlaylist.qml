import QtQuick 2.0
import QtQuick.Controls 2.0

Item {

    function addSongs(baseNames, absolutePath) {
        for (var i = 0; i < baseNames.length; i++) {
            songModel.append({"title": baseNames[i], "path": absolutePath[i]})
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        clip: true

        model: ListModel {
            id: songModel
//            ListElement { sender: "Bob Bobbleton"; title: "How are you going?" }
//            ListElement { sender: "Rug Emporium"; title: "SALE! All rugs MUST go!" }
//            ListElement { sender: "Electric Co."; title: "Electricity bill 15/07/2016 overdue" }
//            ListElement { sender: "Tips"; title: "Five ways this tip will save your life" }
        }

        delegate: SwipeDelegate {
            id: swipeDelegate
            text: model.title
            width: parent.width

            onClicked: mplayer.setMedia(model.index)

            ListView.onRemove: SequentialAnimation {
                PropertyAction {
                    target: swipeDelegate
                    property: "ListView.delayRemove"
                    value: true
                }
                NumberAnimation {
                    target: swipeDelegate
                    property: "height"
                    to: 0
                    easing.type: Easing.InOutQuad
                }
                PropertyAction {
                    target: swipeDelegate;
                    property: "ListView.delayRemove";
                    value: false
                }
            }

            swipe.right: Label {
                id: deleteLabel
                text: qsTr("Delete")
                color: "white"
                verticalAlignment: Label.AlignVCenter
                padding: 12
                height: parent.height
                anchors.right: parent.right

                //SwipeDelegate.onClicked: listView.model.remove(index)

                background: Rectangle {
                    color: deleteLabel.SwipeDelegate.pressed ? Qt.darker("tomato", 1.1) : "tomato"
                }
            }
        }
    }

}
