<%@page import="org.hibernate.validator.constraints.SafeHtml.Tag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
	<title>券商管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/css_reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bank_security.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/security.css">
</head>
<body>
<div class="page security bind approval">
		<!-- 内容部分 -->
		<div class="body clearfix">
			<!-- 详细信息列表 -->
			<!-- 管理 -->
			<div class="securityContent fl">
				<div class="title">
					<form action="/bank/manage_query" name="formQuery">
						<div class="name fl clearfix">
							<span>名称</span>
							<input type="text" name="name" value="${cName }">
						</div>
						<div class="search fl">
							<a href="javascript:document.formQuery.submit();">查询</a>
						</div>
					</form>
				</div>
				<div class="conter">
					<div class="title">
						<h3>券商信息</h3>
					</div>
					<div class="list">
						<table>
							<tbody>
							<c:forEach items="${page.items }" var="company">
								<tr>
									<td class="brokerLogo">
										<img src="${pageContext.request.contextPath}/imgs/${company.logo}" height="45" width="49" alt="">
									</td>
									<td>
										<span>${company.name }</span>
									</td>
									<td>
										<span class="grounding">${company.status eq 'UP' ? '上架':'下架'  }</span>
									</td>
									<td>
										<c:choose>
										  <c:when test="${company.status eq 'UP' }">
											<a href="/bank/disOrEnable?id=${company.id}&isEnable=false&p=${page.pageNo}" onclick="return isConfirm(true,this.href)" class="undercarriage">下架</a>
										  </c:when>
										  <c:otherwise>
											<a href="/bank/disOrEnable?id=${company.id}&isEnable=true&p=${page.pageNo}" onclick="return isConfirm(false,this.href)" class="grounding">上架</a>
										  </c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 上架/下架提示信息框 -->
        <div class="bank_delete" >
            <div class="bank_delete_title">
                提示信息
            </div>
            <div class="bank_delete_text">
                <p class="bank_textP1">是否下架本条券商信息?</p>
                <p class="bank_textP2">下架点击确定，或者点击取消</p>
            </div>
            <div class="bank_delete_btn bank_btnConfirm">确认</div>
            <div class="bank_delete_btn bank_btnCancel">取消</div>
        </div>
        
	<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/security.js"></script>
	<script type="text/javascript">
		 function isConfirm (isDown,href){
			$(".bank_textP1").text("是否"+(isDown?"下":"上")+"架本条券商信息?");
            $(".bank_textP2").text((isDown?"下":"上")+"架点击确定，或者点击取消?");
            $(".bank_delete").show();
            // 取消
            $(".bank_btnCancel").click(function() {
                $(".bank_delete").hide();
            })
            // 确定
            $(".bank_btnConfirm").click(function() {
                $(".bank_delete").hide();
                $(location).attr('href', href);
            }) 
            return false; 
		}
	</script>
</body>
</html>