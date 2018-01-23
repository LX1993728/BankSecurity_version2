$(function() {
    /* commen */
    // commen();
    // function commen (){
    //  $("#nav-box").children('li').click(function(){
    //      $(this).siblings('li').removeClass('active');
    //      $(this).addClass('active');
    //      if($(this).index()==0){//管理
    //          $(".securityContent").show();
    //          $(".bindContent").hide();
    //          $(".approvalContent").hide()
    //      }else if($(this).index()==1){//审批
    //          $(".securityContent").hide();
    //          $(".bindContent").hide();
    //          $(".approvalContent").show()
    //      }else if($(this).index()==2){//绑定
    //          $(".securityContent").hide();
    //          $(".bindContent").show();
    //          $(".approvalContent").hide()
    //      }
    //  });
    // }

    /* 管理 */
    // security()
    // function security (){

    // }
    /* 绑定 */
    bind();

    function bind() {
        $("#icon_close").click(function() {
            $(".listPage").hide("slow");
        })

//        $(".icon_setting").click(function() {
//            var iconS = $(this).parent().prev().text();
//            $(".listPage").show("slow");
//            $(".listInfoName").html(iconS);
//        })

        // $("#bindExchangeList").children('li').click(function() {
        //     $(this).siblings('li').removeClass('active');
        //     $(this).addClass('active');
        // });

//        $(".listIcon").children('.annulus').click(function() {
//            $(".listIcon").children('.annulus').removeClass('active');
//            $(this).addClass('active');
//        })

//        $(".listPage .icon_look").click(function() {
//            $("#securities_windowPage").show("slow");
//        })

        $("#securities_windowPage .icon_close").click(function() {
            $("#securities_windowPage").hide("slow");
        })
    }


    /* 审批 */
    approval();

    function approval() {
//        $(".approvalContent").find('tbody>tr>td:nth-child(3)').click(function() {
//            $("#windowPage").show('slow');
//        })
        $("#windowPage").children('.header').children(".icon_close").click(function() {
            $("#windowPage").hide('slow');
        });

//        $("#approvalContentList>tr>td:first-child").click(function() {
//            $("#approvalContentList>tr>td").removeClass('active');
//            $(this).addClass('active');
//        });
    }




    /*证讯审批页面，点击券商列表，右侧内容刷新*/
    approList();

    function approList() {
        $("#approvalContentList").find('tr>td:nth-child(1)').click(function() {
            $("#approvalContentList").find('tr>td:nth-child(2)>span').hide().fadeIn(200);
            // $("#approvalContentList").find('tr:nth-child(odd)>td:nth-child(2)>span').hide().empty().append("证讯1").fadeIn(200);
            // $("#approvalContentList").find('tr:nth-child(even)>td:nth-child(2)>span').hide().empty().append("证讯2").fadeIn(200);
        })
    }


    /*证讯绑定页面，点击证讯列表保存时，刷新整个页面*/
//    bindCurrs();
//
//    function bindCurrs() {
//        $("#bindCurr").click(function() {
//            location.reload();
//        })
//    }


    /*证讯审批页面，点击通过时，弹出提示框*/
    securityPasses();

    function securityPasses() {
        $(".security_pass").click(function() {
            var pass = $(this);
            $(".bank_delete").show("slow");
            $(".bank_textP1").text("是否通过本条券商信息?");
            $(".bank_textP2").text("通过点击确定，或者点击取消?");
            // 取消
            $(".security_btnCancel").click(function() {
                $(".bank_delete").hide("slow");
            })
            // 确定
            $(".security_btnConfirm").click(function() {
                pass.parent().parent().prev().html("通过").css("color", "#569ff1");
                $(".bank_delete").hide("slow");
            })

        })

    }

    /*证讯审批页面，点击不通过时，弹出提示框*/
    securityFaileds();

    function securityFaileds() {
        $(".security_failed").click(function() {
            var failed = $(this);
            $(".bank_delete").show("slow");
            $(".bank_textP1").text("是否不通过本条券商信息?");
            $(".bank_textP2").text("不通过点击确定，或者点击取消?");
            // 确定
            $(".security_btnConfirm").click(function() {
                failed.parent().parent().prev().html("不通过").css("color", "#fe7b7b");
                $(".bank_delete").hide("slow");
            })
        })

    }


    /*切换上架/下架状态*/
    securityChange();

    function securityChange() {
        $(".security_change").click(function() {
            var c = $(this);
            if (c.text() == "下架") {
                $(".bank_textP1").text("是否下架本条券商信息?");
                $(".bank_textP2").text("下架点击确定，或者点击取消?");
                $(".bank_delete").show();
                // 取消
                $(".bank_btnCancel").click(function() {
                    $(".bank_delete").hide();
                })
                // 确定
                $(".bank_btnConfirm").click(function() {
                    c.parent().prev().children().text("下架").attr("class", "undercarriage");
                    c.text("上架").attr("class", "grounding security_ground");
                    $(".bank_delete").hide();
                })
            }
            if (c.text() == "上架") {
                $(".bank_delete").show();
                $(".bank_textP1").text("是否上架本条券商信息?");
                $(".bank_textP2").text("上架点击确定，或者点击取消?");
                // 取消
                $(".bank_btnCancel").click(function() {
                    $(".bank_delete").hide();
                })
                // 确定
                $(".bank_btnConfirm").click(function() {
                    $(".bank_delete").hide();
                    c.parent().prev().children().text("上架").attr("class", "grounding");
                    c.text("下架").attr("class", "undercarriage security_listunder");
                })
            }
        })

    }


    /*证讯类型,修改类型名称*/
//    typeIcons();
//
//    function typeIcons() {
//        $(".typeIcon2").click(function() {
//            $("input.securities_typeRevise_input").val("");
//            var typeCon = $(this);
//            $(".securities_typeRevise").show("slow");
//            // 确定
//            $(".typeRevise_confirm").click(function() {
//                var typeText = $("input.securities_typeRevise_input").val();
//                if (typeText == "") {
//                    $(".securities_typeRevise").hide("slow");
//                } else {
//                    typeCon.parent().siblings().eq(0).html(typeText);
//                    $(".securities_typeRevise").hide("slow");
//                }
//
//            })
//            // 取消
//            $(".typeRevise_cancel").click(function() {
//                $(".securities_typeRevise").hide("slow");
//            })
//        })
//    }


    /*证讯类型,修改类型名称*/
//    typeIconD();
//
//    function typeIconD() {
//        $(".typeIcon1").click(function() {
//            $(this).parent().parent().remove();
//        })
//    }






    /*类型添加*/
    btnTypeAdds();

    function btnTypeAdds() {
        // 添加
        $("#btnTypeAdd").click(function() {
            var btnTypeVaradd = $(this).prev().val();
            if (btnTypeVaradd == "") {
                $(this).prev().prev().val("");
            } else {
                $(".securities_type_table").append('<tr><td>' + btnTypeVaradd + '</td><td width="120px"><s class="typeIcon1"></s></td><td width="120px"><s class="typeIcon2"></s></td></tr>');
            }
        })
        // 取消
        $("#btnTypeCancel").click(function() {
            $(this).prev().prev().val("");
        })
    }




    /*证讯绑定页面*/






























    /*证讯绑定页面，点击证讯列表弹窗，右侧内容刷新*/
    // apprSecuritiesList();

    // function apprSecuritiesList() {
    //     $("#bindExchangeList>li").click(function() {
    //         $(".borderBot .list>ul>li:nth-child(odd) .listInfo").hide().empty().append("https//www.baidu.com").fadeIn(200);
    //         $(".borderBot .list>ul>li:nth-child(even) .listInfo").hide().empty().append("https://www.sogou.com").fadeIn(200);

    //     })
    // }




})