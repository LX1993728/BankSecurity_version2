<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/css_reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/logoin.css">
<title>登录页面</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/login" method="post"
		id="loginForm">
		<div class="page logoin clearfix">
			<div class="title fl">证券业务开发互联平台</div>
			<div class="content fl">
				<div class="logoinBox">
					<div class="header">
					证券业务开发互联平台
					</div>
					
					<div class="body">
						<div class="userName clearfix">
							<span><i class="icon_user"></i></span> <input type="text"
								name="account" placeholder="请输入登录账号">
						</div>
						<div class="password clearfix">
							<span><i class="icon_password"></i></span> <input type="password"
								name="password" placeholder="请输入您的密码">
						</div>
					</div>
					<div class="footer">
						<div class="userChecked clearfix">
							<span></span> <span>下次自动登录</span> <span>忘记密码</span>
						</div>
						<span style="color: red;font-size:14px;margin-left: 30px">${errorMsg }</span><br>
						<div class="logoinBtn">
							<a href="javascript:void(0);" onclick="loginSubmit()">登录</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script
		src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".footer").children('.userChecked').children('span:first-child')
					.click(function() {
						$(this).toggleClass('active');
					});
		})
		function loginSubmit() {
			document.getElementById("loginForm").submit()
		};
	</script>
</body>
</html>