import QtQuick 2.0
import QtQuick.Controls 2.0

Item {

    property alias sliderDuration: sliderDuration
    property alias currentTime: currentTime
    property alias maxTime: maxTime
    property alias btnIcon: btnIcon
    property int maxDuration

    ProgressBar {
        id: sliderDuration
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 25
        width: parent.width - 100
        MouseArea {
            anchors.fill: parent
            onClicked: {
                var percentage = ((mouseX * 100) / width) / 100;
                mplayer.setPosition(percentage * maxDuration)
            }
        }
        onValueChanged: {
            if (value === maxDuration)
                btnIcon.source = "qrc:/icon/play.png"
        }
    }

    Label {
        id: currentTime
        anchors.verticalCenter: sliderDuration.verticalCenter
        anchors.right: sliderDuration.left
        anchors.rightMargin: 10
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
        width: 64
        height: 64
        anchors.right: btnPlayStop.left
        anchors.rightMargin: 15
        anchors.verticalCenter: btnPlayStop.verticalCenter
        background: Image {
            anchors.fill: parent
            source: "qrc:/icon/backward.png"
        }
        onClicked: mplayer.backward()
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
        onClicked: mplayer.forward()
    }

    Label {
        id: title
        text: qsTr("<b>Counting Down The Days</b> <br>Natalie Imbruglia")
        anchors.horizontalCenterOffset: 0
        font.family: "None Sans"
        font.pointSize: 10
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        y: Math.abs((sliderDuration.y + (sliderDuration.height / 2) + btnPlayStop.y) / 2)
    }
}
