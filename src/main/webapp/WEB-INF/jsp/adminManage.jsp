<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 安荣超级管理员===${sessionScope.loginUser.name }</h1>
	<frameset cols="159,*" frameborder="0" border="0" framespacing="0">
		<frame src="${pageContext.request.contextPath}/admin/toLeft" name="leftFrame" noresize scrolling="YES">
		<frame src="${pageContext.request.contextPath}/toWelcome" name="mainFrame">
  	</frameset>
</body>
</html>