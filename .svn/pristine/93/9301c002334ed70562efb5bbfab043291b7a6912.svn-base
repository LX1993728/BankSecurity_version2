<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>证讯管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/css_reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bank_security.css">
</head>

<body>
    <div class="page bank">
        <!-- 内容部分 -->
        <div class="body clearfix">
            <div class="content content1 fl clearfix">
                <!-- 添加 -->
                <div class="addContent fl">
                    <div class="title">证讯添加</div>
                    <div class="content">
                        <div class="header">
                        		<form action="/security/addLink" id="addLink" name="addLink" method="post">
	                            <select name="typeId" id="addType" class="bank_select" style="width: 12%">
	                                <option value="-1">=类型=</option>
	                            		<c:forEach items="${types }" var="t">
		                                <option value="${t.id }">${t.name }</option>
	                            		</c:forEach>
	                            </select>
	                            <input type="text" name="url" id="linkUrl" placeholder="请输入证讯链接，必须以Http://或Https://开头">
	                            <a href="javascript:;" id="addContent-save" onclick="look()">查看</a>
	                            <a href="javascript:void(0);" onclick="addLinkF()">保存</a>
	                            <a href="javascript:document.addLink.reset();" >取消</a>
                        		</form>
                        </div>
                    </div>
                </div>
                <!-- 管理 -->
                <div class="manageContent fl">
                    <div class="header">
                        <span>证讯类型</span>
                        <span>我的证讯</span>
                        <span>操作</span>
                        <span>状态</span>
                        <span>查看</span>
                    </div>
                    <div class="body">
                        <ul id="infoLook">
                        		<c:forEach items="${links }" var="link">
	                            <li>
	                                <span>${link.linkType.name }</span>
	                                <span>${link.url }</span>
	                                <span class="${link.status eq 'DISABLE'?'notpass':''}">
	                                    <i class="icon_delete" linkId=${link.id }></i>
	                                </span>
	                                <span class="${link.status eq 'ENABLE'?'pass':'notpass'}">${link.status eq 'ENABLE'?'':'未'}通过</span>
	                                <span>
	                                    <i class="icon_look" linkUrl=${ link.url }></i>
	                                </span>
	                            </li>
                        		</c:forEach>
                        </ul>
                    </div>
                    <div class="manageContentPage" style="display:none">
                        <div class="title clearfix">
                            <i class="icon_close fr"></i>
                        </div>
                        <div class="view">
                        		<iframe id="linkFrame" src="" style="" width="100%" height="100%">
        						</iframe>
                        </div>
                    </div>
                </div>
                <!-- 删除提示信息框 -->
                <div class="bank_delete">
                    <div class="bank_delete_title">
                        提示信息
                    </div>
                    <div class="bank_delete_text">
                        <p class="bank_textP1">是否删除本条证讯信息?</p>
                        <p class="bank_textP2">删除点击确定，或者点击取消</p>
                    </div>
                    <div class="bank_delete_btn bank_btnConfirm">确认</div>
                    <div class="bank_delete_btn bank_btnCancel">取消</div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bank_security.js"></script>
    <script type="text/javascript">
	$("#infoLook>li").find('.icon_look').click(function(){
		var url = $(this).attr("linkUrl");
		$("#linkFrame").attr('src',url);
		$(".manageContentPage").show("slow");
	});
    
	function look(){
		var url = $("#linkUrl").val();
		if(!url || url.trim().length == 0){
			alert("请输入链接");
		}else{
			$("#linkFrame").attr('src',url);
			$(".manageContentPage").show("slow");
		}
	}
	
	function addLinkF(){
		// 进行校验
		 var formData =$("#addLink").serializeArray();
		for(i=0;i<formData.length;i++){
			var fieldName = formData[i].name; 
			var fieldValue = formData[i].value; 
			if(fieldName=='typeId' && fieldValue==-1){
				alert('请选择证讯类型');
				return;
			}
			if(fieldName=='url' && (!fieldValue || fieldValue.trim().length == 0)){
				alert('请输入链接');
				return;
			}
		} 
		// 提交表单
		$("#addLink").submit();
	}
	
	
	// 点击删除按钮图标 事件
	$(".icon_delete").click(function(){
		var linkId = $(this).attr("linkId");
		$(".bank_delete").show();
		 // 删除提示框中的取消按钮的事件
		$(".bank_btnCancel").click(function(){
			$(".bank_delete").hide();
		});
		$(".bank_btnConfirm").click(function(){
			$(location).attr('href', '/security/manage_del?id='+linkId);
		});
	})
    </script>
</body>

</html>