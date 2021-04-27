import QtQuick 2.12
import QtQuick.Window 2.1
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.5

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

    OptionsPopup{
        id:optionsPopup
        popupCoordinateX:0
        popupCoordinateY: 42;
        popupWidth: root.width;
        popupHeight: 90;
        font: Qt.font({
                      family: roboto.name,
                      pixelSize: 13
                      })
    }

    InfoPopup {
        id: insecureInfo
        popupHeight: 164
        popupWidth: 230
        popupCoordinateX: infoSign.x+infoSign.width/2 - popupWidth/2
        popupCoordinateY: infoSign.y - popupHeight;
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
            onClicked: {
                optionsPopup.openPopup();
            }
        }

        ConnectedPrivacyWidget
        {
            id:connectedPrivacyWidget
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true;
            Layout.topMargin: 10
            Layout.preferredHeight: 70
        }


        Toggler {
            on: false
            Layout.topMargin: 20
            Layout.alignment: Qt.AlignHCenter
        }

        LocationCombox{
            id: locationSelector
            Layout.topMargin: 37
            Layout.alignment: Qt.AlignHCenter
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
            onClicked:
            {
                insecureInfo.openPopup();
            }
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

        AdawareFooter{
            Layout.fillWidth: true;
            Layout.preferredHeight: 40;
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:10}
}
##^##*/
