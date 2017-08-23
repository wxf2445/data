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
    <title>企业用户注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="注册">
    <meta name="description" content="企业用户注册">
    <meta name="author" content="websystem">

    <!-- The styles -->

    <%--     <link id="bs-css" href='<c:url value="/resources/charisma-master/css/bootstrap-cerulean.min.css"/>' rel="stylesheet"> --%>
    <link id="bs-css"
          href='<c:url value="/resources/charisma-master/bower_components/bootstrap/dist/css/bootstrap.min.css"/>'
          rel="stylesheet">

    <link
            href='<c:url value="/resources/charisma-master/css/charisma-app.css"/>'
            rel="stylesheet">
    <link
            href='<c:url value="/resources/charisma-master/bower_components/fullcalendar/dist/fullcalendar.css"/>'
            rel="stylesheet">
    <link
            href='<c:url value="/resources/charisma-master/bower_components/fullcalendar/dist/fullcalendar.print.css"/>'
            rel="stylesheet" media="print">
    <link
            href='<c:url value="/resources/charisma-master/bower_components/chosen/chosen.min.css"/>'
            rel="stylesheet">
    <link
            href='<c:url value="/resources/charisma-master/bower_components/colorbox/example3/colorbox.css"/>'
            rel="stylesheet">
    <link
            href='<c:url value="/resources/charisma-master/bower_components/responsive-tables/responsive-tables.css"/>'
            rel="stylesheet">
    <link
            href='<c:url value="/resources/charisma-master/bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css"/>'
            rel="stylesheet">
    <link
            href='<c:url value="/resources/charisma-master/css/jquery.noty.css"/>'
            rel="stylesheet">
    <link
            href='<c:url value="/resources/charisma-master/css/noty_theme_default.css"/>'
            rel="stylesheet">
    <link
            href='<c:url value="/resources/charisma-master/css/elfinder.min.css"/>'
            rel="stylesheet">
    <link
            href='<c:url value="/resources/charisma-master/css/elfinder.theme.css"/>'
            rel="stylesheet">
    <link
            href='<c:url value="/resources/charisma-master/css/jquery.iphone.toggle.css"/>'
            rel="stylesheet">
    <link
            href='<c:url value="/resources/charisma-master/css/uploadify.css"/>'
            rel="stylesheet">
    <link
            href='<c:url value="/resources/charisma-master/css/animate.min.css"/>'
            rel="stylesheet">
    <link id="bs-css"
          href='<c:url value="/resources/css/sluan.css"/>' rel="stylesheet">
    <link id="bs-css"
          href='<c:url value="/resources/css/register.css"/>' rel="stylesheet">
    <!-- jQuery -->
    <script
            src='<c:url value="/resources/charisma-master/bower_components/jquery/jquery.min.js"/>'></script>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"/>'></script>
    <![endif]-->

    <!-- The fav icon -->
    <%-- <link rel="shortcut icon"
        href='<c:url value="/resources/jsp/img/favicon.ico"/>'>--%>

</head>

<body>
<!-- <div class="navbar navbar-default" role="navigation">

    <div class="navbar-inner">
        <button type="button" class="navbar-toggle pull-left animated flip">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <%-- <a class="navbar-brand" href="<c:url value="/" />"> <img alt="Duoxieyun Logo" src='<c:url value="/resources/img/logo_sluan.png"/>' class="hidden-xs logo-sluan"/>
            <span><spring:message code="company" text="Hang Zhou SLuan Technology Co."/></span></a> --%>
        <a class="navbar-brand" href="<c:url value='/home'/>"> <img alt="Duoxieyun Logo" src='https://dn-websystemweb.qbox.me/img/websystem/logo-full-white.png' class="hidden-xs logo-sluan"/>
            <span>用户注册</span></a>


    </div> 
    
</div>-->
<jsp:include page="../homeheader.jsp">
    <jsp:param name="menu" value="2"/>
</jsp:include>

<div class="ch-container" style="background-color: aliceblue;">
    <div class="row">
        <!-- <div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked"></div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                    <li><a  class="ajax-link" href="#"><i class="glyphicon glyphicon-tags"></i><span>企业用户注册 </span></a></li>
                    <li class="disable" ><a   href="#"><i class="glyphicon glyphicon-tags"></i><span> 个人用户注册</span></a></li>
                    </ul>
                </div>
            </div>
        </div> -->
        <div class="col-lg-12 col-sm-12 ">
            <!-- content starts -->
            <%-- <div>
                <ul class="breadcrumb">
                    <li><a href="<c:url value="/admin/index" />"><spring:message
                                code="breadcrumb.home" text="Home" /></a></li>
                    <li><a href="<c:url value="/admin/company/manage" />"><spring:message
                                code="breadcrumb.company" text="Company" />
                            <spring:message code="breadcrumb.manage" text="Manage" /></a></li>
                    <li><spring:message code="href.create" text="Create" />
                        <spring:message code="breadcrumb.company" text="Company" /></li>
                </ul>
            </div> --%>

            <div class="row" style="margin-top: 20px;">
                <div class="col-md-8" style="padding-left: 60px;">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3>
                                <strong>参赛用户注册</strong>
                            </h3>
                            <img src="<c:url value="/resources/images/register-bar.png"/>" style="width:100%">
                        </div>
                        <div class="panel-body">
                            <div>
                                <c:url value="/register" var="createActoin"/>
                                <form:form method="post" modelAttribute="registerForm" enctype="multipart/form-data"
                                           action="${createActoin}" role="form" cssClass="form-horizontal">
                                    <fieldset>
                                        <legend class="blue-bar">个人信息</legend>

                                        <c:choose>
                                            <c:when test="${errors != null}">
                                                <c:forEach var="error" items="${errors}">
                                                    <spring:message code="${error.code}"
                                                                    text="${error.defaultMessage}" var="error_message"/>
                                                    <script>
                                                        <!--
                                                        $(document)
                                                                .ready(
                                                                        function () {
                                                                            var inputbox = $(
                                                                                    '#group-${error.field}')
                                                                                    .addClass(
                                                                                            "has-error has-feedback");

                                                                            $(
                                                                                    inputbox)
                                                                                    .find(
                                                                                            'input[name="${error.field}"]:first')
                                                                                    .after(
                                                                                            '<span class="glyphicon glyphicon-remove form-control-feedback" style="right: 45px"></span>');
                                                                            $(
                                                                                    '#error_${error.field}')
                                                                                    .html(
                                                                                            '<label id="${error.field}-error" class="error" for="${error.field}">${error_message}</label>');

                                                                            $(
                                                                                    '.has-error:first')
                                                                                    .find(
                                                                                            'input[name="${error.field}"]:first')
                                                                                    .focus();
                                                                        });
                                                        -->
                                                    </script>
                                                </c:forEach>
                                            </c:when>
                                        </c:choose>

                                        <div id="group-name" class="form-group">
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.user.name" text="Company Name"/></label>

                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <form:input path="registerName" cssClass="form-control"
                                                                value=""/>
													<span class="input-group-addon"><i
                                                            class="glyphicon glyphicon-pencil yellow"></i></span>
                                                </div>
                                            </div>
                                            <div id="error_registerName" class="col-sm-4 restrict-label"></div>
                                        </div>
                                        <div id="group-userpassword" class="form-group">
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.user.password" text="userpassword"/></label>

                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <form:password path="userpassword" cssClass="form-control"
                                                                   value=""/>
													<span class="input-group-addon"><i
                                                            class="glyphicon glyphicon-pencil yellow"></i></span>
                                                </div>
                                            </div>
                                            <div id="error_userpassword" class="col-sm-4 restrict-label"></div>
                                        </div>
                                            <%-- <div class="form-group">
                                                <label class="col-sm-2 control-label"><spring:message
                                                        code="model.user.telephone" text="Telephone" /></label>
                                                <div class="col-sm-3">
                                                    <div class="input-group">
                                                        <input type="text" name="telephone" class="form-control"
                                                            value="${company.telephone}" /> <span
                                                            class="input-group-addon"><i
                                                            class="glyphicon glyphicon-phone-alt green"></i></span>
                                                    </div>
                                                </div>
                                                <div id="error_telephone" class="col-sm-4 restrict-label">
                                                </div>
                                            </div> --%>
                                            <%-- <div class="form-group">
                                                <label class="col-sm-2 control-label"><spring:message
                                                        code="model.email" text="Email" /></label>
                                                <div class="col-sm-3">
                                                    <div class="input-group">
                                                        <input type="text" name="email" class="form-control"
                                                            value="${company.email}" /> <span
                                                            class="input-group-addon"><i
                                                            class="glyphicon glyphicon-envelope red"></i></span>
                                                    </div>
                                                </div>
                                                <div id="error_email" class="col-sm-4 restrict-label">
                                                </div>
                                            </div> --%>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.email"
                                                    text="Email"/></label>

                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <spring:message code="model.email" text="EmailExample"
                                                                    var="email.example"/>
                                                    <input type="text" id="email" name="email"
                                                           placeholder="${email }" class="form-control"
                                                           value=""/>
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-envelope red"></i></span>
                                                </div>
                                            </div>
                                            <div id="validateemail" class="validatebutton">
                                                <button disabled="disabled" id="validatebutton"
                                                        class="btn  btn-primary">
                                                    验证邮箱
                                                </button>
                                            </div>
                                            <div id="error_email" class="col-sm-2 restrict-label">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"
                                                   style="padding-left:0px"><spring:message
                                                    code="model.user.checksum" text="Checksum"/></label>

                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <spring:message code="model.user.checksum" text="checksumExample"
                                                                    var="email.example"/>
                                                    <input type="text" id="checksum" name="checksum"
                                                           placeholder="${email.example }" class="form-control"
                                                           value=""/>
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-envelope red"></i></span>
                                                </div>
                                            </div>
                                            <div id="error_checksum" class="col-sm-4 restrict-label">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.user.cellphone" text="Phone"/></label>

                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <input type="text" name="phone" class="form-control"
                                                           value=""/> <span
                                                        class="input-group-addon"><i
                                                        class="glyphicon glyphicon-phone green"></i></span>
                                                </div>
                                            </div>
                                            <div id="error_phone" class="col-sm-4 restrict-label">
                                            </div>
                                        </div>
                                            <%-- <div class="form-group">
                                                <label class="col-sm-2 control-label"><spring:message
                                                        code="model.user.industrys" text="Industrys" /></label>
                                                <div class="col-sm-6">
                                                    <div class="input-group col-sm-12">
                                                    <c:forEach var="industry" items="${industrys}">
                                                        <div class="industry">
                                                        <input type="checkbox" name="industrys" class="form-control"
                                                            value="${industry.id }" />
                                                            <label for="industrys" >${industry.name }</label>
                                                        </div>
                                                    </c:forEach>
                                                    </div>
                                                </div>
                                                <div id="error_address" class="col-sm-4 restrict-label">
                                                </div>
                                            </div> --%>
                                            <%-- <div class="form-group">
                                                <label class="col-sm-2 control-label"><spring:message
                                                        code="model.user.contact" text="Contact" /></label>
                                                <div class="col-sm-3">
                                                    <div class="input-group">
                                                        <input type="text" name="contact" class="form-control"
                                                            value="${company.contact}" /> <span
                                                            class="input-group-addon"><i
                                                            class="glyphicon glyphicon-user blue"></i></span>
                                                    </div>
                                                </div>
                                                <div id="error_contact" class="col-sm-4 restrict-label">
                                                </div>
                                            </div> --%>

                                    </fieldset>
                                    <fieldset>
                                        <legend class="blue-bar">团队信息</legend>

                                        <div id="group-teamname" class="form-group">
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.user.teamname"
                                                    text="TeamName"/></label>

                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <form:input path="teamname" cssClass="form-control"
                                                                value=""/>
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-pencil blue"></i></span>
                                                </div>
                                            </div>
                                            <div id="error_teamname" class="col-sm-4 restrict-label">
                                            </div>
                                        </div>
                                        <div id="group-teampeonum" class="form-group">
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.user.teampeonum"
                                                    text="teampeonum"/></label>

                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <form:input path="teampeonum" cssClass="form-control"
                                                                value=""/>
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-pencil yellow"></i></span>
                                                </div>
                                            </div>
                                            <div id="error_teampeonum" class="col-sm-4 restrict-label">
                                            </div>
                                        </div>
                                        <div id="group-schoolname" class="form-group">
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.user.schoolname"
                                                    text="schoolname"/></label>

                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <form:input path="schoolname" cssClass="form-control"
                                                                value=""/>
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-pencil yellow"></i></span>
                                                </div>
                                            </div>
                                            <div id="error_schoolname" class="col-sm-4 restrict-label">
                                            </div>
                                        </div>
                                        <div id="group-teachername" class="form-group">
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.user.teachername"
                                                    text="teachername"/></label>

                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <form:input path="teachername" cssClass="form-control"
                                                                value=""/>
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-pencil"></i></span>
                                                </div>
                                            </div>
                                            <div id="error_teachername" class="col-sm-4 restrict-label">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.user.applydata" text="applydata"/></label>

                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <input type="file" name="applydata" class="form-control"
                                                           value=""/>
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-file green"></i></span>
                                                </div>
                                            </div>
                                            <div id="error_applydata" class="col-sm-4 restrict-label">
                                            </div>
                                        </div>
                                            <%-- <div class="form-group">
                                              <label class="col-sm-2 control-label"><spring:message code="model.user.telephone" text="Telephone"/></label>
                                              <div class="col-sm-3">
                                                <div class="input-group">
                                                  <input type="text" name="user.telephone" class="form-control" value="${user.telephone}" />
                                                  <span class="input-group-addon"><i class="glyphicon glyphicon-phone green"></i></span>
                                                </div>
                                              </div>
                                              <div id="error_telephone" class="col-sm-4 restrict-label">
                                              </div>
                                            </div> --%>


                                        <div class="form-group">
                                            <label class="col-sm-2 control-label "><spring:message
                                                    code="model.register.validatecode" text="Validatecode"/></label>

                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <input type="text" id="validateCode" name="validateCode"
                                                           placeholder=""
                                                           class="form-control" value=""/>
                                        	<span class="registervalidate">
                                        	<a href="javascript:void(0);" onclick="javascript:reloadValidateCode();">
                                                <img id="validateCodeImg" class="img-validate-code img-rounded"
                                                     src="Kaptcha.jpg" data-toggle="tooltip" data-original-title=""/>
                                            </a>
                                        	</span>
                                                </div>
                                            </div>
                                            <div id="" class="col-sm-4 restrict-label">
                                                <c:if test="${registerstatus ne null && registerstatus eq 'validateerror' }">
                                                    <label id="name-error" class="error" for="name"><spring:message
                                                            code="validate.error" text="Validate error"/>！</label>
                                                </c:if>
                                            </div>

                                        </div>
                                        <div class="form-group registererror">
                                            <label class="col-sm-2 control-label"></label>

                                            <div class="col-sm-6">
                                                <div class="input-group">
                                                    <label class="error-text"> <spring:message code="register.error"
                                                                                               text="Register Error"/> </label>
                                                </div>
                                            </div>
                                        </div>
                                            <%-- <div class="form-group">
                                              <label class="col-sm-2 control-label"><spring:message code="model.user.qq" text="QQ"/></label>
                                              <div class="col-sm-3">
                                                <div class="input-group">
                                                  <input type="text" name="user.qq" class="form-control" value="${user.qq}" />
                                                  <span class="input-group-addon"><i class="glyphicon glyphicon-comment yellow"></i></span>
                                                </div>
                                              </div>
                                              <div id="error_qq" class="col-sm-4 restrict-label">
                                              </div>
                                            </div> --%>

                                    </fieldset>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <hr class="blue-hr">
                                        </div>
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <form:button value="submit" id="register"
                                                         class="btn btn-primary">
                                                <i class="glyphicon glyphicon-saved"></i>
                                                <spring:message code="href.register" text="Register"/>
                                            </form:button>
                                            <a href="<c:url value="/home" />" class="btn btn-primary"><i
                                                    class="glyphicon glyphicon-share-alt"></i> <spring:message
                                                    code="href.cancel" text="Cancel"/></a>
                                        </div>
                                    </div>
                                </form:form>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">温馨提示</h3>
                        </div>
                        <div class="panel-body">
                            <span>您好！欢迎您注册报名网站。提交前请牢记您的用户名和密码，它将是您登录系统唯一的依据。谢谢！</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/#content.col-md-0-->
    </div>
    <!--/fluid-row-->

    <%@include file="../footer.jsp" %>

</div>
<div class="modal fade" id="view" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h3>温馨提示：</h3>
            </div>
            <div class="modal-body">
                邮件发送失败！请检查邮箱格式是否错误!
            </div>
            <div class="modal-footer">
                <a href="#" class="confirm btn btn-primary" data-dismiss="modal"><i
                        class="glyphicon glyphicon-share-alt"></i> <spring:message code="href.confirm"
                                                                                   text="Confirm"/></a>
            </div>
            </form>

        </div>
    </div>
</div>
<!--/.fluid-container-->

<!-- external javascript -->

<script
        src='<c:url value="/resources/charisma-master/bower_components/bootstrap/dist/js/bootstrap.min.js"/>'></script>

<!-- library for cookie management -->
<script
        src='<c:url value="/resources/charisma-master/js/jquery.cookie.js"/>'></script>
<!-- calender plugin -->
<script
        src='<c:url value="/resources/charisma-master/bower_components/moment/min/moment.min.js"/>'></script>
<script
        src='<c:url value="/resources/charisma-master/bower_components/fullcalendar/dist/fullcalendar.min.js"/>'></script>
<!-- data table plugin -->
<script
        src='<c:url value="/resources/charisma-master/js/jquery.dataTables.min.js"/>'></script>

<!-- select or dropdown enhancer -->
<script
        src='<c:url value="/resources/charisma-master/bower_components/chosen/chosen.jquery.min.js"/>'></script>
<!-- plugin for gallery image view -->
<script
        src='<c:url value="/resources/charisma-master/bower_components/colorbox/jquery.colorbox-min.js"/>'></script>
<!-- notification plugin -->
<script
        src='<c:url value="/resources/charisma-master/js/jquery.noty.js"/>'></script>
<!-- library for making tables responsive -->
<script
        src='<c:url value="/resources/charisma-master/bower_components/responsive-tables/responsive-tables.js"/>'></script>
<!-- tour plugin -->
<script
        src='<c:url value="/resources/charisma-master/bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"/>'></script>
<!-- star rating plugin -->
<script
        src='<c:url value="/resources/charisma-master/js/jquery.raty.min.js"/>'></script>
<!-- for iOS style toggle switch -->
<script
        src='<c:url value="/resources/charisma-master/js/jquery.iphone.toggle.js"/>'></script>
<!-- autogrowing textarea plugin -->
<script
        src='<c:url value="/resources/charisma-master/js/jquery.autogrow-textarea.js"/>'></script>
<!-- multiple file upload plugin -->
<script
        src='<c:url value="/resources/charisma-master/js/jquery.uploadify-3.1.min.js"/>'></script>
<!-- history.js for cross-browser state change on ajax -->
<script
        src='<c:url value="/resources/charisma-master/js/jquery.history.js"/>'></script>
<!-- form.js for form submit on ajax -->
<script
        src='<c:url value="/resources/charisma-master/bower_components/jquery-validation-1.13.1/lib/jquery.form.js"/>'></script>
<!-- validate.js for form submit on ajax -->
<script
        src='<c:url value="/resources/charisma-master/bower_components/jquery-validation-1.13.1/dist/jquery.validate.js"/>'></script>
<script
        src='<c:url value='/resources/charisma-master/bower_components/jquery-validation-1.13.1/dist/localization/messages_zh.js '/>'></script>
<script
        src='<c:url value='/resources/charisma-master/bower_components/jquery-validation-1.13.1/dist/additional-methods.js'/>'></script>
<!-- application script for Charisma demo -->
<%-- <script
    src='<c:url value="/resources/charisma-master/js/charisma.js"/>'></script> --%>
<script
        src='<c:url value="/resources/charisma-master/bower_components/jquery-tmpl-master/jquery.tmpl.js"/>'></script>

<spring:message code="companycreateform.message.failed"
                text="Password Edit failed!" var="message_edit_failed"/>
<spring:message code="companycreateform.message.success"
                text="Password Edit success!" var="message_edit_success"/>
<spring:message code="companycreateform.name.not.empty"
                text="Company name must not be empty!" var="error_message_name"/>
