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
                                <%--   <c:if test="${userpages eq null}">
                                    <div class="row center">
                                        <div class="col-md-1 col-md-offset-2">
                                      <img src="<c:url value="/resources/img/happy_72.png"/>" />

                                     </div>
                                     <div class="col-md-5 congratuation">
                                      <span>您尚未添加设备！</span>
                                     </div>
                                    </div>
                                </c:if> --%>
                                <%-- <c:if test="${userpages ne null}"> --%>
                                <div class="navbar-inner">
                                    <div class="navbar-form navbar-left">
                                        <div class="form-group">
                                            <div class="input-group">
                                            
                                            	<c:if test="${createrecordtype=='1' }">
	                                            	<a class="createType btn btn-success" href="#">
	                                                        <i class="glyphicon glyphicon-plus-sign"></i> <spring:message
	                                                            code="btn.create" text="Create"/>档案类型
	                                                    </a>
                                            	</c:if>
                                            	<c:if test="${createrecordtype=='-1' }">
	                                            	<shiro:hasAnyRoles name="SUPER ADMIN">
                                                    <a class="createType btn btn-success" href="#">
                                                        <i class="glyphicon glyphicon-plus-sign"></i> <spring:message
                                                            code="btn.create" text="Create"/>档案类型
                                                    </a>
                                                </shiro:hasAnyRoles> 
                                            	</c:if>
                                                <%-- <shiro:hasAnyRoles name="SUPER ADMIN">
                                                    <a class="createType btn btn-success" href="#">
                                                        <i class="glyphicon glyphicon-plus-sign"></i> <spring:message
                                                            code="btn.create" text="Create"/>档案类型
                                                    </a>
                                                </shiro:hasAnyRoles> --%>
                                            </div>
                                        </div>
                                    </div>
                                    <c:url value="/recordtype/manage" var="searchActoin">
                                    </c:url>
                                    <form:form modelAttribute="searchForm" action="${searchActoin}">
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
                                                    <spring:message code="model.recordtype.name" text="Search"
                                                                    var="placeholder_search"/>
                                                    <form:input class="form-control"
                                                                placeholder="${placeholder_search}" path="key"
                                                                autocomplete="true"/>
                            <span class="input-group-btn">
                              <button type="submit" class="btn btn-info"><i class="glyphicon glyphicon-search"></i>
                              </button>
                            </span>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                                <c:set var="page" value="${recordTypePages.getPage() }"></c:set>
                                <div class="table-content">
                                    <table class="table table-striped table-bordered responsive">
                                        <thead>
                                        <tr>
                                            <th id="th_name" title="Name"><spring:message code="model.recordtype.name"
                                                                                          text="Name"/></th>
                                            <th id="th_fondsName" title="FondsName"><spring:message code="model.recordtype.fondsName"
                                                                                          text="fondsName"/></th>
                                            <th id="th_createtime" title="CreateTime"><spring:message
                                                    code="model.user.createtime" text="CreateTime"/></th>
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
                                                <c:forEach var="recordtype" items="${page.items }" varStatus="">
                                                    <tr id="${recordtype.id }">
                                                        <td>${recordtype.name }</td>
                                                        <td>${recordtype.fonds }</td>
                                                        <td>
                                                            <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                            value="${recordtype.createtime }"/>
                                                        </td>
                                                        <td class="">
                                                            <a class="recordTypeDetailButton btn btn-success"
                                                               title="查看档案类型"><i
                                                                    class="glyphicon glyphicon-pencil"></i>
                                                            </a>
                                                            <a class="deleterecordtype btn btn-warning"
                                                               title="删除档案类型"><i
                                                                    class="glyphicon glyphicon-remove"></i>
                                                        	</a>
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
                                                    <a href="<c:url value="/recordtype/manage?n=${n}&typeId=${typeId }&page=${page.previousPage()}&size=${page.getPageSize()}&sn=true"/>"><span>&laquo;</span></a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach var="p" items="${recordTypePages.showPages()}" varStatus="s">
                                            <c:choose>
                                                <c:when test="${p == page.currentPage()}">
                                                    <li class="active"><a href="#">${p}</a></li>
                                                </c:when>
                                                <c:when test="${p == 0}">
                                                    <li><a>...</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <a href="<c:url value="/recordtype/manage?n=${n}&typeId=${typeId }&page=${p}&size=${page.getPageSize()}&sn=true"/>"><span>${p}</span></a>
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
                                                    <a href="<c:url value="/recordtype/manage?n=${n}&typeId=${typeId }&page=${page.nextPage()}&size=${page.getPageSize()}&sn=true"/>"><span>&raquo;</span></a>
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


<style>
.modal {
  overflow-y: auto;
}

.modal-open {
  overflow: auto;
}
</style>
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
                <p class="deletetip">是否确定要删除用户<span class="deleterecordtypename"></span>信息？</p>

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
<script type="text/javascript">
/* $(document).on("change","#myTab input[type=checkbox]",function(){
	 if($(this).is(':checked')){
		 $(this).next("button").addClass("btn-warning").removeClass("disabled").css({background:"",color:""});
		 if($("#myTab input[type=checkbox]").not(this).is(':checked')){
			 $("#myTab input[type=checkbox]").not(this).next("button").addClass("btn-primary").removeClass("btn-warning");
			 $($("#myTab input[type=checkbox]").not(this).next("button").attr("href")).removeClass("in").removeClass("active");
		 }
		 $($(this).next("button").attr("href")).addClass("in").addClass("active");
		 $(this).tab("show");
		 $(".createTypeButton").css({background:"#ccc",color:"#3C3C3C"}).removeClass("btn-primary").addClass("btn-muted").addClass("disabled");
	 }else{
		 $(this).next("button").removeClass("btn-primary").removeClass("btn-warning").addClass("disabled").css({background:"#ccc",color:"#3C3C3C"});
		 $($(this).next("button").attr("href")).removeClass("in").removeClass("active");
		 if($("#myTab input[type=checkbox]").not(this).is(':checked')){
			 $("#myTab input[type=checkbox]").not(this).next("button").removeClass("btn-primary").addClass("btn-warning");
			 $($("#myTab input[type=checkbox]").not(this).next("button").attr("href")).addClass("in").addClass("active"); 
			 $("#myTab input[type=checkbox]").not(this).next("button").tab("show");	
		 }
	 }	
}); */
$(document).on("click","#myTab button",function(){
	//if($("#myTab button").not(this).prev("input[type=checkbox]").is(':checked')){
		$("#myTab button").not(this).removeClass("btn-primary")/* .removeClass("btn-warning") */.css({background:"",color:""});
		if($(this).attr("activeType")=='piece'){
			activeType = "piece";
			if(pieceSureRule&&!$(".sureRule").hasClass("disabled"))
				$(".sureRule").removeClass("btn-primary").addClass("btn-muted").addClass("disabled");
			else if(!pieceSureRule&&$(".sureRule").hasClass("disabled"))
				$(".sureRule").addClass("btn-primary").removeClass("btn-muted").removeClass("disabled");
		}else if($(this).attr("activeType")=='recordvolume'){
			activeType = activeVolumeType;
			if(volumeSureRule&&!$(".sureRule").hasClass("disabled"))
				$(".sureRule").removeClass("btn-primary").addClass("btn-muted").addClass("disabled");
			else if(!volumeSureRule&&$(".sureRule").hasClass("disabled"))
				$(".sureRule").addClass("btn-primary").removeClass("btn-muted").removeClass("disabled");
		}
		$(".recordRuleContain").html($(".recordRuleContain").attr(activeType+"C"));
	//}
	$(this).addClass("btn-primary")/* .addClass("btn-warning") */;
});

$(document).on("click","#Tab li a",function(){
	activeType = $(this).attr("activeType");
	$(".recordRuleContain").html($(".recordRuleContain").attr(activeType+"C"));
});

$(document).on("click",".idorvalue",function(){
	$(this).parent().find("input").not(this).removeAttr("checked");
})

        function typeCreateFormSubmit(){
        	$('#typeCreateForm').submit();
        }
</script>
<script type="text/html" id="createTypeTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="optitle">创建档案类型</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <c:url var="createTypeAction" value="/json/recordtype/create"/>
                <form:form modelAttribute="typeCreateForm" action="${createTypeAction}" class="form-horizontal"
                           role="form">
                    <div class="form-group createDocument"  style="border:none">
                        <label class="col-sm-1 control-label">全宗</label>
                        <div class="col-sm-2">
                            <select name="fondsid" class="form-control">
                                  <c:forEach var="fond" items="${fonds }" varStatus="">
                                	  <option value="${fond.id}">${fond.name}</option>
                                  </c:forEach>
                            </select>
                        </div>

                        <label class="col-sm-1 control-label"><spring:message code="model.recordtype.name"
                                                                              text="Name"/></label>
                        <div class="col-sm-2">
                            <input id="typename" name="typename" class="form-control">
                            <label id="typename-error" class="control-label"></label>
                        </div>
                        <label class="col-sm-1 control-label"><spring:message code="model.recordtype.description"
                                                                              text="Description"/></label>

                        <div class="col-sm-2">
                            <input id="typedes" name="typedes" class="form-control">
                            <label id="typedes-error" class="control-label"></label>
                        </div>
                        <label class="col-sm-1 control-label"><spring:message code="model.recordtype.typeno"
                                                                              text="coding"/></label>

                        <div class="col-sm-2">
                            <input id="typeno" name="typeno" class="form-control">
                            <label id="typeno-error" class="control-label"></label>
                        </div>

				   		<div class="col-sm-12" style="border:none;height:30px">
							<div class="col-sm-1">格式：</div>
							<div class="col-sm-8 recordRuleContain" record="fondsid-department-year-deadline-sequencNo" volume="fondsid-department-year-deadline"
								piece="fondsid-department-year-deadline-sequencNo" recordC="全宗-部门-年度-保管期限-顺序号"
								volumeC="全宗-部门-年度-保管期限" pieceC="全宗-部门-年度-保管期限-顺序号">全宗-部门-年度-保管期限-顺序号</div>
							<div class="col-sm-3">
								<button type="button" class="ruleSure btn btn-muted btn-sm disabled"> 
			              			 确认规则 
			           			</button> 
								<button type="button" class="btn btn-primary btn-sm ruleRemove"> 
			              			 清空规则 
			           			</button> 
							</div>
				   		</div>
                    </div>

