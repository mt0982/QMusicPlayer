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
            }

            CheckBox { text: qsTr("Sequential") }
            CheckBox { text: qsTr("Repeat") }
            CheckBox { text: qsTr("Radom") }
        }
    }

//    GroupBox {
//        title: "Playback Mode:"
//        width: parent.width

//        ColumnLayout {
//            anchors.fill: parent
//            CheckBox { text: qsTr("Repeat") }
//            CheckBox { text: qsTr("Sequential") }
//            CheckBox { text: qsTr("Loop") }
//            CheckBox { text: qsTr("Radom") }
//        }
//    }
}
