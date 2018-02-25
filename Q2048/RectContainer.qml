import QtQuick 2.0
import "JsFunc.js" as JsFunc

Rectangle {
    id: id_rectContainer
    property color subRectColor: "#999999"
    property real move_begin_x: 0
    property real move_end_x: 0
    property real move_begin_y: 0
    property real move_end_y: 0
    signal moveRect(real deltaX,real deltaY)

    anchors.centerIn: parent
    width: 290
    height: 290
    radius: 5
    color: "#CCCCCC"
    MouseArea {
        id: id_mouseArea
        anchors.fill: parent
        onPressed: {
            move_begin_x = mouseX
            move_begin_y = mouseY
        }
        onReleased: {
            move_end_x = mouseX
            move_end_y = mouseY
            var steps = 70;
            var delta_x = move_end_x - move_begin_x;
            var delta_y = move_end_y - move_begin_y;
            if(delta_x && delta_y) {
                var delta_point = JsFunc.moveTo(delta_x,delta_y,steps);
                moveRect(delta_point.moveX,delta_point.moveY); // emitt signal
            }
        }
    }
    Repeater {
        model: 16
        Rectangle {
            width: 60
            height: 60
            radius: 5
            x: JsFunc.pointAt(index).x-30; y: JsFunc.pointAt(index).y-30
            color: subRectColor
        }
    }
}