<div class="col-sm-12">
	<div class="col-sm-1">
	<ul id="myTab" class="nav nav-pills nav-stacked">
   		<li class="active">
			<button type="button" class="btn btn-sm btn-primary" href="#piece" data-toggle="tab" style="width:50px;height:50px" activeType="piece"> 
			         按件<br/>归档 
			</button> 
		</li>
   		<li>
			<button type="button" class="btn btn-sm" href="#recordvolume" data-toggle="tab" style="width:50px;height:50px;" activeType="recordvolume"> 
			         组卷<br/>归档 
			</button> 
		</li>
	</ul>
	</div>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade" id="recordvolume">
		<div class="col-sm-11">
			<center>
			<ul id="Tab" class="nav nav-tabs" style="width:250px">
				<li class="active">
					<a href="#volume" data-toggle="tab" activeType="volume"> 
			   			案卷字段 
					</a> 
				</li>
				<li>
					<a href="#record" data-toggle="tab" activeType="record"> 
			         	   卷内字段 
					</a> 
   				</li>
			</ul>
			</center>
		</div>
		<div id="TabContent" class="tab-content">
   		<div class="tab-pane fade active in" id="volume">
				   <div class="moreInfoContain col-sm-11" style="background:#fff">
					 <br>
					 <div class="form-group"> 
						<div class="col-sm-3">
						字段
						</div>
						<div class="col-sm-2">
						长度
						</div>
						<div class="col-sm-2">
      					连接符
						</div>
						<div class="col-sm-2">
      					用编码代替内容
						</div>
						<div class="col-sm-3">
      					操作
						</div>
          	     	 </div> 
						<div class="form-group" fieldnow="recordNo"> 
						<div class="col-sm-3">
							<font>案卷号</font><font2 style="display:none">volumeNo</font2>
						</div>
						<div class="col-sm-2">
							255
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
						</div>
						<input type="hidden" name="fieldsdata" value="volumeNo:255:案卷号"/>
						</div>
					  <div class="form-group" fieldnow="fondsid"> 
						<div class="col-sm-3">
							<font>全宗</font><font2 style="display:none">fondsid</font2>
						</div>
						<div class="col-sm-2">
							2
						</div>
						<div class="col-sm-2">
      						<select>
         						<option>-</option>
         						<option>.</option>
      						</select>
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-muted btn-sm disabled standardAdd"> 
			              		 <span class="glyphicon glyphicon-ok" title="加入档案生成规则"></span> 
			           		</button> 
							<button type="button" class="btn btn-muted btn-sm disabled standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="fondsid:2:全宗"/>
						</div>
					 <div class="form-group" fieldnow="year"> 
					 	<div class="col-sm-3">
						<font>年度</font><font2 style="display:none">year</font2>
						</div>
						<div class="col-sm-2">
							4
						</div>
						<div class="col-sm-2">
      						<select>
         						<option>-</option>
         						<option>.</option>
      						</select>
						</div>
						<div class="col-sm-2">
							是<input type="radio" class="idorvalue" value="1">
							否<input type="radio" class="idorvalue" value="0" checked>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-muted btn-sm disabled standardAdd"> 
			              		 <span class="glyphicon glyphicon-ok" title="加入档案生成规则"></span> 
			           		</button> 
							<button type="button" class="btn btn-muted btn-sm disabled standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="year:4:年度"/>
          	     	 </div> 
					 <div class="form-group" fieldnow="department"> 
						<div class="col-sm-3">
						<font>部门</font><font2 style="display:none">department</font2>
						</div>
						<div class="col-sm-2">
							3
						</div>
						<div class="col-sm-2">
      						<select>
         						<option>-</option>
         						<option>.</option>
      						</select>
						</div>
						<div class="col-sm-2">
							是<input type="radio" class="idorvalue" value="1">
							否<input type="radio" class="idorvalue" value="0" checked>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-muted btn-sm disabled standardAdd"> 
			              		 <span class="glyphicon glyphicon-ok" title="加入档案生成规则"></span> 
			           		</button> 
							<button type="button" class="btn btn-muted btn-sm disabled standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="department:3:部门"/>
          	     	 </div> 
					 <div class="form-group" fieldnow="deadline"> 
						<div class="col-sm-3">
						<font>保管期限</font><font2 style="display:none">deadline</font2>
						</div>
						<div class="col-sm-2">
							4
						</div>
						<div class="col-sm-2">
      						<select>
         						<option>-</option>
         						<option>.</option>
      						</select>
						</div>
						<div class="col-sm-2">
							是<input type="radio" class="idorvalue" value="1">
							否<input type="radio" class="idorvalue" value="0" checked>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-muted btn-sm disabled standardAdd"> 
			              		 <span class="glyphicon glyphicon-ok" title="加入档案生成规则"></span> 
			           		</button> 
							<button type="button" class="btn btn-muted btn-sm disabled standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="deadline:4:保管期限"/>
          	     	 </div> 
					  <div class="form-group"> 
						<div class="col-sm-3">
						<font>题名</font><font2 style="display:none">subject</font2>
						</div>
						<div class="col-sm-2">
							255
						</div>
						<div class="col-sm-2">
      						
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-primary btn-sm standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="subject:255:题名"/>
          	     	 </div> 
					  <div class="form-group"> 
						<div class="col-sm-3">
						<font>备注</font><font2 style="display:none">description</font2>
						</div>
						<div class="col-sm-2">
							100
						</div>
						<div class="col-sm-2">
      						
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-primary btn-sm standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="description:100:备注"/>
          	     	 </div>
					  <div class="form-group"> 
						<div class="col-sm-3">
						<font>总页数</font><font2 style="display:none">pagenum</font2>
						</div>
						<div class="col-sm-2">
							8
						</div>
						<div class="col-sm-2">
      						
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-primary btn-sm standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="pagenum:8:总页数"/>
          	     	 </div> 

					  <div class="form-group"> 
						<div class="col-sm-3">
						<font>物理位置</font><font2 style="display:none">address</font2>
						</div>
						<div class="col-sm-2">
							32
						</div>
						<div class="col-sm-2">
      						
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-primary btn-sm standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="address:32:物理位置"/>

          	     	 </div>
		     </div>
  		 </div>
		 <div class="tab-pane fade" id="record">
				   <div class="moreInfoContain col-sm-11" style="background:#fff">
					 <br>
					 <div class="form-group"> 
						<div class="col-sm-3">
						字段
						</div>
						<div class="col-sm-2">
						长度
						</div>
						<div class="col-sm-2">
      					
						</div>
						<div class="col-sm-3">
      					操作
						</div>
          	     	 </div> 
						<div class="form-group" id="record_volumerecordNo"> 
						<div class="col-sm-3">
							<font>档号</font><font2 style="display:none">recordNo</font2>
						</div>
						<div class="col-sm-2">
							255
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
						</div>
						<input type="hidden" name="fieldsdata" value="recordNo:255:档号"/>
						</div>
					  <div class="form-group" id="record_volumefondsid"> 
						<div class="col-sm-3">
							<font>全宗</font><font2 style="display:none">fondsid</font2>
						</div>
						<div class="col-sm-2">
							2
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
						</div>
						<input type="hidden" name="fieldsdata" value="fondsid:2:全宗"/>
						</div>
					 <div class="form-group" id="record_volumeyear"> 
					 	<div class="col-sm-3">
						<font>年度</font><font2 style="display:none">year</font2>
						</div>
						<div class="col-sm-2">
							4
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
						</div>
						<input type="hidden" name="fieldsdata" value="year:4:年度"/>
          	     	 </div> 
					 <div class="form-group" id="record_volumedepartment"> 
						<div class="col-sm-3">
						<font>部门</font><font2 style="display:none">department</font2>
						</div>
						<div class="col-sm-2">
							3
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
						</div>
						<input type="hidden" name="fieldsdata" value="department:3:部门"/>
          	     	 </div> 
					 <div class="form-group" id="record_volumedeadline"> 
						<div class="col-sm-3">
						<font>保管期限</font><font2 style="display:none">deadline</font2>
						</div>
						<div class="col-sm-2">
							4
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
						</div>
						<input type="hidden" name="fieldsdata" value="deadline:4:保管期限"/>
          	     	 </div> 
 					 <div class="form-group" id="sequencNoDiv"> 
						<div class="col-sm-3">
						<font>顺序号</font><font2 style="display:none">sequencNo</font2>
						</div>
						<div class="col-sm-2">
							3
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-muted btn-sm disabled standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="sequencNo:3:顺序号"/>
          	     	 </div> 
					  <div class="form-group"> 
						<div class="col-sm-3">
						<font>题名</font><font2 style="display:none">subject</font2>
						</div>
						<div class="col-sm-2">
							255
						</div>
						<div class="col-sm-2">
      						
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-primary btn-sm standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="subject:255:题名"/>
          	     	 </div> 
					  <div class="form-group"> 
						<div class="col-sm-3">
						<font>备注</font><font2 style="display:none">description</font2>
						</div>
						<div class="col-sm-2">
							100
						</div>
						<div class="col-sm-2">
      						
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-primary btn-sm standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="description:100:备注"/>
          	     	 </div>
					  <div class="form-group"> 
						<div class="col-sm-3">
						<font>页数</font><font2 style="display:none">pagenum</font2>
						</div>
						<div class="col-sm-2">
							8
						</div>
						<div class="col-sm-2">
      						
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-primary btn-sm standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="pagenum:8:页数"/>
          	     	 </div> 

					  <div class="form-group"> 
						<div class="col-sm-3">
						<font>物理位置</font><font2 style="display:none">address</font2>
						</div>
						<div class="col-sm-2">
							32
						</div>
						<div class="col-sm-2">
      						
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-primary btn-sm standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="address:32:物理位置"/>
          	     	 </div>
					  

 					</div>
					
		     </div>
   		</div>
	</div>
   <div class="tab-pane fade in active" id="piece">
      <div class="moreInfoContain col-sm-13" style="background:#fff">
					 <br>
					 <div class="form-group"> 
						<div class="col-sm-3">
						字段
						</div>
						<div class="col-sm-2">
						长度
						</div>
						<div class="col-sm-2">
      					连接符
						</div>
						<div class="col-sm-2">
      					用编码代替内容
						</div>
						<div class="col-sm-3">
      					操作
						</div>
          	     	 </div> 
						<div class="form-group"> 
						<div class="col-sm-3">
							<font>档号</font><font2 style="display:none">recordNo</font2>
						</div>
						<div class="col-sm-2">
							255
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
						</div>
						<input type="hidden" name="fieldsdata" value="recordNo:255:档号"/>
						</div>
					  <div class="form-group"> 
						<div class="col-sm-3">
							<font>全宗</font><font2 style="display:none">fondsid</font2>
						</div>
						<div class="col-sm-2">
							2
						</div>
						<div class="col-sm-2">
      						<select>
         						<option>-</option>
         						<option>.</option>
      						</select>
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-muted btn-sm disabled standardAdd"> 
			              		 <span class="glyphicon glyphicon-ok" title="加入档案生成规则"></span> 
			           		</button> 
							<button type="button" class="btn btn-muted btn-sm disabled standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="fondsid:2:全宗"/>
						</div>
					 <div class="form-group"> 
					 	<div class="col-sm-3">
						<font>年度</font><font2 style="display:none">year</font2>
						</div>
						<div class="col-sm-2">
							4
						</div>
						<div class="col-sm-2">
      						<select>
         						<option>-</option>
         						<option>.</option>
      						</select>
						</div>
						<div class="col-sm-2">
							是<input type="radio" class="idorvalue" value="1">
							否<input type="radio" class="idorvalue" value="0" checked>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-muted btn-sm disabled standardAdd"> 
			              		 <span class="glyphicon glyphicon-ok" title="加入档案生成规则"></span> 
			           		</button> 
							<button type="button" class="btn btn-muted btn-sm disabled standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="year:4:年度"/>
          	     	 </div> 
					 <div class="form-group"> 
						<div class="col-sm-3">
						<font>部门</font><font2 style="display:none">department</font2>
						</div>
						<div class="col-sm-2">
							3
						</div>
						<div class="col-sm-2">
      						<select>
         						<option>-</option>
         						<option>.</option>
      						</select>
						</div>
						<div class="col-sm-2">
							是<input type="radio" class="idorvalue" value="1">
							否<input type="radio" class="idorvalue" value="0" checked>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-muted btn-sm disabled standardAdd"> 
			              		 <span class="glyphicon glyphicon-ok" title="加入档案生成规则"></span> 
			           		</button> 
							<button type="button" class="btn btn-muted btn-sm disabled standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="department:3:部门"/>
          	     	 </div> 
					 <div class="form-group"> 
						<div class="col-sm-3">
						<font>保管期限</font><font2 style="display:none">deadline</font2>
						</div>
						<div class="col-sm-2">
							4
						</div>
						<div class="col-sm-2">
      						<select>
         						<option>-</option>
         						<option>.</option>
      						</select>
						</div>
						<div class="col-sm-2">
							是<input type="radio" class="idorvalue" value="1">
							否<input type="radio" class="idorvalue" value="0" checked>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-muted btn-sm disabled standardAdd"> 
			              		 <span class="glyphicon glyphicon-ok" title="加入档案生成规则"></span> 
			           		</button> 
							<button type="button" class="btn btn-muted btn-sm disabled standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="deadline:4:保管期限"/>
          	     	 </div> 
 					 <div class="form-group" id="sequencNoDiv"> 
						<div class="col-sm-3">
						<font>顺序号</font><font2 style="display:none">sequencNo</font2>
						</div>
						<div class="col-sm-2">
							3
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-muted btn-sm disabled standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="sequencNo:3:顺序号"/>
          	     	 </div> 
					  <div class="form-group"> 
						<div class="col-sm-3">
						<font>题名</font><font2 style="display:none">subject</font2>
						</div>
						<div class="col-sm-2">
							255
						</div>
						<div class="col-sm-2">
      						
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-primary btn-sm standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="subject:255:题名"/>
          	     	 </div> 
					 
					  <div class="form-group"> 
						<div class="col-sm-3">
						<font>备注</font><font2 style="display:none">description</font2>
						</div>
						<div class="col-sm-2">
							100
						</div>
						<div class="col-sm-2">
      						
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-primary btn-sm standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="description:100:备注"/>
          	     	 </div> 
					 
					  <div class="form-group"> 
						<div class="col-sm-3">
						<font>页数</font><font2 style="display:none">pagenum</font2>
						</div>
						<div class="col-sm-2">
							8
						</div>
						<div class="col-sm-2">
      						
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-primary btn-sm standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="pagenum:8:页数"/>
          	     	 </div> 

					  <div class="form-group"> 
						<div class="col-sm-3">
						<font>物理位置</font><font2 style="display:none">address</font2>
						</div>
						<div class="col-sm-2">
							32
						</div>
						<div class="col-sm-2">
      						
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-primary btn-sm standardUpdate"> 
			              		 <span class="glyphicon glyphicon-pencil" title="修改规则"></span> 
			           		</button> 
						</div>
						<input type="hidden" name="fieldsdata" value="address:32:物理位置"/>
          	     	 </div>

                   
                   
   			</div>
		</div>
<br>
			<div class="form-group"> 
				<div class="col-sm-1"></div>
				<div class="col-sm-4">
					<a href="#" class=" btn btn-default pull-left addMoreInfo"><strong>
                		<span class="glyphicon glyphicon-plus-sign"></span>添加自定义字段</strong></a>
				</div>
			</div>
			<div class="form-group"> 
				<div class="col-sm-1"></div>
				<div class="col-sm-4">
					<a href="#" class=" btn btn-default pull-left addGeneralField"><strong>
                		<span class="glyphicon glyphicon-plus-sign"></span>添加通用字段</strong></a>
				</div>
			</div>
</div>
</div>
					
                </form:form>
            </div>
		</div>
        <div class="modal-footer">

            <a href="#" class="createTypeButton btn btn-sm btn-primary"><strong><i class="glyphicon glyphicon-share-alt"></i>
                <span class="button1"><spring:message code="href.confirm" text="Confirm"/></span></strong></a>
            <a href="#" class="cancel btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <span class="button2"><spring:message code="href.cancel"
                                                                                                     text="Cancel"/></span></strong></a>
        </div>
    </div>
 </script>
 <div class="modal fade" id="addMoreInfo" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               添加
            </h4>
         </div>
         <div class="modal-body">
            <div class="box-content">
                <!-- <div class="alert alert-info">提示：添加卷内的自定义字段会自动添加到案卷字段中！</div> -->
            	<div class="col-sm-12">
	                <div class="form-group ">
		                   <label class="col-sm-1 control-label">元素:</label>
		                   <div class="col-sm-5">字段名称</div>
						   <!-- <div class="col-sm-2">英文名 </div> -->
		                   <div class="col-sm-5">长度</div>
	                 </div>
                 </div>
         		<div class="col-sm-12" style="margin-top:10px;margin-bottom:10px">
	                <div class="form-group">
		                   <label class="col-sm-1 control-label">示例:</label>
		                   <div class="col-sm-5">
		                        <input   class="form-control" value="保管期限" readOnly="true">
		                   </div>
						    <div class="col-sm-2" style="display:none">
		                        <input   class="form-control" value="deadline" readOnly="true">
		                   </div> 
		                   <div class="col-sm-5">
		                        <input   class="form-control" value="32" readOnly="true">
		                   </div>
	                 </div>
                 </div>
                 <div class="col-sm-12" >
	             	 <div class="form-group">
	             	 	<label class="col-sm-1 control-label">添加:</label>
	             	 	<form:form id="addFieldNameForm">
					          <div class="col-sm-5 addFieldName">
					              <input class="form-control" placeholder="${model_template_colname}" name="chinesename">
                            	  <label id="chinesename-error" class="control-label"></label>
					          </div>
					           <div class="col-sm-2 " style="display:none">
					              <input   class="form-control" placeholder="英文名" name="fieldname">
                            	  <label id="fieldname-error" class="control-label"></label>
					          </div> 
				              <div class="col-sm-5">
				                  <input type="number"  class="form-control" placeholder="${model_template_colwidth}" name="fieldlength">
                            	  <label id="fieldlength-error" class="control-label"></label>
				              </div>
				          </form:form>
	          	     </div>
          	     </div>
          	   </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary">
               确定
            </button>
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
         </div>
         </div>
	</div>
</div>
<div class="modal fade" id="addGeneralField" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               添加
            </h4>
         </div>
         <div class="modal-body">
            <div class="box-content">
            	<div class="col-sm-12">
	                <div class="form-group ">
		                   <label class="col-sm-1 control-label">元素:</label>
		                   <div class="col-sm-5">字段名称</div>
						   <!-- <div class="col-sm-2">英文名 </div> -->
		                   <div class="col-sm-5">长度</div>
	                 </div>
                 </div>
         		<div class="col-sm-12" style="margin-top:10px;margin-bottom:10px">
	                <div class="form-group">
		                   <label class="col-sm-1 control-label">示例:</label>
		                   <div class="col-sm-5">
		                        <input   class="form-control" value="保管期限" readOnly="true">
		                   </div>
						    <div class="col-sm-2" style="display:none">
		                        <input   class="form-control" value="deadline" readOnly="true">
		                   </div> 
		                   <div class="col-sm-5">
		                        <input   class="form-control" value="32" readOnly="true">
		                   </div>
	                 </div>
                 </div>
                 <div class="col-sm-12" >
	             	 <div class="form-group">
	             	 	<label class="col-sm-1 control-label">添加:</label>
	             	 	<form:form id="addGeneralFieldForm">
					          <div class="col-sm-5 addFieldName">
					              <input class="form-control" placeholder="${model_template_colname}" name="chinesename"  readOnly="true">
                            	  <label class="control-label"></label>
					          </div>
					           <div class="col-sm-2 " style="display:none">
					              <input   class="form-control" placeholder="英文名" name="fieldname">
                            	  <label class="control-label"></label>
					          </div> 
				              <div class="col-sm-5">
				                  <input type="number"  class="form-control" placeholder="${model_template_colwidth}" name="fieldlength"  readOnly="true" value="4">
                            	  <label class="control-label"></label>
				              </div>
				          </form:form>
	          	     </div>
          	     </div>
          	   </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary">
               确定
            </button>
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
         </div>
         </div>
	</div>
</div>
<div class="modal fade" id="updateMoreInfo" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
             	修改
            </h4>
         </div>
         <div class="modal-body">
            <div class="box-content">
                <div class="alert alert-info">提示：修改卷内的自定义字段会自动修改相对应的案卷字段！</div>
            	<div class="col-sm-12">
	                <div class="form-group ">
		                   <label class="col-sm-1 control-label">元素:</label>
		                   <div class="col-sm-5">字段名称</div>
						   <!-- <div class="col-sm-2">英文名 </div> -->
		                   <div class="col-sm-3">长度</div>
	                 </div>
                 </div>
         		<div class="col-sm-12" style="margin-top:10px;margin-bottom:10px">
	                <div class="form-group">
		                   <label class="col-sm-1 control-label">示例:</label>
		                   <div class="col-sm-5">
		                        <input   class="form-control" value="保管期限" readOnly="true">
		                   </div>
						    <div class="col-sm-2" style="display:none">
		                        <input   class="form-control" value="deadline" readOnly="true">
		                   </div> 
		                   <div class="col-sm-5">
		                        <input   class="form-control" value="32" readOnly="true">
		                   </div>
	                 </div>
                 </div>
                 <div class="col-sm-12" >
	             	 <div class="form-group">
	             	 	<label class="col-sm-1 control-label">更新:</label>
	             	 	<form:form id="updateFieldNameForm">
					          <div class="col-sm-5 addFieldName">
					              <input class="form-control" placeholder="${model_template_colname}" name="update_chinesename"  readOnly="true">
                            	  <label id="update_chinesename-error" class="control-label"></label>
					          </div>
					           <div class="col-sm-2 " style="display:none">
					              <input   class="form-control" placeholder="英文名" name="update_fieldname">
                            	  <label id="update_fieldname-error" class="control-label"></label>
					          </div> 
				              <div class="col-sm-5">
				                  <input type="number"  class="form-control" placeholder="${model_template_colwidth}" name="update_fieldlength">
                            	  <label id="update_fieldlength-error" class="control-label"></label>
				              </div>
				          </form:form>
	          	     </div>
          	     </div>
          	   </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary">
               						确定
            </button>
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
         </div>
         </div>
	</div>
