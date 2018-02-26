var RectPoint = [ {x:40,y:40},{x:110,y:40},{x:180,y:40},{x:250,y:40},
                  {x:40,y:110},{x:110,y:110},{x:180,y:110},{x:250,y:110},
                  {x:40,y:180},{x:110,y:180},{x:180,y:180},{x:250,y:180},
                  {x:40,y:250},{x:110,y:250},{x:180,y:250},{x:250,y:250}
                ];

function moveTo(delta_x,delta_y,step) {
    var PI = 3.14159265358979323846
    var dir = Math.atan2(delta_y, delta_x);
    var point = { moveX:0, moveY:0 }
    if(-PI/4 <= dir && dir <= PI/4) {
        // x forward
        point.moveX = step;
    }
    else if ((-PI <= dir && dir <= -PI*3/4) || (PI * 3 / 4 <= dir && dir <= PI)) {
        // x backward
        point.moveX = -step;
    }
    else if(PI/4 < dir && dir < PI*3/4) {
        // y upward
        point.moveY = step;
    }
    else if(-PI*3/4 < dir && dir < -PI/4) {
        // y downward
        point.moveY = -step;
    }
    return point;
}
/*
  游戏开始时，随机产生几个方块的位置
*/
function gameInit(num) {
    // 初始生成的方块数量
    //var num = Math.round(4 + Math.random()*7) // 1 -- 3 num of init rectangle number.
    var posRect = [];
    // 标注随机随机制定的位置是否已经有生成的方块了
    var isHave = 0;
    // 当前已经生成的方块的数量
    var actualNum = 0;
    for(var i = 0; i < num; ++i) {
        var pos = Math.round(Math.random()*15); // 0 -- 15
        for(var j = 0; j < actualNum; ++j) {
            if(posRect[j] === pos) {
                isHave = 1;
            }
        }
        if(isHave != 1) {
            posRect[i] = pos;
            ++actualNum;
            isHave = 0;
        }
    }
    console.log(posRect.length)
    return posRect;
}

// Point in rectanlge boundary Inspect
function rectBoundaryInspect(x,y,width,height,testX,testY,haveBound) {
    if(haveBound === true) { // inlcude boundary
        if((x <= testX && testX <= (x + width)) && (y <= testY && testY <= (y + height)))
            return true;
    }
    else if(haveBound === false) {
        if((x < testX && testX < (x + width)) && (y < testY && testY < (y + height)))
            return true;
    }
    else
        return false;
}

function pointAt(pos) {
    var point = RectPoint[pos];
    return point;
}

function shouldMoveTo(curPoint,deltaX,deltaY) {
    var row = Math.floor(curPoint/4)+1; // 下舍入
    var column = (curPoint+1) - row*4 + 4;
    if(deltaX > 0)
        column = 4;
    else if(deltaX < 0)
        column = 1;
    if(deltaY > 0)
        row = 4;
    else if(deltaY < 0)
        row = 1;
    var newpos = row*4-(4-column)-1;
    return newpos;
}
