<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
    <title><decorator:title/></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="description" content="overview &amp; stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!--前台css和js-->
    <link rel="stylesheet" href="/webresources/ace-master/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/webresources/ace-master/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="/webresources/ace-master/assets/font-awesome/4.5.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/webresources/ace-master/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="/webresources/ace-master/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="/webresources/ace-master/assets/css/fonts.googleapis.com.css"/>
    <link rel="stylesheet" href="css/Extra.css"/>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/ace-extra.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/ace.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/jquery.dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/jquery-ui.custom.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/jquery.ui.touch-punch.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/ace-elements.min.js"></script>
    <script type="text/javascript" src="/webresources/ace-master/assets/js/jquery.mobile.custom.min.js"></script>
    <script type="text/javascript" src="/webresources/common/js/userLogin.js"></script>
    <!--获取服务器页面样式-->
    <link rel="import" id="frame" href="/webresources/common/html/appFrame.html">
    <link rel="import" id="local" href="html/localHtml.html">
    <decorator:head/>
</head>
<body class="no-skin">
<!--嵌入导航栏-->
<div id="navbarDiv" class="navbar navbar-default"></div>
<div class="main-container ace-save-state" id="main-container">
    <!--嵌入侧边栏-->
    <div id="sidebarDiv" class="sidebar responsive ace-save-state"></div>
    <div class="main-content">
        <!--嵌入面包屑-->
        <div class="breadcrumbs ace-save-state" id="breadcrumbs"></div>
        <!--侧边栏对应内容-->
        <div class="tab-content">
            <!--项目管理-->
            <div class="tab-pane active" id="projectManagementDiv"></div>
            <!--主功能区-->
            <div class="tab-pane" id="mainFunctionDiv">
                <decorator:body/>
            </div>
            <!--word编辑区-->
            <div class="tab-pane" id="wordEditDiv"></div>
            <!--帮助页面-->
            <div class="tab-pane" id="helpDiv"></div>
        </div>
    </div>
    <!--footer-->
    <div class="footer" id="copyRightDiv"></div>
</div>
<!--模态框-->
<div id="modalFrameDiv"></div>
<script type="text/javascript" src="./js/buttonAction.js"></script>
<script type="text/javascript" src="./js/resultReport.js"></script>
</body>
</html>

