import QtQuick 2.0
import QtQuick.Controls 2.5
Item {
    property string imageSource;
    property string itemText;
    Image{
        id:countryImage
        source: imageSource
        width:28;
        height: 24;
        fillMode: Image.PreserveAspectFit
        anchors.left: parent.left;
        anchors.leftMargin: 10;
        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        text: itemText
        font.pixelSize: 13
        font.family: roboto.name
        color: "white"

        anchors.left: countryImage.right
        anchors.leftMargin: 10;
        anchors.verticalCenter: parent.verticalCenter

        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
    }
}
