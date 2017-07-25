import QtQuick 2.0
import QtQuick.Controls 2.0

Item {

    property alias songModel: songModel

    function addSongs(baseNames, absolutePath) {
        for (var i = 0; i < baseNames.length; i++) {
            songModel.append({"title": baseNames[i], "path": absolutePath[i], "id": i})
        }
    }

    ListView {
        ScrollBar.vertical: ScrollBar { }
        id: listView
        anchors.fill: parent
        clip: true

        section.property: "title"
        section.criteria: ViewSection.FirstCharacter
        section.delegate: Item {
            width: parent.width
            height: childrenRect.height

            Text {
                text: " " + section
                font.family: "Helvetica"
                font.pointSize: root.width * 0.05
                font.bold: true
                width: parent.width

                Rectangle {
                    color: "#324254"
                    height: 1
                    anchors.bottom: parent.bottom
                    width: parent.width
                    //y: childrenRect.height
                }
            }
        }

        model: ListModel {
            id: songModel

            Component.onCompleted: {
                for(var i = 0; i < count; i++) {
                    for(var j = 0; j < i; j++) {
                        if(get(i).title < get(j).title)
                            move(i,j,1)
                    }
                }
            }
        }

        delegate: SwipeDelegate {
            id: swipeDelegate
            text: model.title
            width: parent.width
            font.family: "Helvetica" //"None Sans"
            font.pointSize: root.width * 0.03

            onClicked: mplayer.setMedia(model.id)

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
