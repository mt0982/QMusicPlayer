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

    signal sendSliderValue(int x)

    property var maxDuration

    Connections {
        target: mplayer
        onSendDuration: {
            maxDuration = duration;
            sliderDuration.to = duration;
            maxTime.text = durationText;
        }
        onSendPosition: {
            currentTime.text = positionText;
            sliderDuration.value = position;
        }
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

    ProgressBar {
        id: sliderDuration
        anchors.horizontalCenter: cover.horizontalCenter
        anchors.top: cover.bottom
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
        text: "0:10"
    }

    Label {
        id: maxTime
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
        anchors.horizontalCenterOffset: 0
        font.family: "None Sans"
        font.pointSize: 10
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        y: Math.abs((sliderDuration.y + (sliderDuration.height / 2) + btnPlayStop.y) / 2)
    }


    TabBar {
        id: bar
        anchors.horizontalCenter: cover.horizontalCenter
        anchors.bottom: cover.bottom
        background: Rectangle {
            anchors.fill: parent
            color: "transparent"
        }

        TabButton {
            width: parent.height
            height: parent.height

            background: Rectangle {
                opacity: parent.checked ? 0.6 : 0
                gradient: Gradient {
                    GradientStop {
                        position: 0.00;
                        color: "transparent";
                    }
                    GradientStop {
                        position: 1.00;
                        color: "#f55b47";
                    }
                }

                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 3
                    color: "#f55b47";
                }
            }
        }

        TabButton {
            width: parent.height
            height: parent.height

            background: Rectangle {
                opacity: parent.checked ? 0.6 : 0
                gradient: Gradient {
                    GradientStop {
                        position: 0.00;
                        color: "transparent";
                    }
                    GradientStop {
                        position: 1.00;
                        color: "#f55b47";
                    }
                }

                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 3
                    color: "#f55b47";
                }
            }
        }

        TabButton {
            width: parent.height
            height: parent.height

            background: Rectangle {
                opacity: parent.checked ? 0.6 : 0
                gradient: Gradient {
                    GradientStop {
                        position: 0.00;
                        color: "transparent";
                    }
                    GradientStop {
                        position: 1.00;
                        color: "#f55b47";
                    }
                }

                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 3
                    color: "#f55b47";
                }
            }
        }
    }
}















