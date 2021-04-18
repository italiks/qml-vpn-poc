import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

Item {
    id: infoPopupRoot

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
        infoPopup.open();
    }

    Popup{
        property int backgroundRadius: 5;
        id: infoPopup
        x:popupCoordinateX;
        y:popupCoordinateY
        contentWidth: popupWidth
        contentHeight: popupHeight
        padding: 0

        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        contentItem:
            Item{
            Image{
                id: redEye
                source: "images/info-popup/red-eye.svg"
                opacity: infoPopup.opacity;
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top;
                anchors.topMargin: 20
            }
            Text {
                id: infoText
                readonly property color defColor: Qt.rgba(1, 1, 1, 0.7)
                text: qsTr("If your IP address is visible,\n your device will be more vulnereable\n to threats, viruses & hacks online")
                font: infoPopupRoot.font
                opacity: infoPopup.opacity;
                anchors.top: redEye.bottom
                anchors.topMargin: 10
                color: defColor;
                anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        background:
            Canvas {
                    onPaint: {
                        let radius = 12;
                        let triangleHeight = 4;

                        var ctx = getContext("2d")
                        ctx.fillStyle = infoPopupRoot.popupBackgroundColor
                        ctx.lineWidth = 2;
                        ctx.beginPath()
                        ctx.antialiasing = true;

                       //top right corner
                        ctx.moveTo(radius,0)
                        ctx.lineTo(width-radius,0);
                        ctx.arcTo(width,0,width,radius,radius);

                        //bottom right corner
                        ctx.lineTo(width,height-radius-triangleHeight);
                        ctx.arcTo(width,height-triangleHeight,width-radius,height-triangleHeight,radius);

                        ctx.lineTo(width/2+triangleHeight+radius, height-triangleHeight);
                        ctx.lineTo(width/2, height);
                        ctx.lineTo(width/2-triangleHeight-radius, height-triangleHeight);

                        //bottom left corner
                        ctx.lineTo(radius,height-triangleHeight);
                        ctx.arcTo(0,height-triangleHeight,0,height-radius-triangleHeight,radius);

                        //top left
                        ctx.lineTo(0,radius);
                        ctx.arcTo(0,0,radius,0,radius);

                        ctx.closePath()
                        ctx.fill()
                    }
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
                    to: 5;
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
