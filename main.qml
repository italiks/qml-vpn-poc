import QtQuick 2.12
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1

Window {
    id: root
    width: 290
    height: 390
    visible: true
    title: qsTr("Adaware VPN")
    color: "#232323"

    FontLoader {
        id: roboto
        source: "fonts/Roboto.ttf"
    }

    FontLoader {
        id: robotoMedium
        source: "fonts/Robotomedium.ttf"
    }

    ColumnLayout{
        anchors.fill: parent
        spacing: 0
        RoundButton {
            Layout.alignment: Qt.AlignRight | Qt.AlignTop
            Layout.rightMargin: 14
            Layout.topMargin: 9
            Layout.bottomMargin: 5
            diameter: 24
            Image {
                id: background
                width: 24
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                source: "images/three-dots.svg"
            }
        }

        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            height: 21
            id: line1
            font.pixelSize: 16
            font.family: roboto.name
            color: "white"
            text: qsTr("Your online privacy is")
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            height: 24
            Layout.topMargin: 3
            id: line2
            font.pixelSize: 18
            font.capitalization: Font.AllUppercase
            font.bold: true
            font.family: robotoMedium.name
            color: "#FF3434"
            text: qsTr("NOT PROTECTED")
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.topMargin: 11
            height: 19
            id: line3
            font.pixelSize: 13
            font.family: roboto.name
            color: "white"
            text: qsTr("Turn VPN on to mask your details")
        }


        Toggler {
//            anchors.centerIn: parent
            on: false
            Layout.topMargin: 27
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }


        Rectangle {
            id: servers
            width: 220
            height: 36
            radius: 6
            border.width: 2
            border.color: Qt.rgba(1, 1, 1, 0.15)
            color: "#1C1C1C"
            Layout.topMargin: 37
            Layout.alignment: Qt.AlignCenter

            Text {
                id: caption
                font.pixelSize: 13
                text: qsTr("Select location")
                color: "white"
                anchors.left: parent.left
                anchors.leftMargin: 13
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        RoundButton {
            id: infoSign
            diameter: 16
            border.width: 2
            border.color: "white"
            Text {
                text: "i"
                color: "white"
                anchors.centerIn: parent
                font.pixelSize: 10
            }

            Layout.alignment: Qt.AlignCenter
            Layout.topMargin: 40
        }

        Text {
            text: qsTr("Your IP address is visible 77.222.144.450")
            font.pixelSize: 11
//            font.pointSize: 11
            font.family: "Roboto"
            color: "white"
            Layout.alignment: Qt.AlignCenter
            Layout.topMargin: 5
            Layout.maximumHeight: 15
        }

        Item {
            Layout.fillHeight: true;
            Layout.fillWidth: true;
        }

        Rectangle {
            id: footer
            Layout.fillWidth: true
            Layout.preferredHeight: 38
            color: Qt.rgba(1, 1, 1, 0.05)
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:10}
}
##^##*/
