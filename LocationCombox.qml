import QtQuick 2.0
import QtQuick.Controls 2.5

Item {

    readonly property color locationComboBoxMainColor: "#1C1C1C";
    readonly property color locationBorderColor: Qt.rgba(1, 1, 1, 0.15);
    readonly property color unhoveredTextColor: Qt.rgba(1, 1, 1, 0.6)
    readonly property color hoveredTextColor: "white"
    readonly property int commonRadius:6;
    readonly property int commonBorderWidth:2;

    ComboBox {
        id: servers
        anchors.centerIn: parent
        model: ["Test", "Est", "St"]
        background: Rectangle {
            id: servers_background
            implicitHeight: 36
            implicitWidth: 220
            radius: 6
            border.width: 2
            border.color: locationBorderColor
            color:locationComboBoxMainColor;
        }

        delegate: ItemDelegate {
            id: itemDlg
            width: servers.width
            height: 36
            contentItem: Text {
                id:textItem
                text: modelData
                color: hovered ? hoveredTextColor : unhoveredTextColor
                font.pixelSize: 13
                font.family: roboto.name
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
            }

            background: Rectangle {
                anchors.fill: parent
                radius: 2
                color: itemDlg.hovered ? locationComboBoxMainColor : Qt.lighter(locationComboBoxMainColor, 1.2)
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
                     border.color: locationBorderColor
                     border.width: commonBorderWidth
                     radius: commonRadius
                     color: locationComboBoxMainColor
                 }
        }
    }
}
