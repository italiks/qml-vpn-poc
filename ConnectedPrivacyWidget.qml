import QtQuick 2.0

Item {

    Column{
        spacing: 10
        anchors.centerIn: parent
    Text {
        id:privacyStatusTitle;
        height: 21
        font.pixelSize: 16
        font.family: roboto.name
        color: "white"
        text: qsTr("Your online privacy is")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
        id: connectedTitle;
        anchors.topMargin: 3;
        height: 24
        font.pixelSize: 18
        font.capitalization: Font.AllUppercase
        font.bold: true
        font.family: robotoMedium.name
        color: "#FF3434"
        text: qsTr("NOT PROTECTED")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter

    }
    Text {
        anchors.topMargin: 11;
        height: 19
        id: line3
        font.pixelSize: 13
        font.family: roboto.name
        color: "white"
        text: qsTr("Turn VPN on to mask your details")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
    }
}
