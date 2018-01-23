<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="Utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<br>
<h4>测试多文件上传</h4>
<br>
<form action="${pageContext.request.contextPath }/image/multiUpload"
      method="POST" enctype="multipart/form-data">
    <input type="file" name="f"><br>
    <input type="file" name="f"><br>
    <input type="file" name="f"><br>
    <input type="submit" value="提交">
</form>
<br>
<hr>
<h4>测试单文件上传</h4>
<br>
<form action="${pageContext.request.contextPath }/image/singleUpload"
      method="POST" enctype="multipart/form-data">
    <input type="file" name="f"><br>
    <input type="submit" value="提交">
</form>
</body>
</html>