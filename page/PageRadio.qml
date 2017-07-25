import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtMultimedia 5.6
//import QtQuick.Extras 1.4

Item {

    Rectangle {
        anchors.fill: parent
        color: "#324254"
    }


    Radio {
        id: radio
        band: Radio.FM

        Component.onCompleted: {
            console.log(radio.minimumFrequency)
            console.log(radio.maximumFrequency)
        }

        //onFrequencyChanged: console.log(frequency)
        //onStationFound: start()
    }

    Row {
        Button {
            text: "UP"
            onClicked: {
//                console.log("UP")
//                radio.scanUp()
                console.log(radio.maximumFrequency)
            }
        }
        Button {
            text: "DOWN"
            onClicked: {
//                console.log("DOWN")
//                radio.scanDown()
                console.log(radio.state)
            }
        }
    }
}
