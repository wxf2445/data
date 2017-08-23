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
                            <spring:message code="nav.menu.dataset" text="dataset"/>
                        </li>
                        <li>
                            <spring:message code="nav.menu.template" text="template"/><spring:message
                                code="breadcrumb.manage"
                                text="Manage"/>
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i> <spring:message code="nav.menu.template"
                                                                                            text="template"/><spring:message
                                        code="breadcrumb.manage" text="Manage"/></h2>
                            </div>
                            <div class="box-content">
                                <%--   <c:if test="${templatepages eq null}">
                                    <div class="row center">
                                        <div class="col-md-1 col-md-offset-2">
                                      <img src="<c:url value="/resources/img/happy_72.png"/>" />

                                     </div>
                                     <div class="col-md-5 congratuation">
                                      <span>您尚未添加设备！</span>
                                     </div>
                                    </div>
                                </c:if> --%>
                                <%-- <c:if test="${templatepages ne null}"> --%>
                                <div class="navbar-inner">
                                    <div class="navbar-form navbar-left">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <shiro:hasPermission name="createtemplate">
                                                    <c:choose>
                                                    <c:when test="${canCreateTemplate eq false}">
                                                        <a class="nocreatetemplate btn btn-success disabled" href="#">
                                                            <i class="glyphicon glyphicon-plus-sign"></i> <spring:message
                                                                code="btn.create" text="Create"/>模板
                                                        </a>
                                                        <a class="alert alert-danger"><span><b><strong>请先创建全宗和档案类型再创建模板！</strong></b></span></a>
                                                    </c:when>
                                                        <c:otherwise>
                                                            <a class="createtemplate btn btn-success" href="#">
                                                                <i class="glyphicon glyphicon-plus-sign"></i> <spring:message
                                                                    code="btn.create" text="Create"/>模板
                                                            </a>
                                                        </c:otherwise>

                                                    </c:choose>
                                                </shiro:hasPermission>
                                            </div>
                                        </div>
                                    </div>
                                    <c:url value="/template/manage" var="searchActoin">
                                    </c:url>
                                    <form:form modelAttribute="recordSearchForm"
                                               action="${searchActoin}">
                                        <form:hidden path="orderByClause"/>
                                        <spring:message code="placeholder.start" text="Start" var="placeholder_start"/>
                                        <spring:message code="placeholder.to" text="To" var="placeholder_to"/>
                                        <spring:message code="placeholder.end" text="End" var="placeholder_end"/>
                                        <spring:message code="placeholder.keyword.name" text="Keyword"
                                                        var="placeholder_keyword_name"/>
                                        <spring:message code="placeholder.search" text="Search"
                                                        var="placeholder_search"/>
                                        <div class="navbar-form navbar-right" role="search">
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <select name="fondsId" class="form-control">
                                                        <c:forEach var="fonds" items="${fondss}">
                                                            <option value="${fonds.id}" ${recordSearchForm.fondsId eq fonds.id ? "selected":""}>${fonds.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <select name="rtId" class="form-control">
                                                        <c:forEach var="recordType" items="${recordTypes}">
                                                            <option value="${recordType.id}" ${recordSearchForm.rtId eq recordType.id ? "selected":""}>${recordType.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                                <%--<div class="form-group">

                                                    <div class="input-daterange input-group" id="datepicker">
                                                        <form:input class="form-control" placeholder="${placeholder_start}"
                                                                    path="starttime"/>
                                                        <span class="input-group-addon">${placeholder_to}</span>
                                                        <form:input class="form-control" placeholder="${placeholder_end}"
                                                                    path="endtime"/>
                                                        <span class="input-group-addon"><i
                                                                class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <spring:message code="model.template.name" text="Search"
                                                                        var="placeholder_search"/>
                                                        <form:input class="form-control"
                                                                    placeholder="${placeholder_search}" path="key"
                                                                    autocomplete="true"/>
                                <span class="input-group-btn">
                                  <button type="submit" class="btn btn-info"><i class="glyphicon glyphicon-search"></i>
                                  </button>
                                </span>
                                                    </div>
                                                </div>--%>
                                        </div>
                                    </form:form>
                                </div>
                                <c:set var="page" value="${templatePages.getPage() }"></c:set>
                                <div class="table-content">
                                    <table class="table table-striped table-bordered responsive">
                                        <thead>
                                        <tr>
                                            <th id="th_name" title="Name"><spring:message code="model.template.name"
                                                                                          text="Name"/></th>
                                            <th id="th_createtime" title="CreateTime"><spring:message
                                                    code="model.template.createtime" text="CreateTime"/></th>
                                            <th title="Actions" class="actions w90"><spring:message code="actions"
                                                                                                    text="Actions"/></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty page.items }">
                                                <tr>
                                                    <td style="display:none">无</td>
                                                    <td colspan="20" class="center">表中数据为空！</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="template" items="${page.items }" varStatus="">
                                                    <tr id="${template.tableid }">
                                                        <td>${template.name }</td>
                                                        <td>
                                                            <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                            value="${template.createtime }"/>
                                                        </td>
                                                        <td class="">
                                                            <a class="viewColumn btn btn-primary" title="查看字段"><i
                                                                    class="glyphicon glyphicon-eye-open"></i></a>
                                                            <shiro:hasPermission name="edittemplate">
                                                                <a class="edit btn btn-info" title="编辑"><i
                                                                        class="glyphicon glyphicon-edit"></i></a>
                                                            </shiro:hasPermission>
                                                            <shiro:hasPermission name="deletetemplate">
                                                                <a class="delete btn btn-danger" title="删除"><i
                                                                        class="glyphicon glyphicon-remove"></i></a>
                                                            </shiro:hasPermission>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                        </tbody>
                                    </table>
                                </div>
                                <nav class="center">
                                    <ul class="pagination">
                                        <c:choose>
                                            <c:when test="${page.currentPage() == page.firstPage()}">
                                                <li class="disabled"><a href="#">&laquo;</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li>
                                                    <a href="<c:url value="/template/manage?n=${n}&typeId=${typeId }&page=${page.previousPage()}&size=${page.getPageSize()}&sn=true"/>"><span>&laquo;</span></a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach var="p" items="${templatePages.showPages()}" varStatus="s">
                                            <c:choose>
                                                <c:when test="${p == page.currentPage()}">
                                                    <li class="active"><a href="#">${p}</a></li>
                                                </c:when>
                                                <c:when test="${p == 0}">
                                                    <li><a>...</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <a href="<c:url value="/template/manage?n=${n}&typeId=${typeId }&page=${p}&size=${page.getPageSize()}&sn=true"/>"><span>${p}</span></a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${page.currentPage() == page.lastPage()}">
                                                <li class="disabled"><a href="#">&raquo;</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li>
                                                    <a href="<c:url value="/template/manage?n=${n}&typeId=${typeId }&page=${page.nextPage()}&size=${page.getPageSize()}&sn=true"/>"><span>&raquo;</span></a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                </nav>
                                <%-- </c:if> --%>
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
                                <th id="th_dtuid" title="dtuid"><spring:message code="model.template.dtuid"
                                                                                text="dtuid"/></th>
                                <th id="th_checksum" title="checksum"><spring:message code="model.template.checksum"
                                                                                      text="checksum"/></th>
                                <th id="th_acstatus" title="acstatus"><spring:message code="model.template.acstatus"
                                                                                      text="acstatus"/></th>
                                <th id="th_description" title="Description"><spring:message
                                        code="model.template.description" text="Description"/></th>
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


<script type="text/html" id="templatedeletetemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4>温馨提示：</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <p class="deletetip">是否确定要删除用户<span class="deletetemplatename"></span>信息？</p>

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

<script type="text/html" id="temColumnTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="optitle">查看模板字段信息</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <table class="table table-striped table-bordered responsive">
                    <thead>
                    <tr>
                        <th id="th_colname" title="ColName"><spring:message code="model.template.colname"
                                                                            text="Name"/></th>
                        <th id="th_colwidth" title="ColWidth"><spring:message
                                code="model.template.colwidth" text="ColWidth"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    {{each infos}}
                    <tr>
                        <td>{{= columnname}}</td>
                        <td>{{= columnwidth}}</td>
                    </tr>
                    {{/each}}
                    </tbody>
                </table>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="checkpass btn btn-primary" data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                    class="button1"><spring:message code="href.confirm" text="Confirm"/></span></strong></a>
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
                <c:url var="createUserAction" value="/template/create"/>
                <form:form modelAttribute="createUserForm" action="${createUserAction}" class="form-horizontal"
                           role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.template.name"
                                                                              text="Name"/></label>

                        <div class="col-sm-3">
                            <p class="form-control-static">{{= templatename}} </p>
                        </div>
                        <label id="name-error" class="col-md-1"></label>
                        <label class="col-sm-2 control-label"><spring:message code="model.template.type"
                                                                              text="Type"/></label>

                        <div class="col-sm-3">
                            <p class="form-control-static">{{= role.name}} </p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.template.password"
                                                                              text="Password"/></label>

                        <div class="col-sm-3">
                            <p class="form-control-static">{{= password}} </p>
                        </div>
                        <label id="pwd-error" class="col-md-1"></label>
                        <label class="col-sm-2 control-label"><spring:message code="model.template.service"
                                                                              text="Service"/></label>

                        <div class="col-sm-3">
                            <p class="form-control-static">{{= provider}} </p>
                        </div>
                        <label id="provider-error" class="col-md-1"></label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.template.contact"
                                                                              text="Contact"/></label>

                        <div class="col-sm-3">
                            <p class="form-control-static">{{= contact}} </p>
                        </div>
                        <label id="contact-error" class="col-md-1"></label>
                        <label class="col-sm-2 control-label"><spring:message code="model.template.contactinfo"
                                                                              text="Contactinfo"/></label>

                        <div class="col-sm-3">
                            <p class="form-control-static">{{= contactinfo}} </p>
                        </div>
                        <label id="contactinfo-error" class="col-md-1"></label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.template.mailbox"
                                                                              text="MailBox"/></label>

                        <div class="col-sm-3">
                            <p class="form-control-static">{{= email}} </p>
                        </div>
                        <label id="email-error" class="col-md-1"></label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.template.description"
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
<script type="text/html" id="edittemplateTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="optitle">审核用户</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <c:url var="editUserAction" value="/json/template/edit"/>
                <form:form modelAttribute="templateCreateForm" action="${editUserAction}" class="form-horizontal"
                           role="form">
                    <input type="hidden" name="templateid" value="{{= templateid}}">

                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.template.name"
                                                                              text="Name"/></label>

                        <div class="col-sm-4">
                            <input name="temptemplatename" class="form-control" placeholder="{{= templatename }}"
                                   disabled="disabled" value="{{= templatename }}">
                            <label id="temptemplatename-error" class=""></label>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.template.type"
                                                                              text="Type"/></label>

                        <div class="col-sm-4">
                            <select disabled="disabled" name="templatetype" class="form-control">
                                <option value="{{= roleid}}">{{= role.name}}</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.template.password"
                                                                              text="Password"/></label>

                        <div class="col-sm-4">
                            <input type="password" name="templatepassword" id="templatepassword" class="form-control"
                                   placeholder="空时，不输入新密码则不修改密码">
                            <label id="templatepassword-error" class="ferror"></label>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.template.service"
                                                                              text="Service"/></label>

                        <div class="col-sm-4">
                            <input name="provider" class="form-control" placeholder="{{= provider}}"
                                   value="{{= provider}}">
                            <label id="provider-error" class=""></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.template.pwdconfirm"
                                                                              text="Pwdconfirm"/></label>

                        <div class="col-sm-4">
                            <input type="password" name="pwdconfirm" class="form-control" placeholder="空时，不输入新密码则不修改密码">
                            <label id="pwdconfirm-error" class="ferror"></label>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.template.contact"
                                                                              text="Contact"/></label>

                        <div class="col-sm-4">
                            <input name="contact" class="form-control" placeholder="{{= contact}}"
                                   value="{{= contact}}">
                            <label id="contact-error" class=""></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.template.contactinfo"
                                                                              text="ContacInfo"/></label>

                        <div class="col-sm-4">
                            <input name="contactinfo" class="form-control" placeholder="{{= contactinfo}}"
                                   value="{{= contactinfo}}">
                            <label id="contactinfo-error" class=""></label>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.template.mailbox"
                                                                              text="MailBox"/></label>

                        <div class="col-sm-4">
                            <input name="email" class="form-control" placeholder="{{= email}}" value="{{= email}}">
                            <label id="email-error" class=""></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.template.description"
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
            <a href="#" class="edittemplatebutton btn btn-primary"><strong><i class="glyphicon glyphicon-share-alt"></i>
                <span class="button1"><spring:message code="href.pass" text="Pass"/></span></strong></a>
            <a href="#" class="btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <span class="button2"><spring:message code="href.notpass"
                                                                                                     text="Not pass"/></span></strong></a>
        </div>

        </form>
    </div>
</script>

<script type="text/html" id="addColTemplate">
    <div class="form-group">
        <label class="col-sm-1 control-label"><span><strong><b class="num">{{= i+1}}</b></strong></span></label>
        <label class="col-sm-1 control-label customFormLabel"><spring:message code="model.template.colname"
                                                                              text="Name"/></label>

        <div class="col-sm-4">
            <input id="columns[{{= i}}].colname" name="columns[{{= i}}].colname" class="form-control">
            <label id="columns{{= i}}colname-error" class="control-label errorlabel"></label>
        </div>
        <label class="col-sm-1 control-label customFormLabel"><spring:message code="model.template.colwidth"
                                                                              text="colwidth"/></label>

        <div class="col-sm-4">
            <input id="columns[{{= i}}].colwidth" name="columns[{{= i}}].colwidth" class="form-control">
            <label id="columns{{= i}}colwidth-error" class="control-label errorlabel"></label>
        </div>
        <a class="btn btn-danger delColumn">删除</a>
    </div>
</script>
<script type="text/html" id="addEditColTemplate">
    <div class="form-group">
        <label class="col-sm-1 control-label"><span><strong><b class="num">{{= i+1}}.</b></strong></span></label>
        <label class="col-sm-1 control-label customFormLabel"><spring:message code="model.template.colname"
                                                                              text="Name"/></label>

        <div class="col-sm-4">
            <input id="addcolumns[{{= i}}].colname" name="addcolumns[{{= i}}].colname" class="form-control">
            <label id="addcolumns{{= i}}colname-error" class="control-label errorlabel"></label>
        </div>
        <label class="col-sm-1 control-label customFormLabel"><spring:message code="model.template.colwidth"
                                                                              text="colwidth"/></label>

        <div class="col-sm-4">
            <input id="addcolumns[{{= i}}].colwidth" name="addcolumns[{{= i}}].colwidth" class="form-control">
            <label id="addcolumns{{= i}}colwidth-error" class="control-label errorlabel"></label>
        </div>
        <a class="btn btn-danger delColumn">删除</a>
    </div>
</script>
<script type="text/html" id="recordTypeTemplate">

    {{each recordtypes}}
    <option value="{{= id}}">{{= name}}</option>
    {{/each}}
</script>
<script type="text/html" id="editTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="optitle">编辑模板</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <c:url var="editTemplateAction" value="/json/template/edit"/>
                <form:form modelAttribute="templateCreateForm" action="${editTemplateAction}" class="form-horizontal"
                           onsubmit="return doSubmit()" role="form">
                <input name="tableid" type="hidden" value="{{= tableid}}">
                <legend>档案路径</legend>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><spring:message code="model.record.fonds"
                                                                          text="Fonds"/></label>

                    <div class="col-sm-4">
                        <label class="form-control-static">{{= fonds.name}}</label>
                    </div>
                    <label class="col-sm-2 control-label"><spring:message code="model.record.recordtype"
                                                                          text="RecordType"/></label>

                    <div class="col-sm-4">
                        <label class="form-control-static">{{= recordtype.name}}</label>
                    </div>
                </div>
                <legend>名称</legend>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><spring:message code="model.template.temname"
                                                                          text="Name"/></label>

                    <div class="col-sm-4">
                        <input id="temname" name="temname" class="form-control" placeholder="{{= template.name}}"
                               value="{{= template.name}}">
                        <label id="temname-error" class="control-label"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><spring:message code="model.template.description"
                                                                          text="Description"/></label>

                    <div class="col-sm-10">
                        <textarea name="description" class="form-control" placeholder="{{= template.description}}">{{= template.description}}</textarea>
                        <label id="description-error" class=""></label>
                    </div>
                </div>
                <div class="alert alert-info">为防止信息丢失，只允许添加字段，不允许删除已添加字段！</div>
                <legend>字段信息<a class="btn btn-success addColumn">添加字段</a></legend>
                <fieldset id="colinfo" name="colinfo">
                    {{each(i,v) infos}}
                    <div class="form-group">
                        <label class="col-sm-1 control-label"><span><strong><b
                                class="num">{{= i+1}}</b></strong></span></label>
                        <label class="col-sm-1 control-label customFormLabel"><spring:message
                                code="model.template.colname"
                                text="Name"/></label>

                        <input id="columns[{{= i}}].colid" name="columns[{{= i}}].colid" class="form-control"
                               type="hidden" value="{{= v.columnid}}">

                        <div class="col-sm-4">
                            <input id="columns[{{= i}}].colname" name="columns[{{= i}}].colname" class="form-control"
                                   placeholder="{{= v.columnname}}" value="{{= v.columnname}}">
                            <label id="columns{{= i}}colname-error" class="control-label"></label>
                        </div>
                        <label class="col-sm-1 control-label customFormLabel"><spring:message
                                code="model.template.colwidth"
                                text="colwidth"/></label>

                        <div class="col-sm-4">
                            <input id="columns[{{= i}}].colwidth" name="columns[{{= i}}].colwidth" class="form-control"
                                   placeholder="{{= v.columnwidth}}" value="{{= v.columnwidth}}">
                            <label id="columns{{= i}}colwidth-error" class="control-label"></label>
                        </div>
                    </div>
                    {{/each}}
                    <blockquote>新添加字段</blockquote>
                </fieldset>
            </div>
            </form:form>
        </div>
        <div class="modal-footer">
            <a href="#" class="edittemplatebutton btn btn-primary"><strong><i
                    class="glyphicon glyphicon-share-alt"></i>
                <span class="button1"><spring:message code="href.confirm" text="Confirm"/></span></strong></a>
            <a href="#" class="btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <span class="button2"><spring:message
                    code="href.cancel"
                    text="Cancel"/></span></strong></a>
        </div>
    </div>
</script>
<script type="text/html" id="createTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="optitle">创建模板</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <c:url var="createTemplateAction" value="/json/template/create"/>
                <form:form modelAttribute="templateCreateForm" action="${createTemplateAction}" class="form-horizontal"
                           onsubmit="return doSubmit()" role="form">
                <legend>档案路径</legend>
                <div class="form-group">
                    <label class="col-sm-2 control-label"><spring:message code="model.record.fonds"
                                                                          text="Fonds"/></label>

                    <div class="col-sm-4">
                        <select id="fonds" name="fonds" class="form-control">
                            {{each fonds}}
                            <option value="{{= id}}">{{= name}}</option>
                            {{/each}}
                        </select>
                    </div>
                    <label class="col-sm-2 control-label"><spring:message code="model.record.recordtype"
                                                                          text="RecordType"/></label>

                    <div class="col-sm-4">
                        <select name="recordtype" class="form-control">
                            {{each recordtypes}}
                            <option value="{{= id}}">{{= name}}</option>
                            {{/each}}
                        </select>
                    </div>
                </div>
                {{if recordtypes.length == 0}}
                <div class="nonerecordtype alert alert-warning"><b>该全宗下无档案类型，请选择其他全宗！</b></div>
                <div class="inputarea" style="display: none;">
                    {{else}}
                    <div>
                        {{/if}}
                        <legend>名称</legend>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><spring:message code="model.template.temname"
                                                                                  text="Name"/></label>

                            <div class="col-sm-4">
                                <input id="temname" name="temname" class="form-control">
                                <label id="temname-error" class="control-label"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><spring:message code="model.template.description"
                                                                                  text="Description"/></label>

                            <div class="col-sm-10">
                                <textarea name="description" class="form-control"></textarea>
                                <label id="description-error" class=""></label>
                            </div>
                        </div>
                        <legend>字段信息<a class="btn btn-success addColumn">添加字段</a></legend>
                        <fieldset id="colinfo" name="colinfo">
                                <%--<div class="form-group">
                                    <label class="col-sm-1 control-label"><span><strong><b
                                            class="num">1</b>号</strong></span></label>
                                    <label class="col-sm-1 control-label"><spring:message code="model.template.colname"
                                                                                          text="Name"/></label>

                                    <div class="col-sm-4">
                                        <input id="columns[0].colname" name="columns[0].colname" class="form-control">
                                        <label id="columns[0].colname-error" class="control-label"></label>
                                    </div>
                                    <label class="col-sm-1 control-label"><spring:message code="model.template.colwidth"
                                                                                          text="colwidth"/></label>

                                    <div class="col-sm-4">
                                        <input id="columns[0].colwidth" name="columns[0].colwidth" class="form-control">
                                        <label id="columns[0].colwidth-error" class="control-label"></label>
                                    </div>
                                </div>--%>
                        </fieldset>
                    </div>
                    </form:form>
                </div>
            </div>
            <div class="modal-footer">
                <a href="#" class="createtemplatebutton btn btn-primary"><strong><i
                        class="glyphicon glyphicon-share-alt"></i>
                    <span class="button1"><spring:message code="href.confirm" text="Confirm"/></span></strong></a>
                <a href="#" class="btn btn-primary" data-dismiss="modal"><strong><i
                        class="glyphicon glyphicon-share-alt"></i> <span class="button2"><spring:message
                        code="href.cancel"
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
                        <label class="col-sm-2 control-label"><spring:message code="model.template.dtuid"
                                                                              text="Serialnumber"/></label>

                        <div class="col-sm-10">
                            <p class="form-control-static">{{= dtuid}} <i class="glyphicon glyphicon-tag blue"></i></p>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.template.checksum"
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
                            <th id="th_teamtemplatename" title="teamtemplatename"><spring:message
        code="model.member.name"
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
                            <td>{{= teamtemplatename}}</td>
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
                <a href="#" class="btn btn-primary" data-dismiss="modal"><i class="glyphicon glyphicon-share-alt"></i>
                    <spring:message code="href.close" text="Close"/></a>
        </div>
    </div>





































































































































































































































































































































































































































































</script>
<spring:message code="deleteform.message.failed" text="Delete failed!" var="message_delete_failed"/>
<spring:message code="deleteform.message.success" text="Delete success!" var="message_delete_success"/>
<spring:message code="check.success" text="Check Success" var="message_check_success"/>
<spring:message code="check.failure" text="Check Failure" var="message_check_failure"/>


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
        var currentFonds = "";
        $("[name='fondsId']").on("change", function (e) {
            var thisfondsselect = $(this);
            var oldFonds = currentFonds;
            currentFonds = $(this).val();
            $.ajax({
                type: "GET",
                url: "<c:url value="/json/record/getRecordPath"  />",
                data: {fondsid: currentFonds},
                success: function (result) {
                    console.log(result);
                    if (result.recordtypes.length > 0) {
                        $("[name='rtId']").empty();
                        $("#recordTypeTemplate").tmpl(result).appendTo($("[name='rtId']"));
                        $("#recordSearchForm").submit();
                    } else {
                        var tip = {"datetip": "改全宗下尚未创建档案类型！请重新选择！"};
                        $('#dateTipTemplate').tmpl(result).replaceAll($('#commonModal .modal-content'));
                        $('#commonModal').modal("show");
                        thisfondsselect.val(oldFonds);
                    }
                }
            });
        });
        $("[name='rtId']").on("change", function (e) {
            $("#recordSearchForm").submit();
        });


        $(".viewColumn").on("click", function (e) {
            var templateid = $(this).closest("tr").attr("id");
            $.get("<c:url value="/json/template/getcolumn"  />", {
                templateid: templateid,
                randomid: "1"
            }, function (result, status, xh) {
                $('#temColumnTemplate').tmpl(result).replaceAll($('#commonModal .modal-content'));
                $('#commonModal').modal("show");
            });
        });


        $('.checktemplate').on('click', function (e) {
            var id = $(this).parents("tr").attr("id");
            $.get("<c:url value="/json/template/view"/>", {
                templateid: id
            }, function (result) {
                $('#CheckTemplate').tmpl(result).replaceAll($('.modal-content'));
                $(".modal-dialog").width(800);
                $('#view').modal('show');
                $(".checkpass").on('click', function (e) {
                    window.location = "<c:url value='/template/checkpass?templateid='/>" + id;
                });

                $(".notpass").on('click', function (event) {
                    event.preventDefault();

                    $.get("<c:url value="/json/template/notpass"/>", {
                        templateid: id,
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


        $('.delete').on('click', function (e) {
            var tableid = $(this).closest("tr").attr("id");
            $.ajax({
                type: "POST",
                url: "<c:url value="/json/template/hasContent"  />",
                data: {contentTableId: tableid},
                success: function (result) {
                    if (result.status == false) {
                        result.datetip = "您确定要删除该模板吗？";
                    } else {
                        result.datetip = "该模板下已有数据，不建议删除！点击确定强制删除，点击取消不删除！";
                    }
                    $('#dateTipTemplate').tmpl(result).replaceAll($('#commonModal .modal-content'));
                    $('#commonModal').modal("show");

                    $(".commonConfirm").on("click", function (e) {
                        $.post("<c:url value="/json/template/delete"  />", {contentTableId: tableid}, function (data, status, xh) {
                            console.log(data);
                            if (data.status == true) {
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
                }
            });
        });
        $('.edit').on('click', function (e) {
            var tableid = $(this).closest("tr").attr("id");
            $.ajax({
                type: "GET",
                url: "<c:url value="/json/template/edit"  />",
                data: {contentTableId: tableid},
                success: function (result) {
                    console.log(result);
                    result.tableid = tableid;
                    $(".modal-dialog").width(1000);
                    $('#editTemplate').tmpl(result).replaceAll($('#view .modal-content'));
                    $('#view').modal("show");
                    var index = 0;
                    $(".addColumn").on("click", function (e) {
                        var cols = {
                            i: index,
                            originlength: result.infos.length
                        };
                        $("#addEditColTemplate").tmpl(cols).appendTo($("#colinfo"));
                        $("[name^='addcolumns['][name$='colname']").each(function () {
                            $(this).rules("add", {
                                required: true,
                                maxlength: 10,
                            });
                        });
                        $("[name^='addcolumns['][name$='colwidth']").each(function () {
                            $(this).rules("add", {
                                required: true,
                                number: true,
                                maxlength: 2,
                            });
                        });
                        index++;
                    });
                    $("#templateCreateForm").delegate(".delColumn", "click", function (e) {
                        $.each($(this).parents(".form-group").nextAll(), function (i, v) {
                            var num = Number($(v).find(".num").text());
                            num--;
                            $(v).find(".num").text(num);
                            num--;
                            var colname = $(v).find("input[name$='colname']");
                            colname.attr("id", "addcolumns[" + num + "].colname");
                            colname.attr("name", "addcolumns[" + num + "].colname");
                            colname.siblings("label").attr("id", "addcolumns" + num + "colname-error");
                            var colwidth = $(v).find("input[name$='colwidth']");
                            colwidth.attr("id", "addcolumns[" + num + "].colwidth");
                            colwidth.attr("name", "addcolumns[" + num + "].colwidth");
                            colwidth.siblings("label").attr("id", "addcolumns" + num + "colwidth-error");
                        });
                        $(this).closest(".form-group").remove();
                        index--;
                        console.log(index);
                    });
                    $('#view #templateCreateForm').validate(
                            {
                                submitHandler: function (form) {
                                    $(form).ajaxSubmit({
                                        dataType: "json",
                                        type: "post",
                                        success: function (data, s, xhr) {
                                            var status = data.status;
                                            $('#view').modal("hide");
                                            if (status == true) {
                                                noty({
                                                    text: "编辑成功！",
                                                    layout: "top",
                                                    type: "success",
                                                    timeout: 1000,
                                                    onClosed: function () {
                                                        window.location.reload();
                                                    }
                                                });

                                            } else {
                                                noty({
                                                    text: "编辑失败！",
                                                    layout: "top",
                                                    type: "error",
                                                    timeout: 1000
                                                });
                                            }
                                        }
                                    });
                                },
                                errorPlacement: function (error, element) {
                                    var id = error.attr("id");
                                    error.attr("id", id.replace("[", "").replace("]", "").replace(".", ""));
                                    console.log(error);
                                    error.replaceAll($("#" + $(element).attr("name").replace("[", "").replace("]", "").replace(".", "") + "-error"));
                                },
                                rules: {
                                    temname: {
                                        maxlength: 16,
                                        required: true,
                                        remote: {
                                            url: '<c:url value="/json/template/checkeditname"/>',
                                            type: 'post',
                                            dataType: 'json',
                                            data: {
                                                originname: function () {
                                                    return result.template.name;
                                                },
                                                templatename: function () {
                                                    return $("[name='temname']").val();
                                                }
                                            }
                                        }
                                    },
                                    colname: {
                                        rangelength: [6, 18],
                                        required: true,
                                    },
                                    colwidth: {
                                        rangelength: [6, 18],
                                        required: true,
                                    },
                                    description: {
                                        maxlength: 32,
                                    }
                                },
                                messages: {
                                    temname: {
                                        remote: "重名！"
                                    }
                                },
                                success: function (label) {
                                    var id = label.attr("id");
                                    label.attr("id", id.replace("[", "-").replace("]", ""));
                                    console.log(label);
                                    label.text("${validate_message_ok}").addClass("valid");
                                    label.removeClass("error");
                                    label.html("有效");
                                }
                            });
                    $("[name^='columns['][name$='colname']").each(function () {
                        $(this).rules("add", {
                            required: true,
                            maxlength: 10,
                        });
                    });
                    $("[name^='columns['][name$='colwidth']").each(function () {
                        $(this).rules("add", {
                            required: true,
                            number: true,
                            maxlength: 2,
                        });
                    });
                    $(".edittemplatebutton").on('click', function (e) {
                        if ($('#templateCreateForm').valid()) {
                            $('#templateCreateForm').submit();
                        }
                    });
                }
            });

        });
        $('.createtemplate').on('click', function (e) {
            e.preventDefault();
            var createTemplate = function (fondsid) {

                $.ajax({
                    type: "GET",
                    url: "<c:url value="/json/record/getRecordPath"  />",
                    data: {fondsid: fondsid},
                    success: function (result) {
                        console.log(result);
                        var i = -1;

                        $('#createTemplate').tmpl(result).replaceAll($('#view .modal-content'));
                        var selected = $("select#fonds").val();
                        $("select#fonds").on("change", function (e) {
                            console.log(selected);
                            var current = $(this).val();
                            $.ajax({
                                type: "GET",
                                url: "<c:url value="/json/record/getRecordPath"  />",
                                data: {fondsid: $(this).val()},
                                success: function (result) {
                                    console.log(result);
                                    if (result.recordtypes.length > 0) {
                                        if ($(".inputarea").is(":hidden")) {
                                            $(".inputarea").show();
                                        }
                                        if ($(".nonerecordtype").length > 0) {
                                            $(".nonerecordtype").hide();
                                        }
                                        $("#view [name='recordtype']").empty();
                                        $("#recordTypeTemplate").tmpl(result).appendTo($("#view [name='recordtype']"));
                                        selected = current;
                                    } else {
                                        alert("该全宗下尚无档案类型，请尽快创建！");
                                        $("select#fonds").val(selected);
                                    }
                                }
                            });
                        });
                        $(".addColumn").on("click", function (e) {
                            i++;
                            var cols = {
                                i: i
                            };
                            $("#addColTemplate").tmpl(cols).appendTo($("#colinfo"));
                            $("[name^='columns['][name$='colname']").each(function () {
                                $(this).rules("add", {
                                    required: true,
                                    maxlength: 10,
                                });
                            });
                            $("[name^='columns['][name$='colwidth']").each(function () {
                                $(this).rules("add", {
                                    required: true,
                                    number: true,
                                    maxlength: 2,
                                });
                            });
                        });
                        $("#templateCreateForm").delegate(".delColumn", "click", function (e) {
                            $.each($(this).parents(".form-group").nextAll(), function (i, v) {
                                var num = Number($(v).find(".num").text());
                                num--;
                                $(v).find(".num").text(num);
                                num--;
                                $(v).find("input").attr("id", "columns[" + num + "].colname");
                                $(v).find("input").attr("name", "columns[" + num + "].colname");
                                $(v).find("label.errorlabel").attr("id", "columns[" + num + "].colname-error");
                            });
                            $(this).closest(".form-group").remove();
                            i--;
                            console.log(i);
                        });

                        $(".modal-dialog").width(1000);
                        $('#view').modal('show');
                        $('#view #templateCreateForm').validate(
                                {
                                    submitHandler: function (form) {
                                        $(form).ajaxSubmit({
                                            dataType: "json",
                                            type: "post",
                                            success: function (data, s, xhr) {
                                                var status = data.status;
                                                $('#view').modal("hide");
                                                if (status == true) {
                                                    noty({
                                                        text: "创建成功！",
                                                        layout: "top",
                                                        type: "success",
                                                        timeout: 1000,
                                                        onClosed: function () {
                                                            window.location.reload();
                                                        }
                                                    });

                                                } else {
                                                    noty({
                                                        text: "创建失败！",
                                                        layout: "top",
                                                        type: "error",
                                                        timeout: 1000
                                                    });
                                                }
                                            }
                                        });
                                    },
                                    errorPlacement: function (error, element) {
                                        var id = error.attr("id");
                                        error.attr("id", id.replace("[", "").replace("]", "").replace(".", ""));
                                        console.log(error);
                                        error.replaceAll($("#" + $(element).attr("name").replace("[", "").replace("]", "").replace(".", "") + "-error"));
                                    },
                                    rules: {
                                        temname: {
                                            maxlength: 16,
                                            required: true,
                                            remote: {
                                                url: '<c:url value="/json/template/checkname"/>',
                                                type: 'post',
                                                dataType: 'json',
                                                data: {
                                                    templatename: function () {
                                                        return $("[name='temname']").val();
                                                    }
                                                }
                                            }
                                        },
                                        colname: {
                                            rangelength: [6, 18],
                                            required: true,
                                        },
                                        colwidth: {
                                            rangelength: [6, 18],
                                            required: true,
                                        },
                                        description: {
                                            maxlength: 32,
                                        }
                                    },
                                    messages: {
                                        temname: {
                                            required: "必填项！",
                                            remote: "重名！"
                                        },
                                        colname: {
                                            required: "必填！"
                                        },
                                        colwidth: {
                                            required: "必填！",
                                        },
                                        description: {
                                            required: "必填！"
                                        }
                                    },
                                    success: function (label) {
                                        var id = label.attr("id");
                                        label.attr("id", id.replace("[", "-").replace("]", ""));
                                        console.log(label);
                                        label.text("${validate_message_ok}").addClass("valid");
                                        label.removeClass("error");
                                        label.html("有效");
                                    }
                                });
                        $(".createtemplatebutton").on('click', function (e) {
                        	if($("#colinfo .form-group").length==0){
                                noty({
                                    text: "请添加字段",
                                    layout: "top",
                                    type: "failure",
                                    timeout: 1000
                                });
                                return;
                        	}
                            if ($('#templateCreateForm').valid()) {
                                $('#templateCreateForm').submit();
                            }
                        });
                    }
                });
            }
            createTemplate("");

        });

        $('.edittemplate').on('click', function (e) {
            var id = $(this).parents("tr").attr("id");
            var originalname = $(this).parents("tr").children('td:first').text();
            var oldemail = $.trim($(this).parents("tr").children('.templateemail').text());
            $.get("<c:url value="/json/template/view"/>", {
                templateid: id,
                random: Math.random()
            }, function (result) {
                $('#edittemplateTemplate').tmpl(result).replaceAll($('#view .modal-content'));
                $(".modal-dialog").width(800);
                $(".optitle").text("编辑用户");
                $(".button1").text("确定");
                $(".button2").text("取消");
                $('#view').modal('show');


                $('#view #templateCreateForm').validate({
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
                                url: '<c:url value="/json/template/checkedittemplatename"/>',
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
                        templatepassword: {
                            rangelength: [6, 18],
                            isPassword: true
                        },
                        pwdconfirm: {
                            rangelength: [6, 18],
                            confirmPwd: "#templatepassword"
                        },
                        provider: {
                            required: true,
                            maxlength: 16
                        },
                        template: {
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
                                url: '<c:url value="/json/template/edit/email"/>',
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
                        templatepassword: {},
                        pwdconfirm: {},
                        provider: {
                            required: "必填！"
                        },
                        template: {
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


                $(".edittemplatebutton").on("click", function (e) {
                    if ($('#templateCreateForm').valid()) {
                        $('#templateCreateForm').submit();
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
            var actionURL = $('#recordSearchForm').attr("action");
            if (actionURL.indexOf('?') != -1) {
                return false;
            }
            if (classes === sortClass.sSortAsc) {
                $('#orderByClause').val(column + ' desc');
                $('#recordSearchForm').attr("action", actionURL + "?sn=true&typeId=${typeId }");
                $('#recordSearchForm').submit();
            } else if (classes === sortClass.sSortDesc) {
                $('#orderByClause').val(column + ' asc');
                $('#recordSearchForm').attr("action", actionURL + "?sn=true&typeId=${typeId }");
                $('#recordSearchForm').submit();
            } else if (classes === sortClass.sSortable) {
                $('#orderByClause').val(column + ' desc');
                $('#recordSearchForm').attr("action", actionURL + "?sn=true&typeId=${typeId }");
                $('#recordSearchForm').submit();
            }
        });

        $('ul.pagination>li>a').click(function (e) {
            e.preventDefault();
            var link = $(this).attr("href");
            if (link && link !== '#') {
                $('#recordSearchForm').attr("action", link);
                $('#recordSearchForm').submit();
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
