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
            opacity: root.opacity
            Row {
                anchors.fill: parent
                spacing: 14
                Image {
                    id: optionImage
                    source: root.icon
                    anchors.verticalCenter: parent.verticalCenter
                    opacity: root.opacity;
                }
                Text{
                    readonly property color defColor: Qt.rgba(1, 1, 1, 0.7)
                    id: caption
                    text: root.title;
                    font: root.font
                    color: defColor
                    anchors.verticalCenter: parent.verticalCenter
                    opacity: root.opacity;

                    states: [
                            State {
                                name: "hovered"
                                PropertyChanges { target: caption; color: "white" }
                            },
                            State {
                                name: "default"
                                PropertyChanges { target: caption; color: caption.defColor }
                            }
                        ]
                }
            }
        }

        hoverEnabled: true

        onEntered:  caption.state = "hovered"
        onExited: caption.state = "default"
    }
}
