import QtQuick 2.0
import QtQuick.Controls 2.0
import "../abstract"

Item {

    property alias sliderDuration: sliderDuration
    property alias currentTime: currentTime
    property alias maxTime: maxTime
    property alias btnIcon: btnIcon
    property alias title: title
    property int maxDuration


    Slider {
        id: sliderDuration
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.1  //Static Android 35 // PC - 25
        width: parent.width - 150               //PC - 100

        background: Rectangle {
            x: sliderDuration.leftPadding
            y: sliderDuration.topPadding + sliderDuration.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 4
            width: sliderDuration.availableWidth
            height: implicitHeight
            radius: 2
            color: "#bdbebf"

            Rectangle {
                width: sliderDuration.visualPosition * parent.width
                height: parent.height
                color: "#f55b47"
                radius: 2
            }
        }

        handle: Rectangle {
            x: sliderDuration.leftPadding + sliderDuration.visualPosition * (sliderDuration.availableWidth - width)
            y: sliderDuration.topPadding + sliderDuration.availableHeight / 2 - height / 2
            implicitWidth: parent.width * 0.1
            implicitHeight: parent.width * 0.1
            radius: parent.width * 0.1
            color: sliderDuration.pressed ? "#f0f0f0" : "#f6f6f6"
            border.color: "#bdbebf"
        }

        MouseArea {
            anchors.fill: parent
            onMouseXChanged: {
                var percentage = ((mouseX * 100) / width) / 100;
                mplayer.setPosition(percentage * maxDuration)
            }
        }
    }

    Label {
        id: currentTime
        anchors.verticalCenter: sliderDuration.verticalCenter
        anchors.right: sliderDuration.left
        anchors.rightMargin: 10
        text: "0:00"
    }

    Label {
        id: maxTime
        anchors.verticalCenter: sliderDuration.verticalCenter
        anchors.left: sliderDuration.right
        anchors.leftMargin: 10
    }

    Button {
        id: btnPrevious
        x: 25
        y: 428
        width: parent.width * 0.16 //Static Android - 80 //PC - 64
        height: parent.width * 0.16 //Static Android - 80 //PC - 64
        anchors.right: btnPlayStop.left
        anchors.rightMargin: 15
        anchors.verticalCenter: btnPlayStop.verticalCenter
        background: Image {
            anchors.fill: parent
            source: "qrc:/icon/backward.png"
        }
        onClicked: {
            mplayer.backward()
            btnIcon.source = "qrc:/icon/pause.png"
        }
    }

    Button {
        id: btnPlayStop
        y: 428
        width: parent.width * 0.26      //Static Android - 128 //PC - 64
        height: parent.width * 0.26     //Static Android - 128 //PC - 64
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
        width: parent.width * 0.16      //Static Android - 80 //PC - 64
        height: parent.width * 0.16     //Static Android - 80 //PC - 64
        anchors.left: btnPlayStop.right
        anchors.leftMargin: 15
        anchors.verticalCenter: btnPlayStop.verticalCenter
        background: Image {
            anchors.fill: parent
            source: "qrc:/icon/forward.png"
        }
        onClicked: {
            mplayer.forward()
            btnIcon.source = "qrc:/icon/pause.png"
        }
    }

    Label {
        id: title
        text: qsTr("<b>Counting Down The Days</b> <br>Natalie Imbruglia")
        font.family: "Helvetica" //"None Sans"
        font.pointSize: root.width * 0.03
        color: "#324254"
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Label.AlignVCenter
        horizontalAlignment: Label.AlignHCenter
        y: Math.abs((sliderDuration.y + (sliderDuration.height / 2) + btnPlayStop.y) / 2)
        width: root.width * 0.8
        wrapMode: Label.WordWrap
    }
}
























