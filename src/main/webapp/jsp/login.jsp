<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>Hello World</title>
	</head>
	<body>
		<s:form action="doLogin" method="post">
			<s:textfield name="username" />
			<s:textfield name="password" />
			<s:submit />
		</s:form>
		这样可不可以
	</body>
</html>
