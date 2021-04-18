import QtQuick 2.0

Item {
    id: toggleswitch;
    width: background.width;
    height: background.height;


    property bool on: false

    function toggle() {
        if (toggleswitch.state == "on")
            toggleswitch.state = "off";
        else
            toggleswitch.state = "on";
    }

    function releaseSwitch() {
        if(knob.x == knob.minX) {
            if (toggleswitch.state == "off")
                return;
        }

        if (knob.x == knob.maxX) {
            if (toggleswitch.state == "on")
                return;
        }

        toggle();
    }

    Rectangle {
        id: background
        width: 120
        height: 50
        color: "transparent"
        radius: height / 2
        border.color: progress_color
        border.width: 2

        readonly property color progress_color: "#FF3434"
        readonly property color on_color: "#35B12B"

        MouseArea {
            anchors.fill: parent
//            anchors.rightMargin: -8
//            anchors.bottomMargin: -12
            onClicked: toggle()
        }
    }

    Rectangle {
        id: knob
        x: minX; y: -2
        width: diameter
        height: diameter
        color: "white"
        radius: diameter / 2

        readonly property int diameter: background.height + 6
        readonly property int minX: 0
        readonly property int maxX: background.width - diameter
        property bool in_progress: false

//        anchors.verticalCenter: background.height / 2
//        anchors.baseline: background.height / 2

        MouseArea {
            anchors.fill: parent
            drag.target: knob; drag.axis: Drag.XAxis; drag.minimumX: parent.minX; drag.maximumX: parent.maxX;
            onClicked: toggle()
            onReleased: releaseSwitch()
        }
        Image{
            anchors.fill: parent
            anchors.centerIn: parent
            source: "images/MainToggle.png"
        }
        ProgressCircle {
            visible: parent.in_progress
            anchors.centerIn: parent
            size: parent.diameter / 2
            colorCircle: "#0092CC"
            colorBackground: "#E6E6E6"
            showBackground: true
            arcBegin: 0
            arcEnd: 270
            lineWidth: 2
        }
    }

    anchors.margins: 10

/*
    Image {
        id: background
        source: "background.png"
        MouseArea {
            anchors.fill: parent
            anchors.rightMargin: -8
            anchors.bottomMargin: -12
            onClicked: toggle()
        }
    }
*/
    /*
    Image {
        id: knob
        x: 1; y: 2
        source: "knob.png"

        MouseArea {
            anchors.fill: parent
            drag.target: knob; drag.axis: Drag.XAxis; drag.minimumX: 1; drag.maximumX: 78;
            onClicked: toggle()
            onReleased: releaseSwitch()
        }
    }
*/

    Timer {
        id: timer
        interval: 2000
        onTriggered: {
            knob.in_progress = false;
            background.color = background.on_color
            background.border.color = background.on_color
        }
    }

    states: [
        State {
            name: "on"
            PropertyChanges {
                target: knob; x:knob.maxX
            }
            PropertyChanges {
                target: toggleswitch
                on: true
            }
            PropertyChanges {
                target: background
                color: background.progress_color
            }
            PropertyChanges {
                target: knob
                in_progress: true
            }
            StateChangeScript {
                name: "start_progress"
                script: {
                    timer.start()
                }
            }
        },
        State {
            name: "off"
            PropertyChanges {
                target: knob; x:knob.minX
            }
            PropertyChanges {
                target: toggleswitch
                on: false
            }
            PropertyChanges {
                target: background
                color: "transparent"
                border.color: background.progress_color
            }
            StateChangeScript {
                name: "stop_progress"
                script: {
                    timer.stop()
                }
            }
        }
    ]

    transitions: Transition {
        NumberAnimation { properties: "x"; easing.type: Easing.InOutQuad; duration: 200 }
    }
}
