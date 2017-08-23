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
    <link href='<c:url value='/resources/css/search.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/vakata-jstree/dist/themes/default/style.css'/>' rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/audioPlayer/css/audioplayer.css"/>'>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js '></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href='<c:url value='/resources/img/favicon.ico '/>'>
</head>
<body>

<%@include file="../../common/common.jsp" %>
<%@include file="../../../header.jsp" %>

<div class="container-fluid mycontainer">
    <div class="containercontent">

        <%@include file="../../../nav.jsp" %>

        <div class="rightbox">
            <div class="rightbox_content">
                <!-- content starts -->
                <div class="breadcrumbdiv">
                    <ul class="breadcrumb">
                        <li>
                            <a href="<c:url value="/index" />"><spring:message code="breadcrumb.home" text="Home"/></a>
                        </li>
                        <li>
                            <spring:message code="nav.menu.record" text="Record"/><spring:message
                                code="nav.menu.search"
                                text="Search"/>
                        </li>
                        <li>
                            <spring:message code="nav.menu.index" text="Index"/><spring:message
                                code="nav.menu.search"
                                text="Search"/>
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i> <span><spring:message
                                        code="nav.menu.record" text="Record"/><spring:message code="nav.menu.search"
                                                                                              text="Search"/> </span>
                                </h2>
                            </div>
                            <div class="box-content">
                                <%-- <div class="row center">
                                    <img src="<c:url value="/resources/images/content/archives_128.png"  />">
                                </div> --%>
                                <form class="form-horizontal infoSearchForm">

                                    <div class="form-group">
                                        <div class="col-md-10 col-md-offset-3">

                                            <div class="col-md-12">

                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <select class="form-control " id="searchType" name="searchType">
                                                            <option value="3">根据归档信息查询</option>
                                                            <option value="0">根据模板字段精确查询</option>
                                                            <!-- <option value="1">根据所有模板字段查询</option> -->
                                                            <%--<option value="2">模糊查询</option>--%>
                                                            <option value="4">全文检索</option>
                                                        </select>

                                                    </div>
                                                    <div class="col-md-2">
                                                        <select class="form-control " id="pattern" name="pattern" name="pattern">
                                                            <option value="0">按卷查询</option>
                                                            <option value="1">按件查询</option>
                                                        </select>
                                                    </div>
                                                    <a class="btn btn-primary addField col-md-1 control-label "
                                                       style="text-align: center;"><i
                                                            class="glyphicon glyphicon-info-sign" style="
    text-align: center;
"></i></a>

                                                    <%--<div class="col-md-6 searchInput">
                                                        <input class="form-control" name="search">
                                                    </div>
                                                    <button type="submit" class="btn btn-info control-label"><i
                                                            class="glyphicon glyphicon-search"></i>
                                                    </button>--%>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </form>
                                <div class="well" id="searchConditionArea"></div>
                                <h2 id="recordVolumeArea">档案显示区<span ><strong><b class="patterntext"></b></strong></span></h2>

                                <div class="ch-container">
                                    <div class="row recordArea well">

                                    </div>
                                </div>
                                <div class="detailRecordArea" id="detailRecordArea">
                                </div>
                                <%-- </c:if> --%>
                            </div>
                        </div>
                    </div>
                    <!--/span-->
                </div><!--/row-->
                <%@include file="../../../footer.jsp" %>
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


<script src='<c:url value='/resources/js/common/common.js'/>'></script>
<script src='<c:url value='/resources/vakata-jstree/dist/jstree.js '/>'></script>

<script type="text/javascript" src="<c:url value='/resources/js/cuplayer/swfobject.js'/>"></script>

<script type="text/javascript" src="<c:url value='/resources/audioPlayer/js/audioplayer.js'/>"></script>
<script type="text/html" id="virtualDeviceTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4>虚拟设备列表</h4>
        </div>
        <c:url value="/json/sensor/allocate" var="allocateActoin"/>
        <form id="allocateForm" method="post" action="${allocateActoin}" role="form" class="form-horizontal">
            <div class="modal-body">
                <div class="box-content">
                    <div class="table-content">
                        <input type="hidden" name="id" value="">
                        <table class="table table-striped table-bordered bootstrap-datatable">
                            <thead>
                            <tr>
                                <th id="th_dtuid" title="dtuid"><spring:message code="model.user.dtuid"
                                                                                text="dtuid"/></th>
                                <th id="th_checksum" title="checksum"><spring:message code="model.user.checksum"
                                                                                      text="checksum"/></th>
                                <th id="th_acstatus" title="acstatus"><spring:message code="model.user.acstatus"
                                                                                      text="acstatus"/></th>
                                <th id="th_description" title="Description"><spring:message
                                        code="model.user.description" text="Description"/></th>
                            </tr>
                            </thead>
                            <tbody class="table-tbody">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <a href="javascript:void(0)" class="btn btn-primary" data-dismiss="modal"><i
                        class="glyphicon glyphicon-share-alt"></i>
                    <spring:message code="href.cancel" text="Cancel"/></a>
            </div>
        </form>
    </div>
</script>


<div id="warningTemplate" style="display:none">
    <div class="col-lg-3 col-md-3 warningbox">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <div class="row">
                    <!-- <div class="col-xs-3">
                        <i class="fa fa-comments fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                        <div class="huge">26</div>
                        <div>New Comments!</div>
                    </div> -->
                    <p style="text-align: center;"><img alt=""
                                                        src="<c:url value="/resources/img/warning_32.png"/>"/><span
                            class="warningdevicename"></span></p>
                </div>
            </div>
            <a href="javascript:void(0)">
                <div class="panel-footer warning_footer">
                    <!-- <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div> -->
                    <table class="waringtable">


                    </table>
                </div>
            </a>
        </div>
    </div>
</div>


<script type="text/html" id="userdeletetemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4>温馨提示：</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <p class="deletetip">是否确定要删除用户<span class="deletefondsname"></span>信息？</p>

                <p class="cannotdeletetip">该用户下有机构信息，真的要删除吗？<a
                        class="realdeletebutton btn btn-primary btn-warning"><spring:message code="href.confirm"
                                                                                             text="Confirm"/></a></p>
            </div>
        </div>
        <div class="modal-footer">
            <a href="javascript:void(0)" class="deletebutton btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <spring:message code="href.confirm"
                                                                               text="Confirm"/></strong></a>
            <a href="javascript:void(0)" class="btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <spring:message code="href.cancel"
                                                                               text="Cancel"/></strong></a>
        </div>
    </div>
</script>

<script type="text/html" id="CheckTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="optitle">审核用户</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <c:url var="createUserAction" value="/user/create"/>
                <form:form modelAttribute="createUserForm" action="${createUserAction}" class="form-horizontal"
                           role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.name"
                                                                              text="Name"/></label>

                        <div class="col-sm-3">
                            <p class="form-control-static">{{= username}} </p>
                        </div>
                        <label id="name-error" class="col-md-1"></label>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.type"
                                                                              text="Type"/></label>

                        <div class="col-sm-3">
                            <p class="form-control-static">{{= role.name}} </p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.password"
                                                                              text="Password"/></label>

                        <div class="col-sm-3">
                            <p class="form-control-static">{{= password}} </p>
                        </div>
                        <label id="pwd-error" class="col-md-1"></label>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.service"
                                                                              text="Service"/></label>

                        <div class="col-sm-3">
                            <p class="form-control-static">{{= provider}} </p>
                        </div>
                        <label id="provider-error" class="col-md-1"></label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.contact"
                                                                              text="Contact"/></label>

                        <div class="col-sm-3">
                            <p class="form-control-static">{{= contact}} </p>
                        </div>
                        <label id="contact-error" class="col-md-1"></label>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.contactinfo"
                                                                              text="Contactinfo"/></label>

                        <div class="col-sm-3">
                            <p class="form-control-static">{{= contactinfo}} </p>
                        </div>
                        <label id="contactinfo-error" class="col-md-1"></label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.mailbox"
                                                                              text="MailBox"/></label>

                        <div class="col-sm-3">
                            <p class="form-control-static">{{= email}} </p>
                        </div>
                        <label id="email-error" class="col-md-1"></label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.description"
                                                                              text="Description"/></label>

                        <div class="col-sm-9">
                            <p class="form-control-static">{{= description}} </p>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
        <div class="modal-footer">
            <a href="javascript:void(0)" class="checkpass btn btn-primary"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <span
                    class="button1"><spring:message code="href.pass" text="Pass"/></span></strong></a>
            <a href="javascript:void(0)" class="btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <span class="button2 notpass"><spring:message
                    code="href.notpass" text="Not pass"/></span></strong></a>
        </div>

        </form>
    </div>
</script>
<script type="text/html" id="edituserTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="optitle">审核用户</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <c:url var="editUserAction" value="/json/user/edit"/>
                <form:form modelAttribute="userCreateForm" action="${editUserAction}" class="form-horizontal"
                           role="form">
                    <input type="hidden" name="userid" value="{{= userid}}">

                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.name"
                                                                              text="Name"/></label>

                        <div class="col-sm-4">
                            <input name="tempusername" class="form-control" placeholder="{{= username }}"
                                   disabled="disabled" value="{{= username }}">
                            <label id="tempusername-error" class=""></label>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.type"
                                                                              text="Type"/></label>

                        <div class="col-sm-4">
                            <select disabled="disabled" name="usertype" class="form-control">
                                <option value="{{= roleid}}">{{= role.name}}</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.password"
                                                                              text="Password"/></label>

                        <div class="col-sm-4">
                            <input type="password" name="userpassword" id="userpassword" class="form-control"
                                   placeholder="空时，不输入新密码则不修改密码">
                            <label id="userpassword-error" class="ferror"></label>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.service"
                                                                              text="Service"/></label>

                        <div class="col-sm-4">
                            <input name="provider" class="form-control" placeholder="{{= provider}}"
                                   value="{{= provider}}">
                            <label id="provider-error" class=""></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.pwdconfirm"
                                                                              text="Pwdconfirm"/></label>

                        <div class="col-sm-4">
                            <input type="password" name="pwdconfirm" class="form-control" placeholder="空时，不输入新密码则不修改密码">
                            <label id="pwdconfirm-error" class="ferror"></label>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.contact"
                                                                              text="Contact"/></label>

                        <div class="col-sm-4">
                            <input name="contact" class="form-control" placeholder="{{= contact}}"
                                   value="{{= contact}}">
                            <label id="contact-error" class=""></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.contactinfo"
                                                                              text="ContacInfo"/></label>

                        <div class="col-sm-4">
                            <input name="contactinfo" class="form-control" placeholder="{{= contactinfo}}"
                                   value="{{= contactinfo}}">
                            <label id="contactinfo-error" class=""></label>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.mailbox"
                                                                              text="MailBox"/></label>

                        <div class="col-sm-4">
                            <input name="email" class="form-control" placeholder="{{= email}}" value="{{= email}}">
                            <label id="email-error" class=""></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.description"
                                                                              text="Description"/></label>

                        <div class="col-sm-10">
                            <textarea name="description" placeholder="{{= description}}" class="form-control">{{= description}}</textarea>
                            <label id="description-error" class=""></label>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
        <div class="modal-footer">
            <a href="javascript:void(0)" class="edituserbutton btn btn-primary"><strong><i
                    class="glyphicon glyphicon-share-alt"></i>
                <span class="button1"><spring:message code="href.pass" text="Pass"/></span></strong></a>
            <a href="javascript:void(0)" class="btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <span class="button2"><spring:message code="href.notpass"
                                                                                                     text="Not pass"/></span></strong></a>
        </div>

        </form>
    </div>
</script>
<script type="text/html" id="createFondsTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="optitle">创建全宗</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <c:url var="createTypeAction" value="/json/fonds/create"/>
                <form:form modelAttribute="typeCreateForm" action="${createTypeAction}" class="form-horizontal"
                           role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.recordtype.name"
                                                                              text="Name"/></label>

                        <div class="col-sm-4">
                            <input id="fondsname" name="fondsname" class="form-control">
                            <label id="fondsname-error" class="control-label"></label>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.recordtype.name"
                                                                              text="Name"/></label>

                        <div class="col-sm-4">
                            <input id="fondsno" name="fondsno" class="form-control">
                            <label id="fondsno-error" class="control-label"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.recordtype.description"
                                                                              text="Description"/></label>

                        <div class="col-sm-4">
                            <input id="fondsdes" name="fondsdes" class="form-control">
                            <label id="fondsdes-error" class="control-label"></label>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
        <div class="modal-footer">
            <a href="javascript:void(0)" class="createTypeButton btn btn-primary"><strong><i
                    class="glyphicon glyphicon-share-alt"></i>
                <span class="button1"><spring:message code="href.confirm" text="Confirm"/></span></strong></a>
            <a href="javascript:void(0)" class="cancel btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <span class="button2"><spring:message code="href.cancel"
                                                                                                     text="Cancel"/></span></strong></a>
        </div>

        </form>
    </div>
</script>
<script type="text/html" id="deleteTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="alert alert-danger">确定要删除如下设备？</h4>
        </div>
        <c:url value="/json/device/delete" var="deleteActoin"/>
        <form method="post" id="deleteForm" action="${deleteActoin}" role="form" class="form-horizontal">
            <div class="modal-body">
                <div class="box-content">
                    <div class="form-group">
                        <input type="hidden" name="deviceid" class="form-control" value="{{= deviceid}}"/>
                        <input type="hidden" name="dtuid" class="form-control" value="{{= dtuid}}"/>
                        <input type="hidden" name="isvirtual" class="form-control" value="{{= isvirtual}}"/>
                        <label class="col-sm-2 control-label"><spring:message code="model.ctype.name"
                                                                              text="Name"/></label>

                        <div class="col-sm-10">
                            <p class="form-control-static">{{= name}} <i class="glyphicon glyphicon-tag blue"></i></p>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.dtuid"
                                                                              text="Serialnumber"/></label>

                        <div class="col-sm-10">
                            <p class="form-control-static">{{= dtuid}} <i class="glyphicon glyphicon-tag blue"></i></p>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.checksum"
                                                                              text="Checksum"/></label>

                        <div class="col-sm-10">
                            <p class="form-control-static">{{= checksum}} <i class="glyphicon glyphicon-tag blue"></i>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button value="submit" class="btn btn-primary"><i class="glyphicon glyphicon-saved"></i> <spring:message
                        code="href.ok" text="OK"/></button>
                <a href="javascript:void(0)" class="btn btn-primary" data-dismiss="modal"><i
                        class="glyphicon glyphicon-share-alt"></i>
                    <spring:message code="href.cancel" text="Cancel"/></a>
            </div>
        </form>
    </div>
</script>
<script type="text/html" id="deviceTemplate">
    <tr id="t_{{= deviceid}}">
        <td>{{= dtuid}}</td>
        <td>{{= checksum}}</td>
        <td>
            {{if acstatus=='active'}}
            激活
            {{else}}
            未激活
            {{/if}}
        </td>
        <td>{{= description}}</td>
    </tr>
</script>
<style> .recordArea{
overflow:auto;
}</style>
<script type="text/html" id="PieceTemplate">
    {{if hasresult == false}}
    <div class="alert alert-info">无符合搜寻条件的结果！</div>
    {{else}}
    <h3>符合搜寻条件的档案目录</h3>
    <div class="alert alert-info">共有<b><strong>{{= pieces.page.totalCount}}</strong></b>条符合搜寻条件的结果！</div>
    <table class="table table-striped table-bordered responsive table-content">
        <thead>
        <tr>
            <th id="th_operation" title="操作">操作</th>
            <th id="th_recordNo" title="档号">档号</th>
			<!--
            	<th id="th_recordno" title="档号">{{= piececolmap.recordno}}</th>
            	<th id="th_sequencNo" title="顺序号">{{= piececolmap.sequencNo}}</th>
			-->
            {{each(i,v) pieceecols}}
				{{if v!='recordNo'&& v!='fondsid'&& v!='timerange'}}
            		<th id="th_{{= v}}" title="{{= piececolmap[v]}}">{{= piececolmap[v]}}</th>
				{{/if}}
            {{/each}}
        </tr>
        </thead>
        <tbody>
        {{if pieces.page.items.length == 0}}
        <tr>
            <td style="display:none">无</td>
            <td colspan="20" class="center">表中数据为空！</td>
        </tr>
        {{else}}
        {{each(i,v) pieces.page.items}}
        <tr id="{{= v.targetid}}">
            <td class="">
                 <a class="btn btn-success viewDocument" title="查看具体信息" recordtypeid={{= recordtypeid}} recordid={{= v.targetid}}  type="_piece"><i class="glyphicon glyphicon-check"></i></a>
			</td>
            {{each(ci,cv) pieceecols}}
				{{if cv=='recordNo'}}
            		<td class="">{{= v[cv]}}</td>
				{{/if}}
            {{/each}}
            {{each(ci,cv) pieceecols}}
				{{if cv!='recordNo'&&cv!='fondsid'&&cv!='timerange'}}
            		<td class="">{{= v[cv]}}</td>
				{{/if}}
            {{/each}}
			<!--
            	<td class="">{{= v.recordno}}</td>
            	<td class="">{{= v.sequencNo}}</td>
            	{{each(ci,cv) pieceecols}}
            		<td class="">{{= v[cv]}}</td>
            	{{/each}}
            	<td class="">
                	<a class="btn btn-success viewDocument" title="查看具体信息" recordtypeid={{= recordtypeid}} recordid={{=
                   	v.targetid}} type="_piece"><i class="glyphicon glyphicon-check"></i></a>
            	</td>
       			</tr>
			-->
        {{/each}}
        {{/if}}
        </tbody>
    </table>
    <nav class="center">
        <ul class="pagination">
            {{if pieces.page.pageNum == 1}}
            <li class="disabled"><a href="javascript:void(0)">&laquo;</a></li>
            {{else}}
            <li>
                <a href="javascript:void(0)" class="prev"><span>&laquo;</span></a>
            </li>
            {{/if}}
            {{each(i,v) pieces.showPages}}
            {{if v == pieces.page.pageNum}}
            <li class="active"><a href="javascript:void(0)">{{= v}}</a></li>
            {{else v == 0}}
            <li><a>...</a></li>
            {{else}}
            <li>
                <a href="javascript:void(0)" class="clickpage"><span>{{= v}}</span></a>
            </li>
            {{/if}}
            {{/each}}
            {{if pieces.page.pageNum == pieces.page.totalPage}}
            <li class="disabled"><a href="javascript:void(0)">&raquo;</a></li>
            {{else}}
            <li>
                <a href="javascript:void(0)" class="next"><span>&raquo;</span></a>
            </li>
            {{/if}}
        </ul>
    </nav>
    {{/if}}
</script>
<script type="text/html" id="VolumeInnerTemplate">
    {{if hasresult == true}}
    <div class="alert alert-info">
        共搜寻出<b>{{= total}}</b>条案卷记录，以及相应的符合条件的卷内！
    </div>
    {{else}}
    <div class="alert alert-warning">
        抱歉，共搜寻出<b>0</b>条记录,请重新搜索！
    </div>
    {{/if}}
    {{each(voi,vov) volumeids}}

    <div class="col-md-12 table-content">
        <h2>第<b>{{= voi+1}}</b>条记录</h2>
        <blockquote><b>案卷目录(案卷号：{{= idvalue[vov][0].volumeNo}})</b></blockquote>

        <div class="col-md-3"><img src="<c:url value="/resources/images/Folder.png" />"></div>
        <div class="col-md-9">
            <table>
                <tbody>
                <tr>
                    {{each(i,v) idvalue[vov]}}
                    {{each(ci,cv) volumecols}}
                    <td><b>{{= volumecolmap[cv]}}</b></td>
                    <td class=""><strong>{{= v[cv]}}</strong></td>
                    {{if ci%3 == 2}}
                </tr>
                <tr>
                    {{/if}}
                    {{/each}}
                    {{/each}}
                </tr>
                </tbody>
            </table>
            <%--<table class="table table-striped table-bordered responsive">
                <tbody>
                {{each(i,v) idvalue[vov]}}
                {{each(ci,cv) volumecols}}
                <tr>
                    <td>{{= volumecolmap[cv]}}</td>
                    <td class="">{{= v[cv]}}</td>

                </tr>
                {{/each}}
                {{/each}}
                </tbody>
            </table>--%>
        </div>
    </div>
    <div class="col-md-12" style="overflow-X:scroll;">
        <blockquote>卷內目录</blockquote>
        <table class="table table-striped table-bordered responsive table-content">
            <thead>
            <tr>
                <th id="th_recordno" title="案卷号">案卷号</th>
                <th id="th_sequencNo" title="顺序号">顺序号</th>
                {{each(i,v) innercols}}
                <th id="th_{{= v}}" title="{{= innercolmap[v]}}">{{= innercolmap[v]}}</th>
                {{/each}}
                <th id="th_operation" title="操作">操作</th>
            </tr>
            </thead>
            <tbody>
            {{if innermaps[vov].length == 0}}
            <tr>
                <td style="display:none">无</td>
                <td colspan="20" class="center">表中数据为空！</td>
            </tr>
            {{else}}
            {{each(i,v) innermaps[vov].inners}}
            <tr id="{{= v.id}}">
                <td class="">{{= v.recordNo}}</td>
                <td class="">{{= v.sequencNo}}</td>
                {{each(ci,cv) innercols}}
                <td class="">{{= v[cv]}}</td>
                {{/each}}
                <td class="">
                    <a class="btn btn-success viewDocument" title="查看具体信息" recordtypeid={{= recordtypeid}} recordid={{=
                       v.id}} type="_record"><i class="glyphicon glyphicon-check"></i></a>
                </td>
            </tr>
            {{/each}}
            {{/if}}
            </tbody>
        </table>
    </div>
    {{/each}}

    <nav class="center">
        <ul class="pagination">
            {{if page == 1}}
            <li class="disabled"><a href="javascript:void(0)">&laquo;</a></li>
            {{else}}
            <li>
                <a href="javascript:void(0)" class="prev"><span>&laquo;</span></a>
            </li>
            {{/if}}
            {{each(i,v) pages}}
            {{if v == page}}
            <li class="active"><a href="javascript:void(0)">{{= v}}</a></li>
            {{else v ==8}}
            <li><a>...</a></li>
            {{else}}
            <li>
                <a href="javascript:void(0)" class="clickpage"><span>{{= v}}</span></a>
            </li>
            {{/if}}
            {{/each}}
            {{if page == totalpage}}
            <li class="disabled"><a href="javascript:void(0)">&raquo;</a></li>
            {{else}}
            <li>
                <a href="javascript:void(0)" class="next"><span>&raquo;</span></a>
            </li>
            {{/if}}
        </ul>
    </nav>
</script>
<script type="text/html" id="oneRecordTemplate">
    {{each recordPage}}
    <h3>{{= title}}</h3>
    {{each page.items}}
    <div class="col-md-3" recordid="{{= id}}" type="{{= type}}" recordtypeid="
            {{if recordTypeId != null}}
            	{{= recordTypeId}}
            {{else}}
           		{{= recordtypeid}}
            {{/if}}">
        <img src="<c:url value="/resources/images/content/document_128.png" />">

        <p><a href="javascript:void(0)"><span><b>
            {{if subject != ''}}
            {{= subject}}
            {{else}}
            暂未填写！
            {{/if}}
        </b></span></a></p>
    </div>
    {{/each}}
    {{/each}}
</script>
<script type="text/html" id="colTableTemplate">
    <%--<table class="table table-striped table-bordered bootstrap-datatable">
        <thead>
        <tr>
            <th id="th_actions" title="actions"><spring:message code="model.field.options"
                                                                text="Option"/></th>
            <th id="th_colname" title="colname"><spring:message code="model.field.colname"
                                                                text="colname"/></th>
            <th id="th_colwidth" title="colwidth"><spring:message code="model.field.colwidth"
                                                                  text="colwidth"/></th>

        </tr>
        </thead>
        <tbody class="table-tbody">

        {{each infos}}
        <tr>
            <td><input type="radio" id="colselect" name="colselect" value="{{= columnid}}"></td>
            <td>{{= columnname}}</td>
            <td>{{= columnwidth}}</td>
        </tr>
        {{/each}}

        </tbody>
    </table>--%>
    <form id="colSearchForm" name="colSearchForm" class="form-horizontal"
          action="<c:url value="/json/template/searchContent" />">
        <input name="page" type="hidden" value="1">
        {{if pattern == "0"}}
        <input name="size" type="hidden" value="2">
        {{else}}
        <input name="size" type="hidden" value="10">
        {{/if}}

        <input name="pattern" type="hidden" value="{{= pattern}}">
        <input name="tableid" type="hidden" value="{{= tableid}}">
        <input name="typeid" type="hidden" value="{{= recordtypeid}}">
        {{each(i,value) infos}}
        <p id="" class=""><span>{{= columnname}}=</span>
            <input type="hidden" class="columnwidth" value="{{= columnwidth}}">
            <input class="form-control" type="hidden" name="cols[{{= i}}].colid" value="{{= columnid}}">
            <input class="form-control colvalue" name="cols[{{= i}}].colvalue">
            <input class="form-control" type="hidden" name="cols[{{= i}}].indexorvalue" value="{{= indexorvalue}}">
        </p>
        {{/each}}
    </form>
</script>
<script type="text/html" id="colBasicTableField">

    <form id="colSearchForm" name="colSearchForm" class="form-horizontal"
          action="<c:url value="/json/recordtype/searchContent" />">
        <input name="page" type="hidden" value="1">
        <input name="size" type="hidden" value="10">
        <input name="pattern" type="hidden" value="{{= pattern}}">
        <input name="tableid" type="hidden" value="{{= tableid}}">
        <input name="typeid" type="hidden" value="{{= recordtypeid}}">

        <p id="" class=""><span>档号:</span>
            <input type="hidden" class="columnwidth" value="32">
            <input class="form-control" type="hidden" name="cols[0].colid" value="recordNo">
            <input class="form-control colvalue" name="cols[{{= 0}}].colvalue">
            <input class="form-control" type="hidden" name="cols[0].indexorvalue" value="0">
        </p>
        {{each(i,value) tableFields}}
        {{if i!=0}}
        {{if fieldName=='year'}}
        <p id="" class=""><span>{{= name}}</span>
            <input type="hidden" class="columnwidth" value="{{= length}}">
            <input class="form-control" type="hidden" name="cols[{{= i}}].colid" value="{{= fieldName}}">
            <input class="form-control" type="hidden" name="cols[{{= i}}].indexorvalue" value="1">
            <select class="form-control" name="cols[{{= i}}].colvalue">
                <option value=''>全部</option>
                {{each years}}
                <option value={{= id}}>{{= name}}</option>
                {{/each}}
            </select>
        </p>
        {{else fieldName=='department'}}
        <p id="" class=""><span>{{= name}}</span>
            <input type="hidden" class="columnwidth" value="{{= length}}">
            <input class="form-control" type="hidden" name="cols[{{= i}}].colid" value="{{= fieldName}}">
            <input class="form-control" type="hidden" name="cols[{{= i}}].indexorvalue" value="1">
            <select class="form-control" name="cols[{{= i}}].colvalue">
                <option value=''>全部</option>
                {{each departments}}
                <option value={{= id}}>{{= name}}</option>
                {{/each}}
            </select>
        </p>
        {{else fieldName=='deadline'}}
        <p id="" class=""><span>{{= name}}</span>
            <input type="hidden" class="columnwidth" value="{{= length}}">
            <input class="form-control" type="hidden" name="cols[{{= i}}].colid" value="{{= fieldName}}">
            <input class="form-control" type="hidden" name="cols[{{= i}}].indexorvalue" value="1">
            <select class="form-control" name="cols[{{= i}}].colvalue">
                <option value=''>全部</option>
                {{each deadlines}}
                <option value={{= id}}>{{= name}}</option>
                {{/each}}
            </select>
        </p>
        {{else valueorindex==1}}
        <p id="" class=""><span>{{= name}}</span>
            <input type="hidden" class="columnwidth" value="{{= length}}">
            <input class="form-control" type="hidden" name="cols[{{= i}}].colid" value="{{= fieldName}}">
            <input class="form-control" type="hidden" name="cols[{{= i}}].indexorvalue" value="1">
            <select class="form-control" name="cols[{{= i}}].colvalue">
                <option value=''>全部</option>
                {{each datas}}
                <option value={{= id}}>{{= name}}</option>
                {{/each}}
            </select>
        </p>
        {{else}}
        <p id="" class=""><span>{{= name}}:</span>
            <input type="hidden" class="columnwidth" value="{{= length}}">
            <input class="form-control" type="hidden" name="cols[{{= i}}].colid" value="{{= fieldName}}">
            <input class="form-control colvalue" name="cols[{{= i}}].colvalue">
            <input class="form-control" type="hidden" name="cols[{{= i}}].indexorvalue" value="0">
        </p>
        {{/if}}
        {{/if}}
        {{/each}}
    </form>
</script>

<script type="text/html" id="recordBasicTableField">

    <form id="volumeSearchForm" name="volumeSearchForm" class="form-horizontal"
          action="<c:url value="/json/recordtype/searchVolumeContent" />">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active">
                <a href="#volumeData" data-toggle="tab">案卷字段</a>
            </li>
            <li><a href="#recordData" data-toggle="tab">卷内字段</a></li>
        </ul>

        <input name="id" type="hidden" value="">
        <input name="page" type="hidden" value="1">
        <input name="size" type="hidden" value="10">
        <input name="typeid" type="hidden" value="{{= typeid}}">
        <input name="tableprefix" type="hidden" value="{{= tableprefix}}">

        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="volumeData">
                <p id="" class=""><span>案卷号:</span>
                    <input type="hidden" class="columnwidth" value="32">
                    <input class="form-control" type="hidden" name="volume[0].colid" value="volumeNo">
                    <input class="form-control colvalue" name="volume[0].colvalue">
            <input class="form-control" type="hidden" name="volume[0].indexorvalue" value="{{= valueorindex}}">
                </p>
                {{each(i,value) volumeFields}}
                {{if i!=0}}
                {{if fieldName=='year'}}
                <p id="" class=""><span>{{= name}}:</span>
                    <input type="hidden" class="columnwidth" value="{{= length}}">
                    <input class="form-control" type="hidden" name="volume[{{= i}}].colid" value="{{= fieldName}}">
            <input class="form-control" type="hidden" name="volume[{{= i}}].indexorvalue" value="1">
                    <select class="form-control" name="volume[{{= i}}].colvalue">
                        <option value=''>全部</option>
                        {{each years}}
                        <option value={{= id}}>{{= name}}</option>
                        {{/each}}
                    </select>
                </p>
                {{else fieldName=='department'}}
                <p id="" class=""><span>{{= name}}:</span>
                    <input type="hidden" class="columnwidth" value="{{= length}}">
                    <input class="form-control" type="hidden" name="volume[{{= i}}].colid" value="{{= fieldName}}">
            <input class="form-control" type="hidden" name="volume[{{= i}}].indexorvalue" value="1">
                    <select class="form-control" name="volume[{{= i}}].colvalue">
                        <option value=''>全部</option>
                        {{each departments}}
                        <option value={{= id}}>{{= name}}</option>
                        {{/each}}
                    </select>
                </p>
                {{else fieldName=='deadline'}}
                <p id="" class=""><span>{{= name}}:</span>
                    <input type="hidden" class="columnwidth" value="{{= length}}">
                    <input class="form-control" type="hidden" name="volume[{{= i}}].colid" value="{{= fieldName}}">
            <input class="form-control" type="hidden" name="volume[{{= i}}].indexorvalue" value="1">
                    <select class="form-control" name="volume[{{= i}}].colvalue">
                        <option value=''>全部</option>
                        {{each deadlines}}
                        <option value={{= id}}>{{= name}}</option>
                        {{/each}}
                    </select>
                </p>
                {{else}}
                <p id="" class=""><span>{{= name}}:</span>
                    <input type="hidden" class="columnwidth" value="{{= length}}">
                    <input class="form-control" type="hidden" name="volume[{{= i}}].colid" value="{{= fieldName}}">
                    <input class="form-control colvalue" name="volume[{{= i}}].colvalue">
            <input class="form-control" type="hidden" name="volume[{{= i}}].indexorvalue" value="{{= valueorindex}}">
                </p>
                {{/if}}
                {{/if}}
                {{/each}}

            </div>
            <div class="tab-pane fade" id="recordData">
                <p id="" class=""><span>档号:</span>
                    <input type="hidden" class="columnwidth" value="32">
                    <input class="form-control" type="hidden" name="record[0].colid" value="recordNo">
                    <input class="form-control colvalue" name="record[0].colvalue">
            <input class="form-control" type="hidden" name="record[0].indexorvalue" value="{{= valueorindex}}">
                </p>
                {{each(i,value) recordFields}}
                {{if i>4}}
                <p id="" class=""><span>{{= name}}:</span>
                    <input type="hidden" class="columnwidth" value="{{= length}}">
                    <input class="form-control" type="hidden" name="record[{{= (i-4)}}].colid" value="{{= fieldName}}">
                    <input class="form-control colvalue" name="record[{{= (i-4)}}].colvalue">
            <input class="form-control" type="hidden" name="record[{{= i-4}}].indexorvalue" value="{{= valueorindex}}">
                </p>
                {{/if}}
                {{/each}}
            </div>
        </div>
    </form>
</script>
<script type="text/html" id="colButtonTemplate">
    {{each(i,value) templates}}
    <div class="col-md-3">
        <a class="btn btn-primary commonWidthButton">{{= value}}</a>
    </div>
    {{/each}}
</script>
<script type="text/html" id="searchColAndValueTemplate">
    <form class="form-horizontal" name="colSearchForm" id="colSearchForm"
          action="<c:url value="/json/template/searchContentByOneColumn"   />">
        <input type="hidden" name="page" value="1">
        <input type="hidden" name="size" value="10">
        <input type="hidden" name="pattern" value="{{= pattern}}">


        <div class="form-group">
            <label class="control-label col-md-2">字段名</label>

            <div class="col-md-3">
                <input id="colname" name="cols[0].colname" class="form-control">
                <label class="colname-error"></label>
            </div>
            <div class="col-md-1">
                <%--<a class="btn btn-primary getTemCol"><i class="glyphicon glyphicon-import"></i></a>--%>
            </div>
            <label class="control-label col-md-2">值</label>

            <div class="col-md-3">
                <input name="cols[0].colvalue" class="form-control">
                <label class="colvalue-error"></label>
            </div>
        </div>

    </form>
    <h2>所有可选字段</h2>
    <div class="row">


        <div class="col-md-12 temColArea">

        </div>


    </div>

</script>
<script type="text/html" id="addFieldTemplate">
    <div class="row">

        <div class="col-md-6">
            <h3>选择具体模板</h3>
            {{if templates.length ==0}}
            <div class="alert alert-info"><strong>暂无模板！</strong></div>
            {{else}}
            <div id="jstree">
                <!-- in this example the tree is populated from inline HTML -->
                <ul>
                    {{each templates}}
                    <li class="jstree-open"
                        id="{{= fonds.id}}"
                        title="{{= fonds.name}}">{{= fonds.name}}
                        <ul>
                            {{each recordTypeViews}}
                            <li class="jstree-open"
                                id="{{= recordType.id}}"
                                title="{{= recordType.name}}">{{= recordType.name}}
                                <ul>
                                    {{each templateList}}
                                    <li data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
                                        id="{{= tableid}},{{= piecetableid}}"
                                        class="leaf">
                                        {{= name}}
                                    </li>
                                    {{/each}}
                                </ul>
                            </li>
                            {{/each}}
                        </ul>
                    </li>
                    {{/each}}
                </ul>
            </div>
            {{/if}}
            <%--<select class="addFieldSelect col-md-12 form-control">
                {{each templates}}
                <optgroup label="{{= fonds.name}}">
                    {{each recordTypeViews}}
                    <optgroup label="{{= recordType.name}}">
                        {{each templateList}}
                        <option>{{= name}}</option>
                        {{/each}}
                    </optgroup>
                    {{/each}}
                </optgroup>
                {{/each}}
            </select>--%>
        </div>
        <h3>模板字段</h3>

        <div class="well col-md-6 addFieldColumn">

        </div>
    </div>
    <div class="row center">


    </div>

</script>
<style>
    .addFieldColumn {
        overflow-y: scroll
    }
</style>
<script type="text/html" id="basicRecordField">
    <div class="row">

        <div class="col-md-6">
            <h3>选择档案类型</h3>

            <div id="jstree">
                <!-- in this example the tree is populated from inline HTML -->
                <ul>
                    {{each fondsTrees}}
                    <li class="jstree-open"
                        id="{{= fonds.id}}"
                        title="{{= fonds.name}}">{{= fonds.name}}
                        <ul>
                            {{each recordTypes}}
                            <li class="jstree-open recordtypefield" data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
                                id="{{= id}}" type="{{= type}}"
                                title="{{= name}}">{{= name}}
                            </li>
                            {{/each}}
                        </ul>
                    </li>
                    {{/each}}
                </ul>
            </div>
        </div>
        <h3>字段</h3>

        <div class="well col-md-6 addFieldColumn">

        </div>
    </div>
    <div class="row center">


    </div>
</script>

<script type="text/html" id="luceneField">
    <div class="row">

        <div class="col-md-6">
            <h3>选择档案类型</h3>

            <div id="jstree">
                <!-- in this example the tree is populated from inline HTML -->
                <ul>
                    {{each fondsTrees}}
                    <li class="jstree-open"
                        id="{{= fonds.id}}"
                        title="{{= fonds.name}}">{{= fonds.name}}
                        <ul>
                            {{each recordTypes}}
                            <li class="jstree-open recordtypefield" data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
                                id="{{= id}}" type="{{= type}}"
                                title="{{= name}}">{{= name}}
                            </li>
                            {{/each}}
                        </ul>
                    </li>
                    {{/each}}
                </ul>
            </div>
        </div>
        <h3>搜索条件</h3>

        <div class="well col-md-6" id="input_area" style="display:none">
                <div class="box-content">
                            <textarea class="form-control" rows="7" autocomplete="off" name="indexsearchKey" id="indexsearchKey"></textarea>
                            <label id="indexsearchKey-error" class="ferror" style="display:none">
                                <i class="glyphicon glyphicon-remove"></i>请输入内容！</label>

                </div>
    			<div class="row center">
                            <button class="btn btn-success" onclick="indexSearch(1)"><i
                                    class="glyphicon glyphicon-search"></i>搜索
                            </button>
    			</div>
        </div>
    </div>
</script>
<div class="modal fade " id="indexSearch" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="">
                    全文检索
                </h4>
            </div>
            <div class="modal-body">
            </div>

        </div>
    </div>
</div>


<script type="text/html" id="VolumeRecordData">
    <div class="alert alert-info">共有<b><strong>{{= volumes.page.totalCount}}</strong></b>条符合搜寻条件的案卷！</div>
    <div class="table-content">
        <table class="table table-striped table-bordered responsive">
            <thead>
            <tr>
                <th id="th_operation" title="操作">操作</th>
                <th id="th_volumeNo" title="案卷号">案卷号</th>
				{{each tableFields}}
					{{if fieldName!='fondsid'&&fieldName!='volumeNo'&&fieldName!='timerange'}}
                		<th id="th_{{= fieldName}}" >{{= name}}</th>
					{{/if}}
				{{/each}}
				<!--
                <th id="th_" title=""></th>
                {{each tableFields}}
                {{if fieldName!='fondsid'}}
                <th id="th_{{= fieldName}}" >{{= name}}</th>
                {{/if}}
                {{/each}}
                <th id="th_operation">操作</th>
				-->
            </tr>
            </thead>
            <tbody>
            {{if volumes.length == 0}}
            <tr>
                <td style="display:none">无</td>
                <td colspan="20" class="center">表中数据为空！</td>
            </tr>
            {{else}}

            	{{each volumes.page.items}}
            		<tr>
                		<td class="operation" >
                    		<a href="javascript:void(0)" class="btn btn-success intoResultRecord" title="查看符合条件的卷内记录" volumeId="{{= volumeId}}">
								<i class="glyphicon glyphicon-list-alt"></i></a>
                    		<a href="javascript:void(0)" class="btn btn-success intoRecord" title="查看全部卷内记录" volumeId="{{= volumeId}}">
								<i class="glyphicon glyphicon-folder-open"></i></a>
						</td>
					{{each volumeFields}}
						{{if name=='volumeNo'}}
                			<td class="{{= name}}">{{= fieldvalue=='null'?'':fieldvalue}}</td>
						{{/if}}
					{{/each}}
					{{each volumeFields}}
						{{if name!='fondsid'&&name!='volumeNo'&&name!='timerange'}}
                			<td class="{{= name}}">{{= fieldvalue=='null'?'':fieldvalue}}</td>
						{{/if}}
					{{/each}}
            		</tr>
            	{{/each}}
			<!--
            {{each volumes.page.items}}
            <tr>
                <td id="th_">
                </th>
                {{each volumeFields}}
                {{if name!='fondsid'}}
                <td class="{{= name}}">{{= fieldvalue=='null'?'':fieldvalue}}</td>
                {{/if}}
                {{/each}}
                <td class="operation">
                    <a href="javascript:void(0)" class="btn btn-success intoRecord" title="打开案卷"
                       volumeId="{{= volumeId}}"><i class="glyphicon glyphicon-folder-open"></i></a>
                </td>
            </tr>
            {{/each}}
			-->
            {{/if}}
            </tbody>
        </table>
    </div>
    <nav class="center">
        <ul class="pagination">
            {{if volumes.page.pageNum == 1}}
            <li class="disabled"><a href="javascript:void(0)">&laquo;</a></li>
            {{else}}
            <li>
                <a href="javascript:void(0)" class="volumePrev"><span>&laquo;</span></a>
            </li>
            {{/if}}
            {{each(i,v) volumes.showPages}}
            {{if v == volumes.page.pageNum}}
            <li class="active"><a href="javascript:void(0)">{{= v}}</a></li>
            {{else v == 0}}
            <li><a>...</a></li>
            {{else}}
            <li>
                <a href="javascript:void(0)" class="volumeClickpage"><span>{{= v}}</span></a>
            </li>
            {{/if}}
            {{/each}}
            {{if volumes.page.pageNum == volumes.page.totalPage}}
            <li class="disabled"><a href="javascript:void(0)">&raquo;</a></li>
            {{else}}
            <li>
                <a href="javascript:void(0)" class="volumeNext"><span>&raquo;</span></a>
            </li>
            {{/if}}
        </ul>
    </nav>

</script>
<script type="text/html" id="RecordDetailData">
{{if records!=null&&records!='null'}}
	<h2>{{= records.title}}（卷内目录）<span ><strong><b class="patterntext"></b></strong></span></h2>
	
	<div class="row">
	      <div class="col-md-12 well">
    	<div class="alert alert-info">共有<b><strong>{{= records.page.items.length}}</strong></b>条卷内档案！</div>
    <div class="table-content" style="height:600px">
        <table class="table table-striped table-bordered responsive">
            <thead>
            <tr>
                <th id="th_operation">操作</th>
                <th id="th_recordNo">档号</th>
				{{each recordField}}
					{{if fieldid != null&&fieldName!='recordNo'}}
                		<th id="th_{{= fieldName}}">{{= name}}</th>
					{{/if}}
				{{/each}}
            </tr>
            </thead>
            <tbody>
            {{if records.page.items.length == 0}}
            <tr>
                <td style="display:none">无</td>
                <td colspan="20" class="center">表中数据为空！</td>
            </tr>
            {{else}}
            {{each records.page.items}}
            <tr>
                <td class="operation">
                    <a class="btn btn-success viewDocument" title="查看具体信息" recordtypeid="{{= recordtypeid}}" recordid="{{= id}}" type='_record'><i class="glyphicon glyphicon-check"></i></a>
				</td>
				{{each fields}}
					{{if fieldname=="recordNo"}}
                		<td class="{{= fieldname}}">{{= value=='null'?'':value}}</td>
					{{/if}}
				{{/each}}
				{{each fields}}
					{{if fieldname!="id"&&fieldname!="recordNo"}}
                		<td class="{{= fieldname}}">{{= value=='null'?'':value}}</td>
					{{/if}}
				{{/each}}
            </tr>
            {{/each}}
            {{/if}}
            </tbody>
        </table>

    </div>
    {{/if}}
<!--
    <h2>{{= records.title}}（卷内目录）<span><strong><b class="patterntext"></b></strong></span></h2>

    <div class="row">
        <div class="col-md-12 well">
            <div class="alert alert-info">共有<b><strong>{{= records.page.items.length}}</strong></b>条卷内档案！</div>
            <div class="table-content">
                <table class="table table-striped table-bordered responsive">
                    <thead>
                    <tr>
                        <th id="th_"></th>
                        {{each recordField}}
                        {{if fieldid != null}}
                        <th id="th_{{= fieldname}}">{{= name}}</th>
                        {{/if}}
                        {{/each}}
                        <th id="th_operation">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    {{if records.page.items.length == 0}}
                    <tr>
                        <td style="display:none">无</td>
                        <td colspan="20" class="center">表中数据为空！</td>
                    </tr>
                    {{else}}
                    {{each records.page.items}}
                    <tr>
                        <td id="th_" >
                        </th>
                        {{each fields}}
                        {{if fieldname!="id"}}
                        <td class="{{= fieldname}}">{{= value=='null'?'':value}}</td>
                        {{/if}}
                        {{/each}}
                        <td class="operation">
                            <a class="btn btn-success viewDocument" title="查看具体信息" recordtypeid="{{= recordtypeid}}"
                               recordid="{{= id}}" type='_record'><i class="glyphicon glyphicon-check"></i></a>
                        </td>
                    </tr>
                    {{/each}}
                    {{/if}}
                    </tbody>
                </table>
            </div>

        </div>
-->
</script>

<script type="text/x-jquery-impl" id="memberListTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4>查看用户拥有的团队成员</h4>
        </div>
        <div class="modal-body">
                <div class="box-content">
                    <table class="table table-striped table-bordered responsive">
                        <thead>
                        <tr>
                            <th id="th_teamusername" title="teamusername"><spring:message code="model.member.name"
                                                                                          text="Name"/></th>
                            <th id="th_sex" title="sex"><spring:message
        code="model.member.sex" text="sex"/></th>
                            <th id="th_grade" title="grade"><spring:message
        code="model.member.grade" text="grade"/></th>
                            <th id="th_profession" title="profession"><spring:message
        code="model.member.profession" text="profession"/></th>
                            <th id="th_work" title="work"><spring:message
        code="model.member.work" text="work"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        {{each members}}
                        <tr id="">
                            <td>{{= teamusername}}</td>
                            <td>
                                {{if sex == true}}
                                    <img src="<c:url value="/resources/images/gender/male.png"/>" >
                                {{else}}
                                    <img src="<c:url value="/resources/images/gender/female.png"/>" >
                                {{/if}}
                            </td>
                            <td>{{= grade}}</td>
                            <td>{{= profession}}</td>
                            <td>{{= work}}</td>
                        </tr>
                        {{/each}}
                        </tbody>
                    </table>
                </div>
        </div>
        <div class="modal-footer">
                <a href="javascript:void(0)" class="btn btn-primary" data-dismiss="modal"><i class="glyphicon glyphicon-share-alt"></i>
                    <spring:message code="href.close" text="Close"/></a>
        </div>
    </div>














































































































































































































































































































</script>
<spring:message code="deleteform.message.failed" text="Delete failed!" var="message_delete_failed"/>
<spring:message code="deleteform.message.success" text="Delete success!" var="message_delete_success"/>
<spring:message code="check.success" text="Check Success" var="message_check_success"/>
<spring:message code="check.failure" text="Check Failure" var="message_check_failure"/>
<div class="modal fade " id="checkModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog checkModal">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    <!-- 计算机学院2016届毕业生档案 -->
                </h4>
            </div>
            <div class="modal-body">
                <div class="box-content">
                    <div class="btn-group pull-left"></div>
                    <div class="clearfix"></div>
                    <div class="col-md-9 pull-left fileContent"
                         style="background:#fff;border-radius:5px;border: 1px #ccc solid;">

                        <!-- 标签页开始 -->
                        <div class="col-sm-4  center-block" style="background:#fff">
                            <ul id="myTab" class="nav nav-tabs center-block">
                                <li class="active"><a href="#home" data-toggle="tab">文件信息</a></li>
                                <li><a href="#ios" data-toggle="tab">自定义档案信息</a></li>
                            </ul>
                        </div>
                        <div id="myTabContent" class="tab-content" style="height:94%">
                            <div class="tab-pane fade in active" id="home" style="height:90%">
                                <select class="form-control choosefile"></select>
                                <iframe id="openfileframe" name="openfile" height="100%" width="100%" frameborder="no"
                                        scrolling="no"></iframe>
                            </div>
                            <div class="tab-pane fade" id="ios" style="overflow:auto;height:98%;width:100%">
                                <table></table>
                            </div>
                        </div>
                        <!-- 标签页结束 -->

                    </div>
                    <div class="col-md-3 pull-right wordContent"
                         style="background:#fff;border-radius:5px;border: 1px #ccc solid;"></div>
                </div>
            </div>

            <div class="modal-footer">
            </div>

        </div>
    </div>
</div>


<div class="modal" id="commonModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="width:800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="head"></h4>
            </div>
            <div class="modal-body">
				    <div class="well row center reasonDiv">
						<input name="checkbox" type="checkbox" value="40">查看附件
						<input name="checkbox" type="checkbox" value="41">下载附件
						<input name="checkbox" type="checkbox" value="42">打印
						<br>
						<br>
						<textarea class="form-control" placeholder="请填写申请理由（可不填）"></textarea>
					</div>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary confirm"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">提交申请</span></strong></a>
                <a class="btn btn-primary cancel"
                   data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">取消</span></strong></a>
            </div>
        </div>
    </div>
</div>
<style>
    .checkModal {
        width: 90%;
        height: 700px
    }

    .checkModal .fileContent {
        height: 600px;
    }

    .checkModal .wordContent {
        height: 600px
    }

</style>

<script>
    /*function checkcondition() {
     var starttime = $("#starttime").val();
     var startdate = new Date(starttime);
     var endtime = $("#endtime").val();
     var enddate = new Date(endtime);
     if (startdate.getTime() > enddate.getTime()) {
     alert("搜索提示：起始日期必须小于结束日期！请重新选择日期！！");
     return false;
     }
     }*/
     $(document).on('click', '.putApplication', function (e) {
          $("#commonModal3 .modal-header .head").text("申请权限");
          $("#commonModal3").modal("show");
          $("#commonModal3 .confirm").attr("recordid",$(this).attr("recordid"));
          $("#commonModal3 .confirm").attr("recordtypeid",$(this).attr("recordtypeid"));
          $("#commonModal3 .confirm").attr("type",$(this).attr("type"));
    });  
     $(document).on('click', '#commonModal3 .confirm', function (e) {
     	var permissionInput = $(".reasonDiv input[type=checkbox]:checked");
     	
     	var accesspermission = new Array();
     	for(var i=0;i<permissionInput.length;i++){
     		accesspermission.push(permissionInput.eq(i).val())
     	}
     	//var record = $("input.checkradio[type=checkbox]:checked").closest("tr");
     	var recordtypeid = $(this).attr("recordtypeid");
     	var recordid = $(this).attr("recordid");
     	var type = $(this).attr("type");
     	//var subject = record.attr("subject");
     	var reason = $(".reasonDiv textarea").val();
     	//alert(recordtypeid+" "+type+" "+recordid+" "+subject+" "+reason+" "+accesspermission);
     	$.ajax({
             type: "POST",
             url: "<c:url value="/json/archives/sendApplication"  />",
             data: {recordtypeid:recordtypeid,type:type,recordid:recordid,reason:reason,accesspermission:accesspermission.join(",")},
             success: function (result) {
                 $("#commonModal3").modal("hide");
             	if(result.status==1){
                     noty({
                         text: "提交申请成功！",
                         layout: "top",
                         type: "success",
                         timeout: 1000,
                         onClosed: function () {
                         	//inToPage(-1);
                         }
                     });
             	}else if(result.status==-1){
                    noty({
                        text: "请勿重复提交！",
                        layout: "top",
                        type: "failure",
                        timeout: 1000
                    });
            	}else{
                    noty({
                        text: "提交申请失败！",
                        layout: "top",
                        type: "failure",
                        timeout: 1000
                    });
            	}
             }
         });
     });
     function showVideo(filePath) {//<strong>温馨提示：您的Flash Player版本过低，请<a href="http://www.CuPlayer.com/">点此进行网页播放器升级</a>！</strong>
    		$("#CuPlayer").remove();$("#wrapper").remove();
         var html = '<div class="video" id="CuPlayer" style="height:100%;width:100%"></div>';
         //alert($(".fileContent iframe").length);
         $(".fileContent iframe").before(html);
         $(".fileContent iframe").hide();
         var so = new SWFObject('<c:url value="/resources/js/cuplayer/CuPlayerMiniV4.swf"/>', "CuPlayerV4", "100%", "100%", "9", "#000000");
         so.addParam("allowfullscreen", "true");
         so.addParam("allowscriptaccess", "always");
         so.addParam("wmode", "opaque");
         so.addParam("quality", "high");
         so.addParam("salign", "lt");
         so.addVariable("CuPlayerSetFile", '<c:url value="/resources/js/cuplayer/CuPlayerSetFile.xml"/>'); //播放器配置文件地址,例SetFile.xml、SetFile.asp、SetFile.php、SetFile.aspx
         //window.open("<c:url value='/file/openfile'/>?filepath="+filePath);
         so.addVariable("CuPlayerFile", "<c:url value='/file/openfile'/>?filepath="+filePath); //视频文件地址
         so.addVariable("CuPlayerImage", '<c:url value="/resources/images/videoStop.jpg"/>');//视频略缩图,本图片文件必须正确
         so.addVariable("CuPlayerWidth", "600"); //视频宽度
         so.addVariable("CuPlayerHeight", "410"); //视频高度
         so.addVariable("CuPlayerAutoPlay", "yes"); //是否自动播放
         so.write("CuPlayer");
     }
     function showMusic(filePath){
 		$("#CuPlayer").remove();$("#wrapper").remove();
     	var html='<div id="wrapper"><audio preload="auto" controls><source src="'+'<c:url value='/file/openfile'/>?filepath='+filePath+'"></audio></div>';
     	$(".fileContent iframe").before(html);
         $(".fileContent iframe").hide();
    	$( '#wrapper audio' ).audioPlayer({
			strPlay: '暂停',
			strPause: '播放',
			strVolume: '声音'
		}); 
     }
    function getFileName(url) {
        if (url.split("\\").length == 1)
            url = url.split("/");
        else
            url = url.split("\\");//这里要将 \ 转义一下
        return url[url.length - 1];
    }
    function getSuffix(url) {
        if (url.split("\\").length > 0)
            url = url.split("/");
        else
            url = url.split("\\");//这里要将 \ 转义一下
        var suffix = url[url.length - 1].split(".");
        return suffix[suffix.length - 1].toLowerCase();
    }function biggerImage(){
    	var img = $(".fileContent iframe").contents().find("img");
    	var width = img.width();
    	var height = img.height();
    	img.width(width*1.1);
    	img.height(height*1.1);
    }
    function smallerImage(){
    	var img = $(".fileContent iframe").contents().find("img");
    	var width = img.width();
    	var height = img.height();
    	img.width(width*0.9);
    	img.height(height*0.9);
    }
    $(document).on("click", ".recordArea div.col-md-3", function () {
        var recordid = $(this).attr("recordid");
        var type = $(this).attr("type");
        var recordtypeid = $(this).attr("recordtypeid").replace(/[\r\n]/g, "").replace(/\s+/g, "");
        getDetail(recordid, type, recordtypeid);
    });
    $(document).on("click", ".viewDocument", function () {
        var recordid = $(this).attr("recordid");
        var type = $(this).attr("type");
        var recordtypeid = $(this).attr("recordtypeid").replace(/[\r\n]/g, "").replace(/\s+/g, "");
        //alert(recordid+" "+type+" "+recordtypeid);
        getDetail(recordid, type, recordtypeid);
    });
    /*      $(document).on("click",".intoRecord",function(){
     $("h2").css("color","");
     $($(this).attr("href")).css("color","#f00");
     }); */
     

     var viewfile = false, downloadfile = false, print = false, accessrecord = false;
     $(document).on("click", ".printFile", function () {
    	 var path = $(this).attr("path");
     	if (!!window.ActiveXObject || "ActiveXObject" in window) {
     		$("#pdfprintdiv").remove();
     		$("body").append("<div id=\"pdfprintdiv\"></div>");
		    var pdfprintdiv = document.getElementById("pdfprintdiv");
		
		    var p = document.createElement("object");
		    try {
		        p.id = "createPDF";
		        p.classid = "CLSID:CA8A9780-280D-11CF-A24D-444553540000";
		        p.width = 1;
		        p.height = 1;
		        //p.setAttribute("src","<c:url value='/file/openfile'/>?filepath="+path)
			    var param = document.createElement("param");
		        param.name="SRC";
		        param.setAttribute("value","<c:url value='/file/printfile2'/>?filepath="+path);
		        //param.value="<c:url value='/file/downloadfile'/>?filepath="+path; ;
		        //p.src = "<c:url value='/file/openfile'/>?filepath="+path;// 处理中文名称
		        p.appendChild(param);
		        //alert("<c:url value='/file/openfile'/>?filepath="+path)
		        pdfprintdiv.appendChild(p);
		        p.printWithDialog();// 带打印窗口的直接打印
		        //p.printAll();//直接打印
		        //p.print();
		    } catch (e) {
		        // alert(e);
		        alert('提示：请确保已安装Adobe Reader，并开启Adobe加载项！');
		    } 
	    
     	}else{

         	$("#printIframe").remove(); 
         	$("body").append("<iframe style=\"display:none\" id=\"printIframe\" ></iframe>");

            $("#printIframe").load(function(){ 	
            	$("#printIframe")[0].contentWindow.print();
            }); 
        	 $("#printIframe").attr("src", "<c:url value='/file/printfile'/>?filepath="+path);
         	//alert("<iframe style=\"display:none\" id=\"printIframe\" src=\"<c:url value='/file/openfile'/>?filepath="+path+"\"></iframe>"); 
     	}
    });
    function getDetail(recordid, type, recordtypeid) {

       	$("#CuPlayer").remove();
      	$("#wrapper").remove();
        $(".fileContent iframe").show();
        $.get("<c:url value='/json/record/checkdetail'  />", {
            recordid: recordid,
            recordtypeid: recordtypeid,
            type: type
        }, function (data, s, xh) {
        	viewfile = false,downloadfile = false,print = false,accessrecord = false;
            $.each(data.codes, function (index, content) {

                if (content == 'viewfile') {
                    viewfile = true;
                }
                else if (content == 'downloadfile') {
                    downloadfile = true;
                }
                else if (content == 'print') {
                    print = true;
                }
                else if (content == 'accessrecord') {
                    accessrecord = true;
                }
            })
            if (!accessrecord) {
                noty({
                    text: "暂无权限。<button class=\"putApplication\" recordid=\""+recordid+"\" type=\""+type+"\" recordtypeid=\""+recordtypeid+"\">申请权限</button>",
                    layout: "top",
                    type: "failure",
                    timeout: 10000,
                });
                return;
            }
            $("#checkModal .modal-body select.choosefile").html("");
    		$("#checkModal .modal-footer").html("");
            if (viewfile) {
                var documents = data.documents;
                if (documents != null && documents != '' && documents.length != 0) {
                    for (var i = 0; i < documents.length; i++) {
                        //$("#checkModal .modal-body select.choosefile").append("<option value='<c:url value='/'/>"+documents[i].path+"'>"+getFileName(documents[i].path)+"</option>");
                        $("#checkModal .modal-body select.choosefile").append("<option value='" + documents[i].path + "'>" + getFileName(documents[i].path) + "</option>");
                    }
                    var file_path = encodeURI(encodeURI(documents[0].path));
                    var suffix = getSuffix(file_path);
                    if ($.inArray(suffix, PdfExtension) != -1 || $.inArray(suffix, OfficeExtension) != -1) {
                        $(".fileContent iframe").attr("src", "<c:url value='/jsp/pdf.jsp'/>?url=" + file_path);
                        $(".fileContent iframe").attr("scrolling", "no");
                        if (downloadfile)
                            $("#checkModal .modal-footer").html(
                                    " <a href=\"<c:url value='/file/downloadfile'/>?filepath=" + file_path + "\" class=\"btn btn-success\">" +
                                    "    		保存至本地" +
                                    " </a>"
                            );
                        if (print) {
                        	if($.inArray(suffix, OfficeExtension) == -1)
	                            $("#checkModal .modal-footer").append(
	                                    " <a href=\"javascript:void(0)\" class=\"btn btn-success openPicture\">" +
	                                    "    		编辑档案该页" +
	                                    " </a>"
	                            );
                            $("#checkModal .modal-footer").append(
                                    " <a href=\"javascript:void(0)\" class=\"btn btn-success printFile\" path=\""+file_path+"\">" +
                                    "    		打印附件" +
                                    " </a>"
                            );
                            $(document).off("click", ".openPicture");
                            $(document).on("click", ".openPicture", function () {
                                var pagenum = 0;
                                if (document.getElementById('openfileframe') != null) {
                                    pagenum = document.getElementById('openfileframe').contentWindow.getPage();
                                }
                                window.open("<c:url value='/jsp/print.jsp'/>?url=" + file_path + "&pagenum=" + pagenum);
                            });
                        }
                    } else if ($.inArray(suffix, ImgExtension) != -1) {
                        $(".fileContent iframe").attr("src", "<c:url value='/jsp/image.jsp'/>");
                        $(".fileContent iframe").load(function(){ 	
                         	 $(".fileContent iframe").contents().find("img").attr("src", "<c:url value='/file/openfile'/>?filepath=" + file_path);
                        }); 
                        $(".fileContent iframe").attr("scrolling", "yes");
                        $("#checkModal .modal-footer").html("");
                        if (downloadfile)
                            $("#checkModal .modal-footer").html(
                                    " <a href=\"<c:url value='/file/downloadfile'/>?filepath=" + file_path + "\" class=\"btn btn-success\">" +
                                    "    		保存至本地" +
                                    " </a>"
                            );
                        if (print)
                            $("#checkModal .modal-footer").append(
                                    " <a href=\"<c:url value='/jsp/print.jsp'/>?url=" + file_path + "\" target=\"_blank\"  class=\"btn btn-success\">" +
                                    "    		编辑并打印 " +
                                    " </a>"
                            );
                        $("#checkModal .modal-footer").append(
                                " <a href=\"javascript:void(0)\" onclick='biggerImage()' class=\"btn btn-success\">" +
                                "    		放大" +
                                " </a>"
                        );
                        $("#checkModal .modal-footer").append(
                                " <a href=\"javascript:void(0)\" onclick='smallerImage()' class=\"btn btn-success\">" +
                                "    		缩小" +
                                " </a>"
                        );
                    } else if ($.inArray(suffix, VideoExtension) != -1) {
                        if (downloadfile)
                            $("#checkModal .modal-footer").html(
                                    " <a href=\"<c:url value='/file/downloadfile'/>?filepath=" + file_path + "\" class=\"btn btn-success\">" +
                                    "    		保存至本地" +
                                    " </a>"
                            );
                        window.showVideo("/" + file_path);
                    }else if($.inArray(suffix, MusicEXtension) != -1){
                        if (downloadfile)
                            $("#checkModal .modal-footer").html(
                                    " <a href=\"<c:url value='/file/downloadfile'/>?filepath=" + file_path + "\" class=\"btn btn-success\">" +
                                    "    		保存至本地" +
                                    " </a>"
                            );
                    	window.showMusic("/" + file_path);
                    }
                } else {
                    $(".fileContent iframe").attr("src", "");
                }

                //$("#checkModal .modal-footer .checkPass").attr("recordid",recordid);
            } else {
                $(".fileContent iframe").attr("src", "<c:url value='/jsp/noaccess.jsp'/>");
                $("#checkModal .modal-footer").append(
                        " <a recordid=\""+recordid+"\" type=\""+type+"\" recordtypeid=\""+recordtypeid+"\"class=\"btn btn-success putApplication\">" +
                        "    		申请权限" +
                        " </a>"
                );
            }

            var information = data.information;
            $("#checkModal .wordContent").html("<br><br>");
            if (information != null && information != '')
                for (var i = 0; i < information.length; i++) {
                    if (information[i].fieldvalue != null && information[i].fieldvalue != "" && information[i].fieldvalue != 'null')
                        $("#checkModal .wordContent").append("<p>" + information[i].name + ":<strong>" + information[i].fieldvalue + "</strong></p>");
                    if (information[i].fieldname == 'subject') {
                        if (information[i].fieldvalue != null && information[i].fieldvalue != "" && information[i].fieldvalue != 'null')
                            $("#myModalLabel").html(information[i].fieldvalue);
                        else
                            $("#myModalLabel").html("无题名");
                    }
                }

            var filecontent = data.filecontent;
            $("#ios").html("<table class='table table-striped'></table>");
            if (filecontent != null && filecontent != '' && filecontent.length != 0) {
                var tds = filecontent[0];
                var f_td = "";
                for (var i = 0; i < tds.length; i++)f_td += "<td>" + tds[i].columnname + "</td>";
                $("#ios table").append("<tr>" + f_td + "<tr>");
                for (var i = 0; i < filecontent.length; i++) {
                    var p = "";
                    for (var j = 0; j < filecontent[i].length; j++) {
                        p += "<td>" + filecontent[i][j].columnvalue + "</td>";
                    }
                    $("#ios table").append("<tr>" + p + "</tr>");
                }
            } else {
                $("#ios").append("<p>暂无内容</p>");
            }

            $("#checkModal .modal-footer").append(
                    " <a href=\"<c:url value='/archives/library'/>?recordtypeid=" + recordtypeid + "&recordid="+recordid+"&type="+type+"\" class=\"btn btn-success\">" +
                    "    		实物借阅 " +
                    " </a>"
            );
            $('#checkModal').modal('show');
        });
    }
    $(document).on("change", "#checkModal .modal-body select.choosefile", function () {
    	var file_path = encodeURI(encodeURI($(this).val()));
		var suffix = getSuffix($(this).val());
		$("#checkModal .modal-footer").html("");
     	if($.inArray(suffix, PdfExtension) != -1 || $.inArray(suffix, OfficeExtension) != -1){

            $(".fileContent iframe").attr("src","<c:url value='/jsp/pdf.jsp'/>?url="+file_path);
       		$(".fileContent iframe").attr("scrolling","no");
			 if(downloadfile){
               	$("#checkModal .modal-footer").html(
	   				           " <a href=\"<c:url value='/file/downloadfile'/>?filepath="+file_path+"\" class=\"btn btn-success\">"+
	   				           "    		保存至本地"+
	   				           " </a>"
	                 		);
			 }
			 if(print){
             	if($.inArray(suffix, OfficeExtension) == -1)
                    $("#checkModal .modal-footer").append(
                            " <a href=\"javascript:void(0)\" class=\"btn btn-success openPicture\">" +
                            "    		编辑档案该页" +
                            " </a>"
                    );
                $("#checkModal .modal-footer").append(
                        " <a href=\"javascript:void(0)\" class=\"btn btn-success printFile\" path=\""+file_path+"\">" +
                        "    		打印附件" +
                        " </a>"
                );
           		$(document).off("click",".openPicture");
				$(document).on("click",".openPicture",function(){
              		var pagenum =  0;
                     if (document.getElementById('openfileframe') != null) {
                     	pagenum = document.getElementById('openfileframe').contentWindow.getPage();
                     } 
                     window.open("<c:url value='/jsp/print.jsp'/>?url="+$(this).val()+"&pagenum="+pagenum);
				});
			 }
    	} else if ($.inArray(suffix, ImgExtension) != -1){

            $(".fileContent iframe").attr("src", "<c:url value='/jsp/image.jsp'/>");
            $(".fileContent iframe").load(function(){ 	
             	 $(".fileContent iframe").contents().find("img").attr("src", "<c:url value='/file/openfile'/>?filepath=" + file_path);
            }); 
            $(".fileContent iframe").attr("scrolling","yes");
            $("#checkModal .modal-footer").html("");
			 if(downloadfile){
              	$("#checkModal .modal-footer").html(
	   				           " <a href=\"<c:url value='/file/downloadfile'/>?filepath="+file_path+"\" class=\"btn btn-success\">"+
	   				           "    		保存至本地"+
	   				           " </a>"
	                 		);
			 }
				 if(print){
          		$("#checkModal .modal-footer").append(
				           " <a href=\"<c:url value='/jsp/print.jsp'/>?url="+file_path+"\" target=\"_blank\"  class=\"btn btn-success\">"+
				           "    		编辑并打印 "+
				           " </a>"
             		);
				 }
				 $("#checkModal .modal-footer").append(
                         " <a href=\"javascript:void(0)\" onclick='biggerImage()' class=\"btn btn-success\">" +
                         "    		放大" +
                         " </a>"
                 );
                 $("#checkModal .modal-footer").append(
                         " <a href=\"javascript:void(0)\" onclick='smallerImage()' class=\"btn btn-success\">" +
                         "    		缩小" +
                         " </a>"
                 );
    	}else if ($.inArray(suffix, VideoExtension) != -1) {
			 if(downloadfile){
	               	$("#checkModal .modal-footer").html(
		   				           " <a href=\"<c:url value='/file/downloadfile'/>?filepath="+file_path+"\" class=\"btn btn-success\">"+
		   				           "    		保存至本地"+
		   				           " </a>"
		                 		);
				 }
            window.showVideo("/" + file_path);
        }else if($.inArray(suffix, MusicEXtension) != -1){
			 if(downloadfile){
	               	$("#checkModal .modal-footer").html(
		   				           " <a href=\"<c:url value='/file/downloadfile'/>?filepath="+file_path+"\" class=\"btn btn-success\">"+
		   				           "    		保存至本地"+
		   				           " </a>"
		                 		);
				 }
        	 window.showMusic("/" + file_path);
        }
    });
    $(document).on("change", "#searchType", function () {
        if ($(this).val() == 4) {
            /* $("#pattern").css("display","none"); */
            $(".fileContent iframe").attr("src", "<c:url value='/jsp/pdf.jsp'/>?url=" + $(this).val());
            $(".fileContent iframe").attr("scrolling", "no");
        } else {
            /* $("#pattern").css("display",""); */
        }
    });

    function indexSearch(pagenum) {
        var currentPattern = $("#pattern").val();
        var indexsearchKey = $("#indexsearchKey").val();
        var recordtypeid = $("#indexsearchKey").attr("recordtypeid");
        var type = "_piece";
        if (currentPattern == 0)
            type = "_record";
        var label = $("#indexsearchKey-error");
        if (indexsearchKey == '') {
            label.show();
            return;
        } else {
            label.hide();
        }
        $.ajax({
            type: "POST",
            url: "<c:url value="/json/record/indexsearch"  />",
            data: {indexsearchKey: indexsearchKey, pagenum: pagenum, type: type, recordtypeid:recordtypeid},
            success: function (result) {

            	jQuery("html,body").animate({scrollTop:200},300); 
                $("#searchConditionArea").html("");
                $(".detailRecordArea").empty();
                var indexSearchResult = "";
                var items = result.searchResults.items;
                if (items.length == 0)
                    indexSearchResult = "<div class=\"alert alert-info\">无符合搜寻条件的结果！</div>";
                else {
                    var tbody = "";
                    $.each(items, function () {


                        var type = "", othertd = "", recordNo = this.recordno;
                        var s_num = recordNo.indexOf("S");
                        if (recordNo.indexOf("S-") > 0)
                        	recordNo.replace('S-','');
                            //recordNo = recordNo.substring(0, recordNo.indexOf("S-") - 1);
                        else if (recordNo.indexOf("S.") > 0)
                            //recordNo = recordNo.substring(0, recordNo.indexOf("S.") - 1);
                        	recordNo.replace('S.','');
                        else if (s_num > 0 && /^[0-9]+$/.test(recordNo.charAt(s_num + 1)))
                        	recordNo.replace('S','');
                            //recordNo = recordNo.substring(0, s_num - 1);
                        /* else
                            recordNo = recordNo.substring(0, recordNo.replace(".", "-").lastIndexOf("-")); */


                        if (this.type == '_record') {
                            type = "<td class=\"\">卷内</td>";
                            othertd = "<td class=\"\">" + recordNo + "</td>";
                        } else {
                            type = "<td class=\"\">按件</td>";
                        }
                        var countA = recordNo.replace(".", "-").split("-");
                        //alert(countA.length)
                        tbody += " 		<tr id=\"" + this.recordid + "\">" +
                                "    		<td class=\"\">" + this.subject + "</td>" + type +
                                "    		<td width=\"500px\">" + this.content + "</td>" +
                                othertd +
                                "    		<td class=\"\">" + this.recordno + "</td>" +
                                "    		<td class=\"\">" + (countA.length>0?countA[countA.length - 1]:1) + "</td>" +
                                "    		<td class=\"\">" +
                                "         		<a class=\"btn btn-success viewDocument\" title=\"查看具体信息\" recordtypeid=" + this.recordtypeid +
                                " recordid=" + this.recordid + "  type=\"" + this.type + "\">" +
                                "					<i class=\"glyphicon glyphicon-check\"></i></a>" +
                                "			</td>" +
                                "		</tr>";
                    });
                    var otherth = "";
                    if (currentPattern == 0)
                        otherth = "    <th id=\"th_path\" title=\"案卷号\">案卷号</th>";
                    indexSearchResult =
                            "<h3>符合搜寻条件的档案---<font color=\"red\">" + indexsearchKey + "</font></h3>" +
                            "<table class=\"table table-striped table-bordered table-content indexsearchtable\">" +
                            "<thead>" +
                            "<tr>" +
                            "    <th id=\"th_subject\" title=\"题名\">题名</th>" +
                            "    <th id=\"th_type\" title=\"类型\">类型</th>" +
                            "    <th id=\"th_keyword\" title=\"关键字\">关键字</th>" + otherth +
                            "    <th id=\"th_path\" title=\"档号\">档号</th>" +
                            "    <th id=\"th_path\" title=\"顺序号\">顺序号</th>" +
                            "    <th id=\"th_operation\" title=\"查看详情\">查看详情</th>" +
                            "</tr>" +
                            "</thead>" +
                            "<tbody>" +
                            tbody +
                            "</tbody>" +
                            "</table>";
                }

                var logPage = "<ul class=\"pagination\" >";
                var page = result.pages;
                if (pagenum == 1)
                    logPage += "<li class=\"disabled\"><a>&laquo;</a></li>";
                else
                    logPage += "<li> <a onclick=\"indexSearch(" + (pagenum - 1) + ")\"><span>&laquo;</span></a> </li>";
                //alert(logs.showPages);
                $.each(page, function (index, content) {
                    if (content == pagenum) {
                        logPage += "<li class=\"active disabled\"><a>" + content + "</a></li>";
                    } else if (content == 0) {
                        logPage += "<li><a>...</a></li>";
                    } else {
                        logPage += "<li><a onclick=\"indexSearch(" + content + ")\"><span>" + content + "</span></a> </li>";
                    }
                });
                if (pagenum == result.searchResults.totalPage)
                    logPage += "<li class=\"disabled\"><a>&raquo;</a></li>";
                else
                    logPage += "<li> <a onclick=\"indexSearch(" + (pagenum + 1) + ")\" ><span>&raquo;</span></a></li>";
                logPage += "</ul>";
                indexSearchResult += logPage;
                $(".recordArea").html(indexSearchResult);
                $(".recordArea").find(".pagination li:not(.disable)").css("cursor","pointer");
                $("#commonModal2").modal("hide");
            }
        });

    }
    /* $(document).on("click",".createIndex",function(){
     $.ajax({
     type: "POST",
     url: "<c:url value="/json/record/createIndex"  />",
     data: {indexsearchKey:$(this).parent().find("input[name=indexsearchKey]").val()},
     success: function (result) {
     if(result.status==1)
     alert("create success");
     }
     });

     });  */

    $(document).ready(function () {

        var currentPattern = $("#pattern").val();
        $(".addField").on("click", function (e) {
            currentPattern = $("#pattern").val();
            if ($("#searchType").val() == "0") {
                $.ajax({
                    type: "GET",
                    url: "<c:url value="/json/template/getAllTemplate"  />",
                    data: {},
                    success: function (result) {
                        console.log(result);
                        $("#commonModal2 .modal-body").empty();
                        $("#commonModal2 .modal-header .head").text("选择模板字段");
                        $("#addFieldTemplate").tmpl(result).appendTo($("#commonModal2 .modal-body"));
                        $("#jstree").jstree();
                        $("#commonModal2").modal("show");
                        $(".leaf a").on("click", function (e) {
                            var alltableid = $(this).attr("id");
                            var tableid = "";
                            if (currentPattern == "0") {
                                tableid = alltableid.split(",")[0];
                            } else if (currentPattern == "1") {
                                tableid = alltableid.split(",")[1].replace("_anchor", "");
                            }
                            var recordtypeid = $(this).closest(".jstree-open").attr("id");
                            $.ajax({
                                type: "GET",
                                url: "<c:url value="/json/template/getcolumn"  />",
                                data: {templateid: tableid},
                                success: function (result) {
                                    $("#commonModal2 .addFieldColumn").empty();
                                    result.tableid = tableid;
                                    result.pattern = $("#pattern").val();
                                    result.recordtypeid = recordtypeid;
                                    $("#colTableTemplate").tmpl(result).appendTo($("#commonModal2 .addFieldColumn"));
                                    $('#commonModal2 #colSearchForm').validate(
                                            {
                                                submitHandler: function (form) {
                                                    $(form).ajaxSubmit({
                                                        dataType: "json",
                                                        type: "post",
                                                        success: function (data, s, xhr) {
                                                            console.log(data);
                                                            $(".recordArea").empty();
                                                            $(".detailRecordArea").empty();
                                                            $("#searchConditionArea").html("");
                                                            data.recordtypeid = recordtypeid;
                                                            $("#recordVolumeArea").html("档案显示区<span ><strong><b class=\"patterntext\"></b></strong></span>");
                                                            if (currentPattern == "0") {
                                                                data.type = "_record";
                                                                $("#VolumeInnerTemplate").tmpl(data).appendTo($(".recordArea"));
                                                            }
                                                            else {
                                                                data.type = "_piece";
                                                                $("#PieceTemplate").tmpl(data).appendTo($(".recordArea"));
                                                            }
                                                            $(".clickpage").on("click", function (e) {
                                                                $("#commonModal2 #colSearchForm [name='page']").val($(this).find("span").text());
                                                                $("#commonModal2 #colSearchForm").submit();
                                                            });
                                                            $(".prev").on("click", function (e) {
                                                                var clickpage = Number($(".pagination .active a").text());
                                                                $("#commonModal2 #colSearchForm [name='page']").val(parseInt(clickpage) - 1);
                                                                $("#commonModal2 #colSearchForm").submit();
                                                            });
                                                            $(".next").on("click", function (e) {
                                                                var clickpage = Number($(".pagination .active a").text());
                                                                $("#commonModal2 #colSearchForm [name='page']").val(parseInt(clickpage) + 1);
                                                                $("#commonModal2 #colSearchForm").submit();
                                                            });
                                                        }
                                                    });
                                                    return false;
                                                },
                                                errorPlacement: function (error, element) {
                                                    error.replaceAll($("#" + $(element).attr("name") + "-error"));
                                                },
                                                success: function (label) {
                                                    label.text("${validate_message_ok}").addClass("valid");
                                                    label.removeClass("error");
                                                    label.html("有效");
                                                }
                                            });
                                    $("[name^='cols[']").each(function () {
                                        $(this).rules("add", {
                                            maxlength: $(this).siblings(".columnwidth").val(),
                                        });
                                    });
                                    $("#commonModal2 .confirm").on("click", function (e) {
                                        if (currentPattern == 0) {
                                            $(".patterntext").text("(按卷)");
                                        } else {
                                            $(".patterntext").text("(按件)");
                                        }
                                        $("#commonModal2 #colSearchForm").submit();
                                        $("#commonModal2 .confirm").off("click");
                                    });
                                }
                            });
                        });
                    }
                });
            } else if ($("#searchType").val() == '1') {
                $("#commonModal2 .modal-body").empty();
                $("#commonModal2 .modal-header .head").text("输入查询字段和值");
                var result = {pattern: $("#pattern").val()};
                $("#searchColAndValueTemplate").tmpl(result).appendTo($("#commonModal2 .modal-body"));
                $("#commonModal2").modal("show");

                $.ajax({
                    type: "GET",
                    url: "<c:url value="/json/template/getUnionTemCol"  />",
                    data: {},
                    success: function (result) {
                        console.log(result);
                        result.pattern = $("#pattern").val();
                        $("#commonModal2 .addFieldColumn").empty();
                        $("#commonModal2 .temColArea").empty();
                        $("#colButtonTemplate").tmpl(result).appendTo($("#commonModal2 .temColArea"));
                        $("#commonModal2 .well").removeClass("hide");
                        $('#commonModal2 #colSearchForm').validate(
                                {
                                    submitHandler: function (form) {
                                        $(form).ajaxSubmit({
                                            dataType: "json",
                                            type: "post",
                                            success: function (data, s, xhr) {
                                                console.log(data);
                                                $(".recordArea").empty();
                                                $(".detailRecordArea").empty();
                                                $("#recordVolumeArea").html("档案显示区<span ><strong><b class=\"patterntext\"></b></strong></span>");
                                                $("#searchConditionArea").html("");
                                                if (currentPattern == 0)
                                                    data.type = "_record";
                                                else
                                                    data.type = "_piece";
                                                $("#RecordTemplate").tmpl(data).appendTo($(".recordArea"));
                                            }
                                        });
                                        return false;
                                    },
                                    errorPlacement: function (error, element) {
                                        error.replaceAll($("#" + $(element).attr("name") + "-error"));
                                    },
                                    success: function (label) {
                                        label.text("${validate_message_ok}").addClass("valid");
                                        label.removeClass("error");
                                        label.html("有效");
                                    }
                                });
                        $(".commonWidthButton").on("click", function (e) {
                            $("#commonModal2 #colname").val($(this).text());
                        });
                        $("#commonModal2 .confirm").on("click", function (e) {
                            $("#commonModal2 #colSearchForm").submit();
                            $("#commonModal2 .confirm").off("click");
                        });
                    }
                });

            } else if ($("#searchType").val() == 3 && currentPattern == "1") {
                $.ajax({
                    type: "GET",
                    url: "<c:url value="/json/recordtype/selectAccessTree"  />",
                    data: {},
                    success: function (result) {
                        console.log(result);
                        $("#commonModal2 .modal-body").empty();
                        $("#commonModal2 .modal-header .head").text("选择查询字段");
                        $("#basicRecordField").tmpl(result).appendTo($("#commonModal2 .modal-body"));
                        $("#jstree").jstree();
                        $("#commonModal2").modal("show");
                        $(".recordtypefield").on("click", function (e) {
                            var recordtypeid = $(this).attr("id");
                            //var recordtypeid = $(this).closest(".jstree-last").attr("id");
                            $.ajax({
                                type: "POST",
                                url: "<c:url value="/json/recordtype/getAllTableField"  />",
                                data: {recordTypeId: recordtypeid, type: "_piece"},
                                success: function (result) {
                                    console.log(result);
                                    $("#commonModal2 .addFieldColumn").empty();
                                    if (result.length == 0)
                                        return;
                                    result.pattern = $("#pattern").val();
                                    result.recordtypeid = recordtypeid;
                                    $("#colBasicTableField").tmpl(result).appendTo($("#commonModal2 .addFieldColumn"));
                                    $('#commonModal2 #colSearchForm').validate(
                                            {
                                                submitHandler: function (form) {
                                                    $(form).ajaxSubmit({
                                                        dataType: "json",
                                                        type: "post",
                                                        success: function (data, s, xhr) {
                                                            //console.log(data);
                                                        	jQuery("html,body").animate({scrollTop:200},300); 	
                                                            $(".recordArea").empty();
                                                            $(".detailRecordArea").empty();
                                                            data.type = "_piece";
                                                            data.recordtypeid = recordtypeid;
                                                            $("#recordVolumeArea").html("档案显示区<span ><strong><b class=\"patterntext\"></b></strong></span>");
                                                            //alert(data.recordTypeId);
                                                            if (data.pieces.length == 0)
                                                                data.hasresult = false;
                                                            else
                                                                data.hasresult = true;
                                                            $("#PieceTemplate").tmpl(data).appendTo($(".recordArea"));

                                                            $("#searchConditionArea").html("");
                                                            $(".clickpage").on("click", function (e) {
                                                                $("#commonModal2 #colSearchForm [name='page']").val($(this).find("span").text());
                                                                $("#commonModal2 #colSearchForm").submit();
                                                            });
                                                            $(".prev").on("click", function (e) {
                                                                var clickpage = Number($(".pagination .active a").text());
                                                                $("#commonModal2 #colSearchForm [name='page']").val(parseInt(clickpage) - 1);
                                                                $("#commonModal2 #colSearchForm").submit();
                                                            });
                                                            $(".next").on("click", function (e) {
                                                                var clickpage = Number($(".pagination .active a").text());
                                                                $("#commonModal2 #colSearchForm [name='page']").val(parseInt(clickpage) + 1);
                                                                $("#commonModal2 #colSearchForm").submit();
                                                            });
                                                        }
                                                    });
                                                    return false;
                                                },
                                                errorPlacement: function (error, element) {
                                                    error.replaceAll($("#" + $(element).attr("name") + "-error"));
                                                },
                                                success: function (label) {
                                                    label.text("${validate_message_ok}").addClass("valid");
                                                    label.removeClass("error");
                                                    label.html("有效");
                                                }
                                            });
                                    $("[name^='cols[']").each(function () {
                                        $(this).rules("add", {
                                            maxlength: $(this).siblings(".columnwidth").val(),
                                        });
                                    });
                                    $("#commonModal2 .confirm").on("click", function (e) {
                                        $(".patterntext").text("(按件)");
                                        $("#commonModal2 #colSearchForm").submit();
                                        $("#commonModal2 .confirm").off("click");
                                    });
                                }
                            });
                        });
                    }
                });
            } else if ($("#searchType").val() == 3 && currentPattern == "0") {
                $.ajax({
                    type: "GET",
                    url: "<c:url value="/json/recordtype/selectAccessTree"  />",
                    data: {},
                    success: function (result) {
                        console.log(result);
                        $("#commonModal2 .modal-body").empty();
                        $("#commonModal2 .modal-header .head").text("选择查询字段");
                        $("#basicRecordField").tmpl(result).appendTo($("#commonModal2 .modal-body"));
                        $("#jstree").jstree();
                        $("#commonModal2").modal("show");
                        $(".recordtypefield").on("click", function (e) {
                            var recordtypeid = $(this).attr("id");
                            //var recordtypeid = $(this).closest(".jstree-last").attr("id");
                            $.ajax({
                                type: "POST",
                                url: "<c:url value="/json/recordtype/getAllTableField"  />",
                                data: {recordTypeId: recordtypeid, type: "_record"},
                                success: function (result) {
                                    console.log(result);
                                    $("#commonModal2 .addFieldColumn").empty();
                                    if (result.length == 0)
                                        return;
                                    result.pattern = $("#pattern").val();
                                    result.typeid = recordtypeid;
                                    $("#recordBasicTableField").tmpl(result).appendTo($("#commonModal2 .addFieldColumn"));
                                    $('#commonModal2 #volumeSearchForm').validate(
                                            {
                                                submitHandler: function (form) {
                                                    $(form).ajaxSubmit({
                                                        dataType: "json",
                                                        type: "post",
                                                        success: function (data, s, xhr) {

                                                        	jQuery("html,body").animate({scrollTop:200},300); 
                                                            data.recordtypeid = recordtypeid;
                                                            data.type = "_record";
                                                            $(".recordArea").empty();
                                                            $(".detailRecordArea").empty();
                                                            var ps = $(form).find("#volumeData p"),con = "案卷目录中:&nbsp;&nbsp;&nbsp;&nbsp;";
                                                            for(var i=0;i<ps.length;i++){
                                                                if(ps.eq(i).find("select").length>0){
                                                                	con+="<font color='#FF0000'>"+ps.eq(i).find("span").html()+
                                                                		(ps.eq(i).find("select").find("option:selected").length<1?
                                                                			ps.eq(i).find("select").find("option:first").html():
                                                                			ps.eq(i).find("select").find("option:selected").html())+"</font>"+"&nbsp;&nbsp;&nbsp;&nbsp;";
                                                                }else{
                                                                	if(ps.eq(i).find(".colvalue").val()!='')
                                                                		con+="<font color='#FF0000'>"+ps.eq(i).find("span").html()+
	                                                                		ps.eq(i).find(".colvalue").val()+"</font>"+"&nbsp;&nbsp;&nbsp;&nbsp;";	
                                                                }
                                                            } 
                                                            con+="<br>卷内目录中:&nbsp;&nbsp;&nbsp;&nbsp;";
                                                            var ps = $(form).find("#recordData p");
                                                            for(var i=0;i<ps.length;i++){
                                                                if(ps.eq(i).find("select").length>0){
                                                                	con+="<font color='#FF0000'>"+ps.eq(i).find("span").html()+
                                                                		(ps.eq(i).find("select").find("option:selected").length<1?
                                                                			ps.eq(i).find("select").find("option:first").html():
                                                                			ps.eq(i).find("select").find("option:selected").html())+"</font>"+"&nbsp;&nbsp;&nbsp;&nbsp;";
                                                                }else{
                                                                	if(ps.eq(i).find(".colvalue").val()!='')
                                                                		con+="<font color='#FF0000'>"+ps.eq(i).find("span").html()+
	                                                                		ps.eq(i).find(".colvalue").val()+"</font>"+"&nbsp;&nbsp;&nbsp;&nbsp;";	
                                                                }
                                                            } 
                                                            $("#searchConditionArea").html(con);
                                                            $("#recordVolumeArea").html("案卷目录<span ><strong><b class=\"patterntext\"></b></strong></span>");
                                                            //console.log(data);
                                                            $("#VolumeRecordData").tmpl(data).appendTo($(".recordArea"));
                                                            /* $.each(data.records, function (i, v) {
                                                             $.each(v.page.items, function (index, content) {
                                                             var date = new Date(content.createtime);
                                                             content.createtime = date.Format("yyyy-MM-dd HH:mm:ss");
                                                             });
                                                             }); */

                                                            $(".volumeClickpage").on("click", function (e) {
                                                                $("#commonModal2 #volumeSearchForm [name='page']").val($(this).find("span").text());
                                                                $("#commonModal2 #volumeSearchForm").submit();
                                                            });
                                                            $(".volumePrev").on("click", function (e) {
                                                                var clickpage = Number($(".pagination .active a").text());
                                                                $("#commonModal2 #volumeSearchForm [name='page']").val(parseInt(clickpage) - 1);
                                                                $("#commonModal2 #volumeSearchForm").submit();
                                                            });
                                                            $(".volumeNext").on("click", function (e) {
                                                                var clickpage = Number($(".pagination .active a").text());
                                                                $("#commonModal2 #volumeSearchForm [name='page']").val(parseInt(clickpage) + 1);
                                                                $("#commonModal2 #volumeSearchForm").submit();
                                                            });
                                                            if(data.record!=null)
                                                            	$("#RecordDetailData").tmpl(data).appendTo($(".detailRecordArea"));
                                                            $(".intoRecord").off("click");
                                                            $(".intoRecord").on("click", function (e) {
                                                            	$("#commonModal2 #volumeSearchForm [name='id']").val($(this).attr("volumeId"));
	                                                            $(".detailRecordArea").empty();
                                                            	$.ajax({
                                                                    type: "POST",
                                                                    url: "<c:url value="/json/recordtype/searchRecordContent"  />",
                                                                    data: $(form).serialize(),
                                                                    success: function (data) {
                                                                        data.recordtypeid = recordtypeid;
                                                                        $("#RecordDetailData").tmpl(data).appendTo($(".detailRecordArea"));
        	                                                            var _targetTop = $(".detailRecordArea").offset().top;//获取位置
        	                                                        	jQuery("html,body").animate({scrollTop:_targetTop},300); 
                                                                    }
                                                                });
                                                            });

                                                            $(".intoResultRecord").off("click");
                                                            $(".intoResultRecord").on("click", function (e) {
                                                            	$("#commonModal2 #volumeSearchForm [name='id']").val($(this).attr("volumeId"));
	                                                            $(".detailRecordArea").empty();
                                                            	$.ajax({
                                                                    type: "POST",
                                                                    url: "<c:url value="/json/recordtype/searchResultRecord"  />",
                                                                    data: $(form).serialize(),
                                                                    success: function (data) {
                                                                    	data.recordtypeid = recordtypeid;
                                                                        $("#RecordDetailData").tmpl(data).appendTo($(".detailRecordArea"));
                                                                        
        	                                                            var _targetTop = $(".detailRecordArea").offset().top;//获取位置
        	                                                        	jQuery("html,body").animate({scrollTop:_targetTop},300); 
                                                                    }
                                                                });
                                                            });
                                                            
                                                        }
                                                    });
                                                    return false;
                                                },
                                                errorPlacement: function (error, element) {
                                                    error.replaceAll($("#" + $(element).attr("name") + "-error"));
                                                },
                                                success: function (label) {
                                                    label.text("${validate_message_ok}").addClass("valid");
                                                    label.removeClass("error");
                                                    label.html("有效");
                                                }
                                            });
                                    $("[name^='cols[']").each(function () {
                                        $(this).rules("add", {
                                            maxlength: $(this).siblings(".columnwidth").val(),
                                        });
                                    });
                                    $("#commonModal2 .confirm").on("click", function (e) {
                                        var form = $("#commonModal2 #volumeSearchForm");
                                        $(".patterntext").text("(按卷)");
                                        /* var flag = false;
                                         var inputs = $(form).find("input").not("[type=hidden]");
                                         for(var i=0;i<inputs.length;i++){
                                         if(inputs.eq(i).val().replace(/[ ]/g,"").replace(/[\r\n]/g,"")!=''){
                                         flag = true;
                                         break;
                                         }
                                         }
                                         if(flag) */
                                        form.submit();
                                        /* else
                                         noty({
                                         text: "至少输入一项搜索内容！",
                                         layout: "top",
                                         type: "failure",
                                         timeout: 1000,
                                         }); */
                                        $("#commonModal2 .confirm").off("click");
                                    });
                                }
                            });
                        });
                    }
                });
            } else if ($("#searchType").val() == 4) {

                $.ajax({
                    type: "GET",
                    url: "<c:url value="/json/recordtype/selectAccessTree"  />",
                    data: {},
                    success: function (result) {
                        console.log(result);
                        $("#commonModal2 .modal-body").empty(); 
                        $("#commonModal2 .modal-header .head").text("选择查询字段");
                        $("#luceneField").tmpl(result).prependTo($("#commonModal2 .modal-body"));
                        $("#jstree").jstree();
                        $("#commonModal2").modal("show");
                        $(".recordtypefield").on("click", function (e) {
                            var recordtypeid = $(this).attr("id");
                        	$("#indexsearchKey").attr('recordtypeid',recordtypeid);
                        	$("#input_area").show();
                        });
                    }
                });
                /* $("#indexSearch").modal("show"); */
            }

        });


        $(".deletefonds").on("click", function (e) {
            var fondsid = $(this).closest("tr").attr("id");
            var result = {datetip: "您确定要删除该全宗吗？"};
            $('#dateTipTemplate').tmpl(result).replaceAll($('#commonModal .modal-content'));
            $('#commonModal').modal("show");

            $(".commonConfirm").on("click", function (e) {
                $.get("<c:url value="/json/fonds/delete"  />", {typeid: fondsid}, function (data, s, xh) {
                    console.log(data);
                    if (data.status == 1) {
                        noty({
                            text: "删除成功！",
                            layout: "top",
                            type: "success",
                            timeout: 1000,
                            onClosed: function () {
                                window.location.reload();
                            }
                        });
                    } else {
                        noty({
                            text: "删除失败！",
                            layout: "top",
                            type: "failure",
                            timeout: 1000,
                        });
                    }
                });
            });
        });


        $(".viewTeamMember").on("click", function (e) {
            var userid = $(this).closest("tr").attr("id");
            $.get("<c:url value="/json/member/viewall"  />", {userid: userid}, function (data, status, xh) {
                console.log(data);
                var result = {members: data};
                $('#memberListTemplate').tmpl(result).replaceAll($('#commonModal .modal-content'));
                $('#commonModal').modal("show");
            });
        });


        $('.checkuser').on('click', function (e) {
            var id = $(this).parents("tr").attr("id");
            $.get("<c:url value="/json/user/view"/>", {
                userid: id
            }, function (result) {
                $('#CheckTemplate').tmpl(result).replaceAll($('.modal-content'));
                $(".modal-dialog").not(".checkModal").width(800);
                $('#view').modal('show');
                $(".checkpass").on('click', function (e) {
                    window.location = "<c:url value='/user/checkpass?userid='/>" + id;
                });

                $(".notpass").on('click', function (event) {
                    event.preventDefault();

                    $.get("<c:url value="/json/user/notpass"/>", {
                        userid: id,
                        random: Math.random()
                    }, function (result) {
                        if (result == true) {
                            noty({
                                text: "${message_check_success}",
                                layout: "top",
                                type: "success",
                                timeout: 1000,
                                onClosed: function () {
                                    window.location.reload();
                                }
                            });
                        } else {
                            noty({
                                text: "${message_check_failure}",
                                layout: "top",
                                type: "failure",
                                timeout: 1000,
                                onClosed: function () {
                                    window.location.reload();
                                }
                            });
                        }
                    });

                    /* Act on the event */
                });

            });


        });


        $('.createfonds').on('click', function (e) {
            e.preventDefault();
            $('#createFondsTemplate').tmpl().replaceAll($('#view .modal-content'));
            $(".modal-dialog").not(".checkModal").width(800);
            $('#view').modal('show');
            $('#view #typeCreateForm').validate(
                    {
                        submitHandler: function (form) {
                            $(form).ajaxSubmit({
                                dataType: "json",
                                type: "post",
                                success: function (data, s, xhr) {
                                    console.log(status);
                                    console.log(xhr);
                                    var status = data.status;
                                    $('#view').modal("hide");
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
                            fondsname: {
                                maxlength: 16,
                                required: true,
                                remote: {
                                    url: '<c:url value="/json/fonds/checkname"/>',
                                    type: 'post',
                                    dataType: 'json',
                                    data: {
                                        typename: function () {
                                            return $("[name='fondsname']").val();
                                        }
                                    }
                                }
                            },
                            fondsno: {
                                maxlength: 16,
                                required: true,
                                remote: {
                                    url: '<c:url value="/json/fonds/checkno"/>',
                                    type: 'post',
                                    dataType: 'json',
                                    data: {
                                        fondsno: function () {
                                            return $("[name='fondsno']").val();
                                        }
                                    }
                                }
                            },
                            fondsdes: {
                                maxlength: 16,
                                required: true
                            }
                        },
                        messages: {
                            fondsname: {
                                remote: "重名！"
                            },
                            fondsno: {
                                remote: "重名！"
                            },
                            fondsdes: {
                                remote: "重名！"
                            },
                        },
                        success: function (label) {
                            label.text("${validate_message_ok}").addClass("valid");
                            label.removeClass("error");
                            label.html("有效");
                        }
                    });
            $(".createTypeButton").on('click', function (e) {
                if ($('#typeCreateForm').valid()) {
                    $('#typeCreateForm').submit();
                }
            });
        });

        $('.edituser').on('click', function (e) {
            var id = $(this).parents("tr").attr("id");
            var originalname = $(this).parents("tr").children('td:first').text();
            var oldemail = $.trim($(this).parents("tr").children('.useremail').text());
            $.get("<c:url value="/json/user/view"/>", {
                userid: id,
                random: Math.random()
            }, function (result) {
                $('#edituserTemplate').tmpl(result).replaceAll($('#view .modal-content'));
                $(".modal-dialog").not(".checkModal").width(800);
                $(".optitle").text("编辑用户");
                $(".button1").text("确定");
                $(".button2").text("取消");
                $('#view').modal('show');

                $('#view #userCreateForm').validate({
                    submitHandler: function (form) {
                        $(form).ajaxSubmit({
                            dataType: "json",
                            type: "post",
                            success: function (data, status, xhr) {
                                console.log(status);
                                console.log(xhr);
                                var editStatus = data.editSuccess;
                                $('#view').modal("hide");
                                if (editStatus == 1) {
                                    noty({
                                        text: "编辑成功！",
                                        layout: "top",
                                        type: "success",
                                        timeout: 1000,
                                        onClosed: function () {
                                            window.location.reload();
                                        }
                                    });

                                } else if (editStatus == 0) {
                                    noty({
                                        text: "编辑失败！",
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
                        name: {
                            maxlength: 16,
                            required: true,
                            remote: {
                                url: '<c:url value="/json/user/checkeditusername"/>',
                                type: 'post',
                                dataType: 'json',
                                data: {
                                    originalname: originalname,
                                    inputname: function () {
                                        return $("[name='name']").val();
                                    }
                                }
                            }
                        },
                        userpassword: {
                            rangelength: [6, 18],
                            isPassword: true
                        },
                        pwdconfirm: {
                            rangelength: [6, 18],
                            confirmPwd: "#userpassword"
                        },
                        provider: {
                            required: true,
                            maxlength: 16
                        },
                        user: {
                            maxlength: 16,
                            required: true
                        },
                        contact: {
                            maxlength: 16,
                            required: true
                        },
                        contactinfo: {
                            maxlength: 16,
                            required: true,
                            confirmPhone: true
                        },
                        email: {
                            maxlength: 32,
                            required: true,
                            remote: {
                                url: '<c:url value="/json/user/edit/email"/>',
                                type: 'post',
                                dataType: 'json',
                                data: {
                                    oldemail: oldemail,
                                    email: function () {
                                        return $("[name='email']").val();
                                    }
                                }
                            },
                            isEmail: true
                        },
                        description: {
                            maxlength: 32
                        }
                    },
                    messages: {
                        name: {
                            required: "必填项！",
                            remote: "重名！"
                        },
                        userpassword: {},
                        pwdconfirm: {},
                        provider: {
                            required: "必填！"
                        },
                        user: {
                            required: "必填！"
                        },
                        contact: {
                            required: "必填！"
                        },
                        contactinfo: {
                            required: "必填！",
                            confirmPhone: "手机格式错误，若是座机请加区号！"
                        },
                        email: {
                            required: "必填！",
                            remote: "该邮箱已使用，请重新输入！"
                        }
                    },
                    success: function (label) {
                        label.text("${validate_message_ok}").addClass("valid");
                        label.removeClass("error");
                        label.html("有效");
                    }
                });


                $(".edituserbutton").on("click", function (e) {
                    if ($('#userCreateForm').valid()) {
                        $('#userCreateForm').submit();
                    }
                });
            });

        });

        $('.warningarea,.warningpagination').on('click', 'li.nondisabled,li.pagebutton', function (e) {
            /* e.preventDefault();
             e.stopPropagation(); */
            var href = $(this).children().attr('href');
            $.get(href, function (result) {
                var warning = result.warningpage;
                var page = result.page;
                var size = result.size;
                var totalPage = result.totalPage;
                var items = warning.page.items;
                var warningtemplate = $('#warningTemplate').clone().html();
                var allwarningtable = "";
                for (var i = 0; i < items.length; i++) {
                    var devicesensorview = items[i];
                    warningitem = warningtemplate.replace("<span class=\"warningdevicename\">", "<span class='warningdevicename'>" + devicesensorview.deviceview.name);
                    // warningtemplate.find('.warningdevicename').text(devicesensorview.deviceview.name);
                    var sendtime = devicesensorview.sensorDatas[0].sendtime;
                    var sensordatas = devicesensorview.sensorDatas;
                    var alltr = "";
                    for (var j = 0; j < sensordatas.length; j++) {
                        var sensordata = sensordatas[j];
                        var name = sensordata.name;
                        var upper = sensordata.upper;
                        var lower = sensordata.lower;
                        var stypename = sensordata.stype.name;
                        var unit = sensordata.stype.unit;
                        var value = sensordata.value;
                        var tr = "";
                        if (value == null) {
                            tr = "<tr><td>" + stypename + ":</td><td>" + "数据未传输！" + "</td></tr>";
                        } else {
                            tr = "<tr><td>" + stypename + ":</td><td>" + value + unit + "(" + lower + unit + "-" + upper + unit + ")" + "</td></tr>";
                        }
                        alltr += tr;
                    }
                    var timetr = "";
                    if (sendtime == null) {
                        timetr = "<tr><td>时间：</td><td>数据未传输！</td></tr>";
                    } else {
                        var date = new Date(parseInt(sendtime) * 1000);
                        var Y = date.getFullYear() + '-';
                        var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
                        var D = date.getDate() + ' ';
                        var h = date.getHours() + ':';
                        var m = date.getMinutes() + ':';
                        var s = date.getSeconds();
                        var time = Y + M + D + h + m + s;
                        timetr = "<tr><td>时间：</td><td>" + time + "</td></tr>";
                    }
                    alltr += timetr;
                    onewarningtemplate = warningitem.replace("<table class=\"waringtable\">", "<table class=\"waringtable\">" + alltr);
                    allwarningtable += onewarningtemplate;
                }
                $('.warningarea').html(allwarningtable);
                var warningpagination = $('.warningpagination').find('.pagination');
                var allli = "";
                var prevli = "";
                if (page == 1) {
                    prevli = "<li class=\"prevbutton disabled\"><a href=\"#\">&laquo;</a></li>";
                } else {
                    var prevpage = page - 1;
                    var url = "<c:url value='/json/device/warning?page="+prevpage+"&size="+size+"'/>";
                    prevli = "<li class=\"prevbutton nondisabled\"><a href=\"" + url + "\">&laquo;</a></li>";
                }
                var pagelis = "";
                for (var i = 1; i <= totalPage; i++) {
                    var li = "";
                    if (i == page) {
                        li = "<li class=\"active page-" + i + "\"><a href=\"#\">" + i + "</a></li>";
                    } else {
                        var url = "<c:url value='/json/device/warning?page="+i+"&size="+size+"'/>";
                        li = "<li class=\"pagebutton page-" + i + "\"><a href=\"" + url + "\">" + i + "</a></li>";
                    }
                    pagelis += li;
                    /* <li class="active page-
                    ${p}"><a href="javascript:void(0)">
                    ${p}</a></li>
                     <li class="pagebutton page-
                    ${p}"><a href="
                    <c:url value="/json/device/warning?n=${n}&typeId=${typeId }&page=${p}&size=${warningpage.getPageSize()}&sn=true"/>">
                    ${p}</a></li> */
                }
                var nextli = "";
                if (page == totalPage) {
                    nextli = "<li class=\"nextbutton disabled\"><a href=\"#\">&raquo;</a></li>";
                } else {
                    var prevpage = page - 1;
                    var url = "<c:url value='/json/device/warning?page="+prevpage+"&size="+size+"'/>";
                    nextli = "<li class=\"nextbutton nondisabled\"><a href=\"" + url + "\">&raquo;</a></li>";
                }
                allli = prevli + pagelis + nextli;
                warningpagination.html(allli);
                /* //pagination
                 var warningpagination = $('.warningpagination');
                 warningpagination.find('.active').removeClass('active');
                 warningpagination.find('.page-'+page).removeClass('pagebutton').addClass('active');
                 if(page==1){
                 warningpagination.find('.nextbutton').removeClass('disabled');
                 warningpagination.find('.prevbutton').removeClass('nondisabled').addClass('disabled');
                 warningpagination.find('.prevbutton').children().attr("href","#");
                 } else if(page==totalPage){
                 warningpagination.find('.prevbutton').removeClass('disabled');
                 warningpagination.find('.nextbutton').removeClass('nondisabled').addClass('disabled');
                 warningpagination.find('.nextbutton').children().attr("href","#");
                 } else{
                 warningpagination.find('.prevbutton').removeClass().addClass('prevbutton');
                 warningpagination.find('.nextbutton').removeClass().addClass('nextbutton');
                 }
                 // $('.breadcrumbdiv').after(warningtemplate);
                 alert("test!"); */

            });
            return false;
        });
        $('#allocate').click(function (e) {
            e.preventDefault();
            allocate($(this).parent().parent().attr("id"));
            $('#view').modal('show');
        });
        /*$('.table .btn-danger').click(function (e) {
         e.preventDefault();
         deletectype($(this).parent().parent().attr("id"));
         $('#view').modal('show');
         });*/
        $('.input-daterange').datepicker({
            format: "yyyy-mm-dd",
            todayBtn: "linked",
            language: "zh-CN",
            autoclose: true,
            todayHighlight: true
        });

        var sortClass = {
            "sSortAsc": "sorting_asc",
            "sSortDesc": "sorting_desc",
            "sSortable": "sorting"
        };

        var orderByClause = $('#orderByClause').val();

        var columns = [['dtuid'], ['acstatus'], ['createtime']];
        if (orderByClause) {
            var sorts = orderByClause.split(" ");
            for (var i = 0; i < columns.length; i++) {
                var column = columns[i];
                if (column[0] === sorts[0])
                    column[1] = sorts[1];

            }
        }

        for (var i = 0; i < columns.length; i++) {
            var column = columns[i];
            var bAsc = $.inArray('asc', column) !== -1;
            var bDesc = $.inArray('desc', column) !== -1;

            if (bAsc && !bDesc) {
                $('#th_' + column[0]).addClass(sortClass.sSortAsc);
            }
            else if (!bAsc && bDesc) {
                $('#th_' + column[0]).addClass(sortClass.sSortDesc);
            }
            else {
                $('#th_' + column[0]).addClass(sortClass.sSortable);
            }

        }
        $('.table>thead>tr>th').click(function (e) {
            var columnId = $(this).attr('id');
            var column = columnId.split("_")[1].toString();
            var classes = $(this).attr('class');
            var actionURL = $('#searchForm').attr("action");
            if (actionURL.indexOf('?') != -1) {
                return false;
            }
            if (classes === sortClass.sSortAsc) {
                $('#orderByClause').val(column + ' desc');
                $('#searchForm').attr("action", actionURL + "?sn=true&typeId=${typeId }");
                $('#searchForm').submit();
            } else if (classes === sortClass.sSortDesc) {
                $('#orderByClause').val(column + ' asc');
                $('#searchForm').attr("action", actionURL + "?sn=true&typeId=${typeId }");
                $('#searchForm').submit();
            } else if (classes === sortClass.sSortable) {
                $('#orderByClause').val(column + ' desc');
                $('#searchForm').attr("action", actionURL + "?sn=true&typeId=${typeId }");
                $('#searchForm').submit();
            }
        });

        $('ul.pagination>li>a').click(function (e) {
            e.preventDefault();
            var link = $(this).attr("href");
            if (link && link !== '#') {
                $('#searchForm').attr("action", link);
                $('#searchForm').submit();
            }
        });
    });
</script>
<c:if test="${createstatus ne null && createstatus eq 1}">
    <spring:message code="create.success" text="Create success!" var="message_success"/>
    <script>
        $(document).ready(function () {
            noty({
                text: "${message_success}",
                layout: "top",
                type: "success",
                timeout: 1000
            });
        });
    </script>
</c:if>
<c:if test="${createstatus ne null && createstatus eq 0}">
    <spring:message code="create.failure" text="Create failure!" var="message_failure"/>
    <script>
        $(document).ready(function () {
            noty({
                text: "${message_failure}",
                layout: "top",
                type: "success",
                timeout: 1000
            });
        });
    </script>
</c:if>
<c:if test="${editSuccess != null && editSuccess}">
    <spring:message code="edit.success" text="Edit success!" var="message_edit_success"/>
    <script>
        $(document).ready(function () {
            noty({
                text: "${message_edit_success}",
                layout: "top",
                type: "success",
                timeout: 1000
            });
        });
    </script>
</c:if>
<c:if test="${deletestatus ne null && deletestatus eq 1}">
    <spring:message code="delete.success" text="Delete success!" var="message_success"/>
    <script>
        $(document).ready(function () {
            noty({
                text: "${message_success}",
                layout: "top",
                type: "success",
                timeout: 1000
            });
        });
    </script>
</c:if>
<c:if test="${deletestatus ne null && deletestatus eq 0}">
    <spring:message code="delete.failure" text="Delete failure!" var="message_failure"/>
    <script>
        $(document).ready(function () {
            noty({
                text: "${message_failure}",
                layout: "top",
                type: "success",
                timeout: 1000
            });
        });
    </script>
</c:if>
<c:if test="${checkStatus ne null && checkStatus eq 1}">
    <script>
        $(document).ready(function () {
            noty({
                text: "审核通过并成功发送邮件！",
                layout: "top",
                type: "success",
                timeout: 2000
            });
        });
    </script>
</c:if>

</body>
</html>
