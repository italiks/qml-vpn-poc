import QtQuick 2.0

Item {
    id: root

    property string title;
    property string icon;
    property font font: Qt.font(
                            {
                                family:"Arial",
                                pixelSize: 12
                            })

    MouseArea{
        anchors.fill: parent
        Rectangle {
            id: content
            anchors.fill: parent
            anchors.leftMargin: 35
            anchors.rightMargin: 35
            color: "#484848"
            Row {
                anchors.fill: parent
                spacing: 14
                Image {
                    id: optionImage
                    source: root.icon
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text{
                    readonly property color defColor: Qt.rgba(1, 1, 1, 0.7)
                    id: caption
                    text: root.title;
                    font: root.font
                    color: defColor
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }

        hoverEnabled: true

        onEntered:  caption.color = "white"
        onExited: caption.color = caption.defColor
    }
}
