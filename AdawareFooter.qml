import QtQuick 2.0

Item {
    Rectangle
    {
        anchors.fill: parent;
        color: "#2D2D2D"
        Row{
            anchors.centerIn: parent;
            spacing: 5;
            Image {
                id: adareItemLogo
                height: parent.height;
                fillMode: Image.PreserveAspectFit
                source: "images/AdawareWrapper.PNG"
            }
            Text{
                id: adawareTitle;
                color: "#CBCBCB"
                text: qsTr("Adaware")
                font.pointSize:15;
            }
            Text{
                id: vpnTitle;
                color: "#D36D46"
                text: qsTr("VPN")
                font.pointSize:15;
            }
        }
    }
}
