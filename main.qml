import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtCharts 2.0
import "component"
import "page"

ApplicationWindow {
    id: root
    visible: true
    color: Qt.rgba(240, 240, 240, 255)
    width: 480 * 0.6
    height: 800 * 0.6

    MainView {
        id: mainView
        visible: false
    }

    StackView {
        id: stack
        initialItem: mainView
        anchors.fill: parent
    }
}