</div>
<div class="modal fade" id="volumeAddMoreInfo" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               添加
            </h4>
         </div>
         <div class="modal-body">
            <div class="box-content">
            	<div class="col-sm-12">
	                <div class="form-group ">
		                   <label class="col-sm-1 control-label">元素:</label>
		                   <div class="col-sm-5">字段名称</div>
		                   <div class="col-sm-5">长度</div>
	                 </div>
                 </div>
         		<div class="col-sm-12" style="margin-top:10px;margin-bottom:10px">
	                <div class="form-group">
		                   <label class="col-sm-1 control-label">示例:</label>
		                   <div class="col-sm-5">
		                        <input   class="form-control" value="保管期限" readOnly="true">
		                   </div>
				           <div class="col-sm-2 " style="display:none">
				              <input   class="form-control" placeholder="英文名">
				          </div> 
		                   <div class="col-sm-5">
		                        <input   class="form-control" value="32" readOnly="true">
		                   </div>
	                 </div>
                 </div>
                 <div class="col-sm-12" >
	             	 <div class="form-group">
	             	 	<label class="col-sm-1 control-label">添加:</label>
	             	 	<form:form id="volumeAddFieldNameForm">
					          <div class="col-sm-5 addFieldName">
					              <input class="form-control" placeholder="${model_template_colname}" name="volume_chinesename">
                            	  <label id="volume_chinesename-error" class="control-label"></label>
					          </div>
					           <div class="col-sm-2 " style="display:none">
					              <input   class="form-control" placeholder="英文名" name="volume_fieldname">
                            	  <label id="volume_fieldname-error" class="control-label"></label>
					          </div> 
				              <div class="col-sm-5">
				                  <input type="number"  class="form-control" placeholder="${model_template_colwidth}" name="volume_fieldlength">
                            	  <label id="volume_fieldlength-error" class="control-label"></label>
				              </div>
				          </form:form>
	          	     </div>
          	     </div>
          	   </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary">
               确定
            </button>
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
         </div>
         </div>
	</div>
</div>
<div class="modal fade" id="volumeAddGeneralField" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               添加
            </h4>
         </div>
         <div class="modal-body">
            <div class="box-content">
            	<div class="col-sm-12">
	                <div class="form-group ">
		                   <label class="col-sm-1 control-label">元素:</label>
		                   <div class="col-sm-5">字段名称</div>
		                   <div class="col-sm-5">长度</div>
	                 </div>
                 </div>
         		<div class="col-sm-12" style="margin-top:10px;margin-bottom:10px">
	                <div class="form-group">
		                   <label class="col-sm-1 control-label">示例:</label>
		                   <div class="col-sm-5">
		                        <input   class="form-control" value="保管期限" readOnly="true">
		                   </div>
				           <div class="col-sm-2 " style="display:none">
				              <input   class="form-control" placeholder="英文名">
				          </div> 
		                   <div class="col-sm-5">
		                        <input   class="form-control" value="32" readOnly="true">
		                   </div>
	                 </div>
                 </div>
                 <div class="col-sm-12" >
	             	 <div class="form-group">
	             	 	<label class="col-sm-1 control-label">添加:</label>
	             	 	<form:form id="volumeAddGeneralFieldForm">
					          <div class="col-sm-5 addFieldName">
					              <input class="form-control" placeholder="${model_template_colname}" name="volume_chinesename" readOnly="true">
                            	  <label id="volume_chinesename-error" class="control-label"></label>
					          </div>
					           <div class="col-sm-2 " style="display:none">
					              <input   class="form-control" placeholder="英文名" name="volume_fieldname">
                            	  <label id="volume_fieldname-error" class="control-label"></label>
					          </div> 
				              <div class="col-sm-5">
				                  <input type="number"  class="form-control" placeholder="${model_template_colwidth}" name="volume_fieldlength"  readOnly="true"value="4">
                            	  <label id="volume_fieldlength-error" class="control-label"></label>
				              </div>
				          </form:form>
	          	     </div>
          	     </div>
          	   </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary">
               确定
            </button>
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
         </div>
         </div>
	</div>
</div>
<div class="modal fade" id="updateVolumeMoreInfo" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
             	修改
            </h4>
         </div>
         <div class="modal-body">
            <div class="box-content">
            	<div class="col-sm-12">
	                <div class="form-group ">
		                   <label class="col-sm-1 control-label">元素:</label>
		                   <div class="col-sm-5">字段名称</div>
		                   <div class="col-sm-5">长度</div>
	                 </div>
                 </div>
         		<div class="col-sm-12" style="margin-top:10px;margin-bottom:10px">
	                <div class="form-group">
		                   <label class="col-sm-1 control-label">示例:</label>
		                   <div class="col-sm-5">
		                        <input   class="form-control" value="保管期限" readOnly="true">
		                   </div>
		                   <div class="col-sm-5">
		                        <input   class="form-control" value="32" readOnly="true">
		                   </div>
	                 </div>
                 </div>
                 <div class="col-sm-12" >
	             	 <div class="form-group">
	             	 	<label class="col-sm-1 control-label">更新:</label>
	             	 	<form:form id="updateFieldNameForm">
					          <div class="col-sm-5 addFieldName">
					              <input class="form-control" placeholder="${model_template_colname}" name="volume_update_chinesename">
                            	  <label id="volume_update_chinesename-error" class="control-label"></label>
					          </div>
					           <div class="col-sm-2 " style="display:none">
					              <input   class="form-control" placeholder="英文名" name="volume_update_fieldname">
                            	  <label id="volume_update_fieldname-error" class="control-label"></label>
					          </div> 
				              <div class="col-sm-5">
				                  <input type="number"  class="form-control" placeholder="${model_template_colwidth}" name="volume_update_fieldlength">
                            	  <label id="volume_update_fieldlength-error" class="control-label"></label>
				              </div>
				          </form:form>
	          	     </div>
          	     </div>
          	   </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary">
               						确定
            </button>
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
         </div>
         </div>
	</div>
</div>

<div class="modal fade" id="generalDataList" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
             	通用字段
            </h4>
         </div>
         <div class="modal-body">
            <div class="box-content">
            	<div class="col-sm-12">
                        <div class="alert alert-info">提示：若将案卷中的通用字段加入档号生成规则，将会与卷内的相对应字段关联！</div>
	                <div class="form-group fieldList">
	                 </div>
                 </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
         </div>
         </div>
	</div>
</div>
</div>
<div class="modal fade" id="recordTypeDetail" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="recordTypeName">
             	
            </h4>
         </div>
         <div class="modal-body">
	        <ul id="fieldType" class="nav nav-tabs"> 
			    <li class="active"><a data-toggle="tab" type="_piece">按件字段</a> </li> 
			    <li><a href="#ios" data-toggle="tab" type="_volume">案卷字段</a></li> 
			    <li><a href="#ios" data-toggle="tab" type="_record">卷内字段</a></li> 
			</ul> 
            	<div class="table-content">
                     <table class="table table-striped table-bordered responsive">
                         <thead>
	                         <tr>
	                             <th id="th_name" title="name">字段名</th>
	                             <th id="th_length" title="length">字段长度</th>
	                             <th id="th_fieldNo" title="fieldNo">字段编码</th>
	                             <th id="th_operation" title="operation">操作</th>
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
<div class="modal fade" id="sureAddField" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
             	确认添加
            </h4>
         </div>
         <div class="modal-body">
            <div class="box-content">
            	注意！添加后<font color="#f00"> 不能删除</font>，确定要添加<span class="fieldData"  style="color:#f00"></span>?
          	</div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary">
               						确定
            </button>
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
         </div>
         </div>
	</div>
</div>

<script type="text/html" id="FieldTemplate">
    <div class="table-content">
        <table class="table table-striped table-bordered responsive">
            <thead>
            <tr>
                <th id="th_name" title="name">字段名</th>
                <th id="th_length" title="length">字段长度</th>
                <th id="th_operation" title="operation">操作</th>
            </tr>
            </thead>
            <tbody id="addcheckfieldname">
            {{if tablefields.length == 0}}
            <tr>
                <td style="display:none">无</td>
                <td colspan="20" class="center">无字段</td>
            </tr>
            {{else}}
            {{each tablefields}}
            <tr>
                <td class="name">{{= name}}</td>
                <td class="length" >{{= length}}</td>
                <td class="operation"> 
				</td>
            </tr>
            {{/each}}
            {{/if}}
            <tr recordtypeid="{{= recordtypeid}}" type="{{= type}}">
                <td class="name"><input name="fieldName" class="form-control"></td>
                <td class="length" ><input name="length" class="form-control" type="text" onkeyup='this.value=this.value.replace(/\D/gi,"")' maxlength="3"></td>
                <td class="operation"> 
					<a class="btn btn-success addField" title="添加"><i class="glyphicon glyphicon-plus"></i></a>
				</td>
            </tr>
            <tr>
				{{if type=='_volume' }}
                	<td colspan="20" class="center">案卷号规则:{{= rule}}</td>
				{{else}}
                	<td colspan="20" class="center">档号规则:{{= rule}}</td>
				{{/if}}
            </tr>
            </tbody>
        </table>
    </div>


</script>

 <script>
/*  function a(){
	 return true;
 }
 alert(a()); */
 var activeType = "piece";
 var activeVolumeType = "volume";
 var pieceSureRule = false;
 var volumeSureRule = false;
 var field_now = 0;
 $(document).on("click",".addMoreInfo",function(){
	   if(activeType=="record")
	 		$("#volumeAddMoreInfo").modal('show').find(".modal-dialog").width(600);
	   else
	 		$("#addMoreInfo").modal('show').find(".modal-dialog").width(600);
});
		 jQuery.validator.addMethod(
				    "checksensitive", 
				    function(value, element) {
				    	if(value=='')return true;
				    	value = value.replace("_","");
				        return /^[A-Za-z0-9]+$/.test(value);   
				    }, 
				    $.validator.format("含中文")
				);
		 jQuery.validator.addMethod(
				    "checkfieldname", 
				    function(value, element) {
				    	var groups = $("#"+activeType+" .moreInfoContain").find(".form-group");
				    	for(var i=1;i<groups.length;i++){
				    		if(groups.eq(i).find("div:first font").html().replace(' ','').replace(/(\n)+|(\r\n)+/g, "")==value){
				    			return false;
				    		}
				    	}
				    	return true;
				    }, 
				    $.validator.format("该字段名已经被使用")
				);
		 jQuery.validator.addMethod(
				    "updatecheckfieldname", 
				    function(value, element) {
				    	var groups = $("#"+activeType+" .moreInfoContain").find(".form-group");
				    	for(var i=1;i<groups.length;i++){
				    		if(groups.eq(i).find("div:first font").html().replace(' ','').replace(/(\n)+|(\r\n)+/g, "")==value){
								if(i+1!=$("#updateMoreInfo").attr("div_index"))
				    				return false;
				    		}
				    	}
				    	return true;
				    }, 
				    $.validator.format("该字段名已经被使用")
				);
		 jQuery.validator.addMethod(
				    "volumeupdatecheckfieldname", 
				    function(value, element) {
				    	var groups = $("#"+activeType+" .moreInfoContain").find(".form-group");
				    	for(var i=1;i<groups.length;i++){
				    		if(groups.eq(i).find("div:first font").html().replace(' ','').replace(/(\n)+|(\r\n)+/g, "")==value){
								if(i+1!=$("#updateVolumeMoreInfo").attr("div_index"))
				    				return false;
				    		}
				    	}
				    	return true;
				    }, 
				    $.validator.format("该字段名已经被使用")
				);
		 jQuery.validator.addMethod(
				    "checksensitive2", 
				    function(value, element) {
				    	if(value=='')return true;
				    	value = value.replace("_","");
				    	 var pattern=/[`~!@#\$%\^\&\*\(\)_\+<>\?:"\{\},\.\\\/;'\[\]]/im;  
				    	    if(pattern.test(value)){  
				    	        return false;     
				    	 }  
				    	 return true;
				    }, 
				    $.validator.format("含敏感字符")
				);
		 /* jQuery.validator.addMethod(
				    "checkchinese", 
				    function(value, element) {
				        return /^[\u2E80-\u9FFF]+$/.test(value);   
				    }, 
				    $.validator.format("只能出现中文")
				); */
		 jQuery.validator.addMethod(
				    "checknumber", 
				    function(value, element) {
				    	if(value=='')return true;
				    	var Letters = "0123456789";
				    	for(var i=0;i<value.length;i++){
				    		if(Letters.indexOf(value.charAt(i))==-1)
								return true;
				    	}
				        return false;   
				    }, 
				    $.validator.format("不能为纯数字")
				);
 $('#updateMoreInfo #updateFieldNameForm').validate(
         {
             submitHandler: function (form) {
            	 
             },
             errorPlacement: function (error, element) {
                 error.replaceAll($("#" + $(element).attr("name") + "-error"));
             },
             rules: {
            	 update_chinesename: {
                     maxlength: 16,
                     required: true,
                     checknumber:true,
                     checksensitive2:true,
                     updatecheckfieldname:true
                 },
                 update_fieldlength: {
                     maxlength: 3,
                     required: true,
                     checksensitive2:true
                 },
                 update_firstno: {
                     maxlength: 3,
                     required: false,
                     checksensitive:true,
                     checknumber:true,
                     checksensitive2:true
                 }
             },
             messages: {
            	 update_chinesename: {
                     required: "必填项！"
                 },
                 update_fieldlength: {
                     required: "必填！"
                 }
             },
             success: function (label) {
                 label.text("${validate_message_ok}").addClass("valid");
                 label.removeClass("error");
                 label.html("有效");
             }
         });  
 $('#addFieldNameForm').validate(
         {
             submitHandler: function (form) {
            	 
             },
             errorPlacement: function (error, element) {
                 error.replaceAll($("#" + $(element).attr("name") + "-error"));
             },
             rules: {
            	 chinesename: {
                     maxlength: 16,
                     required: true,
                     checksensitive2:true,
                     checkfieldname:true
                 },
                 fieldlength: {
                     maxlength: 3,
                     required: true,
                     checksensitive2:true
                 },
                 firstno: {
                     maxlength: 3,
                     required: false,
                     checknumber:true,
                     checksensitive2:true,
                     checksensitive:true
                 }
             },
             messages: {
            	 chinesename: {
                     required: "必填项！"
                 },
                 fieldlength: {
                     required: "必填！"
                 }
             },
             success: function (label) {
                 label.text("${validate_message_ok}").addClass("valid");
                 label.removeClass("error");
                 label.html("有效");
             }
         }); 
 $('#updateVolumeMoreInfo #updateFieldNameForm').validate(
         {
             submitHandler: function (form) {
            	 
             },
             errorPlacement: function (error, element) {
                 error.replaceAll($("#" + $(element).attr("name") + "-error"));
             },
             rules: {
            	 volume_update_chinesename: {
                     maxlength: 16,
                     required: true,
                     checksensitive2:true,
                     volumeupdatecheckfieldname:true
                 },
                 volume_update_fieldlength: {
                     maxlength: 3,
                     required: true,
                     checksensitive2:true
                 }
             },
             messages: {
            	 volume_update_chinesename: {
                     required: "必填项！"
                 },
                 volume_update_fieldlength: {
                     required: "必填！"
                 }
             },
             success: function (label) {
                 label.text("${validate_message_ok}").addClass("valid");
                 label.removeClass("error");
                 label.html("有效");
             }
         });   
 $('#volumeAddFieldNameForm').validate(
         {
             submitHandler: function (form) {
            	 
             },
             errorPlacement: function (error, element) {
                 error.replaceAll($("#" + $(element).attr("name") + "-error"));
             },
             rules: {
            	 volume_chinesename: {
                     maxlength: 16,
                     required: true,
                     checksensitive2:true,
                     checkfieldname:true
                 },
                 volume_fieldlength: {
                     maxlength: 3,
                     required: true,
                     checksensitive2:true
                 }
             },
             messages: {
            	 chinesename: {
                     required: "必填项！"
                 },
                 fieldlength: {
                     required: "必填！"
                 }
             },
             success: function (label) {
                 label.text("${validate_message_ok}").addClass("valid");
                 label.removeClass("error");
                 label.html("有效");
             }
         });  
 $(document).on("click","#addMoreInfo .modal-footer .btn-primary",function(){
	  if(!$('#addFieldNameForm').valid())
		  return ;
	 var addMoreInfo_data = $(this).parent().parent().find(".col-sm-12:last") ;
	 var chinesename = addMoreInfo_data.find("input[name=chinesename]").val();
	 var fieldlength = addMoreInfo_data.find("input[name=fieldlength]").val();
	 var fieldname = addMoreInfo_data.find("input[name=fieldname]").val();
	 if(fieldname=='')fieldname = "column"+(++field_now);
	 var standardAddbtn=
		"	<button type=\"button\" class=\"btn btn-primary btn-sm standardAdd\">"+ 
		"  		 <span class=\"glyphicon glyphicon-ok\" title=\"加入档案生成规则\"></span>"+ 
		"		</button> ";
	 if($(".ruleSure").hasClass('disabled')){
		 standardAddbtn = 
				"	<button type=\"button\" class=\"btn btn-muted btn-sm disabled standardAdd\">"+ 
				"  		 <span class=\"glyphicon glyphicon-ok\" title=\"加入档案生成规则\"></span>"+ 
				"		</button> ";
	 }
	  
	 $("#"+activeType+" .moreInfoContain").append(
		 "<div class=\"form-group\" fieldnow="+fieldname+"> "+
		"	<div class=\"col-sm-3\">"+
			"<font>"+chinesename+"</font><font2 style=\"display:none\">"+fieldname+"</font2>"+
		"	</div>"+
		"	<div class=\"col-sm-2\">"+
			fieldlength+
		"	</div>"+
		"	<div class=\"col-sm-2\">"+
		"			<select>"+
		"				<option>-</option>"+
		"				<option>.</option>"+
		"			</select>"+
		"	</div>"+
		"	<div class=\"col-sm-2\">"+
		"	</div>"+
		"<div class=\"col-sm-3\">"+standardAddbtn+
		"	<button type=\"button\" class=\"btn btn-primary btn-sm standardUpdate\">"+ 
		"  		 <span class=\"glyphicon glyphicon-pencil\" title=\"修改规则\"></span>"+ 
		"		</button> "+
		"	<button type=\"button\" class=\"btn btn-primary btn-sm standardRemove\"> "+
		"  		 <span class=\"glyphicon glyphicon-remove\" title=\"删除规则\"></span>"+ 
		"		</button>"+ 
		"</div>"+
		"<input type=\"hidden\" name=\"fieldsdata\" value=\""+fieldname+":"+fieldlength+":"+chinesename+"\"/>"+
	   	 "</div>"
   	 );
	 $('#addFieldNameForm')[0].reset();
	 $("#addMoreInfo").modal('hide');
	 $("#addFieldNameForm label").removeClass("valid").html("");
 });
$(document).on("click","#addGeneralField .modal-footer .btn-primary",function(){
	  if(!$('#addGeneralFieldForm').valid())
		  return ;
	 var addMoreInfo_data = $(this).parent().parent().find(".col-sm-12:last") ;
	 var chinesename = addMoreInfo_data.find("input[name=chinesename]").val();
	 var fieldlength = addMoreInfo_data.find("input[name=fieldlength]").val();
	 var fieldname = addMoreInfo_data.find("input[name=fieldname]").val();
	 if(fieldname=='')fieldname = "column"+(++field_now);
	 var standardAddbtn=
		"	<button type=\"button\" class=\"btn btn-primary btn-sm standardAdd\">"+ 
		"  		 <span class=\"glyphicon glyphicon-ok\" title=\"加入档案生成规则\"></span>"+ 
		"		</button> ";
	 if($(".ruleSure").hasClass('disabled')){
		 standardAddbtn = 
				"	<button type=\"button\" class=\"btn btn-muted btn-sm disabled standardAdd\">"+ 
				"  		 <span class=\"glyphicon glyphicon-ok\" title=\"加入档案生成规则\"></span>"+ 
				"		</button> ";
	 }
	 $("#"+activeType+" .moreInfoContain").append(
	 "<div class=\"form-group\" fieldnow="+fieldname+"> "+
	"	<div class=\"col-sm-3\">"+
		"<font>"+chinesename+"</font><font2 style=\"display:none\">"+fieldname+"</font2>"+
	"	</div>"+
	"	<div class=\"col-sm-2\">"+
		fieldlength+
	"	</div>"+
	"	<div class=\"col-sm-2\">"+
	"			<select>"+
	"				<option>-</option>"+
	"				<option>.</option>"+
	"			</select>"+
	"	</div>"+
	"	<div class=\"col-sm-2\">"+
	"	是<input type=\"radio\" class=\"idorvalue\" value=\"1\">"+
	"	否<input type=\"radio\" class=\"idorvalue\" value=\"0\" checked>"+
	"	</div>"+
	"<div class=\"col-sm-3\">"+standardAddbtn+
	"	<button type=\"button\" class=\"btn btn-primary btn-sm standardRemove\"> "+
	"  		 <span class=\"glyphicon glyphicon-remove\" title=\"删除规则\"></span>"+ 
	"		</button>"+ 
	"</div>"+
	"<input type=\"hidden\" name=\"fieldsdata\" value=\""+fieldname+":"+fieldlength+":"+chinesename+"\"/>"+
   	 "</div>"
   	 );
	 $('#addGeneralFieldForm')[0].reset();
	 $("#addGeneralField").modal('hide');
	 $("#addGeneralFieldForm label").removeClass("valid").html("");
 });
  
 $(document).on("click","#volumeAddMoreInfo .modal-footer .btn-primary",function(){
	   if(!$('#volumeAddFieldNameForm').valid())
		  return ; 
	 var addMoreInfo_data = $(this).parent().parent().find(".col-sm-12:last") ;
	 var chinesename = addMoreInfo_data.find("input[name=volume_chinesename]").val();
	 var fieldlength = addMoreInfo_data.find("input[name=volume_fieldlength]").val();
	 var fieldname = addMoreInfo_data.find("input[name=volume_fieldname]").val();
	 if(fieldname=='')fieldname = "column"+(++field_now);
	 $("#"+activeType+" .moreInfoContain").append(
	 "<div class=\"form-group\"> "+
	"	<div class=\"col-sm-3\">"+
		"<font>"+chinesename+"</font><font2 style=\"display:none\">"+fieldname+"</font2>"+
	"	</div>"+
	"	<div class=\"col-sm-2\">"+
		fieldlength+
	"	</div>"+
	"	<div class=\"col-sm-2\">"+
	"	</div>"+
	"<div class=\"col-sm-3\">"+
	"	<button type=\"button\" class=\"btn btn-primary btn-sm volumeFieldUpdate\"> "+
	"  		 <span class=\"glyphicon glyphicon-pencil\" title=\"修改\"></span>"+ 
	"		</button>"+ 
	"	<button type=\"button\" class=\"btn btn-primary btn-sm standardRemove\"> "+
	"  		 <span class=\"glyphicon glyphicon-remove\" title=\"删除\"></span>"+ 
	"		</button>"+ 
	"</div>"+
	"<input type=\"hidden\" name=\"fieldsdata\" value=\""+fieldname+":"+fieldlength+":"+chinesename+"\"/>"+
  	 "</div>"
  	 );
	 $('#volumeAddFieldNameForm')[0].reset();
	 $("#volumeAddMoreInfo").modal('hide');
	 $("#volumeAddFieldNameForm label").removeClass("valid").html("");
	 
});
 $(document).on("click","#volumeAddGeneralField .modal-footer .btn-primary",function(){
	 var addMoreInfo_data = $(this).parent().parent().find(".col-sm-12:last") ;
	 var chinesename = addMoreInfo_data.find("input[name=volume_chinesename]").val();
	 var fieldlength = addMoreInfo_data.find("input[name=volume_fieldlength]").val();
	 var fieldname = addMoreInfo_data.find("input[name=volume_fieldname]").val();
	 if(fieldname=='')fieldname = "column"+(++field_now);
	 $("#"+activeType+" .moreInfoContain").append(
	 "<div class=\"form-group\"> "+
	"	<div class=\"col-sm-3\">"+
		"<font>"+chinesename+"</font><font2 style=\"display:none\">"+fieldname+"</font2>"+
	"	</div>"+
	"	<div class=\"col-sm-2\">"+
		fieldlength+
	"	</div>"+
	"	<div class=\"col-sm-2\">"+
	"	</div>"+
	"<div class=\"col-sm-3\">"+
	"	<button type=\"button\" class=\"btn btn-primary btn-sm standardRemove\"> "+
	"  		 <span class=\"glyphicon glyphicon-remove\" title=\"删除\"></span>"+ 
	"		</button>"+ 
	"</div>"+
	"<input type=\"hidden\" name=\"fieldsdata\" value=\""+fieldname+":"+fieldlength+":"+chinesename+"\"/>"+
	 "</div>"
	 );
	 $('#volumeAddGeneralFieldForm')[0].reset();
	 $("#volumeAddGeneralField").modal('hide');
	 $("#volumeAddGeneralFieldForm label").removeClass("valid").html("");
	 
}); 
  $(document).on("click",".volumeFieldUpdate",function(){
	 var field_data = $(this).parent().parent();
	 var form = $("#updateVolumeMoreInfo #updateFieldNameForm");
	 form.find("input[name=volume_update_chinesename]").val(field_data.find("div:first font").html());
	 form.find("input[name=volume_update_fieldname]").val(field_data.find("div:first font2").html());
	 form.find("input[name=volume_update_fieldlength]").val(field_data.children("div").eq(1).html().replace(/[\r\n]/g,"").replace(/\s+/g, ""));
	 $("#updateVolumeMoreInfo").attr("div_index",field_data.index());
	 $("#updateVolumeMoreInfo").modal('show').find(".modal-dialog").width(600);
	 
 });
 $(document).on("click","#updateVolumeMoreInfo .modal-footer .btn-primary",function(){
	  if(!$('#updateVolumeMoreInfo #updateFieldNameForm').valid())
		  return ;
	  var form = $("#updateVolumeMoreInfo #updateFieldNameForm");
	 //var addMoreInfo_data = $(this).parent().parent().find(".col-sm-12:last input") ;
	 var div_index = $("#updateVolumeMoreInfo").attr("div_index");
	 var chinesename = form.find("input[name=volume_update_chinesename]").val();
	 var fieldname = form.find("input[name=volume_update_fieldname]").val();
	 var fieldlength = form.find("input[name=volume_update_fieldlength]").val();
	 var updateData = $("#"+activeType+" .moreInfoContain").children("div").eq(div_index-1).children("div");
	 updateData.eq(0).find("font").html(chinesename);
	 updateData.eq(0).find("font2").html(fieldname);
	 updateData.eq(1).html(fieldlength);

	 updateData.parent().find("input[name=fieldsdata]").val(fieldname+":"+fieldlength+":"+chinesename);
	 
	 $('#updateVolumeMoreInfo #updateFieldNameForm')[0].reset();
	 $("#updateVolumeMoreInfo").modal('hide');
});
</script>
<div class="modal fade" id="changeIdorvalue" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
             	该字段补零之后的位数
            </h4>
         </div>
         <div class="modal-body">
            <div class="box-content">
                <div class="alert alert-info">例如：原档号：C1-计算机-2007-1。顺序号补零后位数为3时，档号：C1-计算机-2007-001.</div> 
            	<div class="form-group">
                    <div class="col-sm-5">
                        <p class="form-control-static"><font color="#f00"></font>生成档号时，补零后的位数</p>
                    </div>
					<div class="col-sm-2">
						<input class="form-control" name="zeronum" placeholder="留空即不补零" onkeyup="this.value=this.value.replace(/\D/g,'')">
					</div>
                </div>
          	</div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary">
               						确定
            </button>
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
         </div>
         </div>
	</div>
</div>
 <script>
/*  
 $(document).on("click",".closeDialog",function(){
	 $("#view").modal("show");
 }); */
 $(document).on("click",".moreInfoContain .standardAdd",function(){

	 var field_data = $(this).parent().parent();
	 var standardName = field_data.find("div:first font").html();
	 var prefix = field_data.find("div").eq(2).find("select").val();
	 var fieldName = field_data.find("div:first font2").html();
	 var length = field_data.find("div").eq(1).html().replace(/[\r\n]/g,"").replace(/\s+/g, "");
	 var recordRuleContain = $(".recordRuleContain");
	 var parent = $(this);


		 
		 if(activeType=="volume"){
			 if(fieldName!='fondsid'&&fieldName!='department'&&fieldName!='deadline'&&fieldName!='year'){
					var font2s = $("#record .moreInfoContain .form-group");
					for(var i=1;i<font2s.length;i++){
						if(font2s.eq(i).find("font").html()==standardName){
			                noty({
			                    text: "卷内已存在同名字段,加入档号会冲突",
			                    layout: "top",
			                    type: "failure",
			                    timeout: 1000,
			                });
			                return ;
						}
						if(font2s.eq(i).find("font2").html()==fieldName){
			                font2s.eq(i).remove();
			                noty({
			                    text: "卷内中的["+standardName+"]字段已与案卷关联",
			                    layout: "top",
			                    type: "success",
			                    timeout: 1000,
			                });
						}
					}
					 $("#record .moreInfoContain").append(
	
							 "<div class=\"form-group\"  id=\"record_volume"+fieldName+"\"> "+
							"	<div class=\"col-sm-3\">"+
								"<font>"+standardName+"</font><font2 style=\"display:none\">"+fieldName+"</font2>"+
							"	</div>"+
							"	<div class=\"col-sm-2\">"+
								length+
							"	</div>"+
							"	<div class=\"col-sm-2\">"+
							"	</div>"+
							"<div class=\"col-sm-3\">"+
							"</div>"+
							"<input type=\"hidden\" name=\"fieldsdata\" value=\""+fieldName+":"+length+":"+standardName+"\"/>"+
						   	 "</div>"
						   	 );
			 }
	
			 if(recordRuleContain.attr("recordC")==''){
				 recordRuleContain.attr("recordC",standardName);
				 recordRuleContain.attr("record",fieldName);
			 }else{
				 recordRuleContain.attr("recordC",recordRuleContain.attr("recordC")+prefix+standardName);
				 recordRuleContain.attr("record",recordRuleContain.attr("record")+prefix+fieldName);
			 }
		 }

		 if(recordRuleContain.attr(activeType+"C")==''){
			 recordRuleContain.attr(activeType+"C",standardName);
			 recordRuleContain.html(standardName);
			 recordRuleContain.attr(activeType,fieldName);
		 }else{
			 var recordRuleContain_html = recordRuleContain.attr(activeType+"C")+prefix+standardName;
			 recordRuleContain.attr(activeType+"C",recordRuleContain_html);
			 recordRuleContain.html(recordRuleContain_html);
			 recordRuleContain.attr(activeType,recordRuleContain.attr(activeType)+prefix+fieldName);
		 }

		 parent.removeClass("btn-primary").addClass("btn-muted").addClass("disabled");
		 parent.parent().find("button").eq(1).removeClass("btn-primary").addClass("btn-muted").addClass("disabled");
		 parent.parent().find("button").eq(2).removeClass("btn-primary").addClass("btn-muted").addClass("disabled");

		 //$("#view").modal("show");

	 /* var no = "";
	  if(length>4)
		 for(var i=0;i<length;i++)no+="X";
	 else
		 for(var i=0;i<length;i++)no+="0";  */
	 
 });
 $(document).on("click",".ruleSure",function(){ 
	 if($(".recordRuleContain").attr("record")==""){
         noty({
             text: "案卷号规则不能为空",
             layout: "top",
             type: "failure",
             timeout: 1000,
         });
         return;
     }
	 $("#changeIdorvalue .form-control-static font").html("顺序号");
	 //$("#view").modal("hide");
	 $("#changeIdorvalue").modal("show");
	 var parent = $(this);
	 $(document).off("click","#changeIdorvalue .btn-primary");
	 $(document).on("click","#changeIdorvalue .btn-primary",function(){
		 $("#changeIdorvalue").modal("hide");
		 if(activeType=='volume'){
			 var field_data = $("#record #sequencNoDiv");
			 var standardName = field_data.find("div:first font").html();
			 var fieldName = field_data.find("div:first font2").html();
			 var length = field_data.children("div").eq(1).html().replace(/[\r\n]/g,"").replace(/\s+/g, "");
			 //var length = field_data.find("div").eq(5).html().replace(/[\r\n]/g,"").replace(/\s+/g, "");
		 	 var zeronum = $("#changeIdorvalue input[name=zeronum]").val();

		 	 if(zeronum>length){
		         noty({
		             text: "补零位数不能大于顺序号字段长度，当前设置字段长度为"+length,
		             layout: "top",
		             type: "failure",
		             timeout: 1000,
		         });
		         return;
		 	 }
		 		 
			 field_data.children("div").attr("zeronum",zeronum);
			 if(zeronum!=undefined&&zeronum!='')zeronum+="位";
			 else zeronum="";
			 var standardName2 = "-"+zeronum+standardName;
			 var recordRuleContain = $(".recordRuleContain");
			 if(recordRuleContain.attr("recordC")==''){
				 recordRuleContain.attr("recordC",standardName2);
				 recordRuleContain.attr("record",fieldName);
			 }else{
				 var recordRuleContain_html = recordRuleContain.attr(activeType+"C")+standardName2;
				 recordRuleContain.attr("recordC",recordRuleContain_html);
				 recordRuleContain.attr("record",recordRuleContain.attr(activeType)+"-"+fieldName);
			 }
			 $("#record #sequencNoDiv .standardUpdate").removeClass("btn-primary").addClass("btn-muted disabled");
		 }else{
			 var field_data = $("#"+activeType+" #sequencNoDiv");
			 var standardName = field_data.find("div:first font").html();
			 var fieldName = field_data.find("div:first font2").html();
			 var length = field_data.children("div").eq(1).html().replace(/[\r\n]/g,"").replace(/\s+/g, "");
			 //var length = field_data.find("div").eq(5).html().replace(/[\r\n]/g,"").replace(/\s+/g, "");
			 
		 	 var zeronum = $("#changeIdorvalue input[name=zeronum]").val();

		 	 if(zeronum>length){
		         noty({
		             text: "补零位数不能大于顺序号字段长度，当前设置字段长度为"+length,
		             layout: "top",
		             type: "failure",
		             timeout: 1000,
		         });
		         return;
		 	 }
			 field_data.children("div").attr("zeronum",zeronum);
			 if(zeronum!=undefined&&zeronum!='')zeronum+="位";
			 else zeronum="";
			 var standardName2 = "-"+zeronum+standardName;
			 var recordRuleContain = $(".recordRuleContain");
			 if(recordRuleContain.attr(activeType+"C")==''){
				 recordRuleContain.html(standardName2);
				 recordRuleContain.attr(activeType+"C",standardName2);
				 recordRuleContain.attr(activeType,fieldName);
			 }else{
				 var recordRuleContain_html = recordRuleContain.attr(activeType+"C")+standardName2;
				 recordRuleContain.html(recordRuleContain_html);
				 recordRuleContain.attr(activeType+"C",recordRuleContain_html);
				 recordRuleContain.attr(activeType,recordRuleContain.attr(activeType)+"-"+fieldName);
			 }
			 $("#"+activeType+" #sequencNoDiv .standardUpdate").removeClass("btn-primary").addClass("btn-muted disabled");
		 }
		 $("#changeIdorvalue input[name=zeronum]").val("");
		 parent.removeClass("btn-primary").addClass("btn-muted").addClass("disabled");

		 $("#"+activeType+" .standardAdd").removeClass("btn-primary").addClass("btn-muted disabled");
		 $(document).off("click","#changeIdorvalue .btn-primary");

		 $("#view").modal("show");
	 });
	
 });
 $(document).on("click",".moreInfoContain .standardUpdate",function(){
	 var field_data = $(this).parent().parent();
	 var form = $("#updateMoreInfo #updateFieldNameForm");
	 if(field_data.find("div:first font2").html().replace('','').indexOf('subject')!=-1)
		 form.find("input[name=update_chinesename]").removeAttr("readOnly");
	 else
		 form.find("input[name=update_chinesename]").attr("readOnly","true");
	 form.find("input[name=update_chinesename]").val(field_data.find("div:first font").html());
	 form.find("input[name=update_fieldname]").val(field_data.find("div:first font2").html());
	 form.find("input[name=update_fieldlength]").val(field_data.children("div").eq(1).html().replace(/[\r\n]/g,"").replace(/\s+/g, ""));
	 $("#updateMoreInfo").attr("div_index",field_data.index());
	 $("#updateMoreInfo").modal('show').find(".modal-dialog").width(600);
	 //$("#view").modal("hide");
	 
 });
 $(document).on("click","#updateMoreInfo .modal-footer .btn-primary",function(){
	  if(!$('#updateMoreInfo #updateFieldNameForm').valid())
		  return ;
	 //var addMoreInfo_data = $(this).parent().parent().find(".col-sm-12:last input") ;
	 var div_index = $("#updateMoreInfo").attr("div_index");
	 var form = $("#updateMoreInfo #updateFieldNameForm");
	 var chinesename = form.find("input[name=update_chinesename]").val();
	 var fieldname = form.find("input[name=update_fieldname]").val();
	 var fieldlength = form.find("input[name=update_fieldlength]").val();
	 var updateData = $("#"+activeType+" .moreInfoContain").children("div").eq(div_index-1).children("div");
	 updateData.eq(0).find("font").html(chinesename);
	 updateData.eq(0).find("font2").html(fieldname);
	 updateData.eq(1).html(fieldlength);
	 
	 updateData.parent().find("input[name=fieldsdata]").val(fieldname+":"+fieldlength+":"+chinesename);

	 $('#updateMoreInfo #updateFieldNameForm')[0].reset();
	 $("#updateMoreInfo").modal('hide');
	 if(activeType=="volume"){
		 updateData = $("#record_volume"+updateData.parent().attr("fieldnow")).children("div");
		 updateData.eq(0).find("font").html(chinesename);
		 updateData.eq(0).find("font2").html(fieldname);
		 updateData.eq(1).html(fieldlength);
		 updateData.parent().find("input[name=fieldsdata]").val(fieldname+":"+fieldlength+":"+chinesename);
	 }

	 $("#view").modal("show");
});
 
 $(document).on("click",".moreInfoContain .standardRemove",function(){
	 $(this).parent().parent().remove();
	 if(activeType=="volume"){
		 $("#record_volume"+$(this).parent().parent().attr("fieldnow")).remove();
	 }
 });
 $(document).on("click",".ruleRemove",function(){
	 var recordRuleContain = $(".recordRuleContain");
	 if(activeType=='record'||activeType=='volume'){
		 recordRuleContain.attr("recordC","").attr("record","").attr("volume","").attr("volumeC","");
		 recordRuleContain.html("");
		 $("#myTabContent #record .standardUpdate").addClass("btn-primary").removeClass("btn-muted").removeClass("disabled");
		 $("#myTabContent #volume .standardUpdate").addClass("btn-primary").removeClass("btn-muted").removeClass("disabled");
		 $("#myTabContent #volume .standardAdd").addClass("btn-primary").removeClass("btn-muted").removeClass("disabled");
		 $("#myTabContent #volume .standardRemove").addClass("btn-primary").removeClass("btn-muted").removeClass("disabled");
	 }else{
		 recordRuleContain.attr("pieceC","").attr("piece","");
		 recordRuleContain.html("");
		 $("#myTabContent #piece .standardUpdate").addClass("btn-primary").removeClass("btn-muted").removeClass("disabled");
		 $("#myTabContent #piece .standardAdd").addClass("btn-primary").removeClass("btn-muted").removeClass("disabled");
		 $("#myTabContent #piece .standardRemove").addClass("btn-primary").removeClass("btn-muted").removeClass("disabled");
	 }
	 $(this).prev("button").addClass("btn-primary").removeClass("btn-muted").removeClass("disabled");
 });

 </script>
 <style>
 .moreInfoContain{
 	padding:0px;
 	max-height:350px;
 	overflow-y:scroll;
 }
 .operateAddInfo{
 	margin-right:5px;
 	margin-top:5px
 }
 .recordRuleContain{
 	border-top:1px solid #cccccc;
 	padding-top:5px;
 	height:60px;
 	line-height:30px
 }
  .createDocument{
 	border-bottom:1px solid #cccccc;
 }
 </style>
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
   $(document).on("click",".addGeneralField",function(){
	   $.get("<c:url value="/json/dictionary/indextables"  />", {}, function (data, s, xh) {
		   var fieldList = "";
		   $.each(data.indextables,function(){
			   fieldList += 
				   			"<button type=\"button\" class=\"btn btn-default\" title=\""+(this.title.length==3?(this.title.join("、")+"..."):(this.title.join("、")))+"\""+
	           				"    data-dismiss=\"modal\" indextable=\""+this.indextable+"\">"+this.name+
	           				" </button>"; 
		   });
	       $('#generalDataList .fieldList').html(fieldList);
	       if(data.indextables.length==0)
		       $('#generalDataList .fieldList').html("暂无可选通用字段");
       });
       $('#generalDataList').modal("show");

   });
     $(document).on("click","#generalDataList .fieldList button",function(){
		// alert($("#myTabContent div.active").attr("id"));
		var font2s = $("#"+activeType+" .moreInfoContain .form-group");
		for(var i=1;i<font2s.length;i++){
    		if($(this).html().replace(' ','').replace(/(\n)+|(\r\n)+/g, "")==font2s.eq(i).find("div:first font").html()){
                noty({
                    text: "该字段名已经存在！",
                    layout: "top",
                    type: "failure",
                    timeout: 1000,
                });
    			return ;
    		}
	    		
			if(font2s.eq(i).find("font2").html()==$(this).attr("indextable")){
                noty({
                    text: "请勿重复选择通用字段！",
                    layout: "top",
                    type: "failure",
                    timeout: 1000,
                });
                return ;
			}
		}
		 if(activeType=="volume"){
		 	 $('#addGeneralField #addGeneralFieldForm').find("input[name=chinesename]").val($(this).html());
		 	 $('#addGeneralField #addGeneralFieldForm').find("input[name=fieldname]").val($(this).attr("indextable"));
			 $("#addGeneralField").modal('show').find(".modal-dialog").width(600);;
		 }else if(activeType=="piece"){
		 	 $('#addGeneralField #addGeneralFieldForm').find("input[name=chinesename]").val($(this).html());
		 	 $('#addGeneralField #addGeneralFieldForm').find("input[name=fieldname]").val($(this).attr("indextable"));
			 $("#addGeneralField").modal('show').find(".modal-dialog").width(600);;
		 }else{
			 var form = $("#volumeAddGeneralField #volumeAddGeneralFieldForm");
			 form.find("input[name=volume_chinesename]").val($(this).html());
			 form.find("input[name=volume_fieldname]").val($(this).attr("indextable"));
			 $("#volumeAddGeneralField").modal('show').find(".modal-dialog").width(600);;
		 } 
   });
     
     
    $(document).ready(function () {
    	var showTables = function (url,recordtypeid,type) {
            //$(".modal-dialog").not(".checkModal").width(1000);
        	$('#recordTypeDetail').attr("recordtypeid",recordtypeid);
            $.ajax({
                type: "GET",
                url: url,
                data: {recordtypeid:recordtypeid,tabletype:type},
                success: function (result) {
                	result.type = type;
                	result.recordtypeid = recordtypeid;
                    $("#FieldTemplate").tmpl(result).replaceAll($("#recordTypeDetail .table-content"));
                	$('#recordTypeDetail').modal("show");
                }
            }); 
        }
       	$(document).on('click', '.recordTypeDetailButton', function (e) {
            var recordtypeid = $(this).closest("tr").attr("id");
            var type = "_piece";
            showTables("<c:url value="/json/dictionary/manage" />",recordtypeid,type);
        });
       	$(document).on('click', '#fieldType a', function (e) {
        	var recordtypeid = $('#recordTypeDetail').attr("recordtypeid");
            var type = $(this).attr("type");
            showTables("<c:url value="/json/dictionary/manage" />",recordtypeid,type);
        });
        $(document).on('click', '.addField', function (e) {
        	var tr = $(this).parent().parent();
        	var fieldName = tr.find("input[name=fieldName]").val();
        	var length = tr.find("input[name=length]").val();
        	var names = $("#addcheckfieldname tr td.name");
        	for(var i=0;i<names.length;i++){
        		if(names.eq(i).html()==fieldName){
                    noty({
                        text: "该字段名已经存在",
                        layout: "top",
                        type: "failure",
                        timeout: 1000
                    });
                    return;
        		}
        	}
        	if(fieldName.replace(' ','').replace(/(\n)+|(\r\n)+/g, "")==''||length.replace(' ','').replace(/(\n)+|(\r\n)+/g, "")=='')
        		return ;
        	$('#sureAddField').modal("show");
        	$("#sureAddField .fieldData").html(fieldName);
            var type = tr.attr("type");
            var recordtypeid = tr.attr("recordtypeid");
            $("#sureAddField").delegate(".btn-primary", "click", function (e) {
                $.ajax({
                    type: "POST",
                    url: "<c:url value="/json/dictionary/addField" />",
                    data: {recordtypeid:recordtypeid,tabletype:type,fieldName:fieldName,length:length},
                    success: function (result) {
                    	result.type = type;
                    	result.recordtypeid = recordtypeid;
                        $("#FieldTemplate").tmpl(result).replaceAll($("#recordTypeDetail .table-content")); 
                    	$('#sureAddField').modal("hide");
                        noty({
                            text: "成功！",
                            layout: "top",
                            type: "success",
                            timeout: 1000,
                            onClosed: function () {
                            	
                            }
                        });

                        $('#view').modal('show');
                    }
                });
            })
        });
        
        
        $(".deleterecordtype").on("click", function (e) {
            var typeid = $(this).closest("tr").attr("id");
            var result = {datetip: "您确定要删除该档案类型吗？"};
            $('#dateTipTemplate').tmpl(result).replaceAll($('#commonModal .modal-content'));
            $('#commonModal').modal("show");

            $(".commonConfirm").on("click", function (e) {
                $.get("<c:url value="/json/recordtype/delete"  />", {typeid: typeid}, function (data, s, xh) {
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


        $('.createType').on('click', function (e) {
            e.preventDefault();
            $('#createTypeTemplate').tmpl().replaceAll($('#view .modal-content'));
            $(".modal-dialog").width(1000);
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
                            typename: {
                                maxlength: 16,
                                required: true,
                                remote: {
                                    url: '<c:url value="/json/recordtype/checkname"/>',
                                    type: 'post',
                                    dataType: 'json',
                                    data: {
                                        typename: function () {
                                            return $("[name='typename']").val();
                                        },
                                        fondsid:function () {
                                            return $("[name='fondsid']").val();
                                        }
                                    }
                                }
                            },
                            typedes: {
                                maxlength: 16,
                                required: true
                            },
                            typeno: {
                                maxlength: 16,
                                required: true,
                                checksensitive2:true,
                                remote: {
                                    url: '<c:url value="/json/recordtype/checkFirstno"/>',
                                    type: 'post',
                                    dataType: 'json',
                                    data: {
                                    	firstno: function () {
                                            return $("[name='typeno']").val().replace(' ','');
                                        },
                                        fondsid:function () {
                                            return $("[name='fondsid']").val();
                                        }
                                    }
                                }
                            }
                        },
                        messages: {
                            typename: {
                                required: "必填项！",
                                remote: "重名！"
                            },
                            typedes: {
                                required: "必填！"
                            },
                            typeno: {
                                required: "必填！",
                                remote: "重名！"
                            }
                        },
                        success: function (label) {
                            label.text("${validate_message_ok}").addClass("valid");
                            label.removeClass("error");
                            label.html("有效");
                        }
                    });
            var already_created = false;
            $(".createTypeButton").on('click', function (e) {
            	if(already_created)return;
            	already_created = true;
	           	 if($('#typeCreateForm select[name=fondsid]').val()==null){
                    noty({
                        text: "暂无全宗，请先添加全宗",
                        layout: "top",
                        type: "error",
                        timeout: 1000
                    });
                    already_created = false;
                    return;
	           	 }

	           	 if($(".recordRuleContain").attr('piece').indexOf("sequencNo")==-1){
                     noty({
                         text: "尚未确认按件的档号规则",
                         layout: "top",
                         type: "error",
                         timeout: 1000
                     });
                     already_created = false;
                     return;
	           	 }

	           	 if($(".recordRuleContain").attr('record').indexOf("sequencNo")==-1){
                     noty({
                         text: "尚未确认案卷的档号规则",
                         layout: "top",
                         type: "error",
                         timeout: 1000
                     });
                     already_created = false;
                     return;
	           	 }
                if ($('#typeCreateForm').valid()) {
                	
		            	 var record_fields_data = $("#record .moreInfoContain").children("div");
		            	 var recordValue = new Array();
		            	 for(var  i=1;i<record_fields_data.length;i++){
		            		var idorvalue = record_fields_data.eq(i).find(".idorvalue").val();
		            		if(idorvalue == undefined) idorvalue = 0;
		            		var zeronum = 0;
		            		if(record_fields_data.eq(i).attr("id")=='sequencNoDiv')
		            			zeronum = record_fields_data.eq(i).attr("zeronum");
		            		if(zeronum == undefined) zeronum=0;
           		 			recordValue.push(record_fields_data.eq(i).find("input[name=fieldsdata]").val()+":"+idorvalue+":"+zeronum);
		            	 }
		            	 
	            	 	 $("#typeCreateForm").append("<input name='recordFields' type='hidden' value='"+recordValue.join(",")+"' />")

	            	 	 $("#typeCreateForm").append("<input name='recordRule' type='hidden' value='"+$(".recordRuleContain").attr("record")+"' />");
		            	 
	            	 	 $("#typeCreateForm").append("<input name='recordCRule' type='hidden' value='"+$(".recordRuleContain").attr("recordC")+"' />");

		            	 var piece_fields_data = $("#piece .moreInfoContain").children("div");
		            	 var pieceValue = new Array();
		            	 for(var  i=1;i<piece_fields_data.length;i++){
			            		var idorvalue = piece_fields_data.eq(i).find(".idorvalue").val();
			            		if(idorvalue == undefined) idorvalue = 0;
			            		var zeronum = 0;
			            		if(piece_fields_data.eq(i).attr("id")=='sequencNoDiv')
			            			zeronum = piece_fields_data.eq(i).attr("zeronum");
			            		if(zeronum == undefined) zeronum=0;
			            		pieceValue.push(piece_fields_data.eq(i).find("input[name=fieldsdata]").val()+":"+idorvalue+":"+zeronum);
		            	 }

	            	 	 $("#typeCreateForm").append("<input name='pieceFields' type='hidden' value='"+pieceValue.join(",")+"' />");

	            	 	 $("#typeCreateForm").append("<input name='pieceRule' type='hidden' value='"+$(".recordRuleContain").attr("piece")+"' />");
		            	 
	            	 	 $("#typeCreateForm").append("<input name='pieceCRule' type='hidden' value='"+$(".recordRuleContain").attr("pieceC")+"' />");

		            	 var volume_fields_data = $("#volume .moreInfoContain").children("div");
		            	 var volumeValue = new Array();
		            	 for(var  i=1;i<volume_fields_data.length;i++){
			            		var idorvalue = volume_fields_data.eq(i).find(".idorvalue:checked").val();
			            		if(idorvalue == undefined) idorvalue = 0;
			            		var zeronum = 0;
			            		if(volume_fields_data.eq(i).attr("id")=='sequencNoDiv')
			            			zeronum = volume_fields_data.eq(i).attr("zeronum");
			            		if(zeronum == undefined) zeronum=0;
			            		volumeValue.push(volume_fields_data.eq(i).find("input[name=fieldsdata]").val()+":"+idorvalue+":"+zeronum);
		            	 }
	            	 	 $("#typeCreateForm").append("<input name='volumeFields' type='hidden' value='"+volumeValue.join(",")+"' />");
	            	setTimeout("typeCreateFormSubmit()",1500);
	            	
                }else{
                    already_created = false;
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
