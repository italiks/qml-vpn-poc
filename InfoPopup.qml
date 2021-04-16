import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
//https://stackoverflow.com/questions/61627261/shape-for-popup-in-qml
Item {
    id: root

    property int popupCoordinateX;
    property int popupCoordinateY;
    property int popupWidth;
    property int popupHeight;
    property string icon: ""
    property string message: ""

    property font font: Qt.font(
                            {
                                family:"Arial",
                                pixelSize: 12
                            })

    readonly property color popupBackgroundColor: "#484848";


    function openPopup(){
        infoPopup.open();
    }

    Popup{
        id: infoPopup
        x:popupCoordinateX;
        y:popupCoordinateY
        contentWidth: popupWidth
        contentHeight: popupHeight
        padding: 0

        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        contentItem: Column {
            anchors.fill: parent;
            anchors.topMargin: 21
            spacing: 16
            Image {
                id: infoImage
                source: root.icon
                anchors.verticalCenter: parent.verticalCenter
            }
            Text{
                readonly property color defColor: Qt.rgba(1, 1, 1, 0.7)
                id: caption
                text: root.message;
                font: root.font
                color: defColor
                anchors.verticalCenter: parent.verticalCenter
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
