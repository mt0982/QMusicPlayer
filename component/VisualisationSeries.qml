import QtQuick 2.0
import QtCharts 2.0

Item {

    property alias series: series

    ChartView {
        anchors.bottom: parent.bottom
        legend.visible: false
        backgroundColor: "transparent"
        height: parent.height * 0.1
        width: root.width
        antialiasing: true
        margins {
            left: 0
            right: 0
            bottom: 0
        }

        BarSeries {

            axisX: ValueAxis {
                min: -0.5
                max: 20.5
                visible: false
            }

            axisY: ValueAxis {
                min: 0
                max: 1
                visible: false
            }

            BarSet {
                id: series
                borderWidth: 0.1
                borderColor: "red"
                color: Qt.rgba(180, 180, 180, 0.5)
            }
        }
    }
}
