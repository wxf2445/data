<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmtutc" uri="/tags/utcdate" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title><spring:message code="company" text="Hang Zhou ykhl Technology Co."/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="ykhl,iSP">
    <meta name="author" content="ykhl">

    <!-- The styles -->
    <link id="bs-css" href='<c:url value='/resources/charisma-master/css/bootstrap-cerulean.min.css '/>'
          rel="stylesheet">
    <%--     <link id="bs-css" href='<c:url value='/resources/charisma-master/css/bootstrap-cerulean.min.css '/>' rel="stylesheet"> --%>

    <link href='<c:url value='/resources/charisma-master/css/charisma-app.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/bower_components/fullcalendar/dist/fullcalendar.css '/>'
          rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/bower_components/fullcalendar/dist/fullcalendar.print.css '/>'
          rel="stylesheet" media="print">
    <link href='<c:url value='/resources/charisma-master/bower_components/chosen/chosen.min.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/bower_components/colorbox/example3/colorbox.css '/>'
          rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/bower_components/responsive-tables/responsive-tables.css '/>'
          rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css '/>'
          rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/bower_components/bootstrap-datepicker-release/css/datepicker.css '/>'
          rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/css/jquery.noty.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/css/noty_theme_default.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/css/elfinder.min.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/css/elfinder.theme.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/css/jquery.iphone.toggle.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/css/uploadify.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/css/animate.min.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/css/index.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/css/common/common.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/vakata-jstree/dist/themes/default/style.css'/>' rel="stylesheet">


    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js '></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href='<c:url value='/resources/img/favicon.ico '/>'>
</head>
<body>

<%@include file="../common/common.jsp" %>
<%@include file="../../header.jsp" %>

<div class="container-fluid mycontainer">
    <div class="containercontent">

        <%@include file="../../nav.jsp" %>

        <div class="rightbox">
            <div class="rightbox_content">
                <!-- content starts -->
                <div class="breadcrumbdiv">
                    <ul class="breadcrumb">
                        <li>
                            <a href="<c:url value="/admin/index" />"><spring:message code="breadcrumb.home" text="Home"/></a>
                        </li>
                        <li>
                            	档案借阅
                        </li>
                        <li>
                            	借阅登记
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i> 借阅登记</h2>
                            </div>
                            <div class="box-content">
                                
     <c:url value="/json/log/manage" var="logSearchForm"></c:url>

		         <div class="col-md-14">
		             <form id="archivesForm" cssClass="form-horizontal"  >
		                 <table class="center" style="width:100%;" border="1" bordercolor="#000000" id="libraryTable">
							<tbody>
								<tr>
									<td width="25%">借阅单位</td>
									<td width="25%"><input name="borrowunits" class="form-control" style="border-radius:0px;border:0px solid #000">
                            			<label id="borrowunits-error" class="control-label"></label>
                            		</td>
                            		<td width="25%">借阅人 </td>
									<td width="25%"><input name="borrowPerson" class="form-control" style="border-radius:0px;border:0px solid #000">
                            			<label id="borrowPerson-error" class="control-label"></label>
                            		</td>
								</tr>
								<tr>
									<td>借阅日期</td>
									<td class="input-daterange input-group datepicker" style="border:0px solid #000">
										<input name="borrowtime" class="form-control" style="border-radius:0px;border:0px solid #000">
                            			<label id="borrowtime-error" class="control-label"></label>
                            		</td>
									
									<td>联系电话</td>
									<td>
										<input name="phone" class="form-control" style="border-radius:0px;border:0px solid #000">
                            			<label id="phone-error" class="control-label"></label>
									</td>
								</tr>
								<tr>
									<td>借阅卷内号/档案号</td>
									<td colspan="3"><input class="form-control" name="borrowNo" style="border-radius:0px;border:0px solid #000" 
									              	 	<c:if test="${record!=''}">
									              	 		value="${record.recordno }" 
									              	 	</c:if>
									              	 	>
                            						<label id="borrowNo-error" class="control-label"></label></td>
								</tr>
								<tr>
									<td>借阅档案题名</td>
									<td colspan="3"><input class="form-control" name="borrowTitle" style="border-radius:0px;border:0px solid #000"
									              	 	<c:if test="${record!=''}">
									              	 		value="${record.subject }" 
									              	 	</c:if>
									              	 	>
                            			<label id="borrowTitle-error" class="control-label"></label></td>
								</tr>
								<tr>
									<td>预计归还日期</td>
									<td colspan="3" class="datepicker">
										<input class="form-control" name="deadline" style="border-radius:0px;border:0px solid #000">
                            			<label id="deadline-error" class="control-label"></label>
									</td>
								</tr>
								<tr>
									<td>借阅是由</td>
									<td colspan="3"><input name="reason" class="form-control" style="border-radius:0px;border:0px solid #000">
                            					<label id="reason-error" class="control-label"></label></td>
								</tr>
								<tr>
									<td>备注</td>
									<td colspan="3">
										<input class="form-control" name="description" style="border-radius:0px;border:0px solid #000">
                           				 <label id="description-error" class="control-label"></label> 
									</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align:right;">
										<br>
                            			借阅人签名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            			<br>
                            			<br>
									</td>
								</tr>
								<!-- <tr>
									<td>归还档案状况</td>
									<td colspan="5">
										<input class="form-control" style="border-radius:0px;border:0px solid #000">
									</td>
								</tr>
								<tr>
									<td>归还人</td>
									<td colspan="2">
										<input class="form-control" style="border-radius:0px;border:0px solid #000">
									</td>
									<td>归还日期</td>
									<td colspan="2">
										<input class="form-control" style="border-radius:0px;border:0px solid #000">
									</td>
								</tr> -->
							</tbody>
						</table>
						<br>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="pull-right">
                                                <input class="btn btn-success" type="submit" value="确定">
                                                <input class="btn btn-success printTable" type="button" value="保存并打印">
                                            </div>
                                        </div>
                                    </div>
                                        </form>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <!--/span-->
                    
                    
                </div><!--/row-->
                <%@include file="../../footer.jsp" %>
            </div>
            
            
            
            <!-- content ends -->
        </div><!--/#content.col-md-0-->
    </div><!--/fluid-row-->


    <div class="modal fade" id="view" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>

</div>
<!--/.fluid-container-->
<spring:message code="form.validate.ok" text="OK!"
                var="validate_message_ok"/>
<!-- external javascript -->

<script src='<c:url value='/resources/charisma-master/bower_components/bootstrap/dist/js/bootstrap.min.js'/>'></script>

<!-- library for cookie management -->
<script src='<c:url value='/resources/charisma-master/js/jquery.cookie.js '/>'></script>
<!-- calender plugin -->
<script src='<c:url value='/resources/charisma-master/bower_components/moment/min/moment.min.js '/>'></script>
<script src='<c:url value='/resources/charisma-master/bower_components/fullcalendar/dist/fullcalendar.min.js '/>'></script>
<!-- data table plugin -->
<script src='<c:url value='/resources/charisma-master/js/jquery.dataTables.min.js '/>'></script>

<!-- select or dropdown enhancer -->
<script src='<c:url value='/resources/charisma-master/bower_components/chosen/chosen.jquery.min.js '/>'></script>
<!-- plugin for gallery image view -->
<script src='<c:url value='/resources/charisma-master/bower_components/colorbox/jquery.colorbox-min.js '/>'></script>
<!-- notification plugin -->
<script src='<c:url value='/resources/charisma-master/js/jquery.noty.js '/>'></script>
<!-- library for making tables responsive -->
<script src='<c:url value='/resources/charisma-master/bower_components/responsive-tables/responsive-tables.js '/>'></script>
<!-- tour plugin -->
<script src='<c:url value='/resources/charisma-master/bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js '/>'></script>
<!-- star rating plugin -->
<script src='<c:url value='/resources/charisma-master/js/jquery.raty.min.js '/>'></script>
<!-- for iOS style toggle switch -->
<script src='<c:url value='/resources/charisma-master/js/jquery.iphone.toggle.js '/>'></script>
<!-- autogrowing textarea plugin -->
<script src='<c:url value='/resources/charisma-master/js/jquery.autogrow-textarea.js '/>'></script>
<!-- multiple file upload plugin -->
<script src='<c:url value='/resources/charisma-master/js/jquery.uploadify-3.1.min.js '/>'></script>
<!-- history.js for cross-browser state change on ajax -->
<script src='<c:url value='/resources/charisma-master/js/jquery.history.js '/>'></script>
<!-- form.js for form submit on ajax -->
<script src='<c:url value='/resources/charisma-master/bower_components/jquery-validation-1.13.1/lib/jquery.form.js '/>'></script>
<!-- validate.js for form submit on ajax -->
<script src='<c:url value='/resources/charisma-master/bower_components/jquery-validation-1.13.1/dist/jquery.validate.js '/>'></script>
<script src='<c:url value='/resources/charisma-master/bower_components/jquery-validation-1.13.1/dist/localization/messages_zh.js '/>'></script>
<!-- application script for Charisma demo -->
<script src='<c:url value='/resources/charisma-master/js/charisma.js '/>'></script>
<script src='<c:url value='/resources/charisma-master/bower_components/jquery-tmpl-master/jquery.tmpl.js '/>'></script>
<script src='<c:url value='/resources/charisma-master/bower_components/bootstrap-datepicker-release/js/bootstrap-datepicker.js '/>'></script>
<script src='<c:url value='/resources/charisma-master/bower_components/bootstrap-datepicker-release/js/locales/bootstrap-datepicker.zh-CN.js '/>'></script>

<script src='<c:url value='/resources/js/date.js '/>'></script>
<script src='<c:url value='/resources/vakata-jstree/dist/jstree.js '/>'></script>

<script src='<c:url value='/resources/js/common/common.js'/>'></script>


<script>
$(document).on("click",".printTable",function(){
	 $("#libraryTable label").css("display","none");
	/* $(".libraryTable").print();
	
	$(".fileContent iframe")[0].contentWindow.print(); */
	 var p = document.getElementById('libraryTable');//将要被打印的表格
	 var tableToPrint = p.cloneNode(true);
	 $(tableToPrint).find(".datepicker").css("border","");
	 var inputs = $(tableToPrint).find("input");
	 for(var i=0;i<inputs.length;i++){
		 var input = inputs.eq(i);
		 $(input).parent().html(input.val());
	 }
	// alert(tableToPrint);
     var newWin= window.open("");//新打开一个空窗口
     newWin.document.write(tableToPrint.outerHTML);//将表格添加进新的窗口
     newWin.document.close();//在IE浏览器中使用必须添加这一句
     newWin.focus();//在IE浏览器中使用必须添加这一句

     newWin.print();//打印
     newWin.close();//关闭窗口
});


    $(document).ready(function () {
    	$(".datepicker input").not("[name=deadline]").datepicker({
    	    format: "yyyy-mm-dd",
    	    todayBtn: "linked",
            language: 'zh-CN',
            autoclose: true,
            todayHighlight: true
        });

        $(document).on("change",".datepicker input[name=borrowtime]",function(){
    		$(".datepicker input[name=borrowtime]").valid();
    	});
        $(document).on("change",".datepicker input[name=deadline]",function(){
    		$(".datepicker input[name=deadline]").valid();
    	});
    	$(".datepicker input[name=deadline]").datepicker({
    	    format: "yyyy-mm-dd 23:59:59",
    	    todayBtn: "linked",
            language: 'zh-CN',
            autoclose: true,
            todayHighlight: true
        });
    	$('#archivesForm').validate({
                    submitHandler: function (form) {
                        $(form).ajaxSubmit({
                            dataType: "json",
                            url:"<c:url value='/json/archives/add'/>",
                            type: "post",
                            success: function (data, s, xhr) {
                                var status = data.status;
                                if (status == 1) {
                                    noty({
                                        text: "创建成功！",
                                        layout: "top",
                                        type: "success",
                                        timeout: 1000,
                                        onClosed: function () {
                                           window.location.reload();
                                        }
                                    });
                                } else if (status == 0) {
                                    noty({
                                        text: "创建失败！",
                                        layout: "top",
                                        type: "error",
                                        timeout: 1000
                                    });
                                }
                            }
                        });
                        return false;
                    },
                    errorPlacement: function (error, element) {
                        error.replaceAll($("#" + $(element).attr("name") + "-error"));
                    },
                    rules: {
                    	borrowunits: {
                            maxlength: 128,
                            required: true
                        },
                        borrowtime: {
                            maxlength: 16,
                            required: true
                        },
                        borrowPerson: {
                            maxlength: 32,
                            required: true
                        },
                        borrowNo: {
                            maxlength: 128,
                            required: true
                        },
                        phone: {
                            maxlength: 16,
                            required: true
                        },
                        reason: {
                            maxlength: 128,
                            required: true
                        },
                        borrowTitle: {
                            maxlength: 128,
                            required: true
                        },
                        description: {
                            maxlength: 128,
                            required: true
                        },
                        deadline: {
                            maxlength: 36,
                            required: true
                        }
                    },
                    messages: {
                    	borrowunits: {
                            required: "必填！"
                        },
                        borrowtime: {
                            required: "必填！"
                        },
                        borrowPerson: {
                            required: "必填！"
                        },
                        borrowNo: {
                            required: "必填！"
                        },
                        phone: {
                            required: "必填！"
                        },
                        reason: {
                            required: "必填！"
                        },
                        borrowTitle: {
                            required: "必填！"
                        },
                        description: {
                            required: "必填！"
                        },
                        deadline: {
                            required: "必填！"
                        }
                    },
                    success: function (label) {
                        label.text("${validate_message_ok}").addClass("valid");
                        label.removeClass("error");
                        label.html("有效");
                    }
                });
    }); 
</script>


</body>
</html>
