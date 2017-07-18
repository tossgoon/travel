//杂填土
function getZaTianTu(x1, y1, x2, y2, interVal)//45度斜线纹填充，3根135度反斜线辅助 包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var dert1 = interVal / 5, dert2 = interVal / 10, dert3 = interVal; //dert1为短线的长度，dert2为短线间间隔,dert3为两组短线间间距
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentX = x2 - interVal; //当前X值
    while (currentX > x1) {
        var currentL = currentX - x1; //当前长度
        var pt1 = [currentX, y2]; //起始点
        if (currentL <= y2 - y1)//线段间隔小于y2-y1
        {
            var pt2 = [x1, y2 - currentL]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
            //画3根小斜线
            var cx1 = currentX, cy1 = y2, index = 0; //起始，递减
            while (cx1 >= x1) {
                var vx1 = cx1 - dert1, vy1 = cy1 + dert1, vx2 = cx1 + dert1, vy2 = cy1 - dert1;
                if (vx1 < x1) {
                    vx1 = x1;
                    vy1 -= x1 - vx1;
                }
                if (vy1 > y2) {
                    vy1 = y2;
                    vx1 += vy1 - y2;
                }
                if (vx2 > x2) {
                    vx2 = x2;
                    vy2 += vx2 - x2;
                }
                if (vy2 < y1) {
                    vy2 = y1;
                    vx2 -= y1 - vy2;
                }
                var ptU = [vx1, vy1];
                var ptD = [vx2, vy2];
                segList.push([ptU, ptD]);
                symbolList.push({});
                index++;
                if (index % 3 == 0) {
                    cx1 = cx1 - dert3;
                    cy1 = cy1 - dert3;
                }
                else {
                    cx1 = cx1 - dert2;
                    cy1 = cy1 - dert2;
                }
            }
        }
        else {
            var pt2 = [x1 + currentL - (y2 - y1), y1]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
            //画3根小斜线
            var cx1 = currentX, cy1 = y2, index = 0; //起始，递减
            while (cy1 >= y1) {
                var vx1 = cx1 - dert1, vy1 = cy1 + dert1, vx2 = cx1 + dert1, vy2 = cy1 - dert1;
                if (vx1 < x1) {
                    vx1 = x1;
                    vy1 -= x1 - vx1;
                }
                if (vy1 > y2) {
                    vy1 = y2;
                    vx1 += vy1 - y2;
                }
                if (vx2 > x2) {
                    vx2 = x2;
                    vy2 += vx2 - x2;
                }
                if (vy2 < y1) {
                    vy2 = y1;
                    vx2 -= y1 - vy2;
                }
                var ptU = [vx1, vy1];
                var ptD = [vx2, vy2];
                segList.push([ptU, ptD]);
                symbolList.push({});
                index++;
                if (index % 3 == 0) {
                    cx1 = cx1 - dert3;
                    cy1 = cy1 - dert3;
                }
                else {
                    cx1 = cx1 - dert2;
                    cy1 = cy1 - dert2;
                }
            }
        }
        currentX = currentX - interVal; //当前点X
    }
    var currentY = y2;
    while (currentY >= y1) {
        var currentL = currentY - y1; //当前长度
        var pt1 = [x2, currentY]; //起始点
        if (currentL <= x2 - x1)//线段间隔小于x2-x1
        {
            var pt2 = [x2 - currentL, y1]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
            //画3根小斜线
            var cx1 = x2, cy1 = currentY, index = 0; //起始，递减
            while (cy1 >= y1) {
                var vx1 = cx1 - dert1, vy1 = cy1 + dert1, vx2 = cx1 + dert1, vy2 = cy1 - dert1;
                if (vx1 < x1) {
                    vx1 = x1;
                    vy1 -= x1 - vx1;
                }
                if (vy1 > y2) {
                    vy1 = y2;
                    vx1 += vy1 - y2;
                }
                if (vx2 > x2) {
                    vx2 = x2;
                    vy2 += vx2 - x2;
                }
                if (vy2 < y1) {
                    vy2 = y1;
                    vx2 -= y1 - vy2;
                }
                var ptU = [vx1, vy1];
                var ptD = [vx2, vy2];
                segList.push([ptU, ptD]);
                symbolList.push({});
                index++;
                if (index % 3 == 0) {
                    cx1 = cx1 - dert3;
                    cy1 = cy1 - dert3;
                }
                else {
                    cx1 = cx1 - dert2;
                    cy1 = cy1 - dert2;
                }
            }
        }
        else {
            var pt2 = [x1, y1 + currentL - (x2 - x1)]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
            //画3根小斜线
            var cx1 = x2, cy1 = currentY, index = 0; //起始，递减
            while (cx1 >= x1) {
                var vx1 = cx1 - dert1, vy1 = cy1 + dert1, vx2 = cx1 + dert1, vy2 = cy1 - dert1;
                if (vx1 < x1) {
                    vx1 = x1;
                    vy1 -= x1 - vx1;
                }
                if (vy1 > y2) {
                    vy1 = y2;
                    vx1 += vy1 - y2;
                }
                if (vx2 > x2) {
                    vx2 = x2;
                    vy2 += vx2 - x2;
                }
                if (vy2 < y1) {
                    vy2 = y1;
                    vx2 -= y1 - vy2;
                }
                var ptU = [vx1, vy1];
                var ptD = [vx2, vy2];
                segList.push([ptU, ptD]);
                symbolList.push({});
                index++;
                if (index % 3 == 0) {
                    cx1 = cx1 - dert3;
                    cy1 = cy1 - dert3;
                }
                else {
                    cx1 = cx1 - dert2;
                    cy1 = cy1 - dert2;
                }
            }
        }
        currentY = currentY - interVal; //当前点Y
    }
    var jsonData = {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//素填土
function getSuTianTu(x1, y1, x2, y2, interVal)//45度斜线纹填充，包括三个边框,返回线段数组
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentX = x2 - interVal; //当前X值，45
    while (currentX > x1) {
        var currentL = currentX - x1; //当前长度
        var pt1 = [currentX, y2]; //起始点
        if (currentL <= y2 - y1)//线段间隔小于y2-y1
        {
            var pt2 = [x1, y2 - currentL]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
        }
        else {
            var pt2 = [x1 + currentL - (y2 - y1), y1]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
        }
        currentX = currentX - interVal; //当前点X
    }
    var currentY = y2;
    while (currentY >= y1) {
        var currentL = currentY - y1; //当前长度
        var pt1 = [x2, currentY]; //起始点
        if (currentL <= x2 - x1)//线段间隔小于x2-x1
        {
            var pt2 = [x2 - currentL, y1]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
        }
        else {
            var pt2 = [x1, y1 + currentL - (x2 - x1)]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
        }
        currentY = currentY - interVal; //当前点Y
    }
    //135度斜线
    currentX = x1 + interVal; //当前X值
    while (currentX < x2) {
        var currentL = x2 - currentX; //当前长度
        var pt1 = [currentX, y2]; //起始点
        if (currentL <= y2 - y1)//线段间隔小于y2-y1
        {
            var pt2 = [x2, y2 - currentL]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
        }
        else {
            var pt2 = [x2 - (currentL - (y2 - y1)), y1]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
        }
        currentX = currentX + interVal; //当前点X
    }
    currentY = y2;
    while (currentY >= y1) {
        var currentL = currentY - y1; //当前长度
        var pt1 = [x1, currentY]; //起始点
        if (currentL <= x2 - x1)//线段间隔小于x2-x1
        {
            var pt2 = [x1 + currentL, y1]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
        }
        else {
            var pt2 = [x2, y1 + currentL - (x2 - x1)]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
        }
        currentY = currentY - interVal; //当前点Y
    }
    var jsonData = {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//黄土
function getHuangTu(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentX = x1 + interVal / 2;
    while (currentX < x2) {
        var pt1 = [currentX, y1]; //起始点
        var pt2 = [currentX, y2]; //终止点
        segList.push([pt1, pt2]);
        symbolList.push({});
        currentX = currentX + interVal; //当前点Y
    }
    var jsonData = {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//古土壤
function getGuTuRang(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentX = x1 + interVal / 2;
    var index = 0;
    while (currentX < x2) {
        var pt1 = [currentX, y1]; //起始点
        var pt2 = [currentX, y2]; //终止点
        segList.push([pt1, pt2]);
        if (index % 2 == 0) {
            symbolList.push({ lineWidth: 1.5 });
        }
        else {
            symbolList.push({});
        }
        index++;
        currentX = currentX + interVal; //当前点Y
    }
    var jsonData = {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//黄土状土（粉土）
function getHuangTuZhuangFenTu(x1, y1, x2, y2, interVal)//90度填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentX = x1 + interVal;
    while (currentX < x2) {
        var pt1 = [currentX, y1]; //起始点
        var pt2 = [currentX, y2]; //终止点
        segList.push([pt1, pt2]);
        symbolList.push({ linePattern: [15, 6] });
        currentX = currentX + interVal; //当前点Y
    }
    var jsonData = {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//黄土状土（粉质粘土）
function getHuangTuZhuangFenZhiNianTu(x1, y1, x2, y2, interVal)//90度填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var index = 0;
    var currentX = x1 + interVal;
    while (currentX < x2) {
        var pt1 = [currentX, y1]; //起始点
        var pt2 = [currentX, y2]; //终止点
        segList.push([pt1, pt2]);
        if (index % 2 == 0) {
            symbolList.push({ linePattern: [15, 6] });
        }
        else {
            symbolList.push({});
        }
        index++;
        currentX = currentX + interVal; //当前点Y
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//粘土
function getNianTu(x1, y1, x2, y2, interVal)//45度斜线纹填充，包括三个边框,返回线段数组
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentX = x2 - interVal; //当前X值
    while (currentX > x1) {
        var currentL = currentX - x1; //当前长度
        var pt1 = [currentX, y2]; //起始点
        if (currentL <= y2 - y1)//线段间隔小于y2-y1
        {
            var pt2 = [x1, y2 - currentL]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
        }
        else {
            var pt2 = [x1 + currentL - (y2 - y1), y1]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
        }
        currentX = currentX - interVal; //当前点X
    }
    var currentY = y2;
    while (currentY >= y1) {
        var currentL = currentY - y1; //当前长度
        var pt1 = [x2, currentY]; //起始点
        if (currentL <= x2 - x1)//线段间隔小于x2-x1
        {
            var pt2 = [x2 - currentL, y1]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
        }
        else {
            var pt2 = [x1, y1 + currentL - (x2 - x1)]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({});
        }
        currentY = currentY - interVal; //当前点Y
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//粉质粘土，奇数实线，偶数虚线
function getFenZhiNianTu(x1, y1, x2, y2, interVal)//45度斜线纹填充，包括三个边框,返回线段数组
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentX = x2 - interVal; //当前X值
    var index = 0;
    while (currentX > x1) {
        var currentL = currentX - x1; //当前长度
        var pt1 = [currentX, y2]; //起始点
        if (currentL <= y2 - y1)//线段间隔小于y2-y1
        {
            var pt2 = [x1, y2 - currentL]; //终止点
            segList.push([pt1, pt2]);
            if (index % 2 == 0) {
                symbolList.push({ linePattern: [15, 6] });
            }
            else {
                symbolList.push({});
            }
            index++;
        }
        else {
            var pt2 = [x1 + currentL - (y2 - y1), y1]; //终止点
            segList.push([pt1, pt2]);
            if (index % 2 == 0) {
                symbolList.push({ linePattern: [15, 6] });
            }
            else {
                symbolList.push({});
            }
            index++;
        }
        currentX = currentX - interVal; //当前点X
    }
    var currentY = y2;
    index = 1;
    while (currentY >= y1) {
        var currentL = currentY - y1; //当前长度
        var pt1 = [x2, currentY]; //起始点
        if (currentL <= x2 - x1)//线段间隔小于x2-x1
        {
            var pt2 = [x2 - currentL, y1]; //终止点
            segList.push([pt1, pt2]);
            if (index % 2 == 0) {
                symbolList.push({ linePattern: [15, 6] });
            }
            else {
                symbolList.push({});
            }
            index++;
        }
        else {
            var pt2 = [x1, y1 + currentL - (x2 - x1)]; //终止点
            segList.push([pt1, pt2]);
            if (index % 2 == 0) {
                symbolList.push({ linePattern: [15, 6] });
            }
            else {
                symbolList.push({});
            }
            index++;
        }
        currentY = currentY - interVal; //当前点Y
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//粉土
function getFenTu(x1, y1, x2, y2, interVal)//45度斜线纹填充，包括三个边框,返回线段数组
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentX = x2 - interVal; //当前X值
    while (currentX > x1) {
        var currentL = currentX - x1; //当前长度
        var pt1 = [currentX, y2]; //起始点
        if (currentL <= y2 - y1)//线段间隔小于y2-y1
        {
            var pt2 = [x1, y2 - currentL]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({ linePattern: [15, 6] });
        }
        else {
            var pt2 = [x1 + currentL - (y2 - y1), y1]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({ linePattern: [15, 6] });
        }
        currentX = currentX - interVal; //当前点X
    }
    var currentY = y2;
    while (currentY >= y1) {
        var currentL = currentY - y1; //当前长度
        var pt1 = [x2, currentY]; //起始点
        if (currentL <= x2 - x1)//线段间隔小于x2-x1
        {
            var pt2 = [x2 - currentL, y1]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({ linePattern: [15, 6] });
        }
        else {
            var pt2 = [x1, y1 + currentL - (x2 - x1)]; //终止点
            segList.push([pt1, pt2]);
            symbolList.push({ linePattern: [15, 6] });
        }
        currentY = currentY - interVal; //当前点Y
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//粉砂
function getFenSha(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        if (index % 2 == 0) {
            segList.push([[x1, currentY], [x2, currentY]]);
        }
        else {
            segList.push([[x1 + interVal / 2, currentY], [x2, currentY]]);
        }
        symbolList.push({ linePattern: [1, 5], lineWidth: 1 });
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    //加入f字母
    var block = [[x1 / 2 + x2 / 2, y1 / 2 + y2 / 2, 'f']];
    segList.push(block);
    symbolList.push({
        renderer: $.jqplot.BlockRenderer,
        rendererOptions: {
            css: {
                border: false,
                fontSize: '12pt',
                fontFamily: 'Italic',
                fontWeight: 'bold'
            }
        }
    });
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
function getFenXiSha(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        if (index % 2 == 0) {
            segList.push([[x1, currentY], [x2, currentY]]);
        }
        else {
            segList.push([[x1 + interVal / 2, currentY], [x2, currentY]]);
        }
        symbolList.push({ linePattern: [1, 8], lineWidth: 1 });
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    //加入f字母
    var block = [[x1 / 2 + x2 / 2, y1 / 2 + y2 / 2, 'fx']];
    segList.push(block);
    symbolList.push({
        renderer: $.jqplot.BlockRenderer,
        rendererOptions: {
            css: {
                border: false,
                fontSize: '12pt',
                fontFamily: 'Italic',
                fontWeight: 'bold'
            }
        }
    });
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//细砂
function getXiSha(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        if (index % 2 == 0) {
            segList.push([[x1, currentY], [x2, currentY]]);
        }
        else {
            segList.push([[x1 + interVal / 2, currentY], [x2, currentY]]);
        }
        symbolList.push({ linePattern: [1, 8], lineWidth: 1 });
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    //加入f字母
    var block = [[x1 / 2 + x2 / 2, y1 / 2 + y2 / 2, 'x']];
    segList.push(block);
    symbolList.push({
        renderer: $.jqplot.BlockRenderer,
        rendererOptions: {
            css: {
                border: false,
                fontSize: '12pt',
                fontFamily: 'Italic',
                fontWeight: 'bold'
            }
        }
    });
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//细中砂
function getXiZhongSha(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        if (index % 2 == 0) {
            segList.push([[x1, currentY], [x2, currentY]]);
        }
        else {
            segList.push([[x1 + interVal / 2, currentY], [x2, currentY]]);
        }
        symbolList.push({ linePattern: [1, 12], lineWidth: 1 });
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    //加入f字母
    var block = [[x1 / 2 + x2 / 2, y1 / 2 + y2 / 2, 'xz']];
    segList.push(block);
    symbolList.push({
        renderer: $.jqplot.BlockRenderer,
        rendererOptions: {
            css: {
                border: false,
                fontSize: '12pt',
                fontFamily: 'Italic',
                fontWeight: 'bold'
            }
        }
    });
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//中砂
function getZhongSha(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        if (index % 2 == 0) {
            segList.push([[x1, currentY], [x2, currentY]]);
        }
        else {
            segList.push([[x1 + interVal / 2, currentY], [x2, currentY]]);
        }
        symbolList.push({ linePattern: [1, 12], lineWidth: 1 });
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    //加入f字母
    var block = [[x1 / 2 + x2 / 2, y1 / 2 + y2 / 2, 'z']];
    segList.push(block);
    symbolList.push({
        renderer: $.jqplot.BlockRenderer,
        rendererOptions: {
            css: {
                border: false,
                fontSize: '12pt',
                fontFamily: 'Italic',
                fontWeight: 'bold'
            }
        }
    });
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//中粗砂
function getZhongCuSha(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        if (index % 2 == 0) {
            segList.push([[x1, currentY], [x2, currentY]]);
        }
        else {
            segList.push([[x1 + interVal / 2, currentY], [x2, currentY]]);
        }
        symbolList.push({ linePattern: [1, 12], lineWidth: 1 });
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    //加入f字母
    var block = [[x1 / 2 + x2 / 2, y1 / 2 + y2 / 2, 'zc']];
    segList.push(block);
    symbolList.push({
        renderer: $.jqplot.BlockRenderer,
        rendererOptions: {
            css: {
                border: false,
                fontSize: '12pt',
                fontFamily: 'Italic',
                fontWeight: 'bold'
            }
        }
    });
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//粗砂
function getCuSha(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        if (index % 2 == 0) {
            segList.push([[x1, currentY], [x2, currentY]]);
        }
        else {
            segList.push([[x1 + interVal / 2, currentY], [x2, currentY]]);
        }
        symbolList.push({ linePattern: [1, 16], lineWidth: 1 });
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    //加入f字母
    var block = [[x1 / 2 + x2 / 2, y1 / 2 + y2 / 2, 'c']];
    segList.push(block);
    symbolList.push({
        renderer: $.jqplot.BlockRenderer,
        rendererOptions: {
            css: {
                border: false,
                fontSize: '12pt',
                fontFamily: 'Italic',
                fontWeight: 'bold'
            }
        }
    });
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//粗砾砂
function getCuLiSha(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        if (index % 2 == 0) {
            segList.push([[x1, currentY], [x2, currentY]]);
        }
        else {
            segList.push([[x1 + interVal / 2, currentY], [x2, currentY]]);
        }
        symbolList.push({ linePattern: [1, 16], lineWidth: 1 });
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    //加入f字母
    var block = [[x1 / 2 + x2 / 2, y1 / 2 + y2 / 2, 'cl']];
    segList.push(block);
    symbolList.push({
        renderer: $.jqplot.BlockRenderer,
        rendererOptions: {
            css: {
                border: false,
                fontSize: '12pt',
                fontFamily: 'Italic',
                fontWeight: 'bold'
            }
        }
    });
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//砾砂
function getLiSha(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        if (index % 2 == 0) {
            segList.push([[x1, currentY], [x2, currentY]]);
        }
        else {
            segList.push([[x1 + interVal / 2, currentY], [x2, currentY]]);
        }
        symbolList.push({ linePattern: [1, 20], lineWidth: 1 });
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    //加入f字母
    var block = [[x1 / 2 + x2 / 2, y1 / 2 + y2 / 2, 'l']];
    segList.push(block);
    symbolList.push({
        renderer: $.jqplot.BlockRenderer,
        rendererOptions: {
            css: {
                border: false,
                fontSize: '12pt',
                fontFamily: 'Italic',
                fontWeight: 'bold'
            }
        }
    });
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//圆砾
function getYuanLi(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        if (index % 2 == 0) {
            var cx1 = x1 + interVal, cy1 = currentY, tempL = [];
            while (cx1 < x2) {
                tempL.push([cx1, cy1]);
                cx1 += interVal * 2;
            }
            segList.push(tempL);
            symbolList.push({
                showLine: false,
                showMarker: true,
                markerOptions: { size: 3, style: "circle", lineWidth: 0.5 }
            });
        }
        else {
            var cx1 = x1, cy1 = currentY, tempL = [], tempL2 = [];
            while (cx1 < x2) {
                tempL.push([cx1, cy1]);
                tempL2.push([cx1 + interVal, cy1]);
                cx1 += interVal * 2;
            }
            segList.push(tempL);
            symbolList.push({
                showLine: false,
                showMarker: true,
                markerOptions: { size: 3, style: "circle", lineWidth: 0.5 }
            });
            segList.push(tempL2);
            symbolList.push({
                showLine: false,
                showMarker: true,
                markerOptions: { size: 1, style: "dash", lineWidth: 0.5 }
            });
        }
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//角砾
function getJiaoLi(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        var cx1, cy1 = currentY;
        if (index % 2 == 0) {
            cx1 = x1 + interVal;
        }
        else {
            cx1 = x1;
        }
        while (cx1 < x2) {
            segList.push([[cx1, cy1], [cx1 + interVal / 2, cy1], [cx1 + interVal / 4, cy1 + interVal / 3], [cx1, cy1]]);
            symbolList.push({
                fill: true
            });
            cx1 += interVal * 1.5;
        }
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//卵石
function getLuanShi(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        var cx1, cy1 = currentY, tempL = [], tempL2 = [];
        if (index % 2 == 0) {
            cx1 = x1 + interVal * 1.25;
        }
        else {
            cx1 = x1 + interVal / 4;
        }
        while (cx1 < x2) {
            tempL.push([cx1, cy1]);
            tempL2.push([cx1 + interVal * 1.5, cy1]);
            cx1 += interVal * 3;
        }
        segList.push(tempL);
        symbolList.push({
            showLine: false,
            showMarker: true,
            markerOptions: { size: 6, style: "circle", lineWidth: 0.5 }
        });
        segList.push(tempL2);
        symbolList.push({
            showLine: false,
            showMarker: true,
            markerOptions: { size: 1, style: "dash", lineWidth: 0.5 }
        });
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//碎石
function getSuiShi(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        var cx1, cy1 = currentY;
        if (index % 2 == 0) {
            cx1 = x1 + interVal * 1.5;
        }
        else {
            cx1 = x1;
        }
        while (cx1 < x2) {
            segList.push([[cx1, cy1], [cx1 + interVal / 2, cy1], [cx1 + interVal / 4, cy1 + interVal / 2], [cx1 + interVal / 5, cy1 + interVal / 2], [cx1, cy1 + interVal / 4], [cx1, cy1]]);
            symbolList.push({
            });
            cx1 += interVal * 2;
        }
        currentY = currentY - interVal * 1.5; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//漂石
function getPiaoShi(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        var cx1, cy1 = currentY, tempL = [];
        if (index % 2 == 0) {
            cx1 = x1 + interVal * 1.5;
        }
        else {
            cx1 = x1 + interVal / 2;
        }
        while (cx1 < x2) {
            tempL.push([cx1, cy1]);
            cx1 += interVal * 3;
        }
        segList.push(tempL);
        symbolList.push({
            showLine: false,
            showMarker: true,
            markerOptions: { size: 10, style: "circle", lineWidth: 0.5 }
        });
        currentY = currentY - 2 * interVal; //当前点Y
        index++;
    }
    //    //加入三个边框
    //    segList.push([[x1, y1], [x1, y2]]);
    //    segList.push([[x1, y2], [x2, y2]]);
    //    segList.push([[x2, y2], [x2, y1]]);
    //    symbolList.push({});
    //    symbolList.push({});
    //    symbolList.push({});
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//块石
function getKuaiShi(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        var cx1, cy1 = currentY;
        if (index % 2 == 0) {
            cx1 = x1 + interVal * 1.5;
        }
        else {
            cx1 = x1;
        }
        while (cx1 < x2) {
            segList.push([[cx1, cy1], [cx1 + interVal, cy1], [cx1 + interVal / 2, cy1 + interVal], [cx1 + interVal / 4, cy1 + interVal], [cx1, cy1 + interVal / 2], [cx1, cy1]]);
            symbolList.push({
            });
            cx1 += interVal * 2;
        }
        currentY = currentY - interVal * 2; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//有机土
function getYouJiTu(x1, y1, x2, y2, interVal)//
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        var cx1, cy1 = currentY;
        if (index % 2 == 0) {
            cx1 = x1 + interVal * 1.5;
        }
        else {
            cx1 = x1;
        }
        while (cx1 < x2) {
            var dert = interVal / 3, tempL = [], tempY;
            tempL.push([cx1, cy1]);
            tempL.push([cx1 - dert, cy1]);
            for (var i = 1; i < 5; i++) {
                var xishu = i % 2;
                var tempX = cx1 - (1 + xishu) * dert;
                tempY = cy1 - i * dert;
                if (tempY <= y1) {
                    tempL.push([tempX, y1]);
                    tempY = y1;
                    break;
                }
                else {
                    tempL.push([tempX, tempY]);
                }
            }
            tempL.push([cx1, tempY]);
            segList.push(tempL);
            //segList.push([[cx1, cy1], [cx1 - interVal / 3, cy1], [cx1 - interVal / 1.5, cy1 - interVal / 3], [cx1 - interVal / 3, cy1 - interVal * 2 / 3], [cx1 - interVal / 1.5, cy1 - interVal], [cx1 - interVal / 3, cy1 - interVal * 4 / 3], [cx1, cy1 - interVal * 4 / 3]]);
            symbolList.push({
            });
            cx1 += interVal * 2;
        }
        currentY = currentY - interVal * 2; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//砂岩
function getShaYan(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    var index = 0;
    while (currentY >= y1) {
        if (index % 4 == 0 || index % 4 == 2) {
            segList.push([[x1, currentY], [x2, currentY]]);
            symbolList.push({
            });
        }
        else if (index % 4 == 1) {
            segList.push([[x1 + interVal / 2, currentY], [x2, currentY]]);
            symbolList.push({ linePattern: [1, 8], lineWidth: 1 });
        }
        else {
            segList.push([[x1, currentY], [x2, currentY]]);
            symbolList.push({ linePattern: [1, 8], lineWidth: 1 });
        }
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//角砾岩
function getJiaoLiYan(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    var index = 0;
    while (currentY >= y1) {
        if (index % 4 == 0 || index % 4 == 2) {
            segList.push([[x1, currentY], [x2, currentY]]);
            symbolList.push({
                lineWidth: 1
            });
        }
        else if (index % 4 == 1) {
            var cx1 = x1, cy1 = currentY;
            while (cx1 < x2) {
                segList.push([[cx1, cy1], [cx1 + interVal / 2, cy1], [cx1 + interVal / 4, cy1 + interVal / 3], [cx1, cy1]]);
                symbolList.push({
                    fill: true
                });
                cx1 += interVal * 1.5;
            }
        }
        else {
            var cx1 = x1 + interVal / 2, cy1 = currentY;
            while (cx1 < x2) {
                segList.push([[cx1, cy1], [cx1 + interVal / 2, cy1], [cx1 + interVal / 4, cy1 + interVal / 3], [cx1, cy1]]);
                symbolList.push({
                    fill: true
                });
                cx1 += interVal * 1.5;
            }
        }
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//花岗岩
function getHuaGangYan(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    var index = 0;
    while (currentY > y1 + interVal / 3) {
        var cx1, tempL = [];
        if (index % 2 == 0) {
            cx1 = x1 + interVal / 2;
        }
        else {
            cx1 = x1;
        }
        while (cx1 <= x2) {
            tempL.push([cx1, currentY]);
            cx1 += interVal * 2;
        }
        segList.push(tempL);
        symbolList.push({
            showLine: false,
            showMarker: true,
            markerOptions: { size: 5, style: "plus", lineWidth: 0.5 }
        });
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//砾岩
function getLiYan(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    var index = 0;
    while (currentY >= y1) {
        if (index % 2 == 0) {
            var cx1 = x1 + interVal, cy1 = currentY, tempL = [];
            while (cx1 < x2) {
                tempL.push([cx1, cy1]);
                cx1 += interVal * 2;
            }
            segList.push(tempL);
            symbolList.push({
                showLine: false,
                showMarker: true,
                markerOptions: { size: 3, style: "circle", lineWidth: 0.5 }
            });
        }
        else {
            var cx1 = x1, cy1 = currentY, tempL = [], tempL2 = [];
            while (cx1 < x2) {
                tempL.push([cx1, cy1]);
                tempL2.push([cx1 + interVal, cy1]);
                cx1 += interVal * 2;
            }
            segList.push(tempL);
            symbolList.push({
                showLine: false,
                showMarker: true,
                markerOptions: { size: 3, style: "circle", lineWidth: 0.5 }
            });
            segList.push(tempL2);
            symbolList.push({
                showLine: false,
                showMarker: true,
                markerOptions: { size: 1, style: "dash", lineWidth: 0.5 }
            });
        }
        if (currentY > y1 + interVal / 2) {
            segList.push([[x1, currentY - interVal / 2], [x2, currentY - interVal / 2]]);
            symbolList.push({});
        }
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//页岩
function getYeYan(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    while (currentY >= y1) {
        segList.push([[x1, currentY], [x2, currentY]]);
        segList.push([[x1, currentY + interVal / 3], [x2, currentY + interVal / 3]]);
        symbolList.push({
        });
        symbolList.push({
        });
        currentY = currentY - interVal; //当前点Y
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//石灰岩
function getShiHuiYan(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    var index = 0, lastY = y2;
    while (currentY >= y1) {
        if (index % 2 == 0) {
            var cx = x1 + interVal / 2;
            while (cx < x2) {
                segList.push([[cx, lastY], [cx, currentY]]);
                symbolList.push({
                });
                cx += interVal * 1.5;
            }
        }
        else {
            var cx = x1 + interVal;
            while (cx < x2) {
                segList.push([[cx, lastY], [cx, currentY]]);
                symbolList.push({
                });
                cx += interVal * 1.5;
            }
        }
        segList.push([[x1, currentY], [x2, currentY]]);
        symbolList.push({
        });
        lastY = currentY;
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    if (index % 2 == 0) {
        var cx = x1 + interVal / 2;
        while (cx < x2) {
            segList.push([[cx, lastY], [cx, y1]]);
            symbolList.push({
            });
            cx += interVal * 1.5;
        }
    }
    else {
        var cx = x1 + interVal;
        while (cx < x2) {
            segList.push([[cx, lastY], [cx, y1]]);
            symbolList.push({
            });
            cx += interVal * 1.5;
        }
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//泥灰岩
function getNiHuiYan(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    var index = 0, lastY = y2;
    while (currentY >= y1) {
        if (index % 2 == 0) {
            var cx = x1 + interVal / 2;
            while (cx < x2) {
                segList.push([[cx + interVal / 3, lastY], [cx, currentY]]);
                symbolList.push({
                });
                cx += interVal * 2;
            }
        }
        else {
            var cx = x1 + interVal;
            while (cx < x2) {
                segList.push([[cx + interVal / 3, lastY], [cx, currentY]]);
                symbolList.push({
                });
                cx += interVal * 2;
            }
        }
        segList.push([[x1, currentY], [x2, currentY]]);
        symbolList.push({
        });
        lastY = currentY;
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    if (index % 2 == 0) {
        var cx = x1 + interVal / 2;
        while (cx < x2) {
            segList.push([[cx + interVal / 3, lastY], [cx, y1]]);
            symbolList.push({
            });
            cx += interVal * 2;
        }
    }
    else {
        var cx = x1 + interVal;
        while (cx < x2) {
            segList.push([[cx + interVal / 3, lastY], [cx, y1]]);
            symbolList.push({
            });
            cx += interVal * 2;
        }
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//白云岩
function getBaiYunYan(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    var index = 0, lastY = y2;
    while (currentY >= y1) {
        if (index % 2 == 0) {
            var cx = x1 + interVal / 2;
            while (cx < x2) {
                segList.push([[cx, lastY], [cx, currentY]]);
                symbolList.push({
                });
                segList.push([[cx + interVal / 3, lastY], [cx + interVal / 3, currentY]]);
                symbolList.push({
                });
                cx += interVal * 1.5;
            }
        }
        else {
            var cx = x1 + interVal;
            while (cx < x2) {
                segList.push([[cx, lastY], [cx, currentY]]);
                symbolList.push({
                });
                segList.push([[cx + interVal / 3, lastY], [cx + interVal / 3, currentY]]);
                symbolList.push({
                });
                cx += interVal * 1.5;
            }
        }
        segList.push([[x1, currentY], [x2, currentY]]);
        symbolList.push({
        });
        lastY = currentY;
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    if (index % 2 == 0) {
        var cx = x1 + interVal / 2;
        while (cx < x2) {
            segList.push([[cx, lastY], [cx, currentY]]);
            symbolList.push({
            });
            segList.push([[cx + interVal / 3, lastY], [cx + interVal / 3, y1]]);
            symbolList.push({
            });
            cx += interVal * 1.5;
        }
    }
    else {
        var cx = x1 + interVal;
        while (cx < x2) {
            segList.push([[cx, lastY], [cx, currentY]]);
            symbolList.push({
            });
            segList.push([[cx + interVal / 3, lastY], [cx + interVal / 3, y1]]);
            symbolList.push({
            });
            cx += interVal * 1.5;
        }
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//闪长岩
function getShanChangYan(x1, y1, x2, y2, interVal) {
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    var index = 0;
    while (currentY >= y1) {
        var cx1, cy1 = currentY;
        if (index % 2 == 0) {
            cx1 = x1 + interVal / 2;
        }
        else {
            cx1 = x1;
        }
        while (cx1 < x2) {
            segList.push([[cx1, cy1], [cx1 + interVal / 1.5, cy1]]);
            symbolList.push({
            });
            segList.push([[cx1 + interVal / 3, cy1], [cx1 + interVal / 3, cy1 + interVal / 3]]);
            symbolList.push({
            });
            cx1 += interVal * 1.5;
        }
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//安山岩
function getAnShanYan(x1, y1, x2, y2, interVal) {
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    var index = 0;
    while (currentY >= y1 + interVal / 3) {
        var cx1, cy1 = currentY;
        if (index % 2 == 0) {
            cx1 = x1 + interVal / 2;
        }
        else {
            cx1 = x1;
        }
        while (cx1 < x2) {
            segList.push([[cx1, cy1], [cx1 + interVal / 3, cy1 - interVal / 3], [cx1 + interVal / 1.5, cy1]]);
            symbolList.push({
            });
            cx1 += interVal * 2;
        }
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//火山角砾岩
function getHuoShanJiaoLiYan(x1, y1, x2, y2, interVal) {
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY >= y1) {
        var cx1, cy1 = currentY;
        if (index % 2 == 0) {
            cx1 = x1;
            while (cx1 < x2) {
                segList.push([[cx1, cy1], [cx1 + interVal / 2, cy1], [cx1 + interVal / 4, cy1 + interVal / 3], [cx1, cy1]]);
                symbolList.push({
                    fill: true
                });
                segList.push([[cx1 + interVal, cy1 + interVal * 0.75], [cx1 + interVal, cy1 - interVal * 0.75 > y1 ? (cy1 - interVal * 0.75) : y1]]);
                symbolList.push({
                });
                cx1 += interVal * 2;
            }
        }
        else {
            cx1 = x1;
            while (cx1 < x2) {
                segList.push([[cx1, cy1 + interVal * 0.75], [cx1, cy1 - interVal * 0.75 > y1 ? (cy1 - interVal * 0.75) : y1]]);
                symbolList.push({
                });
                segList.push([[cx1 + interVal, cy1], [cx1 + interVal * 1.5, cy1], [cx1 + interVal * 1.25, cy1 + interVal / 3], [cx1 + interVal, cy1]]);
                symbolList.push({
                    fill: true
                });
                cx1 += interVal * 2;
            }
        }
        currentY = currentY - 1.5 * interVal; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//辉绿岩
function getHuiLvYan(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    var index = 0;
    while (currentY > y1 + interVal / 3) {
        var cx1, tempL = [];
        if (index % 2 == 0) {
            cx1 = x1 + interVal / 2;
        }
        else {
            cx1 = x1;
        }
        while (cx1 <= x2) {
            tempL.push([cx1, currentY]);
            cx1 += interVal * 2;
        }
        segList.push(tempL);
        symbolList.push({
            showLine: false,
            showMarker: true,
            markerOptions: { size: 5, style: "x", lineWidth: 0.5 }
        });
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//玄武岩
function getXuanWuYan(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    var index = 0;
    while (currentY >= y1) {
        var cx1, cy1 = currentY;
        if (index % 2 == 0) {
            cx1 = x1 + interVal;
        }
        else {
            cx1 = x1;
        }
        while (cx1 < x2) {
            segList.push([[cx1, cy1], [cx1 - interVal / 2, cy1], [cx1 - interVal / 2, cy1 - interVal / 2 > y1 ? cy1 - interVal / 2 : y1]]);
            symbolList.push({
            });
            cx1 += interVal * 1.5;
        }
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//石英岩
function getShiYingYan(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    while (currentY >= y1) {
        segList.push([[x1, currentY], [x2, currentY]]);
        segList.push([[x1, currentY + interVal / 4], [x2, currentY + interVal / 4]]);
        symbolList.push({
        });
        symbolList.push({
        });
        if (currentY - interVal / 3 > y1) {
            segList.push([[x1, currentY - interVal / 3], [x2, currentY - interVal / 3]]);
            symbolList.push({
                linePattern: [1, 5], lineWidth: 1
            });
        }
        currentY = currentY - interVal; //当前点Y
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//大理岩
function getDaLiYan(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2;
    var index = 0;
    while (currentY >= y1) {
        var cx;
        currentY = currentY - interVal * 1.2; //当前点Y
        if (index % 2 == 0) {
            cx = x1;
        }
        else {
            cx = x1 - interVal;
        }
        while (cx <= x2) {
            segList.push([[cx, currentY > y1 ? currentY : y1], [cx + interVal * 2, currentY > y1 ? currentY : y1], [cx + interVal * 2, currentY + interVal], [cx, currentY + interVal], [cx, currentY > y1 ? currentY : y1]]);
            symbolList.push({
            });
            cx += interVal * 2.4;
        }
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//片麻岩
function getPianMaYan(x1, y1, x2, y2, interVal) {
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2;
    while (currentY >= y1) {
        var cx = x1;
        while (cx <= x2) {
            cx += interVal * 1.3;
            segList.push([[cx, currentY], [cx - interVal / 2, currentY], [cx, currentY + interVal / 2]]);
            symbolList.push({
            });
            segList.push([[cx - interVal / 2, currentY + interVal / 5], [cx - interVal, currentY + interVal / 2]]);
            symbolList.push({
            });

        }
        currentY = currentY - interVal * 1.2; //当前点Y
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//泥岩
function getNiYan(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    var index = 0;
    while (currentY > y1) {
        if (index % 4 == 0 || index % 4 == 2) {
            segList.push([[x1, currentY], [x2, currentY]]);
            symbolList.push({
            });
        }
        else if (index % 4 == 1) {
            segList.push([[x1 - interVal / 2, currentY], [x2, currentY]]);
            symbolList.push({ linePattern: [10, 2], lineWidth: 1 });
        }
        else {
            segList.push([[x1, currentY], [x2, currentY]]);
            symbolList.push({ linePattern: [10, 2], lineWidth: 1 });
        }
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//淤泥
function getYuNi(x1, y1, x2, y2, interVal)//0度斜线纹填充，包括三个边框,返回线段数组,x1,y1为左下,x2,y2为右上
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal;
    var index = 0;
    while (currentY > y1) {
        var cx;
        if (index % 2 == 0) {
            cx = x1;
        }
        else {
            cx = x1 + interVal / 2;
        }
        while (cx < x2) {
            segList.push([[cx, currentY], [cx + interVal * 0.5, currentY + interVal / 2], [cx + interVal * 0.7, currentY + interVal / 2], [cx + interVal, currentY], [cx + interVal * 1.2, currentY], [cx + interVal * 1.5, currentY + interVal / 2]]);
            symbolList.push({});
            cx += interVal * 2.2;
        }
        currentY = currentY - interVal; //当前点Y
        index++;
    }
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//其他类别
function getDefaultLayer(x1, y1, x2, y2, interVal, layerName)//线横纹加层名得了
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var currentY = y2 - interVal / 2;
    while (currentY >= y1) {
        segList.push([[x1, currentY], [x2, currentY]]);
        symbolList.push({});
        currentY = currentY - interVal; //当前点Y
    }
    //加入f字母
    var block = [[x1 / 2 + x2 / 2, y1 / 2 + y2 / 2, layerName]];
    segList.push(block);
    symbolList.push({
        renderer: $.jqplot.BlockRenderer,
        rendererOptions: {
            css: {
                border: false,
                fontSize: '11pt',
                fontFamily: '宋体'
            }
        }
    });
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//地下水位
function getWaterHeight(x1, y1, x2)//
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    var interVal = (x2 - x1) / 8;
    segList.push([[x1, y1], [x1 + interVal * 3, y1]]);
    symbolList.push({ color: '#1E90FF', lineWidth: 1.2 });
    segList.push([[x1 + interVal / 2, y1 - interVal / 2], [x1 + interVal * 2.5, y1 - interVal / 2]]);
    symbolList.push({ color: '#1E90FF', lineWidth: 1.2 });
    segList.push([[x1 + interVal, y1 - interVal], [x1 + interVal * 2, y1 - interVal]]);
    symbolList.push({ color: '#1E90FF', lineWidth: 1.2 });
    segList.push([[x1 + interVal * 4, y1], [x2, y1]]);
    symbolList.push({ color: '#1E90FF', lineWidth: 1.2 });
    segList.push([[x1 + interVal * 1.5, y1], [x1 + interVal * 2.5, y1 + interVal * 1.5], [x1 + interVal * 0.5, y1 + interVal * 1.5], [x1 + interVal * 1.5, y1]]);
    symbolList.push({ color: '#1E90FF', lineWidth: 1.2 });

    //加入深度字母
    var block = [[x1 - interVal * 3.2, y1, y1.toString()]];
    segList.push(block);
    symbolList.push({
        renderer: $.jqplot.BlockRenderer,
        rendererOptions: {
            css: {
                color: '#1E90FF', border: false
            }
        }
    });
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
//地层的边界
function getDCBorder(x1, y1, x2, y2, interVal)//
{
    var segList = new Array(); //线段列表
    var symbolList = new Array(); //渲染列表
    segList.push([[x1, y1], [x2, y1]], [[x1, y2], [x2, y2]], [[x1, y1], [x1, y2]], [[x2, y2], [x2, y1]]);
    symbolList.push({ lineWidth: 1.5 }, { lineWidth: 1.5 }, { lineWidth: 1.5 }, { lineWidth: 1.5 });
    //得到边界的土层厚度值
    var depth = y1 - y2;
    var block = [[x1 - interVal * 2.2, y1, depth.toFixed(1)]];
    segList.push(block);
    symbolList.push({
        renderer: $.jqplot.BlockRenderer,
        rendererOptions: {
            css: {
                 border: false
            }
        }
    });
    var jsonData =
    {
        data: segList,
        sysmbol: symbolList
    };
    return jsonData; //返回线段点集列表
}
function GetDCSymbol(tcname, lastDepth, tcDepth, xLepth, interval) {
    var layerData;
    switch (tcname) {
        case "杂填土":
            layerData = getZaTianTu(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "素填土":
        case "填土":
        case "表土":
            layerData = getSuTianTu(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "黄土":
            layerData = getHuangTu(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "黑垆土":
        case "古土壤":
            layerData = getGuTuRang(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "黄土状粉土":
            layerData = getHuangTuZhuangFenTu(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "黄土状土":
            layerData = getHuangTuZhuangFenTu(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "黄土状粉质粘土":
            layerData = getHuangTuZhuangFenZhiNianTu(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "粘土":
            layerData = getNianTu(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "粉质粘土":
            layerData = getFenZhiNianTu(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "粉土":
            layerData = getFenTu(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "淤泥":
            layerData = getYuNi(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "粉砂":
            layerData = getFenSha(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "粉细砂":
            layerData = getFenXiSha(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "细砂":
            layerData = getXiSha(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "中细砂":
            layerData = getXiZhongSha(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "细中砂":
            layerData = getXiZhongSha(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "中砂":
            layerData = getZhongSha(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "中粗砂":
            layerData = getZhongCuSha(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "粗砂":
            layerData = getCuSha(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "粗砾砂":
            layerData = getCuLiSha(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "砾砂":
            layerData = getLiSha(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "圆砾":
        case "圆砾土":
            layerData = getYuanLi(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "角砾":
            layerData = getJiaoLi(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "卵石":
            layerData = getLuanShi(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
        case "卵石素填土":
            layerData = getLuanShi(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "碎石":
            layerData = getSuiShi(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "漂石":
            layerData = getPiaoShi(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "块石":
            layerData = getKuaiShi(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "耕土":
        case "有机土":
            layerData = getYouJiTu(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "砂岩":
            layerData = getShaYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "角砾岩":
            layerData = getJiaoLiYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "花岗岩":
            layerData = getHuaGangYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "砾岩":
            layerData = getLiYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "页岩":
            layerData = getYeYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "石灰岩":
            layerData = getShiHuiYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "泥灰岩":
            layerData = getNiHuiYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "白云岩":
            layerData = getBaiYunYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "闪长岩":
            layerData = getShanChangYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "安山岩":
            layerData = getAnShanYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "火山角砾岩":
            layerData = getHuoShanJiaoLiYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "辉绿岩":
            layerData = getHuiLvYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "玄武岩":
            layerData = getXuanWuYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "石英岩":
            layerData = getShiYingYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "大理岩":
            layerData = getDaLiYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "片麻岩":
            layerData = getPianMaYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        case "泥岩":
            layerData = getNiYan(0, lastDepth + tcDepth, xLepth, lastDepth, interval);
            break;
        default:
            layerData = getDefaultLayer(0, lastDepth + tcDepth, xLepth, lastDepth, interval, tcname);
            break;
    }
    return layerData;
};

function GetDCSymbol2(tcname, x1, y1, x2, y2, interval) {
    var layerData;
    switch (tcname) {
        case "杂填土":
            layerData = getZaTianTu(x1, y1, x2, y2, interval);
            break;
        case "素填土":
        case "填土":
        case "表土":
            layerData = getSuTianTu(x1, y1, x2, y2, interval);
            break;
        case "黄土":
            layerData = getHuangTu(x1, y1, x2, y2, interval);
            break;
        case "黑垆土":
        case "古土壤":
            layerData = getGuTuRang(x1, y1, x2, y2, interval);
            break;
        case "黄土状粉土":
            layerData = getHuangTuZhuangFenTu(x1, y1, x2, y2, interval);
            break;
        case "黄土状土":
            layerData = getHuangTuZhuangFenTu(x1, y1, x2, y2, interval);
            break;
        case "黄土状粉质粘土":
            layerData = getHuangTuZhuangFenZhiNianTu(x1, y1, x2, y2, interval);
            break;
        case "粘土":
            layerData = getNianTu(x1, y1, x2, y2, interval);
            break;
        case "粉质粘土":
            layerData = getFenZhiNianTu(x1, y1, x2, y2, interval);
            break;
        case "粉土":
            layerData = getFenTu(x1, y1, x2, y2, interval);
            break;
        case "淤泥":
            layerData = getYuNi(x1, y1, x2, y2, interval);
            break;
        case "粉砂":
            layerData = getFenSha(x1, y1, x2, y2, interval);
            break;
        case "粉细砂":
            layerData = getFenXiSha(x1, y1, x2, y2, interval);
            break;
        case "细砂":
            layerData = getXiSha(x1, y1, x2, y2, interval);
            break;
        case "中细砂":
            layerData = getXiZhongSha(x1, y1, x2, y2, interval);
            break;
        case "细中砂":
            layerData = getXiZhongSha(x1, y1, x2, y2, interval);
            break;
        case "中砂":
            layerData = getZhongSha(x1, y1, x2, y2, interval);
            break;
        case "中粗砂":
            layerData = getZhongCuSha(x1, y1, x2, y2, interval);
            break;
        case "粗砂":
            layerData = getCuSha(x1, y1, x2, y2, interval);
            break;
        case "粗砾砂":
            layerData = getCuLiSha(x1, y1, x2, y2, interval);
            break;
        case "砾砂":
            layerData = getLiSha(x1, y1, x2, y2, interval);
            break;
        case "圆砾":
        case "圆砾土":
            layerData = getYuanLi(x1, y1, x2, y2, interval);
            break;
        case "角砾":
            layerData = getJiaoLi(x1, y1, x2, y2, interval);
            break;
        case "卵石":
            layerData = getLuanShi(x1, y1, x2, y2, interval);
        case "卵石素填土":
            layerData = getLuanShi(x1, y1, x2, y2, interval);
            break;
        case "碎石":
            layerData = getSuiShi(x1, y1, x2, y2, interval);
            break;
        case "漂石":
            layerData = getPiaoShi(x1, y1, x2, y2, interval);
            break;
        case "块石":
            layerData = getKuaiShi(x1, y1, x2, y2, interval);
            break;
        case "耕土":
        case "有机土":
            layerData = getYouJiTu(x1, y1, x2, y2, interval);
            break;
        case "砂岩":
            layerData = getShaYan(x1, y1, x2, y2, interval);
            break;
        case "角砾岩":
            layerData = getJiaoLiYan(x1, y1, x2, y2, interval);
            break;
        case "花岗岩":
            layerData = getHuaGangYan(x1, y1, x2, y2, interval);
            break;
        case "砾岩":
            layerData = getLiYan(x1, y1, x2, y2, interval);
            break;
        case "页岩":
            layerData = getYeYan(x1, y1, x2, y2, interval);
            break;
        case "石灰岩":
            layerData = getShiHuiYan(x1, y1, x2, y2, interval);
            break;
        case "泥灰岩":
            layerData = getNiHuiYan(x1, y1, x2, y2, interval);
            break;
        case "白云岩":
            layerData = getBaiYunYan(x1, y1, x2, y2, interval);
            break;
        case "闪长岩":
            layerData = getShanChangYan(x1, y1, x2, y2, interval);
            break;
        case "安山岩":
            layerData = getAnShanYan(x1, y1, x2, y2, interval);
            break;
        case "火山角砾岩":
            layerData = getHuoShanJiaoLiYan(x1, y1, x2, y2, interval);
            break;
        case "辉绿岩":
            layerData = getHuiLvYan(x1, y1, x2, y2, interval);
            break;
        case "玄武岩":
            layerData = getXuanWuYan(x1, y1, x2, y2, interval);
            break;
        case "石英岩":
            layerData = getShiYingYan(x1, y1, x2, y2, interval);
            break;
        case "大理岩":
            layerData = getDaLiYan(x1, y1, x2, y2, interval);
            break;
        case "片麻岩":
            layerData = getPianMaYan(x1, y1, x2, y2, interval);
            break;
        case "泥岩":
            layerData = getNiYan(x1, y1, x2, y2, interval);
            break;
        default:
            layerData = getDefaultLayer(x1, y1, x2, y2, interval, tcname);
            break;
    }
    var borderData = getDCBorder(x1, y1, x2, y2,interval);
    layerData.data = borderData.data.concat(layerData.data);
    layerData.sysmbol = borderData.sysmbol.concat(layerData.sysmbol);
    return layerData;
};