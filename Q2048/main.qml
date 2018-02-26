import QtQuick 2.8
import QtQuick.Window 2.8
import "JsFunc.js" as JsFunc

Window {
    id: id_app
    objectName: "RootWindow"
    visible: true
    width: 360
    height: 640
    title: qsTr("Hello World")
    ParallelAnimation {
        id: id_parallelAnimation
        PropertyAnimation { target: idRect0;  running:false; property: "centerX"; to:idRect0.cx;  duration: 500}
        PropertyAnimation { target: idRect0;  running:false; property: "centerY"; to:idRect0.cy;  duration: 500}
        PropertyAnimation { target: idRect1;  running:false; property: "centerX"; to:idRect1.cx;  duration: 500}
        PropertyAnimation { target: idRect1;  running:false; property: "centerY"; to:idRect1.cy;  duration: 500}
        PropertyAnimation { target: idRect2;  running:false; property: "centerX"; to:idRect2.cx;  duration: 500}
        PropertyAnimation { target: idRect2;  running:false; property: "centerY"; to:idRect2.cy;  duration: 500}
        PropertyAnimation { target: idRect3;  running:false; property: "centerX"; to:idRect3.cx;  duration: 500}
        PropertyAnimation { target: idRect3;  running:false; property: "centerY"; to:idRect3.cy;  duration: 500}
        PropertyAnimation { target: idRect4;  running:false; property: "centerX"; to:idRect4.cx;  duration: 500}
        PropertyAnimation { target: idRect4;  running:false; property: "centerY"; to:idRect4.cy;  duration: 500}
        PropertyAnimation { target: idRect5;  running:false; property: "centerX"; to:idRect5.cx;  duration: 500}
        PropertyAnimation { target: idRect5;  running:false; property: "centerY"; to:idRect5.cy;  duration: 500}
        PropertyAnimation { target: idRect6;  running:false; property: "centerX"; to:idRect6.cx;  duration: 500}
        PropertyAnimation { target: idRect6;  running:false; property: "centerY"; to:idRect6.cy;  duration: 500}
        PropertyAnimation { target: idRect7;  running:false; property: "centerX"; to:idRect7.cx;  duration: 500}
        PropertyAnimation { target: idRect7;  running:false; property: "centerY"; to:idRect7.cy;  duration: 500}
        PropertyAnimation { target: idRect8;  running:false; property: "centerX"; to:idRect8.cx;  duration: 500}
        PropertyAnimation { target: idRect8;  running:false; property: "centerY"; to:idRect8.cy;  duration: 500}
        PropertyAnimation { target: idRect9;  running:false; property: "centerX"; to:idRect9.cx;  duration: 500}
        PropertyAnimation { target: idRect9;  running:false; property: "centerY"; to:idRect9.cy;  duration: 500}
        PropertyAnimation { target: idRect10; running:false; property: "centerX"; to:idRect10.cx; duration: 500}
        PropertyAnimation { target: idRect10; running:false; property: "centerY"; to:idRect10.cy; duration: 500}
        PropertyAnimation { target: idRect11; running:false; property: "centerX"; to:idRect11.cx; duration: 500}
        PropertyAnimation { target: idRect11; running:false; property: "centerY"; to:idRect11.cy; duration: 500}
        PropertyAnimation { target: idRect12; running:false; property: "centerX"; to:idRect12.cx; duration: 500}
        PropertyAnimation { target: idRect12; running:false; property: "centerY"; to:idRect12.cy; duration: 500}
        PropertyAnimation { target: idRect13; running:false; property: "centerX"; to:idRect13.cx; duration: 500}
        PropertyAnimation { target: idRect13; running:false; property: "centerY"; to:idRect13.cy; duration: 500}
        PropertyAnimation { target: idRect14; running:false; property: "centerX"; to:idRect14.cx; duration: 500}
        PropertyAnimation { target: idRect14; running:false; property: "centerY"; to:idRect14.cy; duration: 500}
        PropertyAnimation { target: idRect15; running:false; property: "centerX"; to:idRect15.cx; duration: 500}
        PropertyAnimation { target: idRect15; running:false; property: "centerY"; to:idRect15.cy; duration: 500}
        alwaysRunToEnd: true;
        onStopped: {
            id_container.createNewRect();
            id_container.executeMove();
        }
    }

    RectContainer {
        id: id_container
        property var mapPlane: [ {rectIndex:-1},{rectIndex:-1},{rectIndex:-1},{rectIndex:-1},
                                 {rectIndex:-1},{rectIndex:-1},{rectIndex:-1},{rectIndex:-1},
                                 {rectIndex:-1},{rectIndex:-1},{rectIndex:-1},{rectIndex:-1},
                                 {rectIndex:-1},{rectIndex:-1},{rectIndex:-1},{rectIndex:-1}
                               ]; // 16
        property int curScore: 0

        Component.onCompleted: {
            var showPosVec = JsFunc.gameInit(2);
            for(var index = 0; index < showPosVec.length; ++index) {
                console.log(showPosVec[index]);
                id_vec.children[index].pos = showPosVec[index];
                id_vec.children[index].centerX = JsFunc.pointAt(showPosVec[index]).x;
                id_vec.children[index].centerY = JsFunc.pointAt(showPosVec[index]).y;
                id_vec.children[index].cx = JsFunc.pointAt(showPosVec[index]).x;
                id_vec.children[index].cy = JsFunc.pointAt(showPosVec[index]).y;
                id_vec.children[index].value = 2;
                id_vec.children[index].color = JsFunc.getValueColor(id_vec.children[index].value);
                mapPlane[showPosVec[index]].rectIndex = index;
            }
            id_container.executeMove();
        }
        onMoveRect: {
            // game logic...
            moveLogic(deltaX,deltaY);
            id_parallelAnimation.start();
        }
        function moveLogic(dx,dy) {
            var x = 0;
            var y = 0;
            if(dx>0) {
                for(y = 0; y <= 3; ++y) {
                    for(x = 2; x >= 0; --x) {
                        moveRight(x,y);
                    }
                }
            }
            if(dx<0) {
                for(y = 0; y <= 3; ++y) {
                    for(x = 1; x <= 3; ++x) {
                        moveLeft(x,y);
                    }
                }
            }
            if(dy>0) {
                for(x = 0; x <= 3; ++x) {
                    for(y = 2; y >= 0; --y) {
                        moveDown(x,y);
                    }
                }
            }
            if(dy<0) {
                for(x = 0; x <= 3; ++x) {
                    for(y = 1; y <= 3; ++y) {
                        moveUp(x,y);
                    }
                }
            }
        }
        function moveRight(x,y) {
            var mapIndex = y*4+x;
            var rectIndex = mapPlane[mapIndex].rectIndex;
            var i = 0;
            if(rectIndex !== -1) { // 当前块
                for(i = 0; i < 3-x; ++i) {
                    if(mapPlane[mapIndex+1].rectIndex === -1) { // 下一个块
                        id_vec.children[rectIndex].cx = JsFunc.pointAt(mapIndex+1).x;
                        id_vec.children[rectIndex].cy = JsFunc.pointAt(mapIndex+1).y;
                        id_vec.children[rectIndex].pos = mapIndex+1;
                        mapPlane[mapIndex+1].rectIndex = rectIndex;
                        mapPlane[mapIndex].rectIndex = -1;
                        mapIndex += 1;
                    }
                    else
                    {
                        if(id_vec.children[mapPlane[mapIndex].rectIndex].value === id_vec.children[mapPlane[mapIndex+1].rectIndex].value) { // 如果当前块与下一块值相等，将合并
                            var tmpPos = id_vec.children[mapPlane[mapIndex+1].rectIndex].pos;
                            //
                            id_vec.children[mapPlane[mapIndex].rectIndex].pos = tmpPos;
                            id_vec.children[mapPlane[mapIndex].rectIndex].cx = JsFunc.pointAt(mapIndex+1).x;
                            id_vec.children[mapPlane[mapIndex].rectIndex].cy = JsFunc.pointAt(mapIndex+1).y;
                            var tmpVar = id_vec.children[mapPlane[mapIndex].rectIndex].value;
                            id_vec.children[mapPlane[mapIndex].rectIndex].value *= 2;
                            //id_vec.children[mapPlane[mapIndex+1].rectIndex].visible = false;
                            //id_vec.children[mapPlane[mapIndex+1].rectIndex].value = 0;
                            id_vec.children[mapPlane[mapIndex+1].rectIndex].pos = -1;
                            //id_vec.children[mapPlane[mapIndex+1].rectIndex].centerX = 0;
                            //id_vec.children[mapPlane[mapIndex+1].rectIndex].centerY = 0;
                            //id_vec.children[mapPlane[mapIndex+1].rectIndex].cx = 0;
                            //id_vec.children[mapPlane[mapIndex+1].rectIndex].cy = 0;

                            mapPlane[mapIndex+1].rectIndex = rectIndex;
                            mapPlane[mapIndex].rectIndex = -1;

                            id_container.curScore += tmpVar;

                            break;
                        }
                    }
                }
            }
        }
        function moveLeft(x,y) {
            var mapIndex = y*4+x;
            var rectIndex = mapPlane[mapIndex].rectIndex;
            var i = 0;
            if(rectIndex !== -1) { // 当前块
                for(i = x; i > 0; --i) {
                    if( mapPlane[mapIndex-1].rectIndex === -1) { // 前一个块
                        id_vec.children[rectIndex].cx = JsFunc.pointAt(mapIndex-1).x;
                        id_vec.children[rectIndex].cy = JsFunc.pointAt(mapIndex-1).y;
                        id_vec.children[rectIndex].pos = mapIndex-1;
                        mapPlane[mapIndex-1].rectIndex = rectIndex;
                        mapPlane[mapIndex].rectIndex = -1;
                        mapIndex -= 1;
                    }
                    else
                    {
                        if(id_vec.children[mapPlane[mapIndex].rectIndex].value === id_vec.children[mapPlane[mapIndex-1].rectIndex].value) { // 如果当前块与下一块值相等，将合并
                            var tmpPos = id_vec.children[mapPlane[mapIndex-1].rectIndex].pos;
                            //
                            id_vec.children[mapPlane[mapIndex].rectIndex].pos = tmpPos;
                            id_vec.children[mapPlane[mapIndex].rectIndex].cx = JsFunc.pointAt(mapIndex-1).x;
                            id_vec.children[mapPlane[mapIndex].rectIndex].cy = JsFunc.pointAt(mapIndex-1).y;
                            var tmpVar = id_vec.children[mapPlane[mapIndex].rectIndex].value;
                            id_vec.children[mapPlane[mapIndex].rectIndex].value *= 2;
                            //id_vec.children[mapPlane[mapIndex-1].rectIndex].visible = false;
                            //id_vec.children[mapPlane[mapIndex-1].rectIndex].value = 0;
                            id_vec.children[mapPlane[mapIndex-1].rectIndex].pos = -1;
                            //id_vec.children[mapPlane[mapIndex-1].rectIndex].centerX = 0;
                            //id_vec.children[mapPlane[mapIndex-1].rectIndex].centerY = 0;
                            //id_vec.children[mapPlane[mapIndex-1].rectIndex].cx = 0;
                            //id_vec.children[mapPlane[mapIndex-1].rectIndex].cy = 0;

                            mapPlane[mapIndex-1].rectIndex = rectIndex;
                            mapPlane[mapIndex].rectIndex = -1;
                            id_container.curScore += tmpVar;
                            break;
                        }
                    }
                }
            }
        }
        function moveDown(x,y) {
            var mapIndex = y*4+x;
            var rectIndex = mapPlane[mapIndex].rectIndex;
            var i = 0;
            if(rectIndex !== -1) { // 当前块
                for(i = 0; i < 3-y; ++i) {
                    if( mapPlane[mapIndex+4].rectIndex === -1) { // 下一个块
                        id_vec.children[rectIndex].cx = JsFunc.pointAt(mapIndex+4).x;
                        id_vec.children[rectIndex].cy = JsFunc.pointAt(mapIndex+4).y;
                        id_vec.children[rectIndex].pos = mapIndex+4;
                        mapPlane[mapIndex+4].rectIndex = rectIndex;
                        mapPlane[mapIndex].rectIndex = -1;
                        mapIndex += 4;
                    }
                    else
                    {
                        if(id_vec.children[mapPlane[mapIndex].rectIndex].value === id_vec.children[mapPlane[mapIndex+4].rectIndex].value) { // 如果当前块与下一块值相等，将合并
                            var tmpPos = id_vec.children[mapPlane[mapIndex+4].rectIndex].pos;
                            //
                            id_vec.children[mapPlane[mapIndex].rectIndex].pos = tmpPos;
                            id_vec.children[mapPlane[mapIndex].rectIndex].cx = JsFunc.pointAt(mapIndex+4).x;
                            id_vec.children[mapPlane[mapIndex].rectIndex].cy = JsFunc.pointAt(mapIndex+4).y;
                            var tmpVar = id_vec.children[mapPlane[mapIndex].rectIndex].value;
                            id_vec.children[mapPlane[mapIndex].rectIndex].value *= 2;
                            //id_vec.children[mapPlane[mapIndex+4].rectIndex].visible = false;
                            //id_vec.children[mapPlane[mapIndex+4].rectIndex].value = 0;
                            id_vec.children[mapPlane[mapIndex+4].rectIndex].pos = -1;
                            //id_vec.children[mapPlane[mapIndex+4].rectIndex].centerX = 0;
                            //id_vec.children[mapPlane[mapIndex+4].rectIndex].centerY = 0;
                            //id_vec.children[mapPlane[mapIndex+4].rectIndex].cx = 0;
                            //id_vec.children[mapPlane[mapIndex+4].rectIndex].cy = 0;

                            mapPlane[mapIndex+4].rectIndex = rectIndex;
                            mapPlane[mapIndex].rectIndex = -1;

                            id_container.curScore += tmpVar;

                            break;
                        }
                    }
                }
            }
        }
        function moveUp(x,y) {
            var mapIndex = y*4+x;
            var rectIndex = mapPlane[mapIndex].rectIndex;
            var i = 0;
            if(rectIndex !== -1) { // 当前块
                for(i = y; i > 0; --i) {
                    if( mapPlane[mapIndex-4].rectIndex === -1) { // 前一个块
                        id_vec.children[rectIndex].cx = JsFunc.pointAt(mapIndex-4).x;
                        id_vec.children[rectIndex].cy = JsFunc.pointAt(mapIndex-4).y;
                        id_vec.children[rectIndex].pos = mapIndex-4;
                        // id_vec.children[rectIndex].value = 0;
                        mapPlane[mapIndex-4].rectIndex = rectIndex;
                        mapPlane[mapIndex].rectIndex = -1;
                        mapIndex -= 4;
                    }
                    else
                    {
                        if(id_vec.children[mapPlane[mapIndex].rectIndex].value === id_vec.children[mapPlane[mapIndex-4].rectIndex].value) { // 如果当前块与下一块值相等，将合并
                            var tmpPos = id_vec.children[mapPlane[mapIndex-4].rectIndex].pos;
                            //
                            id_vec.children[mapPlane[mapIndex].rectIndex].pos = tmpPos;
                            id_vec.children[mapPlane[mapIndex].rectIndex].cx = JsFunc.pointAt(mapIndex-4).x;
                            id_vec.children[mapPlane[mapIndex].rectIndex].cy = JsFunc.pointAt(mapIndex-4).y;
                            var tmpVar = id_vec.children[mapPlane[mapIndex].rectIndex].value;
                            id_vec.children[mapPlane[mapIndex].rectIndex].value *= 2;
                            //id_vec.children[mapPlane[mapIndex-4].rectIndex].visible = false;
                            //id_vec.children[mapPlane[mapIndex-4].rectIndex].value = 0;
                            id_vec.children[mapPlane[mapIndex-4].rectIndex].pos = -1;
                            //id_vec.children[mapPlane[mapIndex-4].rectIndex].centerX = 0;
                            //id_vec.children[mapPlane[mapIndex-4].rectIndex].centerY = 0;
                            //id_vec.children[mapPlane[mapIndex-4].rectIndex].cx = 0;
                            //id_vec.children[mapPlane[mapIndex-4].rectIndex].cy = 0;

                            mapPlane[mapIndex-4].rectIndex = rectIndex;
                            mapPlane[mapIndex].rectIndex = -1;
                            id_container.curScore += tmpVar;
                            break;
                        }
                    }
                }
            }
        }
        function executeMove() {
            for(var rectIndex = 0; rectIndex < 16; ++rectIndex) {
                if(id_vec.children[rectIndex].pos !== -1) {
                    id_vec.children[rectIndex].text = id_vec.children[rectIndex].value;
                    id_vec.children[rectIndex].color = JsFunc.getValueColor(id_vec.children[rectIndex].value);
                    id_vec.children[rectIndex].visible = true;
                    id_vec.children[rectIndex].width = 60;
                    id_vec.children[rectIndex].height = 60;
                }
                else if(id_vec.children[rectIndex].pos === -1) {
                    id_vec.children[rectIndex].visible = false;
                    id_vec.children[rectIndex].value = 0;
                    id_vec.children[rectIndex].width = 30;
                    id_vec.children[rectIndex].height = 30;
                }
            }
            id_curScore.text = id_container.curScore;
        }
        function createNewRect() {
            var emptyQueue = [];
            var index = 0;
            var i = 0;
            for(i = 0; i < 16; ++i) {
                if(mapPlane[i].rectIndex === -1) {
                    emptyQueue[index] = i;
                    ++index;
                }
            }
            // 即数字已经满了，无法再产生新的数字了，宣告游戏失败
            if(index===0) {
                failedDialog.visible = true;
                return;
            }
            var randNewPos = Math.round(Math.random()*(index-1));
            for(i = 0; i < 16; ++i) {
                if(id_vec.children[i].pos === -1) {
                    mapPlane[emptyQueue[randNewPos]].rectIndex = i;
                    id_vec.children[i].pos = emptyQueue[randNewPos];
                    id_vec.children[i].centerX = JsFunc.pointAt(emptyQueue[randNewPos]).x;
                    id_vec.children[i].centerY = JsFunc.pointAt(emptyQueue[randNewPos]).y;
                    id_vec.children[i].cx = JsFunc.pointAt(emptyQueue[randNewPos]).x;
                    id_vec.children[i].cy = JsFunc.pointAt(emptyQueue[randNewPos]).y;
                    id_vec.children[i].value = Math.pow(2,1 + Math.round(Math.random()*4));
                    id_vec.children[i].color = JsFunc.getValueColor(id_vec.children[i].value);
                    //id_vec.children[i].visible = true;
                    break;
                }
            }
        }

        Item {
            id: id_vec;
            children: [
                SingleRect {
                    id: idRect0
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect1
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect2
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect3
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect4
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect5
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect6
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect7
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect8
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect9
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect10
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect11
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect12
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect13
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect14
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                },
                SingleRect {
                    id: idRect15
                    property int pos: -1
                    property int value: 0
                    property int cx:0
                    property int cy:0
                    //text:value
                    visible: false
                }
            ]
        }
    }

    Item {
        width: id_labelText.contentWidth
        height: id_labelText.contentHeight
        anchors.bottom: id_container.top
        anchors.bottomMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: id_container.x
        Column {
            anchors.fill: parent
            Text {
                id: id_labelText
                text: "2048"
                color: "#8B757B"
                font { pointSize: 40; bold:true; family: "arial" }
            }
            Text {
                text: "Written by LCS."
                color: "grey"
                font { family: "arial"; italic: true }
            }
        }
    }

    Row {
        spacing: 15
        anchors.bottom: id_container.top
        anchors.bottomMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: parent.width - ( id_container.x + id_container.width )
        Rectangle {
            width: 70
            height: 50
            color: "#8B7B8B"
            Column {
                anchors.centerIn: parent
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    font { bold:true; family: "arial"}
                    text: "SCORE"
                }
                Text {
                    id: id_curScore
                    anchors.horizontalCenter: parent.horizontalCenter
                    font { bold:true; family: "arial"}
                    text: "0"
                }
            }
        }
        Rectangle {
            width: 70
            height: 50
            color: "#8B7B8B"
            Column {
                anchors.centerIn: parent
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    font { bold:true; family: "arial"}
                    text: "BEST"
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    font { bold: true; family: "arial"}
                    text: "0"
                }
            }
        }
    }

    Rectangle {
        id: failedDialog
        anchors.centerIn: parent
        width: 400
        height: 230
        visible: false
        color: "#8B757B"
        radius: 5
        Text {
            anchors.centerIn: parent
            text: "游戏失败！\n点击重玩"
            color: "#ff3344"
            font.pointSize: 40
            font.bold: true
            font.family: "黑体"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                for(var i = 0; i < id_container.mapPlane.length;++i) {
                    id_container.mapPlane[i].rectIndex = -1;
                    id_vec.children[i].pos = -1;
                    id_vec.children[i].centerX = JsFunc.pointAt(i).x;
                    id_vec.children[i].centerY = JsFunc.pointAt(i).y;
                    id_vec.children[i].cx = 0;
                    id_vec.children[i].cy = 0;
                    id_vec.children[i].value = 0;
                    id_vec.children[i].color = "gray";
                }
                id_container.curScore = 0;
                var showPosVec = JsFunc.gameInit(2);
                for(var index = 0; index < showPosVec.length; ++index) {
                    console.log(showPosVec[index]);
                    id_vec.children[index].pos = showPosVec[index];
                    id_vec.children[index].centerX = JsFunc.pointAt(showPosVec[index]).x;
                    id_vec.children[index].centerY = JsFunc.pointAt(showPosVec[index]).y;
                    id_vec.children[index].cx = JsFunc.pointAt(showPosVec[index]).x;
                    id_vec.children[index].cy = JsFunc.pointAt(showPosVec[index]).y;
                    id_vec.children[index].value = 2;
                    id_vec.children[index].color = JsFunc.getValueColor(id_vec.children[index].value);
                    id_container.mapPlane[showPosVec[index]].rectIndex = index;
                }
                id_container.executeMove();
                failedDialog.visible = false;
            }
        }
    }
}

