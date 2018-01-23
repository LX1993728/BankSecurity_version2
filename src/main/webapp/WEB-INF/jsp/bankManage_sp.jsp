<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>证讯审批</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/css_reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bank_security.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/security.css">
</head>

<body style="background-color: white;">
    <div class="page security bind approval examine">
        <!-- 内容部分 -->
        <div class="body clearfix">
            <!-- 详细信息列表 -->
            <!-- 审批 -->
            <div class="approvalContent fl">
                <div class="list">
                    <table >
                        <thead>
                            <tr>
                                <td>券商列表</td>
                                <td>证讯类型</td>
                                <td>查看</td>
                                <td>状态</td>
                                <td>设置</td>
                            </tr>
                        </thead>
                        <tbody id="approvalContentList">
                        		<c:forEach items="${companies }" var="company" varStatus="status">
	                            <tr>
	                                <td class="${status.index == 0 ? 'active':''}">
	                                    <span companyId=${company.id }>${company.name }</span>
	                                </td>
	                                <td>
	                                    <span class="type"></span>
	                                </td>
	                                <td>
	                                    <a href="javacsript:;">
	                                        <i class="icon_look"></i>
	                                    </a>
	                                </td>
	                                <td></td>
	                                <td>
	                                    <div>
	                                        <a href="javascript:;"   class="security_pass">通过</a>
	                                        <a href="javascript:;"   class="security_failed">不通过</a>
	                                    </div>
	                                </td>
	                            </tr>
                        		</c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- 审批弹窗 -->
                <div class="windowPage addShowInfo" id="windowPage" style="display: none;">
                    <div class="header clearfix">
                        <i class="icon_close"></i>
                    </div>
                    <div class="windowPageBg">
                        <iframe id="linkFrame" src="Http://www.baidu.com" width="100%" height="100%">
                        </iframe>
                    </div>
                </div>
            </div>
            <!-- 通过/不通过提示信息框 -->
            <div class="bank_delete">
                <div class="bank_delete_title">
                    提示信息
                </div>
                <div class="bank_delete_text">
                    <p class="bank_textP1">是否通过本条券商信息?</p>
                    <p class="bank_textP2">通过点击确定，或者点击取消</p>
                </div>
                <div class="bank_delete_btn security_btnConfirm">确认</div>
                <div class="bank_delete_btn security_btnCancel">取消</div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/security.js"></script>
    <script type="text/javascript">
    $("#approvalContentList>tr>td:first-child").click(function() {
    		if($(this).find('span').size()==0){
    			return;
    		}
        $("#approvalContentList>tr>td").removeClass('active');
        $(this).addClass('active');
        getLink($(this));
    });
    
    function getLink(domTd){
    		// 获取选中公司的ID
    		var companyId = domTd.find('span').attr('companyId');
        $.ajax({
            type: "GET",
            url: "/securityAjax/query_link?id="+companyId,
            success: function(data){
            		// 获取公司的行数
            		var companySize = $("#approvalContentList>tr>td:first-child").find('span').size();
            		// 获取证讯的行数
            		var linkSize = data.length;
            		// 首先移除空的第一列为空的tr
            		$("#approvalContentList>tr>td:first-child:not(:has(span))").parent().remove(); 
            		// 得到真实需要的表格行数
            		var needSize = Math.max(companySize,linkSize);
            		// 得到需要添加的行数
            		var addSize = needSize - companySize;
            		// 添加td
            		var str ="<tr>";
            		str+='<td></td>';
            		str+='<td>';
            		str+='<span class="type"></span>';
            		str+='</td>';
            		str+='<td>';
            		str+='<a onClick="look(url)">';
            		str+='<li class="icon_look"></li>';
            		str+='</a>';
            		str+='</td>';
            		str+='<td></td>';
            		str+='<td>';
            		str+='<div>';
            		str+='<a href="javascript:;" onClick="isPass(true,1)" class="security_pass">通过</a>';
            		str+='<a href="javascript:;" onClick="isPass(false,1)" class="security_failed">不通过</a>';
            		str+='</div>'; 
            		str+='</td>'; 
            		str+='</tr>'; 
            		for(i=0;i<addSize;i++){
	                $("#approvalContentList").append(str);
            		}
            		
            		// 获取后边所有列进行内容重置 赋值
            		$(".approvalContent").find('tbody>tr>td:nth-child(2)').each(function (index, secondTd) {
            			if(index >= data.length){
            				return;
            			}
            			var link = data[index];
            			$(secondTd).empty();
            			$(secondTd).append('<span>'+link.linkType.name+'</span>');
            			var lookTd = $(secondTd).nextAll()[0];
            			var statusTd = $(secondTd).nextAll()[1];
            			var setId = $(secondTd).nextAll()[2];
            			$(lookTd).empty();
            			$(statusTd).empty();
            			$(setId).empty();
            			
            			var strLook = '';
            			strLook+='<a onClick="look(\''+link.url+'\')">';
            			strLook+='<li class="icon_look"></li>';
            			strLook+='</a>';
            			$(lookTd).append(strLook);
            			
            			var strStatus = link.status=='ENABLE'?'通过':'不通过';
            			$(statusTd).css('color',link.status=='ENABLE'?'rgb(86, 159, 241)':'red');
            			$(statusTd).append(strStatus);
            			
            			var strSet = '<div>';
            			if( link.status=='ENABLE'){
            				strSet+='<a href="javascript:;" onClick="isPass(false,'+link.id+')" class="security_failed">不通过</a>';
            			}else{
            				strSet+='<a href="javascript:;" onClick="isPass(true,'+link.id+')" class="security_pass">通过</a>';
            			}
            			strSet+='</div>';
            			$(setId).append(strSet);
            			
                 });
            		
            },
            error:function(data){
            	 alert(data.responseText);
            }
         });
    }
    function look(url){
    	//  alert("======="+url);
     	$("#linkFrame").attr('src',url);
        $("#windowPage").show('slow');
    }
    	function isPass(isPass,id){
    		// alert("+++++++++++++"+isPass+"===="+id);
    		$(".bank_delete").show("slow");
        $(".bank_textP1").text("是否"+(isPass?"":"不")+"通过本条券商信息?");
        $(".bank_textP2").text((isPass?"":"不")+"通过点击确定，或者点击取消?");
        // 取消
        $(".security_btnCancel").click(function() {
            $(".bank_delete").hide("slow");
        })
        // 确定
        $(".security_btnConfirm").click(function() {
        		// 通过/不通过  发送数据修改状态
        		 $.ajax({
	            type: "GET",
	            url: "/securityAjax/disable_link?id="+id+"&isEnable="+isPass,
	            success: function(data){
	            		//刷新数据
	            		getLink($(".active"));
	            	},
	            	error:function(data){
               	 alert(data.responseText);
               }
            });
            $(".bank_delete").hide("slow");
        })
    	}
    	
    	
    	$(function(){
    		var firstTdIndexOne = $("#approvalContentList>tr>td:first-child")[0];
	   getLink($(".active"));
    	})
    </script>
</body>

</html>