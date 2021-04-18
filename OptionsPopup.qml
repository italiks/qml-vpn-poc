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
        property int backgroundRadius: 0;
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
                opacity: optionsMainPopup.opacity;
            }
            OptionItem{
                width: parent.width
                height: parent.height/2;
                title: "See Full Settings"
                icon: "images/full-settings.svg"
                font: root.font
                opacity: optionsMainPopup.opacity;
            }
        }
        background: Rectangle{
            anchors.fill: parent
            color:popupBackgroundColor;
            radius: optionsMainPopup.backgroundRadius;
        }
        enter: Transition {
            ParallelAnimation {
                NumberAnimation {
                    property: "opacity";
                    from: 0.0;
                    to: 1.0;
                    duration: 300
                }
                NumberAnimation {
                    property: "scale";
                    from: 0.4;
                    to: 1.0;
                    easing.type: Easing.OutBack
                    duration: 300
                }
                NumberAnimation {
                    property: "backgroundRadius";
                    from: 100;
                    to: 0;
                    easing.type: Easing.OutBack
                    duration: 300
                }
            }
        }
        exit: Transition {
             ParallelAnimation {
                 NumberAnimation {
                     property: "opacity";
                     from: 1.0
                     to: 0.0;
                     duration: 300
                 }
                 NumberAnimation {
                     property: "scale";
                     from: 1.0
                     to: 0.8;
                     duration: 300
                 }
             }
        }
    }
}
