<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<%
    String basePath = "http://innovation.xjtu.edu.cn:80/StaticFiles/web-resources/frames/mes/1.0-SNAPSHOT/";
    String appPath = "http://innovation.xjtu.edu.cn:80/InnovationToolsPlatform/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><decorator:title/></title>
    <link href="<%=basePath%>assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=basePath%>assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />
    <link rel="stylesheet" href="<%=basePath%>assets/css/ace.min.css" />
    <link rel="stylesheet" href="<%=basePath%>assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="<%=basePath%>assets/css/ace-skins.min.css" />
    <script src="<%=basePath%>assets/js/jquery.min.js"></script>
    <script src="<%=basePath%>assets/js/ace-extra.min.js"></script>
    <decorator:head/>
</head>
<body>
    <jsp:include page="/decorators/banner.jsp"></jsp:include>
	<decorator:body/>
    <jsp:include page="/decorators/copyright.jsp"></jsp:include>
</body>
</html>
