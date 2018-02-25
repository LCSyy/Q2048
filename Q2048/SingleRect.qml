import QtQuick 2.0

Rectangle {
    id: id_SingleRect
    property alias text:id_SingleTxt.text
    property real centerX: 0
    property real centerY: 0
    property bool openBehavior: true
    property real nextX: 0
    property real nextY: 0
    x: (centerX - width/2>0)?(centerX - width/2):0    // the simplest way of property bindings
    y: (centerY - height/2>0)?(centerY - height/2):0
    width: 30
    height: 30
    radius: 5
    color: "grey"
    Behavior on width {
        enabled: id_SingleRect.openBehavior
        NumberAnimation {
            target: id_SingleRect
            property: "width"
            duration: 300
            easing.type: Easing.OutElastic
        }
    }
    Behavior on height {
        enabled: id_SingleRect.openBehavior
        NumberAnimation {
            target: id_SingleRect
            property: "height"
            duration: 300
            easing.type: Easing.OutElastic
        }
    }
    Text {
        id: id_SingleTxt
        anchors.centerIn: id_SingleRect
        font { pointSize: 20; family: "Areal" }
        text: "2"
    }
}
