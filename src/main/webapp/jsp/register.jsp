<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>Hello World</title>
	</head>
	<body>
    <div>账号注册页面</div>
		<s:form action="doRegister" method="post">
			<s:textfield name="username" />
			<s:textfield name="password" />
			<s:submit />
		</s:form>
    </body>
</html>
