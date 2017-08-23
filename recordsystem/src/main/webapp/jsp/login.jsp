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
    <title>用户登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="登录">
    <meta name="description" content="用户登录">
    <meta name="author" content="websystem">
    <link id="bs-css"
          href='<c:url value="/resources/charisma-master/bower_components/bootstrap/dist/css/bootstrap.min.css"/>'
          rel="stylesheet">
    <%-- <link id="bs-css" href='<c:url value="/resources/css/home/screen.css"/>'
        rel="stylesheet"> --%>
    <link id="bs-css" href='<c:url value="/resources/css/home/homehead.css"/>'
          rel="stylesheet">
    <%-- <link id="bs-css" href='<c:url value="/resources/css/home/screen.css"/>'
    rel="stylesheet"> --%>
    <link id="bs-css" href='<c:url value="/resources/css/home/home.css"/>'
          rel="stylesheet">
    <link id="bs-css" href='<c:url value="/resources/css/sluan.css"/>'
          rel="stylesheet">
    <link id="bs-css" href='<c:url value="/resources/css/home/login.css"/>'
          rel="stylesheet">


    <!-- jQuery -->
    <%-- <script src='<c:url value="/resources/charisma-master/bower_components/jquery/jquery.min.js"/>'></script> --%>
    <script src='<c:url value="/resources/charisma-master/js/jquery-1.12.1.min.js"/>'></script>
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"/>'></script>
    <![endif]-->


</head>

<body>

<!-- <div class="navTop">
        <div class="container">
            <div class="row">

                <nav class="col-md-12">

                    <ul class="clearfix unstyled pull-right">
                        <li>
                            <a href="#" title="twitter">Twitter</a>
                        </li>
                        <li>
                            <a href="#" title="Flckr">Flckr</a>
                        </li>
                        <li>
                            <a href="#" title="Facebook">Facebook</a>
                        </li>
                        <li>
                            <a href="#" title="Google+">Google+</a>
                        </li>
                    </ul>
                </nav>/nav
            </div>/.row [TopNavigation]
        </div>/.container
    </div> -->
<!-- /.navTop -->

<!-- /.mainNav -->
<jsp:include page="./homeheader.jsp">
    <jsp:param name="menu" value="2"/>
</jsp:include>


<div class="container-fluid loginpanel">

    <%-- <div class="row">
        <spring:message code="welcom.to.websystem" text="Welcome to websystem" var="message_welcometo"/>
        <div class="col-md-12 center login-header">
            <h2>${message_welcometo}</h2>
        </div>
        <!--/span-->
    </div><!--/row--> --%>

    <%-- <div class="loginimgdiv col-md-offset-1 col-md-6">
    <img alt="" class="loginimg" src='<c:url value="/resources/images/login_bg.jpg"/>'>
    </div> --%>
    <div class=" col-md-offset-7 col-md-5 logincontainer ">
        <%--<ul class="nav nav-tabs logintabs center">
            <li class="active entrance"><a class="li1" href="#"><span class="sensorname"><h5>企业管理员登录</h5></span></a>
            </li>
            <li class="entrance rightentrance"><a class="li2" href="http://cold-chain.websystem.com/"><span
                    class="sensorname"><h5>冷链平台入口</h5></span></a></li>
        </ul>--%>
        <c:url value="/login" var="loginActoin"/>
        <form:form method="post" modelAttribute="loginForm" action="${loginActoin}" role="form"
                   cssClass="form loginForm login-box">
            <c:choose>
                <c:when test="${errors != null}">
                    <div class="alert alert-danger">
                        <c:forEach var="error" items="${errors}">
                            <spring:message code="${error.code}" text="${error.defaultMessage}"
                                            var="error_message"/>${error_message}
                            <script>
                                <!--
                                $(document).ready(function () {
                                    var inputbox = $('#group-${error.field}')
                                            .addClass("has-error has-feedback")
                                            .find('input[name="${error.field}"]:first')
                                            .after('<span class="glyphicon glyphicon-remove form-control-feedback"></span>')
                                            .focus();
                                });
                                -->
                            </script>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-info">
                        <spring:message code="welcome.to.management"
                                        text="Welcome to Management Platform,"/><spring:message
                            code="please.input.username.and.password"
                            text="Please login with your Username and Password."/>
                    </div>
                </c:otherwise>
            </c:choose>
            <fieldset>
                <spring:message code="loginform.username" text="User Name" var="message_uesrname"/>
                <div id="group-username" class="form-group" data-toggle="tooltip"
                     data-original-title="${message_uesrname}">
                    <div class="input-group ">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <form:input path="username" cssClass="form-control" placeholder="${message_uesrname}"/>
                    </div>
                </div>
                <div class="clearfix"></div>
                <br>

                <spring:message code="loginform.password" text="Password" var="message_password"/>
                <div id="group-password" class="form-group form-group-lg" data-toggle="tooltip"
                     data-original-title="${message_password}">
                    <div class="input-group " data-toggle="tooltip" data-original-title="${message_password}">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <form:password path="password" cssClass="form-control" placeholder="${message_password}"
                                       showPassword="true"/>
                    </div>
                </div>
                <div class="clearfix"></div>
                <br>

                <div id="group-validateCode" class="row form-group form-group-lg">
                    <spring:message code="loginform.validatecode" text="Validate Code" var="message_validatecode"/>
                    <div class="col-xs-6 col-sm-6 col-md-6" data-toggle="tooltip"
                         data-original-title="${message_validatecode}">
                        <div class="input-group ">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-certificate"></i></span>
                            <input type="text" class="form-control" name="validateCode"
                                   placeholder="${message_validatecode}"/>
                        </div>
                    </div>
                    <spring:message code="loginform.validatecode.refresh" text="Refresh"
                                    var="message_validatecode_refresh"/>
                    <div class="col-xs-offset-6 col-xs-6 col-sm-offset-4 col-sm-6 col-md-offset-4 col-md-6 input-group  validate-code">
                        <a href="javascript:void(0);" onclick="javascript:reloadValidateCode();">
                            <img id="validateCodeImg" class="img-validate-code img-rounded" src="Kaptcha.jpg"
                                 data-toggle="tooltip" data-original-title="${message_validatecode_refresh}"/>
                        </a>
                    </div>
                </div>
                <div class="clearfix"></div>

                <%--<spring:message code="loginform.rememberme" text="Remember me" var="message_rememberme"/>
                <div class="form-group form-group-lg">

                    <div class="input-prepend">
                        <label class="remember" for="remember"><input type="checkbox" name="rememberMe" data-val="true"
                                                                      value="true"
                                                                      checked="checked">${message_rememberme}</label>
                    </div>
                </div>--%>
                <div class="clearfix"></div>

                <div class="row form-group loginsubmit">
                    <p class="center col-md-12">
                        <form:button value="submit" class="btn btn-primary"><spring:message code="loginform.submit"
                                                                                            text="Submit"/></form:button>
                        <a href="<c:url value="/register"/>" class="btn btn-primary" target="_new"><spring:message
                                code="loginform.register" text="Register"/></a>
                    </p>
                    <center><font color="#999">没有Ukey支持工具？</font><a href="<c:url value="/resources/tools/SetUpAll.exe"/>">点击下载</a></center>
                </div>
                    <%-- <div class="row form-group form-group-lg">
                      <p class="center col-md-12">
                          <form:button value="submit" class="btn btn-primary btn-lg"><spring:message code="loginform.submit" text="Submit"/></form:button>
                      </p>
                    </div>
                    <div class="row form-group form-group-lg">
                      <p class="center col-md-12">
                          <form:button value="submit" class="btn btn-primary btn-lg"><spring:message code="loginform.submit" text="Submit"/></form:button>
                      </p>
                    </div> --%>
            </fieldset>
        </form:form>
    </div>
    <!--/span-->
</div><!--/.fluid-container-->
<%@include file="footer.jsp" %>

<div class="modal fade" id="view" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h3>温馨提示：</h3>
            </div>
            <div class="modal-body">
                账号注册成功，请等待平台管理员审核，审核通过将通过邮件通知到您！
            </div>
            <div class="modal-footer">
                <a href="#" class="confirm btn btn-primary" data-dismiss="modal"><i
                        class="glyphicon glyphicon-share-alt"></i> <spring:message code="href.confirm" text="Confirm"/></a>
            </div>
        </div>
    </div>
</div>

<%-- <div id="templatemo_banner_slide" class="container_wapper">
        <div class="camera_wrap camera_emboss" id="camera_slide">
            <div data-src='<c:url value="/resources/img/login/banner_slide_01.jpg"/>'>
            </div>
            <div data-src='<c:url value="/resources/img/login/banner_slide_02.jpg"/>'>
            </div>
            <div data-src='<c:url value="/resources/img/login/banner_slide_03.jpg"/>'>
            </div>
        </div><!-- #camera_wrap_3 -->    
    </div> --%>
<!-- external javascript -->

<script src='<c:url value="/resources/charisma-master/bower_components/bootstrap/dist/js/bootstrap.min.js"/>'></script>
<script src='<c:url value='/resources/charisma-master/bower_components/jquery-tmpl-master/jquery.tmpl.js '/>'></script>
<%--
<!-- library for cookie management -->
<script src='<c:url value="/resources/charisma-master/js/jquery.cookie.js"/>'></script>
<!-- calender plugin -->
<script src='<c:url value="/resources/charisma-master/bower_components/moment/min/moment.min.js"/>'></script>
<script src='<c:url value="/resources/charisma-master/bower_components/fullcalendar/dist/fullcalendar.min.js"/>'></script>
<!-- data table plugin -->
<script src='<c:url value="/resources/charisma-master/js/jquery.dataTables.min.js"/>'></script>

<!-- select or dropdown enhancer -->
<script src='<c:url value="/resources/charisma-master/bower_components/chosen/chosen.jquery.min.js"/>'></script>
<!-- plugin for gallery image view -->
<script src='<c:url value="/resources/charisma-master/bower_components/colorbox/jquery.colorbox-min.js"/>'></script>
<!-- notification plugin -->
<script src='<c:url value="/resources/charisma-master/js/jquery.noty.js"/>'></script>
<!-- library for making tables responsive -->
<script src='<c:url value="/resources/charisma-master/bower_components/responsive-tables/responsive-tables.js"/>'></script>
<!-- tour plugin -->
<script src='<c:url value="/resources/charisma-master/bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"/>'></script>
<!-- star rating plugin -->
<script src='<c:url value="/resources/charisma-master/js/jquery.raty.min.js"/>'></script>
<!-- for iOS style toggle switch -->
<script src='<c:url value="/resources/charisma-master/js/jquery.iphone.toggle.js"/>'></script>
<!-- autogrowing textarea plugin -->
<script src='<c:url value="/resources/charisma-master/js/jquery.autogrow-textarea.js"/>'></script>
<!-- multiple file upload plugin -->
<script src='<c:url value="/resources/charisma-master/js/jquery.uploadify-3.1.min.js"/>'></script>
<!-- history.js for cross-browser state change on ajax -->
<script src='<c:url value="/resources/charisma-master/js/jquery.history.js"/>'></script>
<!-- application script for Charisma demo -->
<script src='<c:url value="/resources/charisma-master/js/charisma.js"/>'></script>

<script src='<c:url value="/resources/js/login/jquery.easing.1.3.js"/>'></script>
<script src='<c:url value="/resources/js/login/jquery.mobile.customized.min.js"/>'></script>
<script src='<c:url value="/resources/js/login/camera.min.js"/>'></script> --%>
<script type="text/html" id="setPwdTemplate">
     <div class="modal-body">
                恭喜您，密码修改成功，请重新登入！
     </div>
</script>
<script type="text/html" id="registerTemplate">
     <div class="modal-body">
                 账号注册成功，请等待平台管理员审核，审核通过将通过邮件通知到您！
     </div>
</script>
<c:url value="/validateCode" var="validateCode"/>
<script>

    $(document).ready(function () {
        var registerstatus = '${registerstatus}';
        var setPwdInfo = '${setPwdInfo}';
        if (registerstatus != null && registerstatus == 'success') {
        	$("#registerTemplate").tmpl().replaceAll($("#view .modal-body"));
            $(".modal").modal('show');
        }
        if(setPwdInfo !=null && setPwdInfo){
        	$("#setPwdTemplate").tmpl().replaceAll($("#view .modal-body"));
            $(".modal").modal('show');
        }
        /* if("
        <shiro:principal/>" != "")
         $('input[name="username"]').attr("value", "
        <shiro:principal/>"); */
        var message = '${findpassword}';
        if (message == true) {
            alert("请查看您的邮件查看找回密码信息！");
        }
    });
    function reloadValidateCode() {
        $("#validateCodeImg").attr("src", "Kaptcha.jpg?" + new Date() + Math.floor(Math.random() * 24));
    }

</script>

</body>
</html>

