import QtQuick 2.12
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1
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


        ComboBox {
            id: servers

            model: ["Test", "Est", "St"]

            Layout.topMargin: 37
            Layout.alignment: Qt.AlignCenter
            background: Rectangle {
                id: servers_background
                implicitHeight: 36
                implicitWidth: 220
                radius: 6
                border.width: 2
                border.color: Qt.rgba(1, 1, 1, 0.15)
                color: "#1C1C1C"
            }

            delegate: ItemDelegate {
                id: itemDlg
                width: 200
                height: 36
                contentItem: Text {
                    id:textItem
                    text: modelData
                    color: hovered ? "white" : Qt.rgba(1, 1, 1, 0.6)
                    font.pixelSize: 13
                    font.family: roboto.name
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    leftPadding: 20
                }

                background: Rectangle {
                    anchors.fill: parent
                    color: itemDlg.hovered ? servers_background.color : Qt.lighter(servers_background.color, 1.2)
                }
            }

            contentItem: Text {
                font.family: roboto.name
                font.pixelSize: 13
                text: servers.displayText
                color: "white"
                anchors.left: servers.left
                anchors.leftMargin: 13
                verticalAlignment: Text.AlignVCenter
            }

            indicator: Canvas {
                id: canvas
                height: 5.44
                width: 9.63
                anchors.right: servers.right
                anchors.rightMargin: 12.5
                anchors.verticalCenter: servers.verticalCenter
                contextType: "2d"

                Connections {
                    target: servers
                    function onPressedChanged() { canvas.requestPaint(); }
                }

                onPaint: {
                    context.reset();
                    context.lineWidth = 2;
                    context.lineJoin = "round";
                    context.lineCap = "round";
                    if (servers.popup.visible) {
                        console.log('POPup visible');
                        context.moveTo(0, height);
                        context.lineTo(width / 2, 0);
                        context.lineTo(width, height);
                    }
                    else {
                        console.log('POPup invisible');
                        context.moveTo(0, 0);
                        context.lineTo(width / 2, height);
                        context.lineTo(width, 0);
                    }

                    context.strokeStyle = Qt.rgba(1, 1, 1, 0.5)
                    context.stroke()
                }
            }

            popup: Popup {
                     y: servers.height - 1
                     width: servers.width
                     implicitHeight: contentItem.implicitHeight
                     padding: 1

                     contentItem: ListView {
                         id: content_lv
                         clip: true
                         implicitHeight: contentHeight
                         model: servers.popup.visible ? servers.delegateModel : null
                         currentIndex: servers.highlightedIndex

                         ScrollIndicator.vertical: ScrollIndicator { }
                     }

                     background: Rectangle {
                         border.color: servers_background.border.color
                         border.width: servers_background.border.width
                         radius: servers_background.radius
                         color: servers_background.color
                     }
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
