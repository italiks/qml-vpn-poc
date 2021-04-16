import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

Item {
    id: root

    property int popupCoordinateX;
    property int popupCoordinateY;
    property int popupWidth;
    property int popupHeight;

    property font font: Qt.font(
                            {
                                family:"Arial",
                                pixelSize: 12
                            })

    readonly property color popupBackgroundColor: "#484848";
    function openPopup(){
        optionsMainPopup.open();
    }

    Popup{
        id: optionsMainPopup
        x:popupCoordinateX;
        y:popupCoordinateY
        contentWidth: popupWidth
        contentHeight: popupHeight
        padding: 0

        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        contentItem:
            Column {
            anchors.fill: parent;
            OptionItem{
                width: parent.width
                height: parent.height/2;
                title: "How VPN Works"
                icon: "images/how-vpn-works.svg"
                font: root.font
            }
            OptionItem{
                width: parent.width
                height: parent.height/2;
                title: "See Full Settings"
                icon: "images/full-settings.svg"
                font: root.font
            }
        }
        background: Rectangle{
            anchors.fill: parent
            color:popupBackgroundColor
        }
        enter: Transition {
                   NumberAnimation { properties: "x"; from: 0; to: popupCoordinateX}
                   NumberAnimation { properties: "y"; from: 0; to: popupCoordinateY}
               }
    }
}