<spring:message code="companycreateform.domain.not.empty"
                text="Company domain must not be empty!" var="error_message_domain"/>
<spring:message code="companycreateform.email.not.valid"
                text="Please enter a valid email address!" var="error_message_email"/>
<spring:message code="form.validate.ok" text="OK!"
                var="validate_message_ok"/>
<spring:message code="usercreateform.password.length.range" text="Password length must be {0}-{1} characters!"
                arguments="8,30" argumentSeparator="," var="error_message_password_length"/>
<script>

    function reloadValidateCode() {
        $("#validateCodeImg").attr("src", "Kaptcha.jpg?" + new Date() + Math.floor(Math.random() * 24));
    }
    /* function checkSubmit(){
     var email = $("#email").val();
     $.ajax({
     url: "<c:url value='/json/register/checkemail' />",
     type: "POST",
     data: "email="+email,
     success: function(result){
     if(result == false){
     alert("注册邮箱失败，请确认邮箱是否正确以及网络是否可用,然后重新注册！");
     return false;
     }
     }
     });
     } */

    $(document).ready(function () {
        var registerstatus = '${registerstatus}';
        if (registerstatus != null && registerstatus != '') {
            $(".registererror").show();
        }
        var isEmailSended = false;
        /* function openValidEmail(){
         $("#validatebutton").removeAttr("disabled");
         $("#validatebutton").text("验证邮箱");
         isEmailSended = true;
         } */
        var mill = 60;
        var t;

        function clock() {
            if (mill >= 0) {
                $("#validatebutton").text("等待" + mill + "秒");
                mill--;
                t = setTimeout(clock, 1000);
            } else {
                $("#validatebutton").text("邮箱验证");
                $("#validatebutton").removeAttr("disabled");
                clearTimeout(t);
            }
        }

        $("#validatebutton").click(function (e) {
            if ($("#email").valid()) {
                var email = $("#email").val();
                $.post("<c:url value='/json/register/checkemail' />", {email: email}, function (result) {
                    if (result == false) {
                        $(".modal").modal('show');
                    } else {
                        $(".modal-body").text("邮件发送成功！前去邮箱查看验证码！");
                        $(".modal").modal('show');
                        $("#validatebutton").text("等待60秒");
                        isEmailSended = true;
                        $("#validatebutton").attr("disabled", "disabled");
                        mill = 60;
                        setTimeout(clock, 1000);
                        //var interval = setInterval(checkclock,1000);
                        //window.clearInterval(interval);
                        //setTimeout(openValidEmail,60000);
                    }
                    return false;
                });
            } else {
                $(".modal-body").text("邮件格式错误！,请输入正确的邮箱！");
                $(".modal").modal('show');
            }
            /* $.ajax({
             url: "
            <c:url value='/json/register/checkemail' />",
             type: "POST",
             data: JSON.stringify("email="+email),
             success: function(result){

             }
             }); */
        });
        $("#protocol").on("click", function (e) {
            $("#register").prop("disabled", !$("#register").prop("disabled"));
        });
        $("#register").click(function (e) {
            if ($('#registerForm').valid()) {
                e.preventDefault();
                //$(".modal-body").text("账号注册成功，请等待平台管理员审核，审核通过将通过邮件通知到您！");
                //$(".modal").modal('show');
                //$(".confirm").click(function(e){
                $('#registerForm').submit();
                //});
                /* var email = $("#email").val();
                 $.ajax({
                 url: "
                <c:url value='/json/register/checkemail' />",
                 type: "POST",
                 data: "email="+email,
                 success: function(result){
                 if(result == false){
                 alert("注册邮箱失败，请确认邮箱是否正确以及网络是否可用,然后重新注册！");
                 return false;
                 }
                 $("#registerForm").submit();
                 }
                 }); */
            }
        });


        $('#registerForm').validate({
            errorPlacement: function (error, element) {
                if ($(element).attr("name") == 'email' && isEmailSended == false) {
                    $("#validatebutton").attr("disabled", "disabled");
                }
                error.appendTo($("#error_" + $(element).attr("name").replace(".", "")));
            },
            rules: {
                registerName: {
                    isUsername: true,
                    required: true,
                    remote: {
                        url: '<c:url value="/json/register/create/checkname"/>',
                        type: 'post',
                        data: {
                            name: function () {
                                return $("#registerName").val();
                            }
                        }
                    }
                },
                userpassword: {
                    required: true,
                    isPassword: true,
                },
                email: {
                    required: true,
                    isEmail: true,
                    remote: {
                        url: '<c:url value="/json/register/email"/>',
                        type: 'post',
                        data: {
                            email: function () {
                                return $("#email").val();
                            }
                        }
                    }
                },
                checksum: {
                    required: true,
                    remote: {
                        url: '<c:url value="/json/register/checksum"/>',
                        type: 'post',
                        data: {
                            checksum: function () {
                                return $("#checksum").val();
                            }
                        }
                    }
                },
                phone: {
                    required: true,
                    confirmPhone: true,
                },
                teamname: {
                    required: true,
                    maxlength: 10
                },
                teampeonum: {
                    required: true,
                    digits: true,
                    maxlength: 3
                },
                schoolname: {
                    required: true,
                    maxlength: 12
                },
                teachername: {
                    required: true,
                    maxlength: 12
                },
                applydata: {
                    required: true,
                    filesize: 20,
                    extension: "xls|csv|doc|docx|zip|rar"
                }
            },
            messages: {
                registerName: {
                    remote: "昵称重名！"
                },
                checksum: {
                    remote: "请确保验证码无误并且未超时！"
                },
                email: {
                    remote: "邮箱已被使用！"
                },
                applydata: {
                    extension: "文件后缀不支持！请上传word文档或者zip压缩包！"
                }
            },
            success: function (label) {
                if (label.attr("for") == 'email' && isEmailSended == false) {
                    $("#validatebutton").removeAttr("disabled");
                }
                label.text("${validate_message_ok}").addClass("valid");
            }
        });
    });
</script>


</body>
</html>
