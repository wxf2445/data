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
                            <a href="<c:url value="/admin/index" />"><spring:message code="breadcrumb.home"
                                                                                     text="Home"/></a>
                        </li>
                        <li>
                            <spring:message code="nav.menu.record" text="record"/><spring:message
                                code="nav.menu.archive" text="archive"/>
                        </li>
                        <li>
                            <spring:message code="nav.menu.recrodvolume" text="recrodvolume"/><spring:message
                                code="breadcrumb.manage"
                                text="Manage"/>

                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i> <spring:message code="nav.menu.recrodvolume"
                                                                                            text="recrodvolume"/><spring:message
                                        code="breadcrumb.manage" text="Manage"/></h2>
                            </div>
                            <div class="box-content">
                                <blockquote>已选择档案</blockquote>

                                <div class="table-content selectedArea">
                                    <table class="table table-striped table-bordered responsive">
                                        <thead>
                                        <tr>
                                            <th id="th_id" title="Id"><spring:message code="model.record.id"
                                                                                      text="Id"/></th>
                                            <th id="th_type" title="Type"><spring:message code="model.record.type"
                                                                                          text="Type"/></th>
                                            <th id="th_subject" title="Subject"><spring:message
                                                    code="model.record.subject"
                                                    text="Subject"/></th>
                                            <th id="th_operator" title="Operator"><spring:message
                                                    code="model.record.operator"
                                                    text="Operator"/></th>
                                            <th id="th_address" title="Address"><spring:message
                                                    code="model.record.address"
                                                    text="Address"/></th>
                                            <th id="th_year" title="year"><spring:message code="model.record.year"
                                                                                          text="year"/></th>
                                            <th id="th_people" title="people"><spring:message code="model.record.people"
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
                                            <th id="th_select" title="Select"><spring:message code="model.record.option"
                                                                                              text="Option"/></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td style="display:none">无</td>
                                            <td colspan="20" class="center nonetd">表中数据为空！</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <hr>
                                    <a class="pull-right btn btn-success buildvolume">组卷</a>
                                </div>


                                <div class="selectarea">
                                    <blockquote>搜索档案</blockquote>

                                    <div class="">
                                        <%--<div class="navbar-inner">

                                                <div class="form-horizontal" role="search">
                                                        <div class="form-group col-sm-12">
                                                            <label class="col-sm-2 control-label"><spring:message code="model.record.year"
                                                                                                                  text="Year"
                                                            /></label>

                                                                <div class="col-sm-2">
                                                                    <select name="year" id="year" class="form-control">
                                                                        {{each years}}
                                                                        <option value="{{= id}}">{{= name}}</option>
                                                                        {{/each}}
                                                                    </select>
                                                                </div>

                                                                <label class="col-sm-2 control-label"><spring:message code="model.record.deadline"
                                                                                                                      text="Deadline"
                                                                /></label>

                                                                <div class="col-sm-2">
                                                                    <select name="deadline" id="deadline" class="form-control">
                                                                        {{each deadlines}}
                                                                        <option value="{{= id}}">{{= name}}</option>
                                                                        {{/each}}
                                                                    </select>
                                                                </div>

                                                                <label class="col-sm-2 control-label"><spring:message code="model.record.department"
                                                                                                                      text="department"
                                                                /></label>

                                                                <div class="col-sm-2">
                                                                    <select name="department" id="department" class="form-control">
                                                                        {{each departments}}
                                                                        <option value="{{= id}}">{{= name}}</option>
                                                                        {{/each}}
                                                                    </select>
                                                                </div>

                                            </div>
                                        </div>--%>
                                        <form:form modelAttribute="buildRecordSearchForm" name="buildRecordSearchForm"
                                                   action="${searchActoin}"
                                                   cssClass="form-horizontal">
                                            <form:hidden path="orderByClause"/>
                                            <form:hidden path="rccId"/>
                                            <form:hidden path="recordCatogory"/>
                                            <form:hidden path="page"/>
                                            <form:hidden path="size"/>
                                            <c:url value="/recordtype/manage" var="searchActoin">
                                            </c:url>

                                            <spring:message code="placeholder.start" text="Start"
                                                            var="placeholder_start"/>
                                            <spring:message code="placeholder.to" text="To" var="placeholder_to"/>
                                            <spring:message code="placeholder.end" text="End"
                                                            var="placeholder_end"/>
                                            <spring:message code="placeholder.keyword.name" text="Keyword"
                                                            var="placeholder_keyword_name"/>
                                            <spring:message code="placeholder.search" text="Search"
                                                            var="placeholder_search"/>
                                            <div class="form-group">
                                                <div class="">
                                                    <label class="col-sm-1 control-label"
                                                           style="width: auto;">全宗</label>

                                                    <div class="col-sm-1" style="width: auto;">
                                                        <select name="fondsId" class="form-control">
                                                            <c:forEach var="fonds" items="${fondsList}">
                                                                <option value="${fonds.id}">${fonds.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <label class="col-sm-1 control-label"
                                                           style="width: auto;">档案类型</label>

                                                    <div class="col-sm-2">
                                                        <select name="rtId" class="form-control">
                                                            <c:forEach var="recordtype" items="${recordTypes}">
                                                                <option value="${recordtype.id}">${recordtype.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <label class="col-sm-1 control-label"
                                                           style="width: auto;">部门</label>

                                                    <div class="col-sm-2">
                                                        <select name="department" class="form-control">
                                                            <option value="0">全部</option>
                                                            <c:forEach var="department" items="${departments}">
                                                                <option value="${department.id}">${department.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <label class="col-sm-1 control-label"
                                                           style="width: auto;">年度</label>

                                                    <div class="col-sm-1" style="width: auto;">
                                                        <select name="year" class="form-control">
                                                            <option value="0">全部</option>
                                                            <c:forEach var="year" items="${years}">
                                                                <option value="${year.id}">${year.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <label class="col-sm-1 control-label"
                                                           style="width: auto;">保管期限</label>

                                                    <div class="col-sm-1" style="width: auto;">
                                                        <select name="deadline" class="form-control">
                                                            <option value="0">全部</option>
                                                            <c:forEach var="deadline" items="${deadlines}">
                                                                <option value="${deadline.id}">${deadline.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--<div class="navbar-form navbar-left" role="search">
                                                <div class="form-group">
                                                    <label>年度</label>
                                                    <select name="year" class="form-control">
                                                        <c:forEach var="year" items="${years}">
                                                            <option value="${year.id}">${year.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <label>保管期限</label>
                                                    <select name="deadline" class="form-control">
                                                        <c:forEach var="deadline" items="${deadlines}">
                                                            <option value="${deadline.id}">${deadline.name}</option>
                                                        </c:forEach>
                                                    </select>

                                                </div>
                                            </div>--%>
                                            <%--<div class=" navbar-form navbar-right" role="search">


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
                                                      <a class="btn btn-info buildSearh"><i
                                                              class="glyphicon glyphicon-search"></i>
                                                      </a>
                                                    </span>
                                                    </div>
                                                </div>
                                            </div>--%>

                                        </form:form>
                                    </div>
                                    <div class="table-content">
                                        <table class="table table-striped table-bordered responsive">
                                            <thead>
                                            <tr>
                                                <th id="th_id" title="Id"><spring:message code="model.record.id"
                                                                                          text="Id"/></th>
                                                <th id="th_type" title="Type"><spring:message code="model.record.type"
                                                                                              text="Type"/></th>
                                                <th id="th_subject" title="Subject"><spring:message
                                                        code="model.record.subject"
                                                        text="Subject"/></th>
                                                <th id="th_operator" title="Operator"><spring:message
                                                        code="model.record.operator"
                                                        text="Operator"/></th>
                                                <th id="th_address" title="Address"><spring:message
                                                        code="model.record.address"
                                                        text="Address"/></th>
                                                <th id="th_year-name" title="year"><spring:message
                                                        code="model.record.year"
                                                        text="year"/></th>
                                                <th id="th_people" title="people"><spring:message
                                                        code="model.record.people"
                                                        text="people"/></th>
                                                <th id="th_department-name" title="department"><spring:message
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
                                                <th id="th_select" title="Select"><spring:message
                                                        code="model.record.option"
                                                        text="Option"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
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
<script src='<c:url value='/resources/js/common/common.js'/>'></script>


<spring:message code="deleteform.message.failed" text="Delete failed!" var="message_delete_failed"/>
<spring:message code="deleteform.message.success" text="Delete success!" var="message_delete_success"/>
<spring:message code="check.success" text="Check Success" var="message_check_success"/>
<spring:message code="check.failure" text="Check Failure" var="message_check_failure"/>

<script type="text/html" id="createVolumeTemplate">
    <div class="box-content">
        <div class="alert alert-danger">
            <b>档案号不填将由后台自动生成!序号由后台自动生成，不需要填写!</b><b><big><span>档号规则:{{= rule.chineserule}}</span></big></b>
        </div>

        <c:url var="createTypeAction" value="/json/recordvolume/apply"/>
        <form:form modelAttribute="volumeCreateForm" action="${createTypeAction}" class="form-horizontal"
                   method="post"
                   role="form">
            <input type="hidden" name="recordIds" id="recordIds" value="{{= selectIds}}">
            <input type="hidden" name="sequence" id="sequence" value="">
            <input type="hidden" name="mode" value="{{= mode}}">
            <blockquote>基础信息</blockquote>
            <div class="form-group">
                <label class="col-sm-2 control-label"><spring:message code="model.record.fonds"
                                                                      text="fonds"/></label>

                <div class="col-sm-4">
                    <input type="hidden" name="fonds" value="{{= fondsId}}">
                    <label class="control-label">{{= fonds}}</label>
                    <label id="dd" class="control-label"></label>
                </div>
                <label class="col-sm-2 control-label"><spring:message code="model.record.recordtype"
                                                                      text="recordtype"/></label>

                <div class="col-sm-4">
                    <input type="hidden" name="recordtype" value="{{= recordTypeId}}">
                    <label class="control-label">{{= recordtype}}</label>
                    <label id="dd" class="control-label"></label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"><spring:message code="model.record.year"
                                                                      text="year"/></label>

                <div class="col-sm-4">
                    <input name="year" type="hidden" class="form-control" value="{{= currentYearId}}">
                    <label class="control-label">{{= currentYear}}</label>
                </div>
                <label class="col-sm-2 control-label"><spring:message code="model.record.deadline"
                                                                      text="deadline"/></label>

                <div class="col-sm-4">
                    <input name="deadline"  type="hidden"  class="form-control" value="{{= currentDeadlineId}}">
                    <label class="control-label">{{= currentDeadline}}</label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"><spring:message code="model.record.department"
                                                                      text="department"/></label>

                <div class="col-sm-4">
                    <input name="department"  type="hidden" class="form-control" value="{{= currentDepartmentId}}">
                    <label class="control-label">{{= currentDepartment}}</label>
                </div>
                <label class="col-sm-2 control-label titleName"><spring:message code="model.record.subject"
                                                                      text="subject"/></label>

                <div class="col-sm-4">
                    <input id="subject" name="subject" class="form-control">
                    <label id="subject-error" class="control-label"></label>
                </div>

            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label"><b><spring:message code="model.record.type"
                                                                         text="RecordNo"/></b></label>

                <div class="col-sm-4">
                    <input id="volumeno" name="volumeno" class="form-control" placeholder="选填">
                    <a class="btn btn-info check">检测</a>
                    <label id="checknomessage" class="control-label"></label>
                </div>
                <label class="col-sm-2 control-label"><b>系统建议档案号</b></label>

                <div class="col-sm-4">
                    <input id="createdvolumeno"  class="form-control" disabled>
                    <label class="control-label"><i class="glyphicon glyphicon-info-sign"></i>该档号会随着用户输入变动!</label>
                </div>

                    <%--<div class="col-sm-4">
                        <input id="address" name="address" class="form-control">
                        <label id="address-error" class="control-label"></label>
                    </div>--%>

            </div>
            <div class="customarea"></div>
            <%--<div class="form-group">
                <label class="col-sm-2 control-label"><spring:message
                        code="model.record.address"
                        text="Address"/></label>

                <div class="col-sm-3">
                    <select name="shNo" class="form-control" >
                        {{each storehouses}}
                            <option value="{{= no}}">{{= name}}({{= location}})</option>
                        {{/each}}
                    </select>
                    <label id="shNo-error" class="control-label"></label>
                </div>
                <div class="col-sm-2">
                    <input name="shCabNo" class="form-control" placeholder="柜子号">
                    <label id="shCabNo-error" class="control-label"></label>
                </div>
                <div class="col-sm-2">
                    <input name="shFloorNo" class="form-control"  placeholder="层号">
                    <label id="shFloorNo-error" class="control-label"></label>
                </div>
            </div>--%>
            <%--<div class="form-group">
                <label class="col-sm-2 control-label"><spring:message code="model.record.people"
                                                                      text="people"/></label>

                <div class="col-sm-4">
                    <input id="people" name="people" class="form-control">
                    <label id="people-error" class="control-label"></label>
                </div>
            </div>--%>

        </form:form>
    </div>

</script>
<script type="text/html" id="emptyTableTemplate">
    <tr>
        <td style="display:none">无</td>
        <td colspan="20" class="center">表中数据为空！</td>
    </tr>
</script>
<script type="text/html" id="buildVolumeSelectTemplate">

    {{if records.page.items.length == 0}}
    <tr>
        <td style="display:none">无</td>
        <td colspan="20" class="center">表中数据为空！</td>
    </tr>
    {{else}}
    {{each(i,v) records.page.items}}
    <tr id="{{= id}}">

        <td>{{= i+1}}</td>
        <td class="center">
            {{= recordno}}
        </td>
        <td class="center"><strong><b> {{= subject}}</b></strong></td>
        <td class="center"><strong><b> {{= operator}}</b></strong></td>
        <td class="center"><strong><b> {{= address}}</b></strong></td>
        <td class="center year" yearid="{{= year}}">{{= yearString}}</td>
        <td class="center">{{= people}}</td>
        <td class="center department" departmentid="{{= department}}">{{= departmentString}}</td>
        <td class="center deadline" deadlineid="{{= deadline}}">{{= deadlineString}}</td>
        <td class="center">{{= title}}</td>
        <td class="center">{{= createtime}}</td>
        <td class="center">
            <input name="recordIds" type="hidden" value="{{= id}}">
            <a class="btn btn-success selectRecord"><span>选择</span></a></td>
    </tr>
    {{/each}}
    {{/if}}
</script>
<script type="text/html" id="recordTypeTemplate">

    {{each recordtypes}}
    <option value="{{= id}}">{{= name}}</option>
    {{/each}}
</script>
<script type="text/x-jquery-tmpl" id="customFieldTemplate">
    <blockquote>自定义字段</blockquote>
    {{if customValueFields.length == 0 }}
    <h2 class="col-md-offset-1"><b><strong>无自定义字段！</strong></b></h2>
    {{else}}
    <div class="form-group">
        {{each(i,value) customValueFields}}
            <label class="col-sm-2 control-label">{{= name}}</label>

            <div class="col-sm-3 customFields" id="customFields_{{= fieldName}}">
                <input type="hidden" class="customFieldLength" value="{{= length}}">
                <input class="form-control" name="customFields[{{= fieldName}}]">
                <label id="customFields-{{= fieldName}}-error" class="col-sm-1"></label>
            </div>
            {{if i%2 ==1}}
            </div>
            <div class="form-group">
                {{/if}}
        {{/each}}
        </div>
        {{/if}}
        <blockquote>通用字段</blockquote>
        {{if customIndexFields.length == 0 }}
        <h2 class="col-md-offset-1"><b><strong>无通用字段！</strong></b></h2>
        {{else}}
        <div class="form-group">
        {{each(i,value) customIndexFields}}
        <label class="col-sm-2 control-label">{{= name}}</label>

        <div class="col-sm-3 customIndexFields" id="customIndexFields_{{= fieldName}}">
            <input type="hidden" class="customFieldLength" value="{{= length}}">
            <select class="form-control" name="customFields[{{= fieldName}}]">
                {{each(j,ivalue) indexMap[fieldName]}}
                    <option value="{{= ivalue.id}}">{{= name}}</option>
                {{/each}}
            </select>
        </div>
        {{if i%2 ==1}}
        </div>
        <div class="form-group">
            {{/if}}
            {{/each}}
        </div>
        {{/if}}




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

    var getBuValue = function (value,len) {
        if(!isNaN(Number(value))&&value.length<len){
            var wei = len-value.length;
            var array = [];
            for(var i = 0;i<wei;i++){
                array[i] = '0';
            }
            return array.join("")+value;
        }else {
            return value;
        }
    };
    function includes(array,key){
    	for(var i=0;i<array.length;i++){
    		if(array[i] == key)
    			return true;
    	}
    	return false;
    }


    $(document).ready(function () {
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
        var oldFondsId = $("[name='fondsId']").val();
        var currentFonds = $("[name='fondsId'] option:selected").text();
        var currentFondsId = oldFondsId;
        var currentRecordType = $("[name='rtId'] option:selected").text();
        var currentRecordTypeId = $("[name='rtId']").val();
        var currentDepartmentId = "";
        var currentDepartment = "";
        var currentYearId = "";
        var currentYear = "";
        var currentDeadlineId = "";
        var currentDeadline = "";
        var volumeNoStatus = false;
        var volumeid = $(this).closest("tr").attr("id");
        var year = $(this).closest("tr").find(".year").attr("id");
        //var deadline = $(this).closest("tr").find(".deadline").attr("id");
        var department = $(this).closest("tr").find(".department").attr("id");
        //$("#commonModal2 .modal-body").empty();
        //$("#buildVolumeSelectedTemplate").tmpl().appendTo($("#commonModal2 .modal-body"));
        var selectArray = [];

        var updateCurrenRT = function () {
            currentRecordType = $("[name='rtId'] option:selected").text();
            currentRecordTypeId = $("[name='rtId']").val();
        };
        var buildVolume = function (form, action) {
            //cloneForm.find("#deadline").val(deadline);
            $.ajax({
                        type: "GET",
                        url: "<c:url value="/json/record/getCanBuildRecord"  />",
                        data: form.serialize(),
                        success: function (result) {

                            console.log(result);
                            var items = result.records.page.items;
                            $.each(items, function (i, v) {
                                console.log(v.createtime);
                                var date = new Date(v.createtime);
                                items[i].createtime = date.Format("yyyy-MM-dd HH:mm:ss");
                                console.log(items[i].createtime);
                            });
                            result.title = $("[name='rtId'] option:selected").text();
                            result.isVolume = false;
                            result.rtId = form.find("#rtId").val();
                            result.fondsId = form.find("#fondsId").val();

                            if (action == "update") {
                                $(".selectarea table tbody").empty();
                            }
                            $("#buildVolumeSelectTemplate").tmpl(result).appendTo($(".selectarea table tbody"));
                            console.log(result);
                            $.each($(".selectarea table tbody tr"), function (i, v) {
                                console.log(selectArray);
                                //selectArray.includes($(v).attr("id"))
                                if (includes(selectArray,$(v).attr("id"))) {
                                    $(v).find("td:last a").removeClass("btn btn-success selectRecord").addClass("label label-success").text("已选择");
                                }
                            });

                            $(".selectedArea").delegate(".hiddenarrow", "click", function (e) {
                                var curtr = $(this).closest("tr");
                                var prevtr = curtr.prev();
                                var prevnum = prevtr.find("td:first").text();
                                var curnum = curtr.find("td:first").text();
                                selectArray[Number(prevnum) - 1] = curtr.attr("id");
                                selectArray[Number(curnum) - 1] = prevtr.attr("id");
                                prevtr.find("td:first").text(curtr.find("td:first").text());
                                curtr.find("td:first").text(prevnum);
                                if (prevnum == "1") {
                                    prevtr.find("td:last").append($("<a class='btn btn-primary hiddenarrow'><i class='glyphicon glyphicon-arrow-up'></i></a>"));
                                    curtr.find("td:last .hiddenarrow").remove();
                                }
                                curtr.after(prevtr);
                                console.log(selectArray);
                            });
                            var initParam = function (context) {
                                var tr = context.closest("tr");
                                currentDepartmentId = tr.find(".department").attr("departmentid");
                                currentYearId = tr.find(".year").attr("yearid");
                                currentDeadlineId = tr.find(".deadline").attr("deadlineid");
                                currentDepartment = tr.find(".department").text();
                                currentYear = tr.find(".year").text();
                                currentDeadline = tr.find(".deadline").text();
                            }
                            var isSameParam = function (context) {
                                var status = false;
                                var tr = context.closest("tr");
                                var year = $.trim(tr.find("td.year").text());
                                var department = $.trim(tr.find("td.department").text());
                                var deadline = $.trim(tr.find("td.deadline").text());
                                if(year == currentYear && department == currentDepartment && deadline == currentDeadline){
                                    status = true;
                                }
                                return status;
                            }
                            var selectRecord = function (context) {
                                selectArray.push(context.closest("tr").attr("id"));
                                console.log(selectArray);
                                $(".nonetd").hide();
                                var tr = context.closest("tr").clone();
                                var recordId = context.closest("tr").attr("id");
                                tr.find("td:first").text($(".selectedArea tbody tr").length);
                                var a = tr.find("td:last a");
                                a.removeClass("btn-success");
                                a.removeClass("selectRecord");
                                a.addClass("btn-danger");
                                a.find("span").text("移除");
                                a.on("click", function (e) {
                                    selectArray.pop(recordId);
                                    console.log(selectArray);
                                    var thistr = $(this).closest("tr");
                                    if ($(this).closest("tbody").find("tr").length <= 2) {
                                        $(".nonetd").show();
                                    }
                                    var id = thistr.attr("id");
                                    var matcha = $(".selectarea table tbody tr[id='" + id + "'] td:last a");
                                    if (thistr.prevAll("tr").length <= 1) {
                                        thistr.next().find(".hiddenarrow").remove();
                                    }
                                    $.each(thistr.nextAll(), function (i, v) {
                                        var id = Number($(v).find("td:first").text());
                                        $(v).find("td:first").text(id - 1);
                                    });
                                    thistr.remove();
                                    if(matcha.length >0){
                                        matcha.removeClass("label label-success status");
                                        matcha.addClass("selectRecord btn btn-success");
                                        matcha.empty();
                                        matcha.append("<span><b>选择</b></span>");
                                    }
                                    /*matcha.show();
                                    matcha.siblings(".status").hide();*/
                                });
                                if ($(".selectedArea tbody tr").length >= 2) {
                                    var hiddenarrow = $("<a class='btn btn-primary hiddenarrow'><i class='glyphicon glyphicon-arrow-up'></i></a>");
                                    tr.find("td:last").append(hiddenarrow);
                                }

                                $(".selectedArea tbody").append(tr);
                                if (context.closest("tbody").find("tr").length == 1) {
                                    context.closest("tbody").append($("#emptyTableTemplate").tmpl());
                                    //$(this).closest("tr").remove();
                                }
                                var lasttda = context.closest("tr").find("td:last a");
                                /*lasttd.find("a").hide();
                                lasttd.append("<span class='label label-success status'><b>已选择</b></span>");*/
                                lasttda.removeClass("selectRecord btn btn-success");
                                lasttda.addClass("label label-success status");
                                lasttda.empty();
                                lasttda.append("<span><b>已选择</b></span>");
                            }
                            $(".selectRecord").on("click", function (e) {
                                if(selectArray.length == 0 ) {
                                    initParam($(this));
                                    selectRecord($(this));
                                }else if($.inArray($(this).closest("tr").attr("id"),selectArray)!=-1){
                                    return false;
                                }else if(isSameParam($(this))){
                                    selectRecord($(this));
                                }else{
                                    var result = {datetip: "部门，年度，保管期限必须一致，才能加入同一个卷宗！请仔细检查！"};
                                    $('#dateTipTemplate').tmpl(result).replaceAll($('#commonModal .modal-content'));
                                    $('#commonModal').modal("show");
                                }
                            })
                            /* $(".selectarea").on("click",".selectRecord", function (e) {
                                //var selectRecord = $(this);
                                alert(1)
                                if(selectArray.length == 0 ) {
                                    initParam($(this));
                                    selectRecord($(this));
                                }else if($.inArray($(this).closest("tr").attr("id"),selectArray)!=-1){
                                    return false;
                                }else if(isSameParam($(this))){
                                    selectRecord($(this));
                                }else{
                                    var result = {datetip: "部门，年度，保管期限必须一致，才能加入同一个卷宗！请仔细检查！"};
                                    $('#dateTipTemplate').tmpl(result).replaceAll($('#commonModal .modal-content'));
                                    $('#commonModal').modal("show");
                                }

                            }); */

                            /*$('.daterange #starttime').datepicker({
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
                             });*/

                        }
                    }
            );
        }
        buildVolume($("#buildRecordSearchForm"), "initial");
        function updateRT() {
            $.ajax({
                type: "GET",
                url: "<c:url value="/json/record/getRecordPath"  />",
                data: {fondsid: currentFondsId},
                success: function (result) {
                    console.log(result);
                    if (result.recordtypes.length > 0) {
                        $("[name='rtId']").empty();
                        $("#recordTypeTemplate").tmpl(result).appendTo($("[name='rtId']"));
                        updateCurrenRT();
                    } else {
                        alert("该全宗下尚无档案类型，请尽快创建！");
                        $("select#fonds").val(oldFondsId);
                    }
                    buildVolume($("#buildRecordSearchForm"), "update");
                }
            });
        }

        $("[name='fondsId']").on("change", function () {
            currentFonds = $("[name='fondsId'] option:selected").text();
            currentFondsId = $("[name='fondsId']").val();
            clearSelectedArea();
            updateRT();
        });
        var clearSelectedArea =  function() {
            $(".selectedArea table tr:gt(1)").remove();
            $(".selectedArea table tbody tr:eq(0) td:eq(1)").show();
            currentDeadline = "";
            currentDepartment = "";
            currentYear = "";
            selectArray = [];
        }

        $("[name='rtId']").on("change", function () {
            updateCurrenRT();
            clearSelectedArea();
            buildVolume($("#buildRecordSearchForm"), "update");
        });
        $("[name='department'],[name='deadline'],[name='year']").on("change", function () {
            buildVolume($("#buildRecordSearchForm"), "update");
        });
        $(".buildSearh").on("click", function (e) {
            currentFonds = $("[name='fondsId'] option:selected").text();
            currentRecordType = $("[name='rtId'] option:selected").text();
            buildVolume($("#buildRecordSearchForm"), "update");
        });
        $(".buildvolume").on("click", function (e) {
            if (selectArray.length == 0) {
                alert("请至少选择一条记录进行组卷！");
                return false;
            }
            var customValueArray = "";
            var customValueMap = {};
            var customIndexArray = "";
            var customIndexMap = {};
            var indexMap = {};
            var ruleOrder = "";
            var addSequence = function (no) {
            	var sequence = no.substring(no.lastIndexOf("-")+1);
                 if(isNaN(sequence)){
                     no = no + "-1"; 
                } 
                /* $.ajax({
                    type: "POST",
                    url: "<c:url value="/json/record/getVolumeSequence"  />",
                    data: $("#commonModal2 #volumeCreateForm").serialize(),
                    success: function (result) {
                    	no = no + "-" + result.sequence;
                        return no;
                    }
                }); */
                return no;
            }
            var updateNo = function () {
                var finalNo = ruleOrder;
                $.each(customValueArray, function (i,v) {
                    var value = $("#customFields_"+ v.fieldName+" input[name^=customFields]").val();
                    value = value == ""? v.name:value;
                    finalNo = finalNo.replace(v.fieldName,getBuValue(value, v.zeronum));
                });
                $.each(customIndexArray, function (i,v) {
                    var value = "";
                    if(v.idorvalue == "0"){
                        value = $("#customIndexFields_"+ v.fieldName+" select option:selected").text();
                        value = getBuValue(value, v.zeronum);
                    }else{
                        value = $("#customIndexFields_"+ v.fieldName+" select").val();
                        value = getNo(v.fieldName,value);
                    }
                    finalNo = finalNo.replace(v.fieldName,value);
                });
                finalNo = addSequence(finalNo);
                $("#createdvolumeno").val(finalNo);
            }
            var getNo = function( fieldName,value) {
                var no = "";
                var status = false;
                $.each(indexMap[fieldName], function (i,v) {
                    if(!status&&Number(value) == v.id){
                        no = v.no;
                        status = true;
                    }
                });
                return no;
            }
            $.ajax({
                type: "get",
                url: "<c:url value="/json/record/getRule" />",
                data: {recordtypeid:currentRecordTypeId},
                success: function (result) {
                    var rule = result.rule.ruleorder;
                    result.fondsId = currentFondsId;
                    result.mode = "0";
                    result.recordTypeId = currentRecordTypeId;
                    result.fonds = currentFonds;
                    result.recordtype = currentRecordType;
                    result.selectIds = selectArray.join(",");
                    result.currentYear = currentYear;
                    result.currentDepartment = currentDepartment;
                    result.currentDeadline = currentDeadline;
                    result.currentYearId = currentYearId;
                    result.currentDepartmentId = currentDepartmentId;
                    result.currentDeadlineId = currentDeadlineId;
                    console.log(result);
                    $("#commonModal2 .modal-body").empty();
                    $("#createVolumeTemplate").tmpl(result).appendTo($("#commonModal2 .modal-body"));
                    $(".check").on("click", function (e) {
                        $.ajax({
                            type: "POST",
                            url: '<c:url value="/json/record/checkno"/>',
                            data:{
                                volumeno: function () {
                                    var no = $("[name='volumeno']").val();
                                    no = addSequence(no);
                                    $("#createdvolumeno").val(no);
                                    $("#volumeno").val(no);
                                    return no;
                                },
                                fondsid: function () {
                                    return currentFondsId;
                                },
                                recordtypeid: function () {
                                    return currentRecordTypeId;
                                }
                            },
                            success: function (result) {
                                console.log(result);
                                $("#checknomessage").empty();
                                volumeNoStatus = result.success;
                                if(result.success == true){
                                    $("#checknomessage").append("<span class='red'><i class='glyphicon glyphicon-ok-circle'></i>档号可以使用！</span>");
                                }else{
                                    $("#checknomessage").append("<span class='red'><i class='glyphicon .glyphicon-folder-close'></i>"+result.message+"</span>");
                                }
                            }
                        });
                    });
                    $("#commonModal2 .head").text("组卷");
                    var showCustomField = function () {
                        $.ajax({
                            type: "POST",
                            url: '<c:url value="/json/recordtype/getCustomField"  />',
                            data: {recordTypeId: currentRecordTypeId, type: RecordCategory.volume},
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
                                $(".titleName").html(result.title.name)
                                customValueArray = result.customValueFields;
                                customIndexArray = result.customIndexFields;
                                indexMap = result.indexMap;
                                $(".customarea").empty();
                                $("#customFieldTemplate").tmpl(result).appendTo($(".customarea"));
                                $(".customFields [name^='customFields[']").each(function () {
                                    var maxlength = $(this).siblings(".customFieldLength").val();
                                    $(this).rules("add", {
                                        /*required: true,*/
                                        maxlength: Number(maxlength),
                                    });
                                });
                            }
                        });
                    }
                    showCustomField();
                    $("#commonModal2 .modal-dialog").width(1000);
                    $("#commonModal2 .confirm").removeAttr("data-dismiss");
                    $("#commonModal2").modal("show");
                    $("#volumeCreateForm").attr("action", "<c:url value="/json/record/getVolumeCreateInitial"  />");
                    $("#volumeCreateForm").ajaxSubmit({
                        dataType: "json",
                        type: "post",
                        success: function (data, s, xhr) {
                            console.log(data);
                            ruleOrder = data.ruleOrder+"-"+data.sequence;
                            var rule = ruleOrder;
                            $.each(customIndexArray, function (i,v) {
                                customIndexMap[v.fieldName] = v;
                            });
                            updateNo();
                            $("#volumeno").val($("#createdvolumeno").val());
                        }
                    });

                    $("#volumeCreateForm").attr("action", "<c:url value="/json/recordvolume/apply"/>");

                    $('#commonModal2 #volumeCreateForm').validate(
                            {
                                submitHandler: function (form) {
                                    /* $.ajax({
                                        type: "POST",
                                        url: "<c:url value="/json/record/getVolumeSequence"  />",
                                        data: $(form).serialize(),
                                        success: function (result) {
                                            console.log(result); */
                                            if(!volumeNoStatus){
                                                var tip = {
                                                    datetip:"您的案卷号未通过检测！请查看提示！"
                                                };

                                                $("#commonModal2 #sequence").val(result.sequence);
                                                $("#dateTipTemplate").tmpl(tip).replaceAll("#commonModal .modal-content");

                                                $("#commonModal2").modal("hide");
                                                $("#commonModal").modal("show");
                                                $(".commonConfirm").on("click", function () {
                                                    $("#commonModal").modal("hide");
                                                    $("#commonModal2").modal("show");
                                                });
                                                $(".commonCancel").on("click", function () {
                                                    $("#commonModal").modal("hide");
                                                    $("#commonModal2").modal("show");
                                                });
                                            }else{
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
                                            }
                                    /*     }
                                    }); */

                                    return false;
                                },
                                errorPlacement: function (error, element) {
                                    error.replaceAll($("#" + $(element).attr("name").replace("[", "-").replace("]", "") + "-error"));
                                },
                                rules: {
                                    volumeno: {
                                        required: true,
                                        maxlength: 32
                                        /*remote: {
                                            url: '<c:url value="/json/record/checkno"/>',
                                            type: 'post',
                                            dataType: 'json',
                                            data: {
                                                volumeno: function () {
                                                    return $("[name='volumeno']").val();
                                                },
                                                fondsid: function () {
                                                    return currentFondsId;
                                                },
                                                recordtypeid: function () {
                                                    return currentRecordTypeId;
                                                }
                                            }
                                        }*/
                                    },
                                    year: {
                                        maxlength: 16,
                                        required: true,
                                    },
                                    deadline: {
                                        maxlength: 16,
                                        required: true
                                    },
                                    department: {
                                        maxlength: 16,
                                        required: true
                                    },
                                    subject: {
                                        maxlength: 16,
                                        required: true
                                    },
                                    people: {
                                        maxlength: 16,
                                        required: true
                                    },
                                    shCabNo: {
                                        maxlength: 3,
                                        required: true
                                    },
                                    shFloorNo: {
                                        maxlength: 3,
                                        required: true
                                    }
                                },
                                messages: {
                                    /*volumeno: {
                                        remote: "档案号重复！"
                                    }*/
                                },
                                success: function (label,element) {
                                    var id = label.attr("id");
                                    var successId = id.replace("[", "-").replace("]", "");
                                   if(id.indexOf("customFields")!=-1){
                                       updateNo();
                                   }
                                    label.attr("id",successId );
                                    label.text("${validate_message_ok}").addClass("valid");
                                    label.removeClass("error");
                                    label.html("有效");
                                }
                            });
                    $(".confirm").unbind("click").on("click", function (e) {
                        e.preventDefault();
                        $("#volumeCreateForm").submit();
                    });
                    $("#volumeCreateForm").delegate("[id^=customIndexFields_] select","change",function () {
                        updateNo();
                    });
                }
            });

        });

        var sortClass = {
            "sSortAsc": "sorting_asc",
            "sSortDesc": "sorting_desc",
            "sSortable": "sorting"
        };

        var orderByClause = $('#orderByClause').val();

        var columns = [['year.name'], ['department.name'], ['createtime']];
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
                $('.selectarea #th_' + column[0]).addClass(sortClass.sSortAsc);
            }
            else if (!bAsc && bDesc) {
                $('.selectarea #th_' + column[0]).addClass(sortClass.sSortDesc);
            }
            else {
                $('.selectarea #th_' + column[0].replace(".", "-")).addClass(sortClass.sSortable);
            }

        }

        $('.table>thead>tr>th').click(function (e) {
            var columnId = $(this).attr('id');
            var column = columnId.split("_")[1].replace("-", ".");
            var classes = $(this).attr('class');
            if (classes === sortClass.sSortAsc) {
                $('#orderByClause').val(column + ' desc');
                $(this).removeClass(classes).addClass(sortClass.sSortDesc);
                buildVolume($("#buildRecordSearchForm"), "update");
            } else if (classes === sortClass.sSortDesc) {
                $('#orderByClause').val(column + ' asc');
                $(this).removeClass(classes).addClass(sortClass.sSortAsc);
                buildVolume($("#buildRecordSearchForm"), "update");
            } else if (classes === sortClass.sSortable) {
                $('#orderByClause').val(column + ' desc');
                $(this).removeClass(classes).addClass(sortClass.sSortDesc);
                buildVolume($("#buildRecordSearchForm"), "update");
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
