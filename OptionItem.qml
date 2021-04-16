import QtQuick 2.0

Item {
    property string title;
    property string icon;
    MouseArea{
        anchors.fill: parent
        Image {
            id: optionImage
            source: icon
        }
        Text{
            text: title;
        }
    }
}
