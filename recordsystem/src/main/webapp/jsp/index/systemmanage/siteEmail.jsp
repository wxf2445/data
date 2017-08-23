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
    <link href='<c:url value='/resources/css/siteEmail.css '/>' rel="stylesheet">
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
                             站内邮件
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i> 邮件发送</h2>
                            </div>
                            <div class="box-content">
								<div class="navbar-inner">
									<div class="row">
										<div class="col-xs-12 col-sm-8 col-md-9">
											<c:url value='/siteEmail/send'  var="siteEmailAction" />
											<form:form modelAttribute="siteEmailForm" cssClass="form-horizontal" role="form" action="${siteEmailAction }" method="post">
												<input type="hidden" name="username" id="username" value="<shiro:principal/>" />
												<div class="form-group row">
													<label class="control-label col-sm-2" for="recipients">收件人</label>
													<div class="col-sm-10">
														<div id="selectUser" class="selectUserEmail"></div>
														<label id="recipients-error" class="col-sm-2"></label>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-sm-2" for="theme">主题</label>
													<div class="col-sm-10">
														<input class="form-control" name="theme" id="theme"/>
														<label id="theme-error" class="col-sm-1"></label>
													</div>
												</div>
												<div class="form-group">
														<label class="control-label col-sm-2" for="content">正文</label>
													<div class="col-sm-10">
														<textarea rows="14"  id="content" name="content" class="kindEditor_textarea form-control" maxlength="2000"></textarea> 
														<label id="content-error" class="col-sm-1"></label>
													</div>
												</div>
											</form:form>
										</div>
										<div class="col-xs-12 col-sm-4 col-md-3">
											<div class="userBox">
												<div class="Resulttitle">通讯录：</div>
												<div class="lm_sbar">
													<button id="searchBtn" type="button"  class="lm_sopen"><i class="glyphicon glyphicon-search"></i></button>
													<div>
														<input id="searchKey" type="text" class="txt" placeholder="查找联系人..." />
													</div>
												</div>
												<div class="Resulttitle">查询结果：</div>
												<div id="searchResBox" class="ResultBox paddingL40">
													暂无查询结果...
												</div>
												<div class="Resulttitle">用户列表：</div>
												<div class="ResultBox">
													<ul>
														<c:forEach var="user" items="${userList }">
															<li id="${user.userid }" title="${user.email }">${user.username }</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="center">
										<button id="submitBtn" type="button" class="btn btn-primary" >发送</button>
										<a class="btn btn-warning" href='<c:url value="/siteEmail/manage"/>'>返回</a>
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
             ${sendinfo }
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
<!-- kindeditor -->
<script type="text/javascript" src='<c:url value="/resources/kindeditor/kindeditor.js" />'></script>
<script type="text/javascript" src='<c:url value="/resources/kindeditor/lang/zh_CN.js" />'></script>
<script type="text/javascript" src='<c:url value="/resources/kindeditor/plugins/code/prettify.js" />'></script>

<script src='<c:url value='/resources/js/common/common.js'/>'></script>
<script type="text/html" id="searchTemplate">
	{{if userList.length  > 0}}
		<div id="searchResBox" class="ResultBox">
			<ul>
				{{each(i,user) userList}}
					<li id="{{= user.userid}}" title="{{= user.email}}">{{= user.username}}</li>
				{{/each}}
			</ul>
		</div>
		{{else}}
			<div id="searchResBox" class="ResultBox paddingL40">
				暂无查询结果...
			</div>
	{{/if}}
</script>
<script type="text/html" id="delSearchTemplate">
	<div id="searchResBox" class="ResultBox paddingL40">
		暂无查询结果...
	</div>
</script>
<script type="text/javascript">
$(function(){
	var info = '${sendinfo}';
	if(info && info!=""){
		$("#view").modal("show");
	}
	KindEditor.ready(function(K) {
		editor=K.create('textarea[class=kindEditor_textarea]', {
			cssPath : getRootPath()+"/resources/kindeditor/plugins/code/prettify.css" ,
			allowFileManager : true,
			allowImageUpload : true, 
			formatUploadUrl:true,
			autoHeightMode : true,
			allowImageRemote:false,
			imageTabIndex:1,
			afterBlur:function(){//Kindeditor下获取文本框信息
				this.sync();
			},
	     	items : [
	      			'undo', 'redo', '|', 'preview', 'print', 'cut', 'copy', 'paste',
	      			'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
	      			'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', '|', 'fullscreen',
	      			'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
	      			'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'table', 'hr', 'emoticons', 'link', 'unlink'
	      	 ]  
		});
	});
});
function insertSelectedDw(id,username){
	var html = [];
	html.push('<div class="marginR10 selectOption"><small>'+username+';</samll>');
	html.push('<input id='+id+' type="checkbox" name="recipients" value='+username+' checked/>');
	html.push('<button  class="close">&times;</button></div>');
	return html;
}
function judgeExist(obj,id){
	var flag = false;
	var len = obj.length;
	if(len>0){
		for(var i=0;i<len;i++){
			if($(obj[i]).attr("id") == id){
				flag= true;
				break;
			}
		}
	}
	return flag;
}
$(".userBox").delegate(".ResultBox ul li","click",function(){
	if($("#recipients-error").hasClass("error")){
		$("#recipients-error").removeClass("error").text("");
	}
	var id = $(this).attr("id");
	var username = $(this).text();
	var flag = judgeExist($("#selectUser input"),id);
	if(!flag){
		var html = insertSelectedDw(id,username);
		$("#selectUser").append(html.join(''));
	}
});

$("#selectUser").delegate("button[class='close']","click",function(){
	$(this).closest("div").remove();
});

$("#searchBtn").on("click",function(){
	var i = $(this).find("i");
	if($("#searchKey").val() == ""){
		return;
	}else if(i.hasClass("glyphicon-search")){
		i.removeClass("glyphicon-search");
		i.addClass("glyphicon-remove");
		$.post('<c:url value="/siteEmail/search"/>',{searchKey:$("#searchKey").val()},function(data){
			$("#searchTemplate").tmpl(data).replaceAll($("#searchResBox"));
		},"json");
	}else{
		i.removeClass("glyphicon-remove");
		i.addClass("glyphicon-search");
		$("#searchKey").val('');
		$("#delSearchTemplate").tmpl().replaceAll($("#searchResBox"));
	}
});
var form = $("#siteEmailForm");
form.validate({
	rules:{
		theme:{
			required:true
		},
		content:{
			required:true
		}
	},
	messages:{
		theme:{
			required:"必填项！"
		},
		content:{
			required:"必填项！"
		}
	},
	errorPlacement: function(error, element) {
		error.replaceAll($("#"+ $(element).attr("name")+"-error"));
	}
});
$("#submitBtn").on("click",function(){
	var length = $("#selectUser input").length;
	if( length <= 0){
		$("#recipients-error").addClass("error").text("必填项！");
	}else if(form.valid()){
		form.submit();
	}else return;
});
</script>
</body>
</html>
