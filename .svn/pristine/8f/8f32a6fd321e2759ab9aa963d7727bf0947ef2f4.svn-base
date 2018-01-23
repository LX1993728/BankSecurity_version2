<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>证讯管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/css_reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/addContent.css">
</head>
<body>
	<div class="page bank">
		<!-- 内容部分 -->
		<div class="body">
			<div class="content clearfix">
				<!-- 添加 -->
				<div class="addContent fl">
					<div class="title">证讯添加</div>
					<div class="content">
						<div class="header">
							<form id="addLinkForm">
								<input type="text" name="url"  style="width: 30%" id="link" placeholder="请输入证讯链接,http:// 或https://开头">
								<input type="text" name="description"  style="width: 30%" value="" id="desc" placeholder="请输入证讯描述">
								<a href="javascript:void(0);"  onclick="read()">查看</a>
								<a href="javascript:;" onclick="saveLink()" id="addContent-save">保存</a>
								<a href="javascript:;">取消</a>
							</form>
						</div>
						<hr>
						<div class="body" style="padding: 0px;">
						<iframe src="" frameborder="0"  style="height: 100%;width: 100%;" id="frame"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/bank_security.js"></script>
	<script type="text/javascript">
		function read(){
			var link = $("#link").val();
			$("#frame").attr("src",link);			
		};
		
		// 
		function saveLink(){
			if(!validateLink()){
				alert("链接和描述不能为空");
				return;
			}
			// 提交表单
			 $.ajax({ 
				    url: "/securityAjax/addLink", 
				    type:"POST",
				    data:$('#addLinkForm').serialize(),
				    success: function(data){
				    		// 清空表单
				    		$('#addLinkForm')[0].reset();
				    		alert(JSON.stringify(data));
				     },
				     error:function(data){
				        	alert(data.responseText);
				 	}
				}); 
		};
		
		// 场景概述 表单校验
		var validateLink = function(){
			var formData = $('#addLinkForm').serializeArray();
			for(i=0;i<formData.length;i++){
				// console.log(formData[i].name+" ===== "+formData[i].value);
				if(formData[i].value == null || formData[i].value.trim().length == 0){
					return false;
				}
			}
			return true;
		};
	</script>
</body>
</html>