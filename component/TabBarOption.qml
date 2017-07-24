import QtQuick 2.0
import QtQuick.Controls 2.0

Item {

    TabBar {
        id: bar
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
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

            Image {
                anchors.centerIn: parent
                width: parent.width * 0.5
                height: parent.height * 0.5
                source: parent.checked ? "qrc:/icon/music_checked.png" : "qrc:/icon/music_unchecked.png"
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
