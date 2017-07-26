import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtMultimedia 5.6
import QtQuick.Layouts 1.3
import "../component"
import "../page"

Item {

    PageSetting { id: pageSetting }

    property bool heightFlag: true

    Connections {
        target: mplayer
        onSendDuration: {
            pageMusic.maxDuration = duration;
            pageMusic.sliderDuration.to = duration;
            pageMusic.maxTime.text = durationText;
            pageMusic.title.text = mplayer.baseNames()[currentIndex]
        }
        onSendPosition: {
            pageMusic.currentTime.text = positionText;
            pageMusic.sliderDuration.value = position;
        }
        onSendStatus: {
            pageMusic.btnIcon.source = status
        }
    }

    Image {
        id: cover
        height: (heightFlag) ? parent.height * 0.55 : parent.height * 0.3
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        source: "https://wallpaperscraft.com/image/balloon_flight_plant_91681_1920x1080.jpg"
        fillMode: Image.PreserveAspectCrop

        Rectangle {
            width: parent.width
            height: 1
            color: "#ccf55c47"
            anchors.bottom: parent.bottom
        }

        Behavior on height {

            NumberAnimation {
                duration: 600
                easing.type: Easing.OutBounce
            }
        }

        Button {
            width: root.width * 0.08
            height: root.width * 0.08
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: 15
            background: Image { source: "qrc:/icon/settings.png" }
            onClicked: stack.push(pageSetting)
        }
    }

    TabBarOption {
        id: bar
        anchors.horizontalCenter: cover.horizontalCenter
        anchors.bottom: cover.bottom
    }

    StackLayout {
        width: parent.width
        currentIndex: bar.currentIndex
        anchors.top: cover.bottom
        anchors.bottom: parent.bottom

        PageMusic {
            id: pageMusic
        }

        PagePlaylist {
            id: pagePlaylist
            Component.onCompleted: addSongs(mplayer.baseNames(), mplayer.absolutePaths())
        }

        PageRadio {

        }

        onCurrentIndexChanged: {
            if (currentIndex == 1) heightFlag = false;
            else heightFlag = true;
        }
    }
}
