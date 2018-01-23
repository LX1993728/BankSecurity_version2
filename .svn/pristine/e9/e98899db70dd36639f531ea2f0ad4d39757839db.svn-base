<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>证讯管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/css_reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bankSecurity.css">
</head>
<body>
	<div class="page bank">
		<!-- 头部标题 -->
		<div class="header clearfix">
			<div class="title fl clearfix">
				<i class="icon_logo fl"></i>
				<h1 class="fl">证讯业务开发互联平台</h1>
			</div>
			<div class="userName fl">
				<a href="jacascript:;" class="clearfix">
					<i class='icon_user fl'></i>
					<span class="fl">${sessionScope.loginUser.name }</span>
				</a>
			</div>
			<div class="logOut fr"><a  href="/logout">退出</a></div>
		</div>
		<!-- 内容部分 -->
		<div class="body clearfix">
			<!-- 导航条 -->
			<div class="nav fl">
				<div class="nav-box">
					<ul id="nav-box">
						<li class="active">
							<i class="icon_manage"></i>
							<a href="javascript:void(0);" onclick="toMain('/security/manage_zx')">证讯管理</a>
						</li>
						<li>
							<i class="icon_add"></i>
							<a href="javascript:void(0);" onclick="toMain('/security/manage_add')">证讯添加</a>
						</li>
						<li></li>
					</ul>
				</div>
			</div>
			<div class="content fl clearfix">
				<iframe src="/security/manage_zx" frameborder="0" id="mainF"></iframe>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bank_security.js"></script>
	<script type="text/javascript">
	  function toMain(link){
		  $("#mainF").attr('src',link);
	  };
	</script>
</body>
</html>