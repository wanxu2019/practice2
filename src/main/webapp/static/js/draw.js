/**
 * Created by Administrator on 2018/4/10.
 */
function max(x1,x2){
    return x1>x2?x1:x2;
}
function min(x1,x2){
    return x1<x2?x1:x2;
}
function getCanvas(){
    return document.getElementsByTagName('canvas')[0];
}
function getCanvasContext(){
    var myCanvas=getCanvas();
    var context=myCanvas.getContext( '2d' );
    return context;
}
//画背景
function drawBackground(){
    var context=getCanvasContext();
    //context.fillStyle="rgba(25,25,25,0.15)";
    context.fillStyle="white";
    context.fillRect(0,0,context.canvas.width,context.canvas.height);
}
//画圆
function drawCircle(x,y,r,color){
    var context=getCanvasContext();
    context.beginPath();
    context.arc(x,y,r,0,360,false);
    context.fillStyle=color;
    context.fill();
    context.closePath();
}
//画带文字的矩形框
function strokeRectWithText(start_x,start_y,width,height,line_color,line_width,text,text_color,font){
    var context=getCanvasContext();
    //画矩形
    context.lineWidth=line_width;
    context.strokeStyle = line_color;
    context.strokeRect(start_x, start_y, width, height);
    //画文字
    context.font=font;
    var txt_width = context.measureText(text).width;
    context.fillStyle=text_color;
    context.textBaseline="middle";
    context.textAlign="center";
    context.fillText(text,start_x+width/2, start_y+height/2);
}
//画表名
function drawRecordName(recordName){
    var context=getCanvasContext();
    fontSize = 30;
    context.font="bold "+fontSize+"px 微软雅黑";
    var txt_width = context.measureText(recordName).width;
    context.fillStyle="rgba(0,0,0,1)";
    context.textBaseline="middle";
    context.textAlign="center";
    context.fillText(recordName,context.canvas.width/2, 5+fontSize/2,txt_width);
    return 5+fontSize;
}
//画一列表格
function drawSeries(base_x,base_y,width,each_height,series_name,series_data){
    var start_x=base_x;
    var start_y=base_y;
    //画表头
    strokeRectWithText(start_x,start_y,width,each_height,"black",2,series_name,"black","bold 20px 微软雅黑");
    //画数据
    for(var i=0;i<series_data.length;i++){
    start_y+=each_height;
    strokeRectWithText(start_x,start_y,width,each_height,"black",2,series_data[i],"black","18px 微软雅黑");
    }
    return start_y+each_height;
}
var process_img=new Image();
process_img.src="./static/js/process.png";
//绘制P过程的图片
function drawPImage(base_x,base_y,width,rect_height,img_height,img_src){
    //画表头
    strokeRectWithText(base_x,base_y,width,rect_height,"black",2,"过程","black","bold 20px 微软雅黑");
    base_y+=rect_height;
    //画一个框把图片与文字框柱
    strokeRectWithText(base_x,base_y,width,img_height,"black",2,"","black","bold 20px 微软雅黑");
    //画文字
    //var context=getCanvasContext();
    //context.font="bold 20px 微软雅黑";
    //context.fillStyle="black";
    //context.textBaseline="middle";
    //context.textAlign="center";
    //context.fillText("过程",base_x+width/2, base_y+rect_height/2);
    //base_y+=rect_height;
    //偏移一点，留出空隙
    var interval=5;
    base_x+=interval;
    base_y+=interval;
    var img_width=width-interval*2;
    img_height=img_height-interval*2;
    //画图片
    var context=getCanvasContext();
    context.drawImage(process_img,base_x,base_y,img_width,img_height);
    return base_y+img_height+interval;
}
//画简单的向右的箭头
function drawSimpleRightArrow(base_x,base_y,length,w,h,line_width,line_color){
    //直线
    drawCircle(base_x,base_y,line_width/2,line_color);
    drawLine(base_x,base_y,base_x+length,base_y,line_width,line_color);
    drawCircle(base_x+length,base_y,line_width/2,line_color);
    //上斜线
    drawLine(base_x+length,base_y,base_x+length-w,base_y-h,line_width,line_color);
    drawCircle(base_x+length-w,base_y-h,line_width/2,line_color);
    //下斜线
    drawLine(base_x+length,base_y,base_x+length-w,base_y+h,line_width,line_color);
    drawCircle(base_x+length-w,base_y+h,line_width/2,line_color);
}
//画向右的箭头
function drawRightArrow(base_x,base_y,h1,h2,w1,w2,line_width,line_color,fill_color){
    var context=getCanvasContext();
    context.beginPath();
    context.lineWidth=line_width;
    //context.strokeWidth=line_width
    context.strokeStyle=line_color;
    context.moveTo(base_x,base_y);
    context.lineTo(base_x,base_y+h1);
    context.lineTo(base_x+w1,base_y+h1);
    context.lineTo(base_x+w1,base_y+h1+h2);
    context.lineTo(base_x+w1+w2,base_y);
    context.lineTo(base_x+w1,base_y-h1-h2);
    context.lineTo(base_x+w1,base_y-h1);
    context.lineTo(base_x,base_y-h1);
    context.closePath();
    context.stroke();
    context.restore();
    context.fillStyle=fill_color;
    context.fill();
}
//画简单的向下的箭头
function drawDownwardArrow(base_x,base_y,length,w,h,line_width,line_color){
    //直线
    drawCircle(base_x,base_y,line_width/2,line_color);
    drawLine(base_x,base_y,base_x,base_y+length,line_width,line_color);
    drawCircle(base_x,base_y+length,line_width/2,line_color);
    //左斜线
    drawLine(base_x,base_y+length,base_x-w,base_y+length-h,line_width,line_color);
    drawCircle(base_x-w,base_y+length-h,line_width/2,line_color);
    //右斜线
    drawLine(base_x,base_y+length,base_x+w,base_y+length-h,line_width,line_color);
    drawCircle(base_x+w,base_y+length-h,line_width/2,line_color);
}
//画简单的向下转折的箭头
function drawSimpleDownwardTurnArrow(base_x,base_y,h1,length,h2,w,h,line_width,line_color){
    //竖直线1
    drawCircle(base_x,base_y,line_width/2,line_color);
    drawLine(base_x,base_y,base_x,base_y+h1,line_width,line_color);
    drawCircle(base_x,base_y+h1,line_width/2,line_color);
    //水平线
    drawLine(base_x,base_y+h1,base_x-length,base_y+h1,line_width,line_color);
    drawCircle(base_x-length,base_y+h1,line_width/2,line_color);
    //竖直线2
    drawLine(base_x-length,base_y+h1,base_x-length,base_y+h1+h2,line_width,line_color);
    drawCircle(base_x-length,base_y+h1+h2,line_width/2,line_color);
    //左斜线
    drawLine(base_x-length,base_y+h1+h2,base_x-length-w,base_y+h1+h2-h,line_width,line_color);
    drawCircle(base_x-length-w,base_y+h1+h2-h,line_width/2,line_color);
    //右斜线
    drawLine(base_x-length,base_y+h1+h2,base_x-length+w,base_y+h1+h2-h,line_width,line_color);
    drawCircle(base_x-length+w,base_y+h1+h2-h,line_width/2,line_color);
}
//画向下转折的箭头
function drawDownwardTurnArrow(start_x,start_y,end_x,end_y,d,h,line_width,line_color,fill_color){
    var context=getCanvasContext();
    context.strokeStyle=line_color;
    context.lineWidth=line_width;
    context.beginPath();
    context.moveTo(start_x,start_y);
    //锚点1
    context.lineTo(start_x+d/2,start_y);
    //锚点2
    context.lineTo(start_x+d/2,start_y+h);
    //锚点3
    context.lineTo(end_x+d/2,start_y+h);
    //锚点4
    context.lineTo(end_x+d/2,end_y-d);
    //锚点5
    context.lineTo(end_x+d,end_y-d);
    //锚点6
    context.lineTo(end_x,end_y);
    //锚点7
    context.lineTo(end_x-d,end_y-d);
    //锚点8
    context.lineTo(end_x-d/2,end_y-d);
    //锚点9
    context.lineTo(end_x-d/2,start_y+h-d);
    //锚点10
    context.lineTo(start_x-d/2,start_y+h-d);
    //锚点11
    context.lineTo(start_x-d/2,start_y);
    context.closePath();
    context.stroke();
    context.fillStyle=fill_color;
    context.fill();
    context.restore();
}
//drawDownwardTurnArrow(500,0,100,400,20,200,3,"red","green");
//画直线
function drawLine(start_x,start_y,end_x,end_y,line_width,line_color){
    var context=getCanvasContext();
    context.beginPath();
    context.moveTo(start_x,start_y);
    context.lineTo(end_x,end_y);
    context.strokeStyle=line_color;
    context.lineWidth=line_width;
    context.stroke();
}
//drawLine(0,0,100,100,5,"red");
//画括号
function drawBracket(base_x,base_y,h1,h2,w1,w2,w3,line_width,line_color){
    var context=getCanvasContext();
    context.lineWidth=line_width;
    context.strokeStyle=line_color;
    context.beginPath();
    context.moveTo(base_x,base_y);
    context.bezierCurveTo(
        base_x,base_y,
        base_x,base_y+h1,
        base_x-w1,base_y+h1
    );
    context.stroke();
    drawLine(base_x-w1,base_y+h1,base_x-w1-w2,base_y+h1,line_width,line_color);
    context.bezierCurveTo(
        base_x-w1-w2,base_y+h1,
        base_x-w1-w2-w3,base_y+h1,
        base_x-w1-w2-w3,base_y+h1+h2
    );
    context.stroke();
    //flip
    context.moveTo(base_x,base_y);
    w1=-w1;
    w2=-w2;
    w3=-w3;
    context.bezierCurveTo(
        base_x,base_y,
        base_x,base_y+h1,
        base_x-w1,base_y+h1
    );
    context.stroke();
    drawLine(base_x-w1,base_y+h1,base_x-w1-w2,base_y+h1,line_width,line_color);
    context.bezierCurveTo(
        base_x-w1-w2,base_y+h1,
        base_x-w1-w2-w3,base_y+h1,
        base_x-w1-w2-w3,base_y+h1+h2
    );
    context.stroke();
}
//drawBracket(500,300,100,50,50,200,50,3,"black");
//画P过程的详细图
function drawFragments(fragments_base_x,fragments_base_y,pMessages,fragment_width,fragment_arrow_width,fragment_line_width,fragment_line_color,fragment_arrow_line_width,fragment_arrow_line_color){
    var context=getCanvasContext();
    var y_bias=10;
    var fragment_height=70;
    if(pMessages.length==1){
        strokeRectWithText(fragments_base_x-fragment_width/2,fragments_base_y+y_bias,fragment_width,fragment_height,fragment_line_color,fragment_line_width,pMessages[0],fragment_line_color,"bold 20px 微软雅黑");
        return fragments_base_y+y_bias+fragment_height;
    }else{
        //Rebase将基准点定位到左边
        var l=min(4,pMessages.length);
        fragments_base_x=fragments_base_x-(l*fragment_width+fragment_arrow_width*(l-1))/2;
        //先画第一个Fragment
        strokeRectWithText(fragments_base_x,fragments_base_y+y_bias,fragment_width,fragment_height,fragment_line_color,fragment_line_width,pMessages[0],"black","bold 20px 微软雅黑");
        //再画箭头与2-4个
        for(var i=1;i<pMessages.length&&i<4;i++){
            //画箭头
            //drawRightArrow(
            //    fragments_base_x+fragment_width+(i-1)*(fragment_width+fragment_arrow_width)+fragment_arrow_width/6
            //    ,fragments_base_y+fragment_height/2+y_bias
            //    ,fragment_arrow_width/6
            //    ,fragment_arrow_width/6
            //    ,fragment_arrow_width/3
            //    ,fragment_arrow_width/3
            //    ,fragment_arrow_line_width
            //    ,fragment_arrow_line_color
            //    ,"#888888"
            //);
            //改为画简单的箭头
            drawSimpleRightArrow(
                fragments_base_x+fragment_width+(i-1)*(fragment_width+fragment_arrow_width)+fragment_arrow_width/6
                ,fragments_base_y+fragment_height/2+y_bias
                ,fragment_arrow_width/3*2
                ,8
                ,8
                ,3
                ,"#000000"
            );
            strokeRectWithText(
                fragments_base_x+i*(fragment_width+fragment_arrow_width)
                ,fragments_base_y+y_bias
                ,fragment_width
                ,fragment_height
                ,fragment_line_color
                ,fragment_line_width
                ,pMessages[i]
                ,"black"
                ,"bold 20px 微软雅黑"
            );
        }
        if(pMessages.length<5)
        {
            return fragments_base_y+y_bias+fragment_height;
        }
        else{
            //两层Fragments的层间间隔
            var fragments_vertical_interval=100;
            //画向下的箭头
            //drawDownwardTurnArrow(
            //    fragments_base_x+3*fragment_arrow_width+3.5*fragment_width
            //    ,fragments_base_y+fragment_height+2*y_bias
            //    ,fragments_base_x+0.5*fragment_width
            //    ,fragments_base_y+fragment_height+fragments_vertical_interval
            //    ,20
            //    ,fragments_vertical_interval/2.5
            //    ,fragment_arrow_line_width
            //    ,fragment_arrow_line_color
            //    ,"#888888"
            //);
            //画简单的向下的箭头
            drawSimpleDownwardTurnArrow(
                fragments_base_x+3*fragment_arrow_width+3.5*fragment_width
                ,fragments_base_y+fragment_height+2*y_bias
                ,fragments_vertical_interval/2.5
                ,(fragment_width+fragment_arrow_width)*3
                ,fragments_vertical_interval/2.5
                ,8
                ,8
                ,3
                ,"#000000"
            );
            //Rebase将基准点定位到左边
            fragments_base_y+=fragment_height+fragments_vertical_interval+y_bias;
            //先画第一个Fragment
            strokeRectWithText(fragments_base_x,fragments_base_y,fragment_width,fragment_height,fragment_line_color,fragment_line_width,pMessages[4],"black","bold 20px 微软雅黑");
            //再画箭头与6-8个
            for(var i=5;i<pMessages.length;i++){
                //画箭头
                //drawRightArrow(
                //    fragments_base_x+fragment_width+(i-5)*(fragment_width+fragment_arrow_width)+fragment_arrow_width/6
                //    ,fragments_base_y+fragment_height/2
                //    ,fragment_arrow_width/6
                //    ,fragment_arrow_width/6
                //    ,fragment_arrow_width/3
                //    ,fragment_arrow_width/3
                //    ,fragment_arrow_line_width
                //    ,fragment_arrow_line_color
                //    ,"#888888"
                //);
                //改为画简单的箭头
                drawSimpleRightArrow(
                    fragments_base_x+fragment_width+(i-5)*(fragment_width+fragment_arrow_width)+fragment_arrow_width/6
                    ,fragments_base_y+fragment_height/2
                    ,fragment_arrow_width/3*2
                    ,8
                    ,8
                    ,3
                    ,"#000000"
                );
                strokeRectWithText(
                    fragments_base_x+(i-4)*(fragment_width+fragment_arrow_width)
                    ,fragments_base_y
                    ,fragment_width
                    ,fragment_height
                    ,fragment_line_color
                    ,fragment_line_width
                    ,pMessages[i]
                    ,"black"
                    ,"bold 20px 微软雅黑"
                );
            }
            return fragments_base_y+fragment_height;
        }
    }
}
//画所有的东西
function drawOnCanvas(recordName,sMessages,iMessages,pMessages,oMessages,cMessages){
    drawBackground();
    var context=getCanvasContext();
    var padding_left=5;
    var padding_right=5;
    var arrow_width=50;
    var p_width=0;
    var series_width=(context.canvas.width-padding_left-padding_right-arrow_width*4-p_width)/5;
    var series_each_height=50;
    //画表名
    var base_y=drawRecordName(recordName)+5;
    var base_x=0;
    var start_x=base_x;
    var start_y=base_y;
    //找出最小的系列长度
    var min_series_length=min(sMessages.length,iMessages.length);
    min_series_length=min(min_series_length,oMessages.length);
    min_series_length=min(min_series_length,cMessages.length);
    min_series_length=min(min_series_length,4);
    //画S
    start_x+=padding_left;
    var s_end_y=drawSeries(start_x,start_y,series_width,series_each_height,"供应商",sMessages);
    //画箭头
    start_x+=series_width;
    //drawRightArrow(start_x+arrow_width/6,start_y+(min(sMessages.length,iMessages.length)+1)/2*series_each_height,arrow_width/6,arrow_width/6,arrow_width/3,arrow_width/3,2,"black","#888888");
    drawRightArrow(start_x+arrow_width/6,start_y+(min_series_length+1)/2*series_each_height,arrow_width/6,arrow_width/6,arrow_width/3,arrow_width/3,2,"black","#888888");
    //画I
    start_x+=arrow_width;
    var i_end_y=drawSeries(start_x,start_y,series_width,series_each_height,"输入",iMessages);
    //画箭头
    start_x+=series_width;
    drawRightArrow(start_x+arrow_width/6,start_y+(min_series_length+1)/2*series_each_height,arrow_width/6,arrow_width/6,arrow_width/3,arrow_width/3,2,"black","#888888");

    //画P
    start_x+=arrow_width;
    var start_x_p=start_x;
    //var p_end_y=drawSeries(start_x,start_y,series_width,series_each_height,"P",pMessages);
    var p_end_y=drawPImage(start_x,start_y,series_width,series_each_height,series_width,"./static/js/process.png");

    //画箭头
    start_x+=series_width;
    drawRightArrow(start_x+arrow_width/6,start_y+(min_series_length+1)/2*series_each_height,arrow_width/6,arrow_width/6,arrow_width/3,arrow_width/3,2,"black","#888888");
    //画O
    start_x+=arrow_width;
    var o_end_y=drawSeries(start_x,start_y,series_width,series_each_height,"输出",oMessages);
    //画箭头
    start_x+=series_width;
    drawRightArrow(start_x+arrow_width/6,start_y+(min_series_length+1)/2*series_each_height,arrow_width/6,arrow_width/6,arrow_width/3,arrow_width/3,2,"black","#888888");
    //画C
    start_x+=arrow_width;
    var c_end_y=drawSeries(start_x,start_y,series_width,series_each_height,"顾客",cMessages);

    //绘图完毕时的最低位置
    var end_y=max(max(max(s_end_y,i_end_y),max(o_end_y,c_end_y)),p_end_y);

    if(pMessages.length<=1){
        //直接不画

        return end_y;
    }
    else{
        //画额外的P的部分
        //画括号
        var h1=20;
        //如果P这一列是最长的
        if(s_end_y<p_end_y+h1 && i_end_y<p_end_y+h1 && o_end_y<p_end_y+h1 && c_end_y<p_end_y+h1){
            //pass
        }else{
            //否则应当将基准线下移以防止重叠
            h1+=max(max(s_end_y,i_end_y),max(o_end_y,c_end_y))-p_end_y;
        }
        var h2=20;
        var w1=arrow_width+series_width/2;
        var w2=0;
        var w3=h2;
        //Fragment参数
        var fragment_width=series_width;
        var fragment_arrow_width=arrow_width;
        var bracket_length=(w1+w2+w3)*2;
        var fragment_length=min(4,pMessages.length)*fragment_width+(min(4,pMessages.length)-1)*fragment_arrow_width;
        //计算w2
        if(pMessages.length==1){
            w2=0;
        }else{
            if(fragment_length-fragment_width>bracket_length){
                w2=(fragment_length-fragment_width-bracket_length)/2;
            }
        }
        //画括号
        //drawBracket(start_x_p+series_width/2,p_end_y,h1,h2,w1,w2,w3,3,"black");
        //改为画简单的向下箭头
        drawDownwardArrow(start_x_p+series_width/2,p_end_y,h1+h2,10,10,3,"black");
        var fragments_base_x=start_x_p+series_width/2;
        var fragments_base_y=p_end_y+h1+h2;
        end_y=drawFragments(fragments_base_x,fragments_base_y,pMessages,fragment_width,fragment_arrow_width,5,"green",5,"#886688");
        return end_y;
    }
}
//画截止线
function showEnd(end_y){
    var context=getCanvasContext();
    drawLine(0,end_y,context.canvas.width,end_y,5,"red");
}
function testDraw(){
    var sMessages=[];
    sMessages.push("AAA");
    sMessages.push("AAA");
    sMessages.push("AAA");
    sMessages.push("AAA");
    sMessages.push("AAA");
    sMessages.push("AAA");
    var iMessages=[];
    iMessages.push("AAA");
    iMessages.push("AAA");
    iMessages.push("AAA");
    iMessages.push("AAA");
    iMessages.push("AAA");
    var pMessages=[];
    pMessages.push("AAA");
    pMessages.push("AAA");
    pMessages.push("AAA");
    pMessages.push("AAA");
    pMessages.push("AAA");
    pMessages.push("AAA");
    pMessages.push("AAA");
    pMessages.push("AAA");
    var oMessages=[];
    oMessages.push("AAA");
    oMessages.push("AAA");
    oMessages.push("AAA");
    oMessages.push("AAA");
    oMessages.push("AAA");
    oMessages.push("AAA");
    var cMessages=[];
    cMessages.push("AAA");
    cMessages.push("AAA");
    cMessages.push("AAA");
    cMessages.push("AAA");
    cMessages.push("AAA");
    cMessages.push("AAA");
    cMessages.push("AAA");
    var end_y=drawOnCanvas("Hello",sMessages,iMessages,pMessages,oMessages,cMessages);
    showEnd(end_y);
    $(getCanvas()).attr("height",end_y+10);
    end_y=drawOnCanvas("Hello",sMessages,iMessages,pMessages,oMessages,cMessages);
    console.log("end_y="+end_y);
}
function drawSIPOC(){
    var sipocMessages=getSIPOCMessages();
    var end_y=drawOnCanvas(
        sipocMessages.name
        ,sipocMessages.sMessage
        ,sipocMessages.iMessage
        ,sipocMessages.pMessage
        ,sipocMessages.oMessage
        ,sipocMessages.cMessage
    );
    $(getCanvas()).attr("height",end_y+10);
    end_y=drawOnCanvas(
        sipocMessages.name
        ,sipocMessages.sMessage
        ,sipocMessages.iMessage
        ,sipocMessages.pMessage
        ,sipocMessages.oMessage
        ,sipocMessages.cMessage
    );
}
testDraw();