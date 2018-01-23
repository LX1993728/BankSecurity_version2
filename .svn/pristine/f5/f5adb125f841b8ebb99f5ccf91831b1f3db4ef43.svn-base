<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>证讯类型</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/css_reset.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/securities_type.css">
</head>

<body style="background-color: white;">
    <div class="page security bind approval">
        <!-- 内容部分 -->
        <div class="body clearfix">
            <!-- 详细信息列表 -->
            <div class="securities_type_title">
                <div class="securities_type_titleName">
                    类型添加
                </div>
                <form action="/bank/addType">
                <input type="text" name="name" class="securities_type_add" placeholder="请输入类型名称">
                <button type="submit" class="btnType_add" id="btnTypeAdd">添加</button>
                <button type="reset" class="btnType_cancel" id="btnTypeCancel">取消</button>
                </form>
            </div>
            <div class="securities_typeCut"></div>
            <div class="securities_typeTable">
            		
                <table class="securities_type_table" border="1">
                    <tr>
                        <th>类型管理</th>
                        <th colspan="2">操作</th>
                    </tr>
                    <c:forEach items="${types}" var="t">
	                    <tr>
	                        <td>${t.name }</td>
	                        <td><s class="typeIcon1" typeId=${t.id } typeName=${t.name }></s></td>
	                        <td><s class="typeIcon2" typeId=${t.id }></s></td>
	                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <!-- 类型提示信息框 -->
        <div class="securities_typeRevise" style="display: none;">
            <div class="securities_typeRevise_title">类型修改</div>
            <input type="text" class="securities_typeRevise_input">
            <button class="typeRevise_confirm">确定</button>
            <button class="typeRevise_cancel">取消</button>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/security.js"></script>
    <script type="text/javascript">
    			
    			// 修改证讯的名称
	        $(".typeIcon2").click(function() {
	            $("input.securities_typeRevise_input").val("");
	            var typeCon = $(this);
	            $(".securities_typeRevise").show("slow");
	            // 确定
	            $(".typeRevise_confirm").click(function() {
	            		// 获取类型的ID
	            		var typeId = typeCon.attr('typeId');
	                var typeText = $("input.securities_typeRevise_input").val();
					if(!typeText || typeText.trim().length == 0){
						alert('请输入有效的名称');
						return;
					}
					$(location).attr('href', '/bank/changeTypeName?name='+typeText+'&id='+typeId);
	            })
	            // 取消
	            $(".typeRevise_cancel").click(function() {
	                $(".securities_typeRevise").hide("slow");
	            })
	        })
	        
	     $(".typeIcon1").click(function() {
	    		 var typeName = $(this).attr('typeName');
	    		 var typeId = $(this).attr('typeId');
	    		 if(confirm("您确定要删除证讯类型 "+typeName+" 吗?")){
	    			 $(location).attr('href', '/bank/delType?id='+typeId);
	    		 }
        })
    </script>
</body>

</html>