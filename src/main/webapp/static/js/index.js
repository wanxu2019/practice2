/**
 * Created by Administrator on 2017/7/21.
 */
/**
 * 点击编辑显示弹出框
 */
//显示添加记录对话框
function add(){
	if($("#check").val()=="anon"){
		alert("请先登录");
		
	}
	
	else{
    $("#myModal").modal();
	}
}
function addRecord(){
    $.post("api/addRecord",$("#addRecordForm").serialize(),function(data){
        alert(data);
        //刷新当前页
        window.location=window.location;
    });
}
function modifyRecord(id){
    window.location=window.location.origin+"/SIPOC/detail/index?id="+id;
}
function deleteRecord(id){
	if($("#check").val()=="anon"){
		alert("本条信息无法删除");
		
	}
	
	else{
    if (confirm("真的要删除这条记录吗？删除后将无法恢复！"))
        $.post("api/deleteRecord",{recordId:id},function(data){
            alert(data);
            //刷新当前页
            window.location=window.location;
        });
	}
}
function checkDetail(){
	
	if($("#check").val()!="anon"){
		alert("请先新建一个项目，通过以下表格进入经行编辑与修改");
		
	}
	
	else{
	window.location=window.location.origin+"/SIPOC/detail/index?id=2";
	}
}
$(function () {
    //alert("document ready!");
    $("#checkDetail").unbind('click').on("click", checkDetail);
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
});



	   
	
