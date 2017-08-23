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

<%-- <%@include file="../common/common.jsp" %>
<%@include file="../../header.jsp" %> --%>

<div class="container-fluid mycontainer">
    <div class="containercontent">

        <%@include file="nav.jsp" %>

        <div class="rightbox">
            <div class="rightbox_content">
                <!-- content starts -->
                <div class="breadcrumbdiv">
                    <ul class="breadcrumb">
                        <li>
                            <a href="<c:url value="/admin/index" />"><spring:message code="breadcrumb.home" text="Home"/></a>
                        </li>
                        <li>
                            <spring:message code="nav.menu.recordtype" text="RecordType"/><spring:message
                                code="breadcrumb.manage"
                                text="Manage"/>
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i> <spring:message code="nav.menu.recordtype"
                                                                                            text="RecordType"/><spring:message
                                        code="breadcrumb.manage" text="Manage"/></h2>
                            </div>
                            <div class="box-content">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div id="jstree">
                                            <!-- in this example the tree is populated from inline HTML -->
                                            <ul>
                                                <c:forEach var="fonds" items="${fondsList}">
                                                    <li
                                                            id="${fonds.id}">${fonds.name}
                                                        <ul>
                                                            <c:forEach var="recordType"
                                                                       items="${recordTypes}">
                                                                <li
                                                                        id="${recordType.id}"
                                                                        title="${recordType.name}">${recordType.name}
                                                                    <ul>
                                                                        <c:forEach var="recordCategory"
                                                                                   items="${recordCategoryTrees}">
                                                                            <li
                                                                                    id="${recordCategory.recordCategory.id}">${recordCategory.recordCategory.des}
                                                                                <ul>
                                                                                    <c:forEach
                                                                                            var="recordCategoryContent"
                                                                                            items="${recordCategory.recordCategoryContents}">
                                                                                        <li
                                                                                                id="${recordCategoryContent.id}">${recordCategoryContent.name}
                                                                                            <ul>
                                                                                                <li data-jstree='{"icon":"<c:url value="/resources/images/jstree/tree.png"  />"}'
                                                                                                    class="volume">
                                                                                                    案卷
                                                                                                </li>
                                                                                                <li data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
                                                                                                    class="nonvolume">
                                                                                                    案件
                                                                                                </li>
                                                                                            </ul>
                                                                                        </li>
                                                                                    </c:forEach>
                                                                                </ul>
                                                                            </li>
                                                                        </c:forEach>
                                                                    </ul>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-9">

                                        <div class="navbar-inner">
                                            <div class="navbar-form navbar-left">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <%--<shiro:hasAnyRoles name="SUPER ADMIN">
                                                            <a class="createuser btn btn-success" href="#">
                                                                <i class="glyphicon glyphicon-plus-sign"></i> <spring:message
                                                                    code="btn.create" text="Create"/>用户
                                                            </a>
                                                        </shiro:hasAnyRoles>--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:url value="/recordtype/manage" var="searchActoin">
                                            </c:url>
                                            <form:form modelAttribute="recordSearchForm" action="${searchActoin}">
                                                <form:hidden path="orderByClause"/>
                                                <form:hidden path="year"/>
                                                <form:hidden path="deadline"/>
                                                <form:hidden path="department"/>
                                                <form:hidden path="rccId"/>
                                                <form:hidden path="recordCatogory"/>
                                                <form:hidden path="rtId"/>
                                                <form:hidden path="fondsId"/>
                                                <form:hidden path="page"/>
                                                <form:hidden path="size"/>
                                                <spring:message code="placeholder.start" text="Start"
                                                                var="placeholder_start"/>
                                                <spring:message code="placeholder.to" text="To" var="placeholder_to"/>
                                                <spring:message code="placeholder.end" text="End"
                                                                var="placeholder_end"/>
                                                <spring:message code="placeholder.keyword.name" text="Keyword"
                                                                var="placeholder_keyword_name"/>
                                                <spring:message code="placeholder.search" text="Search"
                                                                var="placeholder_search"/>
                                                <div class="navbar-form navbar-right" role="search">
                                                    <div class="form-group">
                                                        <div class="input-daterange input-group" id="datepicker">
                                                            <form:input class="form-control"
                                                                        placeholder="${placeholder_start}"
                                                                        path="starttime"/>
                                                            <span class="input-group-addon">${placeholder_to}</span>
                                                            <form:input class="form-control"
                                                                        placeholder="${placeholder_end}"
                                                                        path="endtime"/>
                                                        <span class="input-group-addon"><i
                                                                class="glyphicon glyphicon-calendar"></i></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <spring:message code="model.recordtype.name" text="Search"
                                                                            var="placeholder_search"/>
                                                            <form:input class="form-control"
                                                                        placeholder="${placeholder_search}" path="key"
                                                                        autocomplete="true"/>
                                                    <span class="input-group-btn">
                                                      <button class="btn btn-info searchbutton"><i
                                                              class="glyphicon glyphicon-search"></i>
                                                      </button>
                                                    </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form:form>
                                        </div>
                                        <div class="table-content">
                                            <table class="table table-striped table-bordered responsive">
                                                <thead>
                                                <tr>
                                                    <th id="th_subject" title="Subject"><spring:message
                                                            code="model.record.subject"
                                                            text="Subject"/></th>
                                                    <th id="th_year" title="year"><spring:message
                                                            code="model.record.year"
                                                            text="year"/></th>
                                                    <th id="th_people" title="people"><spring:message
                                                            code="model.record.people"
                                                            text="people"/></th>
                                                    <th id="th_department" title="department"><spring:message
                                                            code="model.record.department"
                                                            text="department"/></th>
                                                    <th id="th_deadline" title="deadline"><spring:message
                                                            code="model.record.deadline"
                                                            text="deadline"/></th>
                                                    <th id="th_recordtype" title="recordtype"><spring:message
                                                            code="model.record.recordtype"
                                                            text="recordtype"/></th>
                                                    <th id="th_createtime" title="CreateTime"><spring:message
                                                            code="model.record.createtime"
                                                            text="CreateTime"/></th>
                                                    <th title="Actions" class="actions w90"><spring:message
                                                            code="actions"
                                                            text="Actions"/></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td style="display:none">无</td>
                                                    <td colspan="20" class="center">请选择左边树节点查询数据！</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/span-->
                </div><!--/row-->
                <%@include file="footer.jsp" %>
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
                <a href="#" class="btn btn-primary" data-dismiss="modal"><i class="glyphicon glyphicon-share-alt"></i>
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
            <a href="#">
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
                <p class="deletetip">是否确定要删除用户<span class="deleteusername"></span>信息？</p>

                <p class="cannotdeletetip">该用户下有机构信息，真的要删除吗？<a
                        class="realdeletebutton btn btn-primary btn-warning"><spring:message code="href.confirm"
                                                                                             text="Confirm"/></a></p>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="deletebutton btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <spring:message code="href.confirm"
                                                                               text="Confirm"/></strong></a>
            <a href="#" class="btn btn-primary" data-dismiss="modal"><strong><i
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
            <a href="#" class="checkpass btn btn-primary"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                    class="button1"><spring:message code="href.pass" text="Pass"/></span></strong></a>
            <a href="#" class="btn btn-primary" data-dismiss="modal"><strong><i
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
            <a href="#" class="edituserbutton btn btn-primary"><strong><i class="glyphicon glyphicon-share-alt"></i>
                <span class="button1"><spring:message code="href.pass" text="Pass"/></span></strong></a>
            <a href="#" class="btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <span class="button2"><spring:message code="href.notpass"
                                                                                                     text="Not pass"/></span></strong></a>
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
                <a href="#" class="btn btn-primary" data-dismiss="modal"><i class="glyphicon glyphicon-share-alt"></i>
                    <spring:message code="href.cancel" text="Cancel"/></a>
            </div>
        </form>
    </div>
</script>
<spring:message code="deleteform.message.failed" text="Delete failed!" var="message_delete_failed"/>
<spring:message code="deleteform.message.success" text="Delete success!" var="message_delete_success"/>
<spring:message code="check.success" text="Check Success" var="message_check_success"/>
<spring:message code="check.failure" text="Check Failure" var="message_check_failure"/>
<style type="text/css">
.unCoverVolumeTemplate_body{
	max-height:400px;
	overflow:scroll
}
.applySuccess{
    position: absolute;
    z-index: 9999;
    opacity: 0.9;
    width: 760px;
    text-align: center;
    left:50%;
    top:-66px;
    margin-left:-380px;
    border-radius:0px 0px 3px 3px;
    background: #ffffff;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
    display: none
}
.applySuccess span{
    color:#999999;
    font-size: 16px;
    margin-right:20px
}
.reBuild_nowFile{
	max-height:200px;
	overflow-y:scroll
}
#reBuildVolumeTemplate .modal-body{
	max-height:450px;
	overflow-y:scroll;
}
.reBuild_otherFile label{
	text-align:right;
	line-height:35px
}
</style>

<div class="alert alert-dismissible alert-warning applySuccess">
        <span>申请成功！</span>
 </div>
<div class="modal fade" id="unCoverVolumeTemplate" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               拆卷
            </h4>
         </div>
         <div class="modal-body unCoverVolumeTemplate_body">
            <h5>当前卷下的案件</h5>
             <table class="table table-striped table-bordered responsive">
                    <thead>
				      <tr>
				         <th>档案保存形式</th>
				         <th>题名</th>
				         <th>年度</th>
				         <th>责任人</th>
				         <th>部门</th>
				         <th>保管期限</th>
				         <th>档案类型</th>
				         <th>创建时间</th>
				      </tr>
				   </thead>
				   <tbody>
				      <tr>
				         <td>案件</td>
				         <td>subject</td>
				         <td>1111</td>
				         <td>asd</td>
				         <td>sad</td>
				         <td>201609</td>
				         <td>科技档案</td>
				         <td>14463023432</td>
				      </tr>
				      
				      <tr>
				         <td>案件</td>
				         <td>subject</td>
				         <td>1112</td>
				         <td>asd</td>
				         <td>sad</td>
				         <td>201609</td>
				         <td>文书档案</td>
				         <td>14463023432</td>
				      </tr>
				      <tr>
				         <td>案件</td>
				         <td>subject</td>
				         <td>1113</td>
				         <td>asd</td>
				         <td>sad</td>
				         <td>201609</td>
				         <td>文书档案</td>
				         <td>14463023432</td>
				      </tr>
				   </tbody>
              </table>
         </div>
         <div class="modal-footer">
         <span class="text-danger pull-left">正在审核中，请等待...</span>
            <a class="btn btn-primary buildConfirm applyForUncover"
               data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                    class="btntext">申请拆卷</span></strong></a>
            <a class="btn btn-primary buildcancel"
               data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                    class="btntext">取消</span></strong></a>
        </div>
      </div>
	</div>
</div>

<div class="modal fade" id="reBuildVolumeTemplate" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               重新组卷
            </h4>
         </div>
         <div class="modal-body">
             <h5>当前卷下的案件</h5>
             <table class="table table-striped table-bordered responsive reBuild_nowFile">
                    <thead>
				      <tr>
				         <th>Select</th>
				         <th>档案保存形式</th>
				         <th>题名</th>
				         <th>年度</th>
				         <th>责任人</th>
				         <th>部门</th>
				         <th>保管期限</th>
				         <th>档案类型</th>
				         <th>创建时间</th>
				      </tr>
				   </thead>
				   <tbody>
				      <tr>
				         <td><input type="checkbox"></td>
				         <td>subject</td>
				         <td>案件</td>
				         <td>1111</td>
				         <td>asd</td>
				         <td>sad</td>
				         <td>201609</td>
				         <td>科技档案</td>
				         <td>14463023432</td>
				      </tr>
				      
				      <tr>
				         <td><input type="checkbox">
				         <td>subject</td>
				         <td>案件</td>
				         <td>1112</td>
				         <td>asd</td>
				         <td>sad</td>
				         <td>201609</td>
				         <td>文书档案</td>
				         <td>14463023432</td>
				      </tr>
				   </tbody>
              </table>
              <div class="form-group">
			      <div class=" col-sm-12" style="padding-right:0px;margin-top:5px">
			         <button type="button" class="btn btn-muted pull-right disabled removeChosedFile">移除所选案件</button>
			      </div>
			   </div>
              <h5>其他案件</h5>
              
				<div class="navbar-form navbar-left col-sm-12 pull-left" role="search" style="padding-left:0px">
					<div class="daterange input-group">                                     
	              		<input id="starttime" name="starttime" placeholder="起始日期" class="form-control" type="text" value="">                                     
	              		<span class="input-group-addon">到</span>                                     
	              		<input id="endtime" name="endtime" placeholder="截止日期" class="form-control" type="text" value="">                                                     
	              		<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>                                 
	              	</div>  
	              	<div class="input-group">                                                                         
	              	 	<input id="key" name="key" placeholder="名称" class="form-control" type="text" value="" autocomplete="true">                                                    
	              	 	<span class="input-group-btn">                                                      
	              	  		<button class="btn btn-info searchbutton"><i class="glyphicon glyphicon-search"></i>  </button>                                                     
	              	  	</span>                                 
	            	</div>  
            	</div>
              
              
              <table class="table table-striped table-bordered responsive reBuild_otherFile">
                    <thead>
				      <tr>
				         <th>Select</th>
				         <th>档案保存形式</th>
				         <th>题名</th>
				         <th>年度</th>
				         <th>责任人</th>
				         <th>部门</th>
				         <th>保管期限</th>
				         <th>档案类型</th>
				         <th>创建时间</th>
				      </tr>
				   </thead>
				   <tbody>
				      <tr>
				         <td><input type="checkbox"></td>
				         <td>subject</td>
				         <td>案件</td>
				         <td>1111</td>
				         <td>asd</td>
				         <td>sad</td>
				         <td>201609</td>
				         <td>科技档案</td>
				         <td>14463023432</td>
				      </tr>
				      
				      <tr>
				         <td><input type="checkbox">
				         <td>subject</td>
				         <td>案件</td>
				         <td>1112</td>
				         <td>asd</td>
				         <td>sad</td>
				         <td>201609</td>
				         <td>文书档案</td>
				         <td>14463023432</td>
				      </tr>
				   </tbody>
              </table>
              <div class="form-group">
			      <div class=" col-sm-4 pull-right" style="padding-right:0px;margin-top:5px">
			         <button type="button" class="btn btn-muted pull-right disabled addChosedFile">添加所选案件</button>
			      </div>
			   </div>
              <ul class="pagination" style="margin-top:5px">
				  <li><a href="#">&laquo;</a></li>
				  <li><a href="#">1</a></li>
				  <li><a href="#">2</a></li>
				  <li><a href="#">&raquo;</a></li>
			  </ul>
         </div>
         <div class="modal-footer">
            <a class="btn btn-primary buildConfirm applyForReBuild"
               data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                    class="btntext">申请重新组卷</span></strong></a>
            <a class="btn btn-primary buildcancel"
               data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                    class="btntext">取消</span></strong></a>
        </div>
      </div>
	</div>
</div>
<script>
var fade_time = 4;
var ftime;
var isApplyUnCover = 0;
var applyUnCover_time = 4;
var autime;
var isApplyReBuild = 0;
var applyReBuild_time = 4;
var artime;
var addHasCheckedArray = new Array;
$(document).on("click","#unCoverVolumeTemplate .applyForUncover span",function(){
    $(".applySuccess").show().animate({top:"0px"});
    ftime= setInterval(function(){
        fade_time--;
        if(fade_time==0){
        	isApplyUnCover = 1;
            $(".applySuccess").animate({top:"-66px"});
            clearInterval(ftime);
        }
    },500);
    fade_time=4;
    $(".uncoverVolume").attr("title","申请中");
    $(".uncoverVolume").removeClass("btn-success").addClass("btn-muted");
    if(isApplyUnCover == 1){
	    aution= setInterval(function(){
	        applyUnCover_time--;
	        if(applyUnCover_time==0){
	        	$("#unCoverVolumeTemplate .applyForUncover span").html("确认拆卷");
	        	$(".uncoverVolume").attr("title","拆卷");
	            $(".uncoverVolume").removeClass("btn-muted").addClass("btn-success");
	            $("#unCoverVolumeTemplate").removeClass("applyForUncover");
	            clearInterval(aution);
	        }
	    },500);
	    applyUnCover_time=4;
    }
});
$(document).on("click","#reBuildVolumeTemplate .applyForReBuild span",function(){
    $(".applySuccess").show().animate({top:"0px"});
    ftime= setInterval(function(){
        fade_time--;
        if(fade_time==0){
        	isApplyReBuild = 1;
            $(".applySuccess").animate({top:"-66px"});
            clearInterval(ftime);
        }
    },500);
    fade_time=4;
    $(".reBuildVolume").attr("title","申请中");
    $(".reBuildVolume").removeClass("btn-success").addClass("btn-muted");
    if(isApplyReBuild == 1){
    	$(".removeChosedFile").removeClass("btn-muted").removeClass("disabled").addClass("btn-primary");
    	$(".addChosedFile").removeClass("btn-muted").removeClass("disabled").addClass("btn-primary");
	    artion= setInterval(function(){
	    	applyReBuild_time--;
	        if(applyReBuild_time==0){
	        	$("#reBuildVolumeTemplate .applyForReBuild span").html("重新组卷");
	        	$(".reBuildVolume").attr("title","重新组卷");
	            $(".reBuildVolume").removeClass("btn-muted").addClass("btn-success");
	            $("#reBuildVolumeTemplate").removeClass("applyForReBuild");
	            clearInterval(artion);
	        }
	    },500);
	    applyReBuild_time=4;
    }
});

//移除所选案件
$(function(){	
	$(".removeChosedFile").click(function() {
		$(".reBuild_nowFile input[type='checkbox']:checked").each(function() { 
			var removeHasChecked = $(this).parents("tr").index();  
			$("table.reBuild_nowFile tbody").find("tr:eq("+removeHasChecked+")").remove();
		});
	});
});
//添加所选案件
$(function(){	
	$(".addChosedFile").click(function() {
		$(".reBuild_otherFile input[type='checkbox']:checked").each(function() { 
			var addHasChecked = $(this).parents("tr").index(); 
			for(var i = 0 ;i<=addHasChecked;i++){
				addHasCheckedArray[i] = $("table.reBuild_otherFile tbody").find("tr:eq("+addHasChecked+")").html();
				$("table.reBuild_nowFile tbody").append(addHasCheckedArray[i]);
			}
			$("table.reBuild_otherFile tbody").find("tr:eq("+addHasChecked+")").remove();
			
		});
		
		
	});
});
</script>

<script type="text/html" id="buildVolumeTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4>选择案件组卷</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <div class="navbar-inner">
                    <c:url value="/recordtype/manage" var="searchActoin">
                    </c:url>
                    <form:form modelAttribute="buildRecordSearchForm" action="${searchActoin}">
                        <form:hidden path="orderByClause"/>
                        <form:hidden path="year"/>
                        <form:hidden path="deadline"/>
                        <form:hidden path="department"/>
                        <form:hidden path="rccId"/>
                        <form:hidden path="recordCatogory"/>
                        <form:hidden path="rtId"/>
                        <form:hidden path="fondsId"/>
                        <form:hidden path="page"/>
                        <form:hidden path="size"/>
                        <spring:message code="placeholder.start" text="Start"
                                        var="placeholder_start"/>
                        <spring:message code="placeholder.to" text="To" var="placeholder_to"/>
                        <spring:message code="placeholder.end" text="End"
                                        var="placeholder_end"/>
                        <spring:message code="placeholder.keyword.name" text="Keyword"
                                        var="placeholder_keyword_name"/>
                        <spring:message code="placeholder.search" text="Search"
                                        var="placeholder_search"/>
                        <div class="form-horizontal" role="search">
                            <div class="form-group col-sm-12">
                                <label class="col-sm-2 control-label"><spring:message code="model.record.year"
                                                                                      text="Year"
                                /></label>

                                <div class="col-sm-2">
                                    <select name="year" class="form-control">
                                        {{each years}}
                                        <option value="{{= id}}">{{= name}}</option>
                                        {{/each}}
                                    </select>
                                </div>

                                <label class="col-sm-2 control-label"><spring:message code="model.record.deadline"
                                                                                      text="Deadline"
                                /></label>

                                <div class="col-sm-2">
                                    <select name="deadline" class="form-control">
                                        {{each deadlines}}
                                        <option value="{{= id}}">{{= name}}</option>
                                        {{/each}}
                                    </select>
                                </div>

                                <label class="col-sm-2 control-label"><spring:message code="model.record.department"
                                                                                      text="department"
                                /></label>

                                <div class="col-sm-2">
                                    <select name="department" class="form-control">
                                        {{each departments}}
                                        <option value="{{= id}}">{{= name}}</option>
                                        {{/each}}
                                    </select>
                                </div>

                            </div>
                        </div>
                        <div class="navbar-form navbar-right" role="search">

                            <div class="form-group">
                                <div class="daterange input-group" id="datepicker">
                                    <form:input class="form-control"
                                                placeholder="${placeholder_start}"
                                                path="starttime"/>
                                    <span class="input-group-addon">${placeholder_to}</span>
                                    <form:input class="form-control"
                                                placeholder="${placeholder_end}"
                                                path="endtime"/>
                                                    <span class="input-group-addon"><i
                                                            class="glyphicon glyphicon-calendar"></i></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <spring:message code="model.recordtype.name" text="Search"
                                                    var="placeholder_search"/>
                                    <form:input class="form-control"
                                                placeholder="${placeholder_search}" path="key"
                                                autocomplete="true"/>
                                                    <span class="input-group-btn">
                                                      <button class="btn btn-info searchbutton"><i
                                                              class="glyphicon glyphicon-search"></i>
                                                      </button>
                                                    </span>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
                <div class="table-content">
                    <table class="table table-striped table-bordered responsive">
                        <thead>
                        <tr>
                            <th id="th_select" title="Select"><spring:message code="model.record.select"
                                                                              text="Select"/></th>
                            <th id="th_type" title="Type"><spring:message code="model.record.type"
                                                                          text="Type"/></th>
                            <th id="th_subject" title="Subject"><spring:message code="model.record.subject"
                                                                                text="Subject"/></th>
                            <th id="th_year" title="year"><spring:message code="model.record.year"
                                                                          text="year"/></th>
                            <th id="th_people" title="people"><spring:message code="model.record.people"
                                                                              text="people"/></th>
                            <th id="th_department" title="department"><spring:message code="model.record.department"
                                                                                      text="department"/></th>
                            <th id="th_deadline" title="deadline"><spring:message code="model.record.deadline"
                                                                                  text="deadline"/></th>
                            <th id="th_recordtype" title="recordtype"><spring:message code="model.record.recordtype"
                                                                                      text="recordtype"/></th>
                            <th id="th_createtime" title="CreateTime"><spring:message code="model.record.createtime"
                                                                                      text="CreateTime"/></th>
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

                            <td class="center"><input name="recordid" type="checkbox" value="{{= id}}"></td>
                            <td class="center">
                                {{if isVolume == false}}
                                案件
                                {{else}}
                                案卷
                                {{/if}}
                            </td>
                            <td class="center">{{= subject}}</td>
                            <td class="center">{{= yearString}}</td>
                            <td class="center">{{= people}}</td>
                            <td class="center">{{= departmentString}}</td>
                            <td class="center">{{= deadlineString}}</td>
                            <td class="center">{{= title}}</td>
                            <td class="center">{{= createtime}}</td>
                        </tr>
                        {{/each}}
                        {{/if}}
                        </tbody>
                    </table>
                </div>
                <nav class="center templatenav">
                    <ul class="pagination">
                        {{if records.page.pageNum == 1}}
                        <li class="disabled"><a href="#">上一页</a></li>
                        {{else}}
                        <li><a
                                href="#" id="prev"><span>上一页</span></a>
                        </li>
                        {{/if}}
                        {{each(i,value) pages}}
                        {{if records.page.pageNum == value }}
                        <li class="active"><a href="#">{{= value}}</a></li>
                        {{else value == 0}}
                        <li><a>...</a></li>
                        {{else}}
                        <li><a
                                href="#" id="toNum"><span>{{= value}}</span></a>
                        </li>
                        {{/if}}
                        {{/each}}
                        {{if records.page.pageNum == records.page.totalPage}}
                        <li class="disabled"><a href="#">下一页</a></li>
                        {{else}}
                        <li><a href="#" id="next"><span>下一页</span></a>
                        </li>
                        {{/if}}
                    </ul>
                </nav>

            </div>
        </div>
        <div class="modal-footer">
            <a class="btn btn-primary buildConfirm"
               data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                    class="btntext">确定</span></strong></a>
            <a class="btn btn-primary buildcancel"
               data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                    class="btntext">取消</span></strong></a>
        </div>

    </div>

</script>
<script type="text/html" id="RecordTemplate">
    <div class="table-content">
        <table class="table table-striped table-bordered responsive">
            <thead>
            <tr>
                <th id="th_type" title="Type"><spring:message code="model.record.type"
                                                              text="Type"/></th>
                <th id="th_subject" title="Subject"><spring:message code="model.record.subject"
                                                                    text="Subject"/></th>
                <th id="th_year" title="year"><spring:message code="model.record.year"
                                                              text="year"/></th>
                <th id="th_people" title="people"><spring:message code="model.record.people"
                                                                  text="people"/></th>
                <th id="th_department" title="department"><spring:message code="model.record.department"
                                                                          text="department"/></th>
                <th id="th_deadline" title="deadline"><spring:message code="model.record.deadline"
                                                                      text="deadline"/></th>
                <th id="th_recordtype" title="recordtype"><spring:message code="model.record.recordtype"
                                                                          text="recordtype"/></th>
                <th id="th_createtime" title="CreateTime"><spring:message code="model.record.createtime"
                                                                          text="CreateTime"/></th>
                <th title="Actions" class="actions w90"><spring:message code="actions"
                                                                        text="Actions"/></th>
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
                <td class="center">
                    {{if isVolume == false}}
                    案件
                    {{else}}
                    案卷
                    {{/if}}
                </td>
                <td class="center">{{= subject}}</td>
                <td class="center">{{= yearString}}</td>
                <td class="center">{{= people}}</td>
                <td class="center">{{= departmentString}}</td>
                <td class="center">{{= deadlineString}}</td>
                <td class="center">{{= title}}</td>
                <td class="center">{{= createtime}}</td>
                <td class="center">
                    {{if isVolume == false}}
                    <a class="btn btn-success" title="查看具体信息"><i class="glyphicon glyphicon-check"></i></a>
                    <a class="btn btn-success importinfo" title="录入信息"><i class="glyphicon glyphicon-import"></i></a>
                    {{else}}
                    <a class="btn btn-success reBuildVolume " title="重新组卷"><span class="glyphicon glyphicon-road"></span></a>
                    <a class="btn btn-success buildVolume" title="组卷"><span class="glyphicon glyphicon-inbox"></span></a>
                    <a class="btn btn-success uncoverVolume" title="申请拆卷"><span class="glyphicon glyphicon-gift"></span></a>
                    {{/if}}
                </td>
            </tr>
            {{/each}}
            {{/if}}
            </tbody>
        </table>
    </div>
    <nav class="center templatenav">
        <ul class="pagination">
            {{if records.page.pageNum == 1}}
            <li class="disabled"><a href="#">上一页</a></li>
            {{else}}
            <li><a
                    href="#" id="prev"><span>上一页</span></a>
            </li>
            {{/if}}
            {{each(i,value) pages}}
            {{if records.page.pageNum == value }}
            <li class="active"><a href="#">{{= value}}</a></li>
            {{else value == 0}}
            <li><a>...</a></li>
            {{else}}
            <li><a
                    href="#" id="toNum"><span>{{= value}}</span></a>
            </li>
            {{/if}}
            {{/each}}
            {{if records.page.pageNum == records.page.totalPage}}
            <li class="disabled"><a href="#">下一页</a></li>
            {{else}}
            <li><a href="#" id="next"><span>下一页</span></a>
            </li>
            {{/if}}
        </ul>
    </nav>


</script>
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
    $(document).ready(function () {
        $('#jstree').jstree();
        var title = "";
        var showTables = function (url, isVolume) {
            $.ajax({
                type: "POST",
                url: url,
                data: $("#recordSearchForm").serialize(),
                /*data: {
                 rccId: recordCatoryContent,
                 recordCatogory: recordCatory,
                 rtId: recordType,
                 fondsId: fondsId,
                 page: 1,
                 size: 5
                 },*/
                success: function (result) {
                    console.log(result);
                    $(".templatenav").remove();
                    result.title = title;
                    result.isVolume = isVolume;

                    var items = result.records.page.items;
                    $.each(items, function (i, v) {
                        console.log(v.createtime);
                        var date = new Date(v.createtime);
                        items[i].createtime = date.Format("yyyy-MM-dd HH:mm:ss");
                    });
                    $("#RecordTemplate").tmpl(result).replaceAll($(".table-content"));
                    $("#prev").on("click", function (e) {
                        var current = $("nav li.active a").text();
                        $("#recordSearchForm #page").val(current - 1);
                        showTables(url, isVolume);
                    });
                    $("#next").on("click", function (e) {
                        var current = $("nav li.active a").text();
                        $("#recordSearchForm #page").val(current + 1);
                        showTables(url, isVolume);
                    });
                    $("#toNum").on("click", function (e) {
                        var toNum = $(this).find("span").text();
                        $("#recordSearchForm #page").val(toNum);
                        showTables(url, isVolume);
                    });
					$(".reBuildVolume").on("click",function(e){
						$("#reBuildVolumeTemplate").modal("show");
					});
					$(".uncoverVolume").on("click",function(e){
						$("#unCoverVolumeTemplate").modal("show");
					});
                    $(".buildVolume").on("click", function (e) {
                        var volumeid = $(this).closest("tr").attr("id");
                        $.ajax({
                            type: "GET",
                            url: "<c:url value="/json/record/getCanBuildRecord"  />",
                            data: $("#recordSearchForm").serialize(),
                            success: function (result) {
                                console.log(result);
                                result.title = title;
                                result.isVolume = false;
                                $("#buildVolumeTemplate").tmpl(result).replaceAll($("#commonModal .modal-content"));
                                $(".modal-dialog").width(1000);
                                $('#commonModal').modal("show");
                                $('.daterange #starttime').datepicker({
                                    format: "yyyy-mm-dd",
                                    todayBtn: "linked",
                                    language: "zh-CN",
                                    autoclose: true,
                                    todayHighlight: true
                                });
                                $('.daterange #endtime').datepicker({
                                    format: "yyyy-mm-dd",
                                    todayBtn: "linked",
                                    language: "zh-CN",
                                    autoclose: true,
                                    todayHighlight: true
                                });
                                $(".buildConfirm").on("click", function (e) {
                                    var array = [];
                                    $.each($("[name=recordid]:checked"), function (i, v) {
                                        array.push(v.val());
                                    });
                                    var data = {
                                        volumeid: volumeid,
                                        recordids: array
                                    }
                                });
                            }
                        });


                    });

                }
            });
        }

        $("#jstree").delegate(".volume a", "click", function (e) {
            var recordCatoryContentLi = $(this).closest(".jstree-children").closest("[role=treeitem]");
            var recordCatoryContent = recordCatoryContentLi.attr("id");
            var recordCatoryLi = recordCatoryContentLi.closest(".jstree-children").closest("[role=treeitem]");
            var recordCatory = recordCatoryLi.attr("id");
            var recordTypeLi = recordCatoryLi.closest(".jstree-children").closest("[role=treeitem]");
            var recordType = recordTypeLi.attr("id");
            title = recordTypeLi.attr("title");
            var fondsLi = recordTypeLi.closest(".jstree-children").closest("[role=treeitem]");
            var fondsId = fondsLi.attr("id");
            console.log(recordCatoryContent);
            console.log(recordCatory);
            console.log(recordType);
            console.log(title);
            console.log(fondsId);
            $("#rccId").val(recordCatoryContent);
            $("#recordCatogory").val(recordCatory);
            $("#rtId").val(recordType);
            $("#fondsId").val(fondsId);
            $("#page").val(1);
            $("#size").val(5);
            showTables("<c:url value="/json/recordvolumn/manage" />", true);
        });

        $("#jstree").delegate(".nonvolume a", "click", function (e) {
            var recordCatoryContentLi = $(this).closest(".jstree-children").closest("[role=treeitem]");
            var recordCatoryContent = recordCatoryContentLi.attr("id");
            var recordCatoryLi = recordCatoryContentLi.closest(".jstree-children").closest("[role=treeitem]");
            var recordCatory = recordCatoryLi.attr("id");
            var recordTypeLi = recordCatoryLi.closest(".jstree-children").closest("[role=treeitem]");
            var recordType = recordTypeLi.attr("id");
            title = recordTypeLi.attr("title");
            var fondsLi = recordTypeLi.closest(".jstree-children").closest("[role=treeitem]");
            var fondsId = fondsLi.attr("id");
            console.log(recordCatoryContent);
            console.log(recordCatory);
            console.log(recordType);
            console.log(title);
            console.log(fondsId);
            $("#rccId").val(recordCatoryContent);
            $("#recordCatogory").val(recordCatory);
            $("#rtId").val(recordType);
            $("#fondsId").val(fondsId);
            $("#page").val(1);
            $("#size").val(5);
            showTables("<c:url value="/json/record/manage" />", false);
        });

        $(".searchbutton").on("click", function (e) {
            e.preventDefault();
            var params = $("#recordSearchForm").serialize();
            console.log(params);

            var treeitem = $(".jstree-clicked").closest("[role=treeitem]");
            var url = "<c:url value="/json/record/manage" />";
            var isVolume = false;
            if (treeitem.hasClass("volume")) {
                url = "<c:url value="/json/recordvolumn/manage" />";
                isVolume = true;
            }
            showTables(url, isVolume);
        });

        $(".deleteuser").on("click", function (e) {
            var userid = $(this).closest("tr").attr("id");
            var result = {datetip: "您确定要删除该用户吗？"};
            $('#dateTipTemplate').tmpl(result).replaceAll($('#commonModal .modal-content'));
            $('#commonModal').modal("show");

            $(".commonConfirm").on("click", function (e) {
                $.get("<c:url value="/json/user/delete"  />", {userid: userid}, function (data, status, xh) {
                    console.log(data);
                    if (data == 1) {
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


        $('.checkuser').on('click', function (e) {
            var id = $(this).parents("tr").attr("id");
            $.get("<c:url value="/json/user/view"/>", {
                userid: id
            }, function (result) {
                $('#CheckTemplate').tmpl(result).replaceAll($('.modal-content'));
                $(".modal-dialog").width(800);
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


        $('.createuser').on('click', function (e) {
            e.preventDefault();
            $('#viewInfoTemplate').tmpl().replaceAll($('#view .modal-content'));
            $(".modal-dialog").width(800);
            $(".optitle").text("创建用户");
            $(".button1").text("确定");
            $(".button2").text("取消");
            $('#view').modal('show');
            $('#view #userCreateForm').validate(
                    {
                        errorPlacement: function (error, element) {
                            error.replaceAll($("#" + $(element).attr("name") + "-error"));
                        },
                        rules: {
                            tempusername: {
                                maxlength: 16,
                                required: true,
                                remote: {
                                    url: '<c:url value="/json/user/checkname"/>',
                                    type: 'post',
                                    dataType: 'json',
                                    data: {
                                        username: function () {
                                            return $("[name='tempusername']").val();
                                        }
                                    }
                                }
                            },
                            userpassword: {
                                rangelength: [6, 18],
                                required: true,
                                isPassword: true
                            },
                            pwdconfirm: {
                                rangelength: [6, 18],
                                required: true,
                                confirmPwd: "#userpassword"
                            },
                            provider: {
                                maxlength: 16,
                                required: true
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
                                isEmail: true,
                                remote: {
                                    url: '<c:url value="/json/user/email"/>',
                                    type: 'post',
                                    dataType: 'json',
                                    data: {
                                        username: function () {
                                            return $("[name='email']").val();
                                        }
                                    }
                                }
                            },
                            description: {
                                maxlength: 32,
                            }
                        },
                        messages: {
                            tempusername: {
                                required: "必填项！",
                                remote: "重名！"
                            },
                            userpassword: {
                                required: "必填！"
                            },
                            pwdconfirm: {
                                required: "必填！",
                            },
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
                                isEmail: "邮箱格式错误，请输入正确格式！",
                                remote: "该邮箱已使用，请重新输入！"
                            }
                        },
                        success: function (label) {
                            label.text("${validate_message_ok}").addClass("valid");
                            label.removeClass("error");
                            label.html("有效");
                        }
                    });
            $(".createuserbutton").on('click', function (e) {
                if ($('#userCreateForm').valid()) {
                    $('#userCreateForm').submit();
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
                $(".modal-dialog").width(800);
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
                    ${p}"><a href="#">
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

 