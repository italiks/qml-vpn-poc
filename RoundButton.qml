import QtQuick 2.0

Rectangle {
    id: root

    property int diameter: 24
    property color hoverColor: "#333333"
    property color mainColor: "#232323"
    signal clicked

    width: diameter
    height: diameter
    radius: diameter / 2
    color: mainColor

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked()
        }

        hoverEnabled: true

        onEntered: root.state = "hovered"
        onExited: root.state = ""
    }

    states: [
        State {
            name: "hovered"
            PropertyChanges {
                target: root
                color: root.hoverColor
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;formeditorZoom:6}
}
##^##*/
