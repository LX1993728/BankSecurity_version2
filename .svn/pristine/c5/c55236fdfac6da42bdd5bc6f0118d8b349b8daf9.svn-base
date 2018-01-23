<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>证讯管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/css_reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/manageContent.css">
</head>
<body>
	<div class="page bank">
		<!-- 内容部分 -->
		<div class="body">
			<div class="content clearfix">
				<!-- 管理 -->
				<div class="manageContent fl">
					<div class="header">
						<span>我的证讯</span>
						<span>操作</span>
						<span>状态</span>
						<span>查看</span>
					</div>
					<div class="body">
						<ul id="infoLook">
							<c:forEach items="${lks }" var="link">
								<li>
									<span>${link.url }</span>
									<span class="${link.status eq 'ENABLE' ? '':'notpass' }">
										<a href="javascript:void(0);" onclick="delLink('${link.id}')"><i class="icon_delete"></i></a>
									</span>
									<c:choose>
										<c:when test="${link.status eq 'ENABLE' }">
											<span class="pass">通过</span>
										</c:when>
										<c:otherwise>
											<span class="notpass">未通过</span>
										</c:otherwise>
									</c:choose>
									<span>
										<i class="icon_look" onclick="look('${link.url}')"></i>
									</span>
								</li>
							
							</c:forEach>
						</ul>
						<div class="deleteTips" style="display:none">
							<div class="title">提示信息</div>
							<div class="content">
								<h4>是否删除本条证讯信息？</h4>
								<input type="hidden" id="url">
								<div class="deleteTips-btn clearfix">
									<span onclick="confirmDel()">确认</span>
									<span>取消</span>
								</div>
							</div>
						</div>
					</div>
					<div class="manageContentPage" style="display:none">
						<div class="title clearfix">
							<i class="icon_close fr"></i>
						</div>
						<div class="view">
							<iframe src="" id="ck" frameborder="0"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bank_security.js"></script>
	<script type="text/javascript">
	 function  look(l){
		$("#ck").attr("src",l);
		$(".manageContentPage").show("slow");
	}
	 
	 function delLink(id){
		
		$("#url").val(id);
		$(".deleteTips").show();
	 }
	function confirmDel(){
		id = $("#url").val();
		$(location).attr('href', '/security/manage_del?id='+id);
		$(".deleteTips").hide();
	}
	</script>
</body>
</html>