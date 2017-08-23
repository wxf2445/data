<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                            <spring:message code="nav.menu.system" text="system"/><spring:message code="nav.menu.manage" text="Manage"/>
                        </li>
                        <li>
                             服务器修改
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i>服务器修改</h2>
                            </div>
                            <div class="box-content">
								<div class="navbar-inner">
									<c:url value='/server/save' var="editServerAction" />
										<form:form modelAttribute="editServerForm" cssClass="form-horizontal" role="form" action="${editServerAction }">
										<input type="hidden" name="serverid" id="serverid" value="${server.id }" />
										<div class="form-group row">
											<label class="control-label col-sm-2" for="oldUsername">旧用户名：</label>
											<div class="col-sm-4">
												<input class="form-control" name="oldUsername" id="oldUsername"/>
												 <label id="oldUsername-error" class="col-sm-1"></label>
											</div>
										</div>
											<div class="form-group row">
											<label class="control-label col-sm-2" for="newUsername">新用户名：</label>
											<div class="col-sm-4">
												<input class="form-control" name="newUsername" id="newUsername"/>
												 <label id="newUsername-error" class="col-sm-1"></label>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="oldPwd">旧密码：</label>
											<div class="col-sm-4">
												<input type="password" class="form-control" name="oldPwd" id="oldPwd"/>
												 <label id="oldPwd-error" class="col-sm-1"></label>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-sm-2" for="newPwd">新密码：</label>
											<div class="col-sm-4">
												<input  type="password" class="form-control" name="newPwd" id="newPwd"/>
												<label id="newPwd-error" class="col-sm-1"></label>
											</div>
										</div>
										<div class="form-group">
												<label class="control-label col-sm-2" for="comfirmPwd">确认密码：</label>
											<div class="col-sm-4">
												<input  type="password" class="form-control" name="comfirmPwd" id="comfirmPwd" />
												<label id="comfirmPwd-error" class="col-sm-1"></label>
											</div>
										</div>
										<div class="form-group">
												<label class="control-label col-sm-2" for="validCode">验证码：</label>
											<div class="col-sm-4">
												<input class="form-control" name="validCode" id="validCode"/>
												<label id="validCode-error" class="col-sm-1"></label>
											</div>
											<div class="col-sm-3 ">
						                        <a href="javascript:void(0);" onclick="javascript:reloadValidateCode();">
						                            <img id="validateCodeImg" class="img-validate-code img-rounded" src='<c:url value="/Kaptcha.jpg"/>'
						                                 data-toggle="tooltip" data-original-title="${message_validatecode_refresh}"/>
						                        </a>
											</div>
										</div>
									</form:form>
									<div class="center">
										<button id="submitBtn" class="btn btn-primary">提交</button>
										<a class="btn btn-warning" href='<c:url value="/server/manage"/>'>返回</a>
									</div>
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
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4>温馨提示：</h4>
            </div>
            <div class="modal-body">
              对不起，信息修改失败，请你重新修改！
            </div>
            <div class="modal-footer">
                <a href="#" class="confirm btn btn-primary" data-dismiss="modal"><i
                        class="glyphicon glyphicon-share-alt"></i> <spring:message code="href.confirm" text="Confirm"/></a>
            </div>
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
<script type="text/javascript">
$(document).ready(function () {
	  var setPwdInfo = '${reusltInfo}';
	  if(setPwdInfo != "" && !setPwdInfo){
          $("#view").modal('show');
      }
});
var form = $("#editServerForm");
form.validate({
	rules:{
		oldUsername:{
			required:true,
			remote:{
				url: '<c:url value="/json/server/check/name"/>',     //后台处理程序 
				  type: "post",               //数据发送方式
				  dataType: "json",           //接受数据格式    
				  data: {                     //要传递的数据
					  id: function() {
				   return '${server.id}';
				   },
				   username: function() {
					   return $("#oldUsername").val();
					   }
			   }
			}
		},
		newUsername:{
			required:true,
			rangelength:[6,20]
		},
		oldPwd:{
			required:true,
			remote:{
				url: '<c:url value="/json/server/check/pwd"/>',     //后台处理程序 
				  type: "post",               //数据发送方式
				  dataType: "json",           //接受数据格式    
				  data: {                     //要传递的数据
					  id: function() {
				   return '${server.id}';
				   },
				   pwd: function() {
					   return $("#oldPwd").val();
					   }
			   }
			}
		},
		newPwd:{
			required:true,
			rangelength:[4,20]
		},
		comfirmPwd:{
			required:true,
			equalTo:"#newPwd"
		},
		validCode:{
			required:true,
			remote:{
				url: '<c:url value="/json/server/check/code"/>',     //后台处理程序 
				  type: "post",               //数据发送方式
				  dataType: "json",           //接受数据格式    
				  data: {                     //要传递的数据
					  code: function() {
				   return $("#validCode").val();
				   }
			   }
			}
		}
	},
	messages:{
	oldUsername:{
		required:"必填项！",
		remote:"用户名错误！" 
		},
		newUsername:{
			required:"必填项！",
			rangelength:"新用户名长度必须大于6小于20"
		},
		oldPwd:{
			required:"必填项！",
			remote:"密码错误！" 
		},
		newPwd:{
			required:"必填项！",
			rangelength:"密码长度必须大于4小于20"
		},
		comfirmPwd:{
			required:"必填项！",
			equalTo:"确认密码和新密码不一致"
		},
		validCode:{
			required:"必填项！",
			remote:"验证码错误！" 
		}
	},
	errorPlacement: function(error, element) {
		error.replaceAll($("#"+ $(element).attr("name")+"-error"));
	}
});
function reloadValidateCode() {
	var date =  new Date() + Math.floor(Math.random() * 24);
	var src = '<c:url value="/Kaptcha.jpg?'+date+'"/>';
    $("#validateCodeImg").attr("src", src);
}
$("#submitBtn").on("click",function(){
	if(form.valid()){
		form.submit();
	}
});
</script>
</body>
</html>
