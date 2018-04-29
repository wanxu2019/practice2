<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>SIPOC帮助文档</title>
        <script src="../static/dependencies/excel/cpexcel.js"></script>
        <script src="../static/dependencies/excel/shim.js"></script>
        <script src="../static/dependencies/excel/jszip.js"></script>
        <script src="../static/dependencies/excel/xlsx.js"></script>
        <!-- FileSaver.js is the library of choice for Chrome -->
        <script type="text/javascript" src="../static/dependencies/excel/Blob.js"></script>
        <script type="text/javascript" src="../static/dependencies/excel/FileSaver.js"></script>
        <script type="text/javascript" src="../static/dependencies/dom-to-image.js"></script>

        <script src="../static/js/detail.js"></script>
        
		<s:head />
        <style>
            .file {
                position: relative;
                display: inline-block;
                overflow: hidden;
                text-decoration: none;
                text-indent: 0;
                line-height: 20px;
            }
            .file input {
                position: absolute;
                font-size: 100px;
                right: 0;
                top: 0;
                opacity: 0;//不透明度
            }
            .file:hover {
                text-decoration: none;
            }

            table input{
                width:120px;
            }
            
            
            div {
    margin-left: auto;
    margin-right: auto;
	
}	
			.main-content{
			margin:0;
			}
        </style>
	</head>
	<body>
	
	
	
<div class="tabble">
	<ul class="nav nav-tabs" id="myTab">
		<li class=""><a href="../index.jsp">SIPOC管理</a></li>
	
		<li class=""><a id="checkDetail" >使用与查询</a></li>
		
		<li class="active"><a  href="#">使用帮助</a></li>
	
		
	</ul>
	<div class="tab-content">		
<%--***************************************************************************************************************************** --%>	
	
	<div>
	
	
	<h1>帮助文档</h1>
	<big>
	<p>
	1.本Web-App为在线SIPOC图表快速生成工具，推荐在PC端使用；
	</p>
	<p>
	2.推荐使用模板完成SIPOC图表创建，根据提示修改模板内容，导入本Web-App,通过保存图片按钮即可生成导出为图片，获取模板请点击<a href="../template/sipoc_template.xls">模板</a>；
	</p>
	<p>
	3.所有SIPOC图表可以通过保存文件按钮，保存为Excel文件；
	</p>
	<p>
	4.如本地无Excel软件，可在页面直接填写SIPOC表格内容，生成SIPOC图片。
	</p>
	
	</big>
	</div>
	 <div class="">
		 <a class="btn btn-info file " href="../index.jsp">返回首页</a>
	
	</div>
<%--***************************************************************************************************************************** --%>	
  </div>
 
   </div>  
	
    </body>
</html>
