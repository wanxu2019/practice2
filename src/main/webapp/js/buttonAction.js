var projectId = 0;//项目Id
var projectName;//项目名
var appResult = null;//word报告
var appNameChinese = 'SIPOC';//app中文名（必填）
var USER_NAME = '';//当前登录用户名

// 添加项目后，自定义操作
function addSelfDefine(result) {
    //上一层函数查看basicAction.js中addProject()函数
    /*
    * your code.....
    **/
    $('a[onclick="sideCheck('+result.content.id+',this)"]').trigger("click");
    console.log("add project successful");
}

// 查看项目后，自定义操作
function checkSelfDefine(node, result) {
    // 上一层函数查看basicAction.js中checkProject()函数
    /*
    * your code.....
    **/
    $('#mainFunction').trigger('click');
    initCustomText();
    console.log("appContent:"+result.content.appContent);
    console.log("appResult:"+result.content.appResult);
    try{
        var sipocMessages=JSON.parse(result.content.appContent);
        displaySIPOCMessages(sipocMessages);
    }catch(e){
        console.log(e);
        removeAllData();
    }
    console.log("check project successful");
}

//删除项目后，自定义操作
function removeSelfDefine(result) {
    // 上一层函数查看basicAction.js中removeProject()函数
    /*
    * your code.....
    **/
    $($('a[onclick^="sideCheck("]')[0]).trigger("click");
    console.log("remove project successful");
}
var customText = {//word编辑区自定义文本内容
    'title': "<h2>1 SIPOC App分析结果 </h2>",
    'img':""
};
function initCustomText(){
    customText = {//word编辑区自定义文本内容
        'title': "<h2>1 SIPOC App分析结果 </h2>",
        'img':""
    };
}
//定制初始化内容
function setCustomContext() {
    // canvas图片获取方式
    var img = $("#canvas")[0];  //选择页面中的img元素
    var image = new Image();
    if (img != null) {
        image.src = img.toDataURL("image/png");
    }
    var img1 = image;
    // 其他示例
    var img2 = $("#image2Id");  //选择页面中的img元素
    var wordImgArr = [img1, img2];//定义图片数组
    //custom code begin
    customText = {//word编辑区自定义文本内容
        'title': "<h2>1 SIPOC App分析结果 </h2>",
        'img':""
    };
    drawSIPOC();
    var img=document.getElementById("canvas");
    var image = new Image();
    if (img != null) {
        image.src = img.toDataURL("image/png");
    }
    customText.img = image;
    try {
        $("#WYeditor").html("");
        for (var variable  in customText) {//遍历自定义文本对象
            $("#WYeditor").append(customText[variable]);//插入元素
        }
    }
    catch(e){
        console.log("初始化报告失败");
    }
    //custom code end
}