<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>证讯管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/css_reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/security.css">
</head>
<body>
	<div class="page security bind approval">
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
							<a href="javascript:void(0);"  onclick="toMain('/bank/manage_qs')">
								<i class="icon_manage"></i>
								<span>券商管理</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);"  onclick="toMain('/bank/manage_sp')">
								<i class="icon_approval"></i>
								<span>证讯审批</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);" onclick="toMain('/bank/manage_bd')">
								<i class="icon_bind"></i>
								<span>证讯绑定</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);" onclick="toMain('/bank/manage_type')">
								<i class="icon_bind"></i>
								<span>证讯类型</span>
							</a>
						</li>
						<li></li>
					</ul>
				</div>
			</div>
			<!-- 详细信息列表 -->
			<!-- 管理 -->
			<div class="securityContent fl">
				<iframe src="/bank/manage_qs" id="mainF" scrolling="no" frameborder="0" width="100%" height="100%" name="mainFrame"></iframe>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/security.js"></script>
	<script type="text/javascript">
		// 为菜单项添加点击选中事件
		$("#nav-box").children('li').click(function(){
			$(this).siblings('li').removeClass('active');
			$(this).addClass('active');
		});
	  function toMain(link){
		  $("#mainF").attr('src',link);
	  };
	</script>
</body>
</html>