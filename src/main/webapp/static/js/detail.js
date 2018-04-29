/**
 * Created by Json Wan on 2017/8/29.
 */
/**
 * 点击编辑显示弹出框
 */
//draw.js内容
//draw.js内容End
/*jshint browser:true */
/* eslint-env browser */
/* eslint no-use-before-define:0 */
/*global Uint8Array, Uint16Array, ArrayBuffer */
/*global XLSX */
var X = XLSX;
var XW = {
    /* worker message */
    msg: 'xlsx',
    /* worker scripts */
    worker: './xlsxworker.js'
};

var global_wb;

var process_wb = (function () {
    var OUT = document.getElementById('out');
    var HTMLOUT = document.getElementById('htmlout');

    var get_format = (function () {
        var radios = document.getElementsByName("format");
        return function () {
            for (var i = 0; i < radios.length; ++i)
                if (radios[i].checked || radios.length === 1)
                    return radios[i].value;
        };
    })();

    var to_json = function to_json(workbook) {
        var result = {};
        workbook.SheetNames.forEach(function (sheetName) {
            var roa = X.utils.sheet_to_json(workbook.Sheets[sheetName]);
            if (roa.length) result[sheetName] = roa;
        });
        return JSON.stringify(result, 2, 2);
    };

    var to_csv = function to_csv(workbook) {
        var result = [];
        workbook.SheetNames.forEach(function (sheetName) {
            var csv = X.utils.sheet_to_csv(workbook.Sheets[sheetName]);
            if (csv.length) {
                result.push("SHEET: " + sheetName);
                result.push("");
                result.push(csv);
            }
        });
        return result.join("\n");
    };

    var to_fmla = function to_fmla(workbook) {
        var result = [];
        workbook.SheetNames.forEach(function (sheetName) {
            var formulae = X.utils.get_formulae(workbook.Sheets[sheetName]);
            if (formulae.length) {
                result.push("SHEET: " + sheetName);
                result.push("");
                result.push(formulae.join("\n"));
            }
        });
        return result.join("\n");
    };

    var to_html = function to_html(workbook) {
        HTMLOUT.innerHTML = "";
        workbook.SheetNames.forEach(function (sheetName) {
            var htmlstr = X.write(workbook, {sheet: sheetName, type: 'binary', bookType: 'html'});
            HTMLOUT.innerHTML += htmlstr;
        });
        return "";
    };

    return function process_wb(wb) {
        global_wb = wb;
        var output = "";
        //switch(get_format()) {
        //    case "form": output = to_fmla(wb); break;
        //    case "html": output = to_html(wb); break;
        //    case "json": output = to_json(wb); break;
        //    default: output = to_csv(wb);
        //}
        output = to_json(wb);
        //show(output);
        //处理Excel中的数据
        handle_excel_data(output);
        //if(OUT.innerText === undefined)
        //    OUT.textContent = output;
        //else
        //    OUT.innerText = output;
        //if(typeof console !== 'undefined')
        //    console.log("output", new Date());
    };
})();

var setfmt = window.setfmt = function setfmt() {
    if (global_wb)
        process_wb(global_wb);
};

var b64it = window.b64it = (function () {
    var tarea = document.getElementById('b64data');
    return function b64it() {
        if (typeof console !== 'undefined') console.log("onload", new Date());
        var wb = X.read(tarea.value, {type: 'base64', WTF: false});
        process_wb(wb);
    };
})();

var do_file = (function () {
    var rABS = typeof FileReader !== "undefined" && (FileReader.prototype || {}).readAsBinaryString;
    var domrabs = document.getElementsByName("userabs")[0];
    if (!rABS) domrabs.disabled = !(domrabs.checked = false);

    var use_worker = typeof Worker !== 'undefined';
    var domwork = document.getElementsByName("useworker")[0];
    if (!use_worker) domwork.disabled = !(domwork.checked = false);

    var xw = function xw(data, cb) {
        var worker = new Worker(XW.worker); 
        worker.onmessage = function (e) {
            switch (e.data.t) {
                case 'ready':
                    break;
                case 'e':
                    console.error(e.data.d);
                    break;
                case XW.msg:
                    cb(JSON.parse(e.data.d));
                    break;
            }
        };
        worker.postMessage({d: data, b: rABS ? 'binary' : 'array'});
    };

    return function do_file(files) {
        //rABS = domrabs.checked;
        rABS = true;
        //use_worker = domwork.checked;
        use_worker = false;
        var f = files[0];
        var reader = new FileReader();
        reader.onload = function (e) {
            if (typeof console !== 'undefined') console.log("onload", new Date(), rABS, use_worker);
            var data = e.target.result;
            if (!rABS) data = new Uint8Array(data);
            if (use_worker) xw(data, process_wb);
            else process_wb(X.read(data, {type: rABS ? 'binary' : 'array'}));
        };
        if (rABS) reader.readAsBinaryString(f);
        else reader.readAsArrayBuffer(f);
    };
})();


var handle_excel_data_flag = 0;
function handle_excel_data(data) {
    //console.log("handle_excel_data begin:");
    //两次只处理一次
    switch (handle_excel_data_flag) {
        case 0:
            handle_excel_data_flag = 1;
            break;
        case 1:
            handle_excel_data_flag = 0;
            break;
        default :
            break;
    }
    console.log(data);
    data = JSON.parse(data);
    displayData(data);
    //清除状态
    var xlf = document.getElementById('xlf');
    if (xlf) {
        xlf.value = "";
    }
    //console.log(data);
    //console.log("handle_excel_data end;");
}
function show(msg) {
    console.log("log:" + msg);
}
//移除所有SIPOC数据
function removeAllData() {
    $("#name").val("请输入项目名称");
    $("#sipoc_table td:nth-child(1) ul li").remove();
    $("#sipoc_table td:nth-child(2) ul li").remove();
    $("#sipoc_table td:nth-child(3) ul li").remove();
    $("#sipoc_table td:nth-child(4) ul li").remove();
    $("#sipoc_table td:nth-child(5) ul li").remove();
}
//移除展示Table中的数据
function removeShowData() {
    $("#showS a").remove();
    $("#showI a").remove();
    $("#showP a").remove();
    $("#showO a").remove();
    $("#showC a").remove();
    $("#detailShowName").empty();
}
//将数据显示出来
function displayData(data) {
    removeAllData();
    for (var i = 0; i < data.Sheet1.length; i++) {
        //show("第"+i+"行数据：");
        //show(row["S"]+","+row["I"]+","+row["P"]+","+row["O"]+","+row["C"]+";");
        row = data.Sheet1[i];
        if (row["S"] != undefined && row["S"] != "") {
            //添加格子
            var index = addS();
            //填充数据
            $("#input_s_" + index).val(row["S"]);
        }
        if (row["I"] != undefined && row["I"] != "") {
            //添加格子
            var index = addI();
            //填充数据
            $("#input_i_" + index).val(row["I"]);
        }
        if (row["P"] != undefined && row["P"] != "") {
            //添加格子
            var index = addP();
            //填充数据
            if(index!=-1){
                $("#input_p_" + index).val(row["P"]);
            }
        }
        if (row["O"] != undefined && row["O"] != "") {
            //添加格子
            var index = addO();
            //填充数据
            $("#input_o_" + index).val(row["O"]);
        }
        if (row["C"] != undefined && row["C"] != "") {
            //添加格子
            var index = addC();
            //填充数据
            $("#sipoc_input_c_" + index).val(row["C"]);
        }
    }
}

//Display SIPOC Messages
function displaySIPOCMessages(sipocMessages){
    removeAllData();
    //设置名称
    $("#name").val(sipocMessages.name);
    //添加S
    for(var i=0;i<sipocMessages.sMessage.length;i++){
        //添加格子
        var index = addS();
        //填充数据
        $("#input_s_" + index).val(sipocMessages.sMessage[i]);
    }
    //添加I
    for(var i=0;i<sipocMessages.iMessage.length;i++){
        //添加格子
        var index = addI();
        //填充数据
        $("#input_i_" + index).val(sipocMessages.iMessage[i]);
    }
    //添加P
    for(var i=0;i<sipocMessages.pMessage.length;i++){
        //添加格子
        var index = addP();
        //填充数据
        $("#input_p_" + index).val(sipocMessages.pMessage[i]);
    }
    //添加O
    for(var i=0;i<sipocMessages.oMessage.length;i++){
        //添加格子
        var index = addO();
        //填充数据
        $("#input_o_" + index).val(sipocMessages.oMessage[i]);
    }
    //添加C
    for(var i=0;i<sipocMessages.cMessage.length;i++){
        //添加格子
        var index = addC();
        //填充数据
        $("#sipoc_input_c_" + index).val(sipocMessages.cMessage[i]);
    }
}

//获取页面中编辑好的SIPOC信息
function getSIPOCMessages() {
    var name = $("#name").val();
    var sMessages = [];
    var iMessages = [];
    var pMessages = [];
    var oMessages = [];
    var cMessages = [];
    var sMessageSize = $("#sipoc_table td:nth-child(1) ul li input").length;
    for (var i = 0; i < sMessageSize; i++) {
        var value=$("#input_s_" + i).val();
        if (value!= "") {
            sMessages.push(value);
        }
    }
    var iMessageSize = $("#sipoc_table td:nth-child(2) ul li input").length;
    for (i = 0; i < iMessageSize; i++) {
        value=$("#input_i_" + i).val();
        if (value!= "") {
            iMessages.push(value);
        }
    }
    var pMessageSize = $("#sipoc_table td:nth-child(3) ul li input").length;
    for (i = 0; i < pMessageSize; i++) {
        value=$("#input_p_" + i).val();
        if (value!= "") {
            pMessages.push(value);
        }
    }
    var oMessageSize = $("#sipoc_table td:nth-child(4) ul li input").length;
    for (i = 0; i < oMessageSize; i++) {
        value=$("#input_o_" + i).val();
        if (value!= "") {
            oMessages.push(value);
        }
    }
    var cMessageSize = $("#sipoc_table td:nth-child(5) ul li input").length;
    for (var i = 0; i < cMessageSize; i++) {
        value=$("#sipoc_input_c_" + i).val();
        if (value!= "") {
            cMessages.push(value);
        }
    }
    return {
        name:name,
        sMessage:sMessages,
        iMessage:iMessages,
        pMessage:pMessages,
        oMessage:oMessages,
        cMessage:cMessages
    };
}
//获取序列化可存储的数据
function getSerilizableData(){
    var sipocMessages=getSIPOCMessages();
    var res=JSON.stringify(sipocMessages);
    console.log("SerilizableData:"+res);
    return res;
}
//保存项目到自己应用后端独立的数据库
function saveProjectToCustomBackend(){
    var sipocMessages=getSIPOCMessages();
    //保存到自己的数据库
    $.post("modify",
        {
            id: $("#recordId").val(),
            name: name,
            sMessage: sipocMessages.sMessage,
            iMessage: sipocMessages.iMessage,
            pMessage: sipocMessages.pMessage,
            oMessage: sipocMessages.oMessage,
            cMessage: sipocMessages.cMessage
        },
        function (data) {
            alert(data);
            //刷新当前页
            window.location = window.location;
        }
    );
}
//保存项目至云端
function saveProject(){
    if(projectId==0){
        alert("请先打开一个项目再保存数据");
        return ;
    }
    //保存到projectManager
    var appContent=getSerilizableData();
    var data={
        id:projectId,
        appName:appName,
        appContent:appContent,
        reservation:"have a try ."
    };
    //alert("save:"+JSON.stringify(data));
    $.ajax({
        url:"/projectManager/api/v1/project",
        type:"put",
        //群组ID
        data:data,
        success:function(result){
            //alert(JSON.stringify(result));
            if(result.state){
                //请求正确
                console.log(result.content)
                alert("数据已保存至云端！");
            }else{
                //请求错误
                console.log(result.error);
                alert("请求异常，请重试！");
            }
        }
    });
}
function addS() {
    var size = $("#sipoc_table td:nth-child(1) ul li").length;
    $("#sipoc_table td:nth-child(1) ul").append("<li><input id=\"input_s_" + size + "\"/>&nbsp;&nbsp;&nbsp;<button class=\"btn btn-danger btn-xs pull-right\" onclick=\"javascript:delElement(this);\"><i class=\"ace-icon fa fa-reply icon-only\"><i class=\"icon-trash icon-white\"></i></i></button></li>");
    return size;
}
function addI() {
    var size = $("#sipoc_table td:nth-child(2) ul li").length;
    $("#sipoc_table td:nth-child(2) ul").append("<li><input id=\"input_i_" + size + "\"/>&nbsp;&nbsp;&nbsp;<button class=\"btn btn-danger btn-xs pull-right\" onclick=\"javascript:delElement(this);\"><i class=\"ace-icon fa fa-reply icon-only\"><i class=\"icon-trash icon-white\"></i></i></button></li>");
    return size;
}
function addP() {
    var size = $("#sipoc_table td:nth-child(3) ul li").length;
    var real_size =size- $("#sipoc_table td:nth-child(3) ul li[my_tag='none']").length;
    if(real_size>=8){
        alert("最多添加8项流程，请精简流程。");
        return -1;
    }
    $("#sipoc_table td:nth-child(3) ul").append("<li><input id=\"input_p_" + size + "\"/>&nbsp;&nbsp;&nbsp;<button class=\"btn btn-danger btn-xs pull-right\" onclick=\"javascript:delElement(this);\"><i class=\"ace-icon fa fa-reply icon-only\"><i class=\"icon-trash icon-white\"></i></i></button></li>");
    return size;
}
function addO() {
    var size = $("#sipoc_table td:nth-child(4) ul li").length;
    $("#sipoc_table td:nth-child(4) ul").append("<li><input id=\"input_o_" + size + "\"/>&nbsp;&nbsp;&nbsp;<button class=\"btn btn-danger btn-xs pull-right\" onclick=\"javascript:delElement(this);\"><i class=\"ace-icon fa fa-reply icon-only\"><i class=\"icon-trash icon-white\"></i></i></button></li>");
    return size;
}
function addC() {
    var size = $("#sipoc_table td:nth-child(5) ul li").length;
    $("#sipoc_table td:nth-child(5) ul").append("<li><input id=\"sipoc_input_c_" + size + "\"/>&nbsp;&nbsp;&nbsp;<button class=\"btn btn-danger btn-xs pull-right\" onclick=\"javascript:delElement(this);\"><i class=\"ace-icon fa fa-reply icon-only\"><i class=\"icon-trash icon-white\"></i></i></button></li>");
    return size;
}
//删除单个元素
function delElement(node){
    var input=$(node).parent().find("input");
    //alert("input value="+input.val());
    input.val("");
    input.val("");
    var li=$(node).parent();
    li.attr("my_tag","none");
    li.css("display","none");
}

//保存至文件
function saveToFile() {
    
    //alert("save to File");
    //清理数据
    var sMessages=[],iMessages=[],pMessages=[],oMessages=[],cMessages=[];
    //S数据
    var size = $("#sipoc_table td:nth-child(1) ul li").length;
    for(var i=0;i<size;i++){
        var value=$("#sipoc_table td:nth-child(1) ul li:nth-child("+(i+1)+") input").val();
        if(value!=undefined&&value!=""){
            sMessages=sMessages.concat(value);
        }
    }
    //I数据
    size = $("#sipoc_table td:nth-child(2) ul li").length;
    for(var i=0;i<size;i++){
        var value=$("#sipoc_table td:nth-child(2) ul li:nth-child("+(i+1)+") input").val();
        if(value!=undefined&&value!=""){
            iMessages=iMessages.concat(value);
        }
    }
    //P数据
    size = $("#sipoc_table td:nth-child(3) ul li").length;
    for(var i=0;i<size;i++){
        var value=$("#sipoc_table td:nth-child(3) ul li:nth-child("+(i+1)+") input").val();
        if(value!=undefined&&value!=""){
            pMessages=pMessages.concat(value);
        }
    }
    //O数据
    size = $("#sipoc_table td:nth-child(4) ul li").length;
    for(var i=0;i<size;i++){
        var value=$("#sipoc_table td:nth-child(4) ul li:nth-child("+(i+1)+") input").val();
        if(value!=undefined&&value!=""){
            oMessages=oMessages.concat(value);
        }
    }
    //C数据
    size = $("#sipoc_table td:nth-child(5) ul li").length;
    for(var i=0;i<size;i++){
        var value=$("#sipoc_table td:nth-child(5) ul li:nth-child("+(i+1)+") input").val();
        if(value!=undefined&&value!=""){
            cMessages=cMessages.concat(value);
        }
    }
    //找出SIPOC中条目最多的数据
    var maxSize=sMessages.length>iMessages.length?sMessages.length:iMessages.length;
    maxSize=maxSize>pMessages.length?maxSize:pMessages.length;
    maxSize=maxSize>oMessages.length?maxSize:oMessages.length;
    maxSize=maxSize>cMessages.length?maxSize:cMessages.length;
    //清理表格
    $("#exportTable tbody tr").remove();
    //提取数据放入格式化的表格
    for(var i=0;i<maxSize;i++){
        $("#exportTable tbody").append("<tr></tr>");
        if(i<sMessages.length){
            $("#exportTable tbody tr:nth-child("+(i+1)+")").append("<td>"+sMessages[i]+"</td>");
        }else{
            $("#exportTable tbody tr:nth-child("+(i+1)+")").append("<td>"+""+"</td>");
        }
        if(i<iMessages.length){
            $("#exportTable tbody tr:nth-child("+(i+1)+")").append("<td>"+iMessages[i]+"</td>");
        }else{
            $("#exportTable tbody tr:nth-child("+(i+1)+")").append("<td>"+""+"</td>");
        }
        if(i<pMessages.length){
            $("#exportTable tbody tr:nth-child("+(i+1)+")").append("<td>"+pMessages[i]+"</td>");
        }else{
            $("#exportTable tbody tr:nth-child("+(i+1)+")").append("<td>"+""+"</td>");
        }
        if(i<oMessages.length){
            $("#exportTable tbody tr:nth-child("+(i+1)+")").append("<td>"+oMessages[i]+"</td>");
        }else{
            $("#exportTable tbody tr:nth-child("+(i+1)+")").append("<td>"+""+"</td>");
        }
        if(i<cMessages.length){
            $("#exportTable tbody tr:nth-child("+(i+1)+")").append("<td>"+cMessages[i]+"</td>");
        }else{
            $("#exportTable tbody tr:nth-child("+(i+1)+")").append("<td>"+""+"</td>");
        }
    }
    doit("xlsx","data.xlsx");
}
//写入excel操作
function s2ab(s) {
    if(typeof ArrayBuffer !== 'undefined') {
        var buf = new ArrayBuffer(s.length);
        var view = new Uint8Array(buf);
        for (var i=0; i!=s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
        return buf;
    } else {
        var buf = new Array(s.length);
        for (var i=0; i!=s.length; ++i) buf[i] = s.charCodeAt(i) & 0xFF;
        return buf;
    }
}

function export_table_to_excel(id, type, fn) {
    var wb = XLSX.utils.table_to_book(document.getElementById(id), {sheet:"Sheet JS"});
    var wbout = XLSX.write(wb, {bookType:type, bookSST:true, type: 'binary'});
    var fname = fn || 'test.' + type;
    try {
        saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), fname);
    } catch(e) { if(typeof console != 'undefined') console.log(e, wbout); }
    return wbout;
}

function doit(type, fn) {
    return export_table_to_excel('exportTable', type || 'xlsx', fn);
}
//保存为图片
function saveAsPicture(){
    domtoimage.toBlob(document.getElementById('print'), { bgcolor: "#ffffff" })
        .then(function (blob) {
            window.saveAs(blob, $("#name").val()+'.png');
        });
}
function detailShow(){
    console.log("detailShow");
	removeShowData();
    //打开弹层
    $("#myModal").modal();
    //获取数据实体
	 var sMessages=[],iMessages=[],pMessages=[],oMessages=[],cMessages=[];
	    //S数据
	    var size = $("#sipoc_table td:nth-child(1) ul li").length;
	    for(var i=0;i<size;i++){
	        var value=$("#sipoc_table td:nth-child(1) ul li:nth-child("+(i+1)+") input").val();
	        if(value!=undefined&&value!=""){
	            sMessages=sMessages.concat(value);
	        }
	    }
	    //I数据
	    size = $("#sipoc_table td:nth-child(2) ul li").length;
	    for(var i=0;i<size;i++){
	        var value=$("#sipoc_table td:nth-child(2) ul li:nth-child("+(i+1)+") input").val();
	        if(value!=undefined&&value!=""){
	            iMessages=iMessages.concat(value);
	        }
	    }
	    //P数据
	    size = $("#sipoc_table td:nth-child(3) ul li").length;
	    for(var i=0;i<size;i++){
	        var value=$("#sipoc_table td:nth-child(3) ul li:nth-child("+(i+1)+") input").val();
	        if(value!=undefined&&value!=""){
	            pMessages=pMessages.concat(value);
	        }
	    }
	    //O数据
	    size = $("#sipoc_table td:nth-child(4) ul li").length;
	    for(var i=0;i<size;i++){
	        var value=$("#sipoc_table td:nth-child(4) ul li:nth-child("+(i+1)+") input").val();
	        if(value!=undefined&&value!=""){
	            oMessages=oMessages.concat(value);
	        }
	    }
	    //C数据
	    size = $("#sipoc_table td:nth-child(5) ul li").length;
	    for(var i=0;i<size;i++){
	        var value=$("#sipoc_table td:nth-child(5) ul li:nth-child("+(i+1)+") input").val();
	        if(value!=undefined&&value!=""){
	            cMessages=cMessages.concat(value);
	        }
	    }
    //填充数据到新的展示页
        //表名
	    $("#detailShowName").append("<h4 style=\"text-align: center;\">"+$("#name").val()+"</h4>");
        //表头
	    $("#showS").append("<a href=\"#\" class=\"list-group-item active\"><h4 class=\"list-group-item-heading\">供方</h4></a>");
	    $("#showI").append("<a href=\"#\" class=\"list-group-item active\"><h4 class=\"list-group-item-heading\">输入</h4></a>");
	    $("#showP").append("<a href=\"#\" class=\"list-group-item active\"><h4 class=\"list-group-item-heading\">过程</h4></a>");
	    $("#showO").append("<a href=\"#\" class=\"list-group-item active\"><h4 class=\"list-group-item-heading\">输出</h4></a>");
	    $("#showC").append("<a href=\"#\" class=\"list-group-item active\"><h4 class=\"list-group-item-heading\">用户</h4></a>");
        //表内数据
	    for(i=0;i<sMessages.length;i++){
	    	
	    	$("#showS").append("<a  href=\"#\" class=\"list-group-item\"><p class=\"list-group-item-text\">"+sMessages[i]+"</p></a>");
	    	
	    	
		}
	    for(i=0;i<iMessages.length;i++){
	    	
	    	$("#showI").append("<a  href=\"#\" class=\"list-group-item\"><p class=\"list-group-item-text\">"+iMessages[i]+"</p></a>");
	    	
	    	
		}
	    for(i=0;i<pMessages.length;i++){
	    	
	    	$("#showP").append("<a  href=\"#\" class=\"list-group-item\"><p class=\"list-group-item-text\">"+pMessages[i]+"</p></a>");
	    	
	    	
		}
	    for(i=0;i<oMessages.length;i++){
	    	
	    	$("#showO").append("<a  href=\"#\" class=\"list-group-item\"><p class=\"list-group-item-text\">"+oMessages[i]+"</p></a>");
	    	
	    	
		}
	    for(i=0;i<cMessages.length;i++){
	    	
	    	$("#showC").append("<a  href=\"#\" class=\"list-group-item\"><p class=\"list-group-item-text\">"+cMessages[i]+"</p></a>");
	    	
	    	
		}
    var recordName=$("#name").val();
    drawSIPOC();
}
function addPngToWord(){
    domtoimage.toPng(document.getElementById('print'))
        .then(function (dataUrl) {
            //alert("dataUrl");
            $("#picture").attr("src",dataUrl);
            var editor = $("#WYeditor");
            editor.html("");
            var chapters=new Array();
            var title = "SIPOC App分析结果";
            chapters.push("<h2>1. " + title + "</h2></br>");
            var img1 = $("#picture");  //选择页面中的img元素
            chapters.push(img1);
            for(var i=0;i<chapters.length;i++){
                editor.append(chapters[i]);
            }
        })
        .catch(function (error) {
            console.error('oops, something went wrong!', error);
        });
}

//初始加载函数
$(function () {
    //alert("document ready!");
    $("#btnSaveToFile").unbind('click').on("click", saveToFile);
    $("#saveProject").unbind('click').on("click", saveProject);
    $("#btnSaveAsPicture").unbind('click').on("click", saveAsPicture);
    $("#btnAddS").unbind('click').on("click", addS);
    $("#btnAddI").unbind('click').on("click", addI);
    $("#btnAddP").unbind('click').on("click", addP);
    $("#btnAddO").unbind('click').on("click", addO);
    $("#btnAddC").unbind('click').on("click", addC);
    $("#btnDetailShow").unbind('click').on("click", detailShow);
    $("#wordEditBar").unbind('click').on("click", addPngToWord);
    var xlf = document.getElementById('xlf');
    if (!xlf.addEventListener)
        return;
    function handleFile(e) {
        //console.log("handleFile begin:");
        //延时调用的函数
        do_file(e.target.files);
        //console.log("handleFile end:");
    }
    xlf.addEventListener('change', handleFile, false);
    //detailShow();
});


