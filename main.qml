import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls 2.0
import "component"
import "page"

//http://doc.qt.io/qt-4.8/qtbinding.html#receiving-signals
//https://s-media-cache-ak0.pinimg.com/originals/c2/af/95/c2af951ba1ce42d5b536cd98ef3f8303.png

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















