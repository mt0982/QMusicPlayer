import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 480 * 0.6
    height: 800 * 0.6

    Image {
        id: cover
        height: parent.height * 0.55
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        source: "https://wallpaperscraft.com/image/balloon_flight_plant_91681_1920x1080.jpg"
        fillMode: Image.PreserveAspectCrop
    }

    Slider {
        id: sliderDuration
        anchors.horizontalCenter: cover.horizontalCenter
        anchors.top: cover.bottom
        anchors.topMargin: 10
        width: parent.width - 100
    }

    Label {
        id: currentTime
        anchors.verticalCenter: sliderDuration.verticalCenter
        anchors.right: sliderDuration.left
        anchors.rightMargin: 10
        text: "0:10"
    }

    Label {
        id: durationTime
        anchors.verticalCenter: sliderDuration.verticalCenter
        anchors.left: sliderDuration.right
        anchors.leftMargin: 10
        text: "4:17"
    }

    Button {
        id: btnPrevious
        x: 25
        y: 428
        width: 40
        height: 40
        text: qsTr("<<")
        anchors.verticalCenter: btnPlayStop.verticalCenter
    }

    Button {
        id: btnPlayStop
        x: 124
        y: 428
        width: 40
        height: 40
        text: qsTr(">")
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: btnNext
        x: 215
        y: 428
        width: 40
        height: 40
        text: qsTr(">>")
        anchors.verticalCenter: btnPlayStop.verticalCenter
    }

    Label {
        id: title
        y: 338
        text: qsTr("<b>Counting Down The Days</b> <br>Natalie Imbruglia")
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}















