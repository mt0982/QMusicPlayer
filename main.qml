import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.0

//http://doc.qt.io/qt-4.8/qtbinding.html#receiving-signals
//https://s-media-cache-ak0.pinimg.com/originals/c2/af/95/c2af951ba1ce42d5b536cd98ef3f8303.png

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 480 * 0.6
    height: 800 * 0.6

    Connections {
        target: mplayer
        onSendDuration: console.log("A")
    }

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
        width: 64
        height: 64
        anchors.right: btnPlayStop.left
        anchors.rightMargin: 15
        anchors.verticalCenter: btnPlayStop.verticalCenter
        background: Image {
            anchors.fill: parent
            source: "qrc:/icon/backward.png"
        }
    }

    Button {
        id: btnPlayStop
        y: 428
        width: 80
        height: 80
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        background: Image {
            id: btnIcon
            anchors.fill: parent
            source: "qrc:/icon/play.png"
        }
        onClicked: {
            switch (mplayer.play()) {
            case 1:
                btnIcon.source = "qrc:/icon/pause.png"
                break;
            case 2:
                btnIcon.source = "qrc:/icon/play.png"
                break;
            default:
                break;
            }
        }
    }

    Button {
        id: btnNext
        y: 428
        width: 64
        height: 64
        anchors.left: btnPlayStop.right
        anchors.leftMargin: 15
        anchors.verticalCenter: btnPlayStop.verticalCenter
        background: Image {
            anchors.fill: parent
            source: "qrc:/icon/forward.png"
        }
    }

    Label {
        id: title
        text: qsTr("<b>Counting Down The Days</b> <br>Natalie Imbruglia")
        //anchors.top: sliderDuration.bottom
        //anchors.topMargin: 25
        anchors.horizontalCenterOffset: 0
        font.family: "None Sans"
        font.pointSize: 10
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        y: Math.abs((sliderDuration.y + (sliderDuration.height / 2) + btnPlayStop.y) / 2)
    }
}















