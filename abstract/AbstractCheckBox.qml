import QtQuick 2.6
import QtQuick.Controls 2.0

CheckBox {

    id: control

    Component.onCompleted: {
        var y = ((parent.implicitHeight * 0.3) % 2) ? 1 : 0;
        var x = ((parent.implicitWidth * 0.3) % 2) ? 1 : 0;

        checkBox.implicitWidth = parent.implicitHeight * 0.3 + x
        checkBox.implicitHeight = parent.implicitHeight * 0.3 + y
    }

    indicator: Rectangle {
        id: checkBox
        //implicitWidth: 32
        //implicitHeight: 32
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        border.color: control.down ? "#405163" : "#324254"

        Rectangle {
            width: ((parent.implicitWidth * 0.6) % 2) ? parent.implicitWidth * 0.6 + 1 : parent.implicitWidth * 0.6
            height: ((parent.implicitHeight * 0.6) % 2) ? parent.implicitWidth * 0.6 + 1 : parent.implicitWidth * 0.6
            anchors.centerIn: parent
            color: control.down ? "#405163" : "#324254"
            visible: control.checked
        }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#405163" : "#324254"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }
}
