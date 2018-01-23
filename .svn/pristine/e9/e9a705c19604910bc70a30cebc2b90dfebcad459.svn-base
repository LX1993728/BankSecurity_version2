<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>证讯绑定</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/css_reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/security.css">
</head>

<body>
    <div class="page security bind approval">
        <!-- 内容部分 -->
        <div class="body clearfix">
            <!-- 绑定 -->
            <div class="bindContent fl clearfix">
            		<c:forEach items="${markets }" var="m" >
	                <div class="content-box fl">
	                    <div class="title clearfix">
	                        <h3>${m.linkType.name }</h3>
	                        <a href="javascript:;" onclick="chooseLink(${m.linkType.id},${ m.link eq null?-1:m.link.id},${m.id })">
	                            <i class="icon_setting"></i>
	                        </a>
	                    </div>
	                    <div class="list">
	                    		<c:if test="${m.link ne null }">
	                    			<iframe  src="${m.link.url }" width="100%" height="100%" style="border: 0px">
            					    </iframe>
	                    		</c:if>
	                    </div>
	                </div>
            		</c:forEach>
        
                <!-- 绑定弹窗 -->
                <div class="listPage">
                    <div class="title clearfix">
                        <h3>证讯列表</h3>
                        <i class="icon_close" id="icon_close"></i>
                    </div>
                    <div class="content clear clearfix" >
                        <div class="borderBot clearfix">
                            <div class="nav fl">
                                <ul id="bindExchangeList" >
                                    <li>东北证券</li>
                                </ul>
                            </div>
                            <div class="list fl">
                            		<input type="hidden" id="choosedId" value=""/>
                            		<input type="hidden" id="marketId" value=""/>
                                <ul id="allZx">
                                    <li class="clearfix">
                                        <div class="listInfo fl listInfoName">
                                            https//www.baidu.com
                                        </div>
                                        <div class="listIcon fl">
                                            <a href="javascript:;" onclick="look('http://www.baidu.com')"><i class="icon_look"></i></a>
                                        </div>
                                        <div class="listIcon fl">
                                            <div class="annulus active">
                                                <span></span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="w224">
                            <span class="curr fl" id="bindCurr">保存</span>
                            <span class="fr">取消</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 审批弹窗 -->
        <div class="windowPage addShowInfo" id="securities_windowPage" style="display: none;">
            <div class="header clearfix">
                <i class="icon_close"></i>
            </div>
            <div class="windowPageBg">
             <iframe id="linkFrame" src="Http://www.baidu.com"  width="100%" height="100%">
             </iframe>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/security.js"></script>
    <script type="text/javascript">
	     function look(url){
	     	$("#linkFrame").attr('src',url);
	        $("#securities_windowPage").show('slow');
  		  }
	    
	     function chLink(aDom,linkId){
	       //	 alert(aDom+"======="+linkId);
	            $('.annulus').removeClass('active');
		    	    $(aDom).find('div').addClass('active'); 
		    	    $("#choosedId").val(linkId);
		 } 
	     
	    function chooseLink(typeId,chooseLinkId,marketId){
	    		// 清空隐藏表单的值
	    		$("#choosedId").val(-1);
             $(".listPage").show("slow");
		    	 $.ajax({
		            type: "GET",
		            url: "/bankAjax/linksOfType?id="+typeId,
		            success: function(data){
		            		//首先为隐藏表单赋值
		            		$("#marketId").val(marketId);
		            		resetDataToElement(data,chooseLinkId);
		            	},
		            	error:function(data){
		              	 alert(data.responseText);
		            }
	           });
	    }
	    
	    // 数据重置
	    function resetDataToElement(data,chooseLinkId){
	    		$("#bindExchangeList").empty();
	    		$("#allZx").empty();
	    		for(i=0;i<data.length;i++){
	    			var link = data[i];
	    			$("#bindExchangeList").append("<li style='font-size: 15px;'>"+link.companyName+"</li>");
	    			
	    			var str = '<li class="clearfix">';
	    			str+='<div class="listInfo fl listInfoName">';
	    			str+=link.url;
	    			str+='</div>';
	    			str+='<div class="listIcon fl">';
	    			str+='<a href="javascript:;" onclick="look(\''+link.url+'\')"><i class="icon_look"></i></a>';
	    			str+='</div>';
	    			str+='<div class="listIcon fl">';
	    			str+='<a href="javascript:;" onclick="chLink(this,'+link.id+')">';
	    			if(link.id == chooseLinkId){
	    				str+='<div class="annulus active">';
	    			}else{
		    			str+='<div class="annulus">';
	    			}
	    			str+='<span></span>';
	    			str+='</div>';
	    			str+='</a>';
	    			
	    			str+='</div>';
	    			str+='</li>';
	    			$("#allZx").append(str);
	    			
	    		}
	    }
	     
	    $("#bindCurr").click(function() {
	      var linkId = $("#choosedId").val();
	      var marketId = $("#marketId").val();
	      if(linkId == -1){
	    	  	alert("请选择证讯");
	    	  	return;
	      }
	    		// 修改
    		 $.ajax({
	            type: "POST",
	            url: "/bankAjax/chooseLink?linkId="+linkId+"&marketId="+marketId,
	            success: function(data){
	            	$(location).attr('href', '/bank/manage_bd');
	            	},
	            	error:function(data){
	              	 alert(data.responseText);
	            }
           });
        })
    </script>
</body>

</html>