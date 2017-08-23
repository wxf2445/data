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
    <link href='<c:url value='/resources/charisma-master/bower_components/bootstrap-datepicker-release/css/datepicker3.css '/>'
          rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/css/jquery.noty.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/css/noty_theme_default.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/css/elfinder.min.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/css/elfinder.theme.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/css/jquery.iphone.toggle.css '/>' rel="stylesheet">
    <link href='<c:url value='/resources/uploadify/uploadify.css'/>' rel="stylesheet">
    <link href='<c:url value='/resources/charisma-master/css/animate.min.css '/>' rel="stylesheet">
       <link rel="stylesheet" type="text/css" href='<c:url value="/resources/audioPlayer/css/audioplayer.css"/>'>
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
                            <spring:message
                                    code="nav.menu.info" text="Info"/><spring:message code="nav.menu.import"
                                                                                      text="Import"/>
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i> <spring:message
                                        code="nav.menu.info" text="Info"/><spring:message code="nav.menu.import"
                                                                                          text="Import"/>
                                    <b><strong>(请先选择好模板后再进行信息添加，防止信息误删)</strong></b>
                                </h2>
                            </div>
                            <div class="box-content">


                                <form id="recordForm" name="recordForm" method="POST"
                                      action="<c:url value="/document/previewupload"  />" class="form-horizontal"
                                      role="form"
                                      target="fileiframe" enctype="multipart/form-data">
                                    <input type="hidden" name="recordId" value="${record.id}">
                                    <input type="hidden" name="mode" value="${mode}">
                                    <input type="hidden" id="deleteDocIds" name="deleteDocIds" value="">
                                    <legend>档案分类</legend>
                                    <fieldset>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"><b><strong><spring:message
                                                    code="model.record.fonds"
                                                    text="Fonds"/></strong></b></label>

                                            <div class="col-sm-3">
                                                <input type="hidden" name="fonds" value="${fondsId}">
                                                <label class="form-control-static"><b><strong>${fondsName}</strong></b></label>
                                            </div>
                                            <label class="col-sm-2 control-label"><b><strong><spring:message
                                                    code="model.record.recordtype"
                                                    text="RecordType"/></strong></b>
                                            </label>

                                            <div class="col-sm-3">
                                                <input type="hidden" name="recordtype" value="${recordTypeId}">
                                                <label class="form-control-static"><b><strong>${recordTypeName}</strong></b></label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"><b><strong><spring:message
                                                    code="model.record.year"
                                                    text="Year"/></strong></b></label>

                                            <div class="col-sm-3">
                                                <label class="form-control-static"><b><strong>${record.yearString}</strong></b></label>
                                            </div>
                                            <label class="col-sm-2 control-label"><b><strong><spring:message
                                                    code="model.record.deadline"
                                                    text="Deadline"/></strong></b>
                                            </label>

                                            <div class="col-sm-3">
                                                <label class="form-control-static"><b><strong>${record.deadlineString}</strong></b></label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"><b><strong><spring:message
                                                    code="model.record.department"
                                                    text="Department"/></strong></b></label>

                                            <div class="col-sm-3">
                                                <label class="form-control-static"><b><strong>${record.departmentString}</strong></b></label>
                                            </div>
                                        </div>

                                    </fieldset>
                                    <legend>上传多个文件<b><strong>(请上传pdf文件或者图片,最多上传5个文件,可多选！)</strong></b></legend>
                                    <fieldset>
                                        <div class="">
                                            <input type="hidden" name="temppath" id="temppath">
                                            <input type="hidden" name="filename" id="filename">
                                            <%--<input id="file_upload" type="file" name="file" multiple/>--%>
                                                <span class="btn btn-default btn-primary btn-file">
                                                    上传文件<input class="form-control" id="resFile" name="resFile"
                                                               type="file"
                                                               multiple>
                                                </span>
                                            <label id="resFile-error"></label>
                                        </div>
                                        <h3>上传文件显示区域</h3>

                                        <div class="well col-md-12 filewell currentFile">
                                            <c:forEach var="document" items="${documents}">
                                                <div class="col-md-3 onefile" id="${document.id}">
                                                    <div class="col-md-12">
                                                    <span class="hiddenPath"
                                                          style="display: none;">${document.path}</span>
                                                        <c:if test="${fn:contains(document.path,'/') }">
                                                            <c:set value="${fn:split(document.path,'/')}"
                                                                   var="separatorPosition"/>
                                                        </c:if>
                                                        <c:set value="${separatorPosition[fn:length(separatorPosition)-1]}"
                                                               var="filename"/>

                                                        <c:if test="${fn:endsWith(filename,'pdf' )}">
                                                            <img src="<c:url value="/resources/images/filetype/pdf_64.png" />">
                                                        </c:if>
                                                        <c:if test="${fn:endsWith(filename,'png' ) || fn:endsWith(filename, 'jpg')}">
                                                            <img src="<c:url value="/resources/images/filetype/png_64.png" />">
                                                        </c:if>
                                                        <c:if test="${fn:endsWith(filename,'word')}">
                                                            <img src="<c:url value="/resources/images/filetype/word_64.png" />">
                                                        </c:if>
                                                        <span class="filename col-md-7" title="${filename }">
                                                            <c:choose>
                                                                <c:when test="${fn:length(filename) gt 15}">
                                                                    <c:out value="${  fn:substring(filename, 0,15 ) }..."
                                                                           escapeXml="true"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:out value="${filename}" escapeXml="true"/>
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </span>
                                                    </div>
                                                    <div class="col-md-12 center">
                                                        <a href="#" class="btn btn-primary originpreview">预览</a>
                                                        <a href="#" class="btn btn-info deleteOrigin">删除</a>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <%--<div class="col-md-3">
                                                <img src="<c:url value="/resources/images/filetype/pdf_64.png" />">
                                                <span class="filename">testpdf</span>
                                                <a class="btn btn-primary">预览</a>
                                            </div>
                                            <div class="col-md-3">
                                                <img src="<c:url value="/resources/images/filetype/png_64.png" />">
                                                <span class="filename">testpng</span>
                                                <a class="btn btn-primary">预览</a>
                                            </div>
                                            <div class="col-md-3">
                                                <img src="<c:url value="/resources/images/filetype/word_64.png" />">
                                                <span class="filename">testword</span>
                                                <a class="btn btn-primary">预览</a>
                                            </div>--%>

                                        </div>
                                    </fieldset>
                                    <%--<legend>文档资料显示</legend>
                                    <fieldset>
                                        &lt;%&ndash;<h3>文档资料显示区域</h3>&ndash;%&gt;

                                        <div class="well col-md-12 filewell">
                                            <c:forEach var="document" items="${documents}">
                                                <div class="col-md-3">
                                                    <span class="hiddenPath"
                                                          style="display: none;">${document.path}</span>
                                                    <c:if test="${fn:contains(document.path,'/') }">
                                                        <c:set value="${fn:split(document.path,'/')}"
                                                               var="separatorPosition"/>
                                                    </c:if>
                                                    <c:set value="${separatorPosition[fn:length(separatorPosition)-1]}"
                                                           var="filename"/>

                                                    <c:if test="${fn:endsWith(filename,'pdf' )}">
                                                        <img src="<c:url value="/resources/images/filetype/pdf_64.png" />">
                                                    </c:if>
                                                    <c:if test="${fn:endsWith(filename,'png' ) || fn:endsWith(filename, 'jpg')}">
                                                        <img src="<c:url value="/resources/images/filetype/png_64.png" />">
                                                    </c:if>
                                                    <c:if test="${fn:endsWith(filename,'word')}">
                                                        <img src="<c:url value="/resources/images/filetype/word_64.png" />">
                                                    </c:if>
                                                    <span class="filename">${filename }</span>
                                                    <a href="#" class="btn btn-primary preview">预览</a>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </fieldset>--%>
                                    <legend>文件预览区域</legend>
                                    <fieldset>
                                        <div class="filepreviewarea well">
                                            <%--<iframe id="filepreview" name="filepreview"
                                                    src="<c:url value="/resources/tempfile/test.pdf"  />" width="100%"
                                                    height="500px">


                                            </iframe>--%>
                                            <%--<div class="row center">
                                                <img src="<c:url value="/resources/tempfile/news_alt.png"  />">

                                            </div>--%>
                                            <%--<iframe src="<c:url value="/template/word" />" width="100%"
                                                    height="500px">

                                            </iframe>--%>
                                        </div>

                                    </fieldset>
                                    <%--</form>--%>
                                    <iframe id="fileiframe" name="fileiframe" style="visibility: hidden;display: none;">

                                    </iframe>
                                    <%--<form id="recordForm" name="recordForm" method="POST"
                                          action="<c:url value="/info/create"  />" class="form-horizontal"
                                          role="form">--%>
                                    <%--<form class="form-horizontal" role="form">--%>
                                    <input name="id" id="id" type="hidden" value="${record.id}">
                                    <input name="tableid" id="tableid" type="hidden" value="">
                                    <input name="colSize" id="colSize" type="hidden" value="">
                                    <input name="listSize" id="listSize" type="hidden" value="">
                                    <legend>
                                        必填信息
                                    </legend>
                                    <fieldset id="mustInfo">
                                        <%--<div class="form-group">
                                            <label class="col-sm-2 control-label"><b><strong><spring:message
                                                    code="model.record.fonds"
                                                    text="FondsView"/></strong></b></label>

                                            <div class="col-sm-3">
                                                <select class="form-control" name="fonds">
                                                    <c:forEach var="fonds" items="${fondss}">
                                                        <option value="${fonds.id}">${fonds.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <label class="col-sm-2 control-label"><b><strong><spring:message
                                                    code="model.record.recordtype"
                                                    text="RecordType"/></strong></b>
                                            </label>

                                            <div class="col-sm-3">
                                                <select class="form-control" name="recordtype">
                                                    <c:forEach var="recordType" items="${recordTypes}">
                                                        <option value="${recordType.id}">${recordType.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"><b><strong><spring:message
                                                    code="model.record.year"
                                                    text="Year"/></strong></b></label>

                                            <div class="col-sm-3">
                                                <input class="form-control" name="year">
                                            </div>
                                            <label class="col-sm-2 control-label"><b><strong><spring:message
                                                    code="model.record.deadline"
                                                    text="Deadline"/></strong></b>
                                            </label>

                                            <div class="col-sm-3">
                                                <input class="form-control" name="deadline">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"><b><strong><spring:message
                                                    code="model.record.department"
                                                    text="Department"/></strong></b></label>

                                            <div class="col-sm-3">
                                                <input class="form-control" name="department">
                                            </div>
                                        </div>

                                        <blockquote>自定义字段</blockquote>
                                        <div class="customarea">


                                        </div>--%>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label titleName"><spring:message
                                                    code="model.record.subject"
                                                    text="Subject"/></label>

                                            <div class="col-sm-8">
                                                <input name="subject" class="form-control" value="${record.subject}">
                                                <label id="subject-error" class="control-label"></label>
                                            </div>

                                        </div>
                                    </fieldset>
                                    <div class="customarea">

                                    </div>
                                    
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.record.description"
                                                    text="description"/></label>

                                            <div class="col-sm-8">
                                        		<input type="hidden" class="customFieldLength" value="32">
                                                <textarea name="customFields[description]" class="form-control"></textarea>
                                                <label id="customFields-description-error" class="col-sm-1"></label>
                                            </div>
                                        </div>
                                    <legend>
                                        <b>添加档案信息条目(选填)</b>
                                    </legend>
                                    <c:choose>
                                        <c:when test="${empty templates}">
                                            <div class="alert alert-info">该档案类型尚未创建信息模板，无法添加模板信息。前去<a
                                                    href="<c:url value="/template/manage" />"
                                                    class="btn btn-info">创建模板</a></div>
                                        </c:when>
                                        <c:otherwise>
                                            <legend>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">选择信息表模板</label>

                                                    <div class="col-sm-3">
                                                        <select id="selectTemplate" class="form-control">

                                                            <c:forEach var="template" items="${templates}">
                                                                <c:if test="${mode eq '0'}">
                                                                    <c:set var="tableid"
                                                                           value="${template.tableid}"></c:set>
                                                                </c:if>
                                                                <c:if test="${mode eq '1'}">
                                                                    <c:set var="tableid"
                                                                           value="${template.piecetableid}"></c:set>
                                                                </c:if>
                                                                <option value="${tableid}">${template.name}
                                                                </option>
                                                            </c:forEach>

                                                        </select>
                                                    </div>
                                                    <div class="btn-group-crop">
                                                        <a class="btn btn-success confirmUseTem">确定使用该模板</a>
                                                        <a class="btn btn-warning cancelUseTem">取消</a>
                                                    </div>
                                                </div>


                                            </legend>
                                            <fieldset id="infoFieldSet">
                                                <div class="form-group">
                                                    <div class="col-sm-12">
                                                        <p><%--<a class="btn btn-info testCustomModal">测试弹出</a>--%><a
                                                                class="btn btn-info addInfo">添加信息</a>
    				<span class="btn btn-info batch-btn">
    					添加模板信息
    						<input class="form-control" id="infofile" name="file" type="file" multiple  
    								accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-excel">
							 <input type="hidden" name="templateid" id="templateid">
    				</span>
                    <span class="alert alert-warning addInfoAlert" style="display: none;"><b>请先选择模板！</b></span>
    				<span class="alert alert-warning uploadInfoAlert" style="display:none"><b>处理中,请稍等！</b></span>
                                                    <%--<div class="form-group">
                                                        <label class="col-sm-2 control-label"><spring:message
                                                                code="model.record.recordNo"
                                                                text="RecordNo"/></label>

                                                        <div class="col-sm-3">
                                                            <input name="recordNo" class="form-control">
                                                        </div>
                                                        <label class="col-sm-2 control-label"><spring:message
                                                                code="model.record.sequenceNo"
                                                                text="SequenceNo"/></label>

                                                        <div class="col-sm-3">
                                                            <input name="sequenceNo" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"><spring:message
                                                                code="model.record.fonds"
                                                                text="fonds"/></label>

                                                        <div class="col-sm-3">
                                                            <select class="form-control" name="fonds">
                                                                <c:forEach var="fond" items="${fonds}">
                                                                    <option value="${fond.id}">${fond.name}</option>
                                                                </c:forEach>
                                                            </select>

                                                        </div>
                                                        <label class="col-sm-2 control-label"><spring:message
                                                                code="model.record.recordtype"
                                                                text="Recordtype"/></label>

                                                        <div class="col-sm-3">
                                                            <select class="form-control" name="recordtype">
                                                                <c:forEach var="recordType" items="${recordTypes}">
                                                                    <option value="${recordType.id}">${recordType.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"><spring:message
                                                                code="model.record.subject"
                                                                text="Subject"/></label>

                                                        <div class="col-sm-3">
                                                            <input class="form-control" name="subject">
                                                        </div>
                                                        <label class="col-sm-2 control-label"><spring:message
                                                                code="model.record.year"
                                                                text="Year"/></label>

                                                        <div class="col-sm-3">
                                                            <input class="form-control" name="year">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"><spring:message
                                                                code="model.record.department" text="Department"/></label>

                                                        <div class="col-sm-3">
                                                            <input class="form-control" name="department">
                                                        </div>
                                                        <label class="col-sm-2 control-label"><spring:message
                                                                code="model.record.deadline"
                                                                text="Deadline"/></label>

                                                        <div class="col-sm-3">
                                                            <input class="form-control" name="deadline">
                                                        </div>
                                                    </div>--%>
                                            </fieldset>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="pull-right">
                                            	<c:if test="${reimport=='true' }">
                                                	<a class="btn btn-success confirmUpload">重新提交</a>
                                            	</c:if>
                                            	<c:if test="${reimport==null }">
                                                	<a class="btn btn-success confirmUpload">保存</a>
                                            	</c:if>
                                                <a class="btn btn-default">取消</a>
                                            </div>
                                        </div>
                                    </div>
                                </form>

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
<script src='<c:url value='/resources/uploadify/jquery.uploadify.js '/>'></script>
<!-- history.js for cross-browser state change on ajax -->
<script src='<c:url value='/resources/charisma-master/js/jquery.history.js '/>'></script>
<!-- form.js for form submit on ajax -->
<script src='<c:url value='/resources/charisma-master/bower_components/jquery-validation-1.13.1/lib/jquery.form.js '/>'></script>
<!-- validate.js for form submit on ajax -->
<script
        src='<c:url value="/resources/charisma-master/bower_components/jquery-validation-1.13.1/dist/jquery.validate.js"/>'></script>
<script
        src='<c:url value='/resources/charisma-master/bower_components/jquery-validation-1.13.1/dist/localization/messages_zh.js '/>'></script>
<script
        src='<c:url value='/resources/charisma-master/bower_components/jquery-validation-1.13.1/dist/additional-methods.js'/>'></script>
<!-- application script for Charisma demo -->
<script src='<c:url value='/resources/charisma-master/js/charisma.js '/>'></script>
<script src='<c:url value='/resources/CamanJs/caman.full.js '/>'></script>
<script src='<c:url value='/resources/charisma-master/bower_components/jquery-tmpl-master/jquery.tmpl.js '/>'></script>
<script src='<c:url value='/resources/charisma-master/bower_components/bootstrap-datepicker-release/js/bootstrap-datepicker.js '/>'></script>
<script src='<c:url value='/resources/charisma-master/bower_components/bootstrap-datepicker-release/js/locales/bootstrap-datepicker.zh-CN.js '/>'></script>
<script src='<c:url value='/resources/js/common/common.js'/>'></script>
<script src='<c:url value='/resources/js/jquery-ui-1.10.3/jquery-ui.js'/>'></script>
<script type="text/javascript" src="<c:url value='/resources/js/cuplayer/swfobject.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/audioPlayer/js/audioplayer.js'/>"></script>

<spring:message code="deleteform.message.failed" text="Delete failed!" var="message_delete_failed"/>
<spring:message code="deleteform.message.success" text="Delete success!" var="message_delete_success"/>
<c:url var="tempfile" value="/resources/tempfile/"/>
<script type="text/x-jquery-tmpl" id="customFieldTemplate">
    <%--<blockquote>自定义字段</blockquote>--%>
    {{if customValueFields.length == 0 }}
    <%--<h2 class="col-md-offset-1"><b><strong>无自定义字段！</strong></b></h2>--%>
    {{else}}
    <div class="form-group">
        {{each(i,value) customValueFields}}
            <label class="col-sm-2 control-label">{{= name}}</label>

            <div class="col-sm-3 " id="customFields_{{= fieldName}}">
                <input type="hidden" class="customFieldLength" value="{{= length}}">
				{{if datas != null}}
                	<input class="form-control" name="customFields[{{= fieldName}}]" value="{{= datas}}">
				{{else}}
                	<input class="form-control" name="customFields[{{= fieldName}}]" value="">
				{{/if}}
                <label id="customFields-{{= fieldName}}-error" class="col-sm-1"></label>
            </div>
            {{if i%2 ==1}}
            </div>
            <div class="form-group">
                {{/if}}
        {{/each}}
        </div>
        {{/if}}
        <%--<blockquote>通用字段</blockquote>--%>
        {{if customIndexFields.length == 0 }}
        <%--<h2 class="col-md-offset-1"><b><strong>无通用字段！</strong></b></h2>--%>
        {{else}}
        <div class="form-group">
        {{each(i,value) customIndexFields}}
        <label class="col-sm-2 control-label">{{= name}}</label>

        <div class="col-sm-3 " id="customIndexFields_{{= fieldName}}">
            <input type="hidden" class="customFieldLength" value="{{= length}}">
            <select class="form-control" name="customIndexFields[{{= fieldName}}]">
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
<script type="text/html" id="tableColTemplate">
    {{each(i,v) values}}
    <tr>
        {{each cols}}
        <td class="{{= columnid}}">
            {{= v[columnid]}}
        </td>
        {{/each}}

        <td>
            <a class="btn btn-info edit"><i class="glyphicon glyphicon-edit"></i></a>
            <a class="btn btn-danger delete"><i class="glyphicon glyphicon-remove"></i></a>
        </td>
        <input type='hidden' name='lists' class="infoinputs">
    </tr>
    {{/each}}
</script>
<script type="text/html" id="colTemplate">
    <tr>
        {{each values}}
        <td class="{{= name}}">
            {{= value}}
        </td>
        {{/each}}
        <td>
            <a class="btn btn-info edit"><i class="glyphicon glyphicon-edit"></i></a>
            <a class="btn btn-danger delete"><i class="glyphicon glyphicon-remove"></i></a>
        </td>
    </tr>
</script>
<script type="text/html" id="tableTemplate">
    <table class="table table-striped table-bordered bootstrap-datatable infotable">
        <thead>
        <tr>

            {{each infos}}
            <th id="th_{{= columnid}}" title="{{= columnname}}">{{= columnname}}</th>
            {{/each}}
            <th id="th_actions" title="actions"><spring:message code="actions" text="Actions"/></th>
        </tr>
        </thead>
        <tbody class="table-tbody">
        </tbody>
    </table>


</script>
<script type="text/html" id="infoTemplate">
    <form id="infoForm" name="infoForm" method="POST" class="form-horizontal"
          role="form">
        <%--<blockquote>第{{= num}}组</blockquote>--%>
        <div class="form-group">
            {{each(i,value) infos}}
            {{if i%2 ==0}}
        </div>
        <div class="form-group">
            {{/if}}
            <label class="col-sm-2 control-label"><b><strong>{{= columnname}}</strong></b></label>

            <div class="col-sm-4">
                {{if columnid == 'sourcefile'}}
                <input name="{{= columnid}}" type="hidden" value="{{= map.sourcefile}}">
                <label id="{{= columnid}}_label" class="control-label">{{= map.sourcefile}}</label>
                {{else columnid == 'pagenum'}}
                <input name="{{= columnid}}" type="hidden" value="{{= map.pagenum}}">
                <label id="{{= columnid}}_label" class="control-label">{{= map.pagenum}}</label>
                {{else}}
                <input class="columnwidth" type="hidden" value="{{= columnwidth}}">
                <input class="form-control addcols" name="{{= columnid}}" value="{{= map[columnid]}}">
                <label id="{{= columnid}}-error" class="col-md-1"></label>
                {{/if}}
            </div>
            {{/each}}
        </div>
    </form>
</script>


<script>
    function checkcondition() {
        var starttime = $("#starttime").val();
        var startdate = new Date(starttime);
        var endtime = $("#endtime").val();
        var enddate = new Date(endtime);
        if (startdate.getTime() > enddate.getTime()) {
            alert("搜索提示：起始日期必须小于结束日期！请重新选择日期！！");
            return false;
        }
    }
    $(document).ready(function () {
    	$(".main-menu").children("li").removeClass("actives");
    
        var recordTypeId = '${recordTypeId}';
        var mode = '${mode}';
        var deleteDocIds = [];
        var recordId = '${record.id}';
        var showCustomField = function () {
            var type = "_piece";
            if (mode == "0") {
                type = "_record";
            }
            $.ajax({
                type: "POST",
                url: '<c:url value="/json/recordtype/getCustomField"  />',
                data: {recordId:recordId,recordTypeId: recordTypeId, type: type},
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
                    $(".customarea").empty();
                    $("#customFieldTemplate").tmpl(result).appendTo($(".customarea"));
                    $(".titleName").html(result.title.name);
                    $("#recordForm [name^='customFields[']").each(function () {
                        var maxlength = $(this).siblings(".customFieldLength").val();
                        $(this).rules("add", {
                            /*required: true,*/
                            maxlength: Number(maxlength),
                        });
                        $(this).val(result.valueMap[$(this).attr("name").replace("customFields[","").replace("]","")]);
                    });
                    $(".customarea [name^='customIndexFields[']").each(function () {
                        var maxlength = $(this).siblings(".customFieldLength").val();
                        $(this).rules("add", {
                            /*required: true,*/
                            maxlength: Number(maxlength),
                        });
                        $(this).val(result.valueMap[$(this).attr("name").replace("customIndexFields[","").replace("]","")]);
                    });
                }
            });
        }
        showCustomField();
        $(".confirmUpload").on("click", function (e) {
            $("#recordForm").find("#deleteDocIds").val(deleteDocIds.join(","));
            $("#recordForm").attr("action", "<c:url value="/info/update"  />");
            $("#recordForm").removeAttr("target");
            $("#recordForm").submit();
        });
        $('#recordForm').validate({
            ignore: ".ignore",
            errorPlacement: function (error, element) {
                //$(element).siblings("label.error").remove();
                var id = error.attr("id");
                error.attr("id", id.replace("[", "-").replace("]", ""));
                console.log(error);
                error.replaceAll($("#" + $(element).attr("name").replace("[", "-").replace("]", "") + "-error"));
            },
            rules: {
                resFile: {
                    filesize: fileLimit.filesize,
                    extension: fileLimit.extension,
                    filenum: fileLimit.fileNum
                },
                department: {
                    required: true,
                    maxlength: 10
                },
                deadline: {
                    required: true,
                    maxlength: 10
                },
                year: {
                    required: true,
                    maxlength: 10
                },
                subject: {
                    required: true,
                    maxlength: 32
                },
                people: {
                    required: true,
                    maxlength: 32
                }
                /*applydata: {
                 filesize: 20,
                 extension: "xls|csv|doc|docx|zip|rar"
                 }*/
            },
            messages: {
                resFile: {
                    required: "必需上传文件！",
                    extension: "只接收pdf文件或者图片格式!"
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
        var num = 0;
        var putDataIntoTable = function (context, valuesresult) {
            //var inputs = [];
            /*for(var i = 0; i < valuesresult.length; ++i) {
             var json = valuesresult[i];
             var newjson = [];
             for(var prop in json) {
             newjson.push(json[prop]);
             // or myArray.push(json[prop]) or whatever you want
             }
             inputs.push(newjson.join(","));
             valuesresult[i] = newjson;
             }*/
            var tableId = context.val();
            $.get("<c:url value='/json/template/getColumnAll'/>", {templateid: tableId}, function (result) {
                console.log(result);
                if ($("#infoFieldSet table").length == 0) {
                    $("#tableTemplate").tmpl(result).appendTo($("#infoFieldSet"));
                }
                var value = {
                    values: valuesresult,
                    cols: result.infos
                };
                $("#tableColTemplate").tmpl(value).appendTo($("#infoFieldSet .infotable tbody"));
                $.each($("#infoFieldSet .infotable tbody tr"), function (i, v) {
                    $(v).find("input.infoinputs").val($(v).find("td:not(:last)").map(function () {
                        return $.trim($(this).text());
                    }).get().join(","));
                });
                $("#infoFieldSet .delete").on("click", function (e) {
                    $(this).closest("tr").remove();
                });

                //$("#recordForm").append(input);
                $("#recordForm #listSize").val($("#infoFieldSet table tbody tr").length);
            });

        }
        $("#infofile").on("change",function(){
            if (!$("#selectTemplate").prop("disabled")) {
                $(".addInfoAlert").show();
                $("#infofile").val('');
                return ;
            } else {
                $(".addInfoAlert").hide();
            }
            $(".uploadInfoAlert").show();
            var templateid = $("#selectTemplate").val();
            $("#recordForm #templateid").val(templateid);
        	$("#recordForm").ajaxSubmit({
        		url:"<c:url value='/json/record/uploadexcelinfo'/>",
                dataType: "json",
                type: "post",
                success: function (data, s, xhr) {
                	if(data.status == -1){
                        noty({
                            text: "文件内容有误,请检查文件,数据字段是否超出设定长度",
                            layout: "top",
                            type: "failure",
                            timeout: 4000
                        });
                        return ;
                	}
                		
					console.log(data);
					$.each(data.dataMap,function(index,content){
	                    var value = [];
						var tr = "<tr>";
						$.each(data.infos,function(index,content2){
		                    if ($("#infoFieldSet table").length == 0) {
		                        $("#tableTemplate").tmpl(data).appendTo($("#infoFieldSet"));
		                    }
		                    var td = content[content2.columnname] == null ? '' :content[content2.columnname];
		                    if(content2.columnid != 'pagenum' && content2.columnid != 'sourcefile'){
			                    value.push(td);
			                    tr+="<td>"+td+"</td>";
		                    }else if(content2.columnid == 'pagenum'){
			                    value.push(num);
			                    tr+="<td>"+num+"</td>";
		                    }else if(content2.columnid == 'sourcefile'){
			                    value.push(currentFile == undefined?'':currentFile);
			                    tr+="<td>"+(currentFile == undefined?'':currentFile)+"</td>";
		                    }
						});
	                    var input = $("<input type='hidden' name='lists' value='" + value.join(",") + "'   >");
	                    
		                tr+="<td><a class=\"btn btn-danger delete\"><i class=\"glyphicon glyphicon-remove\"></i></a></td></tr>";
		                
	                    $("#infoFieldSet .infotable tbody").append(tr).append(input);
					});

                    $("#recordForm #listSize").val($("#infoFieldSet table tbody tr").length);
                    $(".uploadInfoAlert").hide();
                }
        	});
        });
        var selectTem = function (context, map) {
            var tableId = context.val();
            $.get("<c:url value='/json/template/getColumnAll'/>", {templateid: tableId}, function (result) {
                console.log(result);
                $("#colSize").val(result.infos.length);
                num++;
                //$("#infoFieldSet").empty();

                if (map == null) {
                    map = {
                        num: num,
                        sourcefile: currentFile,
                        pagenum: 0
                    }
                }
                result.map = map;
                //result.pagenum = document.getElementById('tempiframe').contentWindow.document.getElementById("pageNumber").value;
                if (document.getElementById('tempiframe') != null && previewFile.filetype == "pdf") {
                    map.pagenum = document.getElementById('tempiframe').contentWindow.getPage();
                } else {
                    map.pagenum = 0;
                }
                $("#commonModal2 .modal-body").empty();
                if ($('#customModal').length != 0) {
                    return false;
                }
                $("#customModalTemplate").tmpl().appendTo("body");
                $("#infoTemplate").tmpl(result).appendTo($("#customModal .modal-body"));
                $('#customModal').draggable();
                $("#customModal .modal-header .head").text("添加一组信息");
                $("#infoForm").validate({
                    errorPlacement: function (error, element) {
                        error.replaceAll($("#" + $(element).attr("name") + "-error"));
                    },
                    success: function (label) {
                        label.text("${validate_message_ok}").addClass("valid");
                        label.removeClass("error");
                        label.html("有效");
                    }
                });
                $(".addcols").each(function () {
                    var maxlength = $(this).siblings(".columnwidth").val();
                    $(this).rules("add", {
                        required: true,
                        maxlength: Number(maxlength)
                    });
                });
                $("#customModal .confirm").unbind("click").on("click", function (e) {
                    e.preventDefault();
                    if ($("#infoForm").valid()) {
                        result.values = $("#customModal form").serializeArray();
                        //putDataIntoTable(result);
                        console.log(result);
                        if ($("#infoFieldSet table").length == 0) {
                            $("#tableTemplate").tmpl(result).appendTo($("#infoFieldSet"));
                        }
                        var value = [];
                        $.each(result.values, function (i, v) {
                            value.push(v.value);
                        });
                        var input = $("<input type='hidden' name='lists' value='" + value.join(",") + "'   >");
                        if ($("#infoFieldSet #edittr").length > 0) {
                            $("#colTemplate").tmpl(result).append(input).insertBefore($("#infoFieldSet #edittr"));
                            $("#infoFieldSet #edittr").remove();
                        } else {
                            $("#colTemplate").tmpl(result).append(input).appendTo($("#infoFieldSet .infotable tbody"));
                        }

                        $("#infoFieldSet .delete").on("click", function (e) {
                            $(this).closest("tr").remove();
                        });

                        //$("#recordForm").append(input);
                        $("#recordForm #listSize").val($("#infoFieldSet table tbody tr").length);
                        $("#customModal").remove();
                    }

                });
                /*$("[name^='lists[']").each(function () {
                 $(this).rules("add", {
                 required: true,
                 maxlength: $(this).closest(".columnwidth").val(),
                 /!*number : true,*!/
                 messages: {
                 required: "必填项！"
                 }
                 });
                 });*/
            });
        }
        $(document).delegate("#infoFieldSet .edit", "click", function (e) {
            $(this).parents("tr").attr("id", "edittr");
            var map = {};
            $.each($(this).parents("tr").find("td"), function (i, v) {
                map[$(v).attr("class")] = $.trim($(v).text());
            });
            selectTem($("#selectTemplate"), map);
        });
        var notSelectTemplate = ${notSelectTemplate};
        if (notSelectTemplate != true) {
            var data = JSON.parse('${contents.values}');
            console.log(data);
            var tableId = '${record.tableid}';
            $("#selectTemplate").val(tableId);
            $("#tableid").val(tableId);
            $("#selectTemplate").attr("disabled", "true");
            putDataIntoTable($("#selectTemplate"), data);
        }
        $(".confirmUseTem").on("click", function (e) {
            $("#tableid").val($("#selectTemplate").val());
            $("#selectTemplate").attr("disabled", "true");
        });
        $(".cancelUseTem").on("click", function (e) {
            $("#selectTemplate").removeAttr("disabled");
        });
        $(".addInfo").on("click", function (e) {
            if (!$("#selectTemplate").prop("disabled")) {
                $(".addInfoAlert").show();
            } else {
                $(".addInfoAlert").hide();
                selectTem($("#selectTemplate"), null);
            }
        });
        /*$(document).on("change", "#selectTemplate", function (e) {
         selectTem($(this));
         });*/

        var filePreview = function (context) {

            var path = context.find(".hiddenPath").text();
            var filename = context.find(".filename").attr("title");
            //if(filename==null)return ;
            /* $.ajax({
             type: "POST",
             url: "
            <c:url value="/json/file/filepreview"  />",
             data: {filepath: path},
             success: function (result) {
             console.log(result);*/
            currentFile = filename;

            var pre = "";
            var suffix = filename.substring(filename.lastIndexOf(".") + 1, filename.length).toLowerCase();
            previewFile.filetype = suffix;
            $(".filepreviewarea").empty();
            if ($.inArray(suffix, PdfExtension) != -1 || $.inArray(suffix, OfficeExtension) != -1) {
                var prepath = "<c:url value='/jsp/pdf.jsp'/>?url=" + encodeURI(encodeURI(path));
                pre = $("<iframe id='tempiframe' name='tempiframe' src='" + prepath + "' width='100%'height='500px'> </iframe>");
                $(".filepreviewarea").append(pre);
                console.log(document.getElementById('tempiframe'));
                //document.getElementById('tempiframe').src = prepath;
            } else if ($.inArray(suffix, ImgExtension) != -1) {
                $.ajax({
                    type: "POST",
                    url: '<c:url value="/json/file/filepreview"  />',
                    data: {filepath: path},
                    success: function (result) {
                        console.log(result);
                        var base64String = result.base64String;
                        if (base64String != undefined) {
                            $(".filepreviewarea").empty();
                            var picurl = "data:image/" + suffix + ";base64," + base64String;
                            var pre = $("<div class='row center'> <img src='" + picurl + "' > </div>");
                            $(".filepreviewarea").append(pre);
                        }
                    }
                });

            } else if ($.inArray(suffix, VideoExtension) != -1) {
                showVideo("/" + path);
            }else if($.inArray(suffix, MusicEXtension) != -1){
            	showMusic("/" + path);
            }
        }
        filePreview($(".originpreview:first").closest(".onefile"));
        $(".originpreview").on("click", function (e) {
            e.preventDefault();
            filePreview($(this).closest(".onefile"));
        });
        $(".deleteOrigin").on("click", function (e) {
            e.preventDefault();
            var thisfile = $(this).closest(".onefile");
            if (document.getElementById('tempiframe') != null) {
                document.getElementById('tempiframe').src = "";
            } else {
                $(".filepreviewarea").empty();
            }
            deleteDocIds.push(thisfile.attr("id"));
            thisfile.remove();
        });


        var uploadify_onSelectError = function (file, errorCode, errorMsg) {
            var msgText = "上传失败\n";
            switch (errorCode) {
                /*case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
                 //this.queueData.errorMsg = "每次最多上传 " + this.settings.queueSizeLimit + "个文件";
                 msgText += "每次最多上传 " + this.settings.queueSizeLimit + "个文件";
                 break;*/
                case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
                    msgText += "文件大小超过限制( " + this.settings.fileSizeLimit + " )";
                    break;
                case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
                    msgText += "文件大小为0";
                    break;
                case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
                    msgText += "文件格式不正确，仅限 " + this.settings.fileTypeExts;
                    break;
                default:
                    msgText += "错误代码：" + errorCode + "\n" + errorMsg;
            }
            alert(msgText);
        };

        var uploadify_onUploadError = function (file, errorCode, errorMsg, errorString) {
// 手工取消不弹出提示
            /*if (errorCode == SWFUpload.UPLOAD_ERROR.FILE_CANCELLED
             || errorCode == SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED) {
             return;
             }*/
            /*var msgText = "上传失败\n";
             switch (errorCode) {
             case SWFUpload.UPLOAD_ERROR.HTTP_ERROR:
             msgText += "HTTP 错误\n" + errorMsg;
             break;
             case SWFUpload.UPLOAD_ERROR.MISSING_UPLOAD_URL:
             msgText += "上传文件丢失，请重新上传";
             break;
             case SWFUpload.UPLOAD_ERROR.IO_ERROR:
             msgText += "IO错误";
             break;
             case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
             msgText += "安全性错误\n" + errorMsg;
             break;
             /!*case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
             msgText += "每次最多上传 " + this.settings.uploadLimit + "个";
             break;*!/
             case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
             msgText += errorMsg;
             break;
             case SWFUpload.UPLOAD_ERROR.SPECIFIED_FILE_ID_NOT_FOUND:
             msgText += "找不到指定文件，请重新操作";
             break;
             case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED:
             msgText += "参数错误";
             break;
             default:
             msgText += "文件:" + file.name + "\n错误码:" + errorCode + "\n"
             + errorMsg + "\n" + errorString;
             }
             alert(msgText);*/
        };

        /*$('#file_upload').uploadify({
         'swf': '
        <c:url value="/resources/uploadify/uploadify.swf"/>',
         'uploader': '
        <c:url value="/json/user/uploadfile"/>',
         'height': 50,
         'width': 250,
         'auto': false,
         /!*'formData': {'userid': $("#userid").val()},*!/
         'fileDataName': 'file',
         'buttonText': '选择上传文件...',
         'fileTypeExts': '*.doc; *.docx; *.zip;*.rar',
         'multi': true,
         'method': 'post',
         'queueSizeLimit': 5,
         fileSizeLimit: '20MB',
         'overrideEvents': ['onCancel', 'onUploadError', 'onSelectError', 'onDialogClose'],
         'onSelectError': uploadify_onSelectError,
         'onUploadError': uploadify_onUploadError,
         'onUploadStart': function (files) {
         alert("onUploadStart!");
         },
         /!*'debug': true,*!/
         /!*'onUploadStart': function (file) {
         var param = {};
         param.picHref = $('#file_upload_href').val();
         $("#file_upload").uploadify("settings", "formData", param);
         },*!/
         'onUploadSuccess': function (file, data, response) {
         console.log(data);
         var jsondata = JSON.parse(data);
         console.log(jsondata);
         if (jsondata.status == true) {
         noty({
         text: "文件上传成功！",
         layout: "top",
         type: "success",
         timeout: 1000,
         onClosed: function () {
         window.location.reload();
         }
         });
         } else {
         noty({
         text: "文件上传失败！",
         layout: "top",
         type: "failure",
         timeout: 1000,
         });
         }
         /!*var imgUrl = uploadCommon.getPath(data);*!/
         /!*$("#imgUrl").val(imgUrl);// 返回的图片路径保存起来
         $("#thumbImg").attr("src", IMAGE_FILE_PATH + imgUrl);// 更新logo显示*!/
         /!*uploadCommon.uploadImageBtnStyle("imgUrl");
         uploadCommon.initPreviewAfterUpload(data); // 新图片预览*!/
         }
         });*/
        $(".uploadbutton").on("click", function (e) {
            $('#file_upload').uploadify('upload', '*');
        });


        $('.editinfo').on('click', function (e) {
            var id = $("#userid").val();
            $.get("<c:url value="/json/user/view"/>", {
                userid: id,
                random: Math.random()
            }, function (result) {
                $('#editInfoTemplate').tmpl(result).replaceAll($('#commonModal .modal-content'));
                $('#commonModal').modal('show');

                $('#commonModal #userCreateForm').validate({
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
                        /*applydata: {
                         filesize: 20,
                         extension: "xls|csv|doc|docx|zip|rar"
                         }*/
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
                        /*applydata: {
                         extension: "文件后缀不支持！请上传word文档或者zip压缩包！"
                         }*/
                    },
                    success: function (label) {
                        label.text("${validate_message_ok}").addClass("valid");
                        label.removeClass("error");
                        label.html("有效");
                    }
                });


                $(".edituserbutton").on("click", function (e) {
                    if ($('#commonModal #userCreateForm').valid()) {
                        $('#commonModal #userCreateForm').submit();
                    }
                });
            });
        });

        $('#allocate').click(function (e) {
            e.preventDefault();
            allocate($(this).parent().parent().attr("id"));
            $('#view').modal('show');
        });
        $('.table .btn-danger').click(function (e) {
            e.preventDefault();
            deletectype($(this).parent().parent().attr("id"));
            $('#view').modal('show');
        });
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
            var actionURL = $('#deviceSearchForm').attr("action");
            if (actionURL.indexOf('?') != -1) {
                return false;
            }
            if (classes === sortClass.sSortAsc) {
                $('#orderByClause').val(column + ' desc');
                $('#deviceSearchForm').attr("action", actionURL + "?sn=true&typeId=${typeId }");
                $('#deviceSearchForm').submit();
            } else if (classes === sortClass.sSortDesc) {
                $('#orderByClause').val(column + ' asc');
                $('#deviceSearchForm').attr("action", actionURL + "?sn=true&typeId=${typeId }");
                $('#deviceSearchForm').submit();
            } else if (classes === sortClass.sSortable) {
                $('#orderByClause').val(column + ' desc');
                $('#deviceSearchForm').attr("action", actionURL + "?sn=true&typeId=${typeId }");
                $('#deviceSearchForm').submit();
            }
        });

        $('ul.pagination>li>a').click(function (e) {
            e.preventDefault();
            var link = $(this).attr("href");
            if (link && link !== '#') {
                $('#deviceSearchForm').attr("action", link);
                $('#deviceSearchForm').submit();
            }
        });
    })
    ;
</script>

<c:if test="${createSuccess != null && createSuccess}">
    <spring:message code="devicecreateform.message.success" text="Create success!" var="message_success"/>
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
<c:if test="${editSuccess != null && editSuccess}">
    <spring:message code="deviceeditform.message.success" text="Edit success!" var="message_edit_success"/>
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
<script type="text/javascript">
    var showVideo = function (filePath) {

        var html = '<div class="video" id="CuPlayer"><strong>温馨提示：您的Flash Player版本过低，请<a href="http://www.CuPlayer.com/">点此进行网页播放器升级</a>！</strong></div>';
        $(".filepreviewarea").append(html);
        var so = new SWFObject('<c:url value="/resources/js/cuplayer/CuPlayerMiniV4.swf"/>', "CuPlayerV4", "600", "410", "9", "#000000");
        so.addParam("allowfullscreen", "true");
        so.addParam("allowscriptaccess", "always");
        so.addParam("wmode", "opaque");
        so.addParam("quality", "high");
        so.addParam("salign", "lt");
        so.addVariable("CuPlayerSetFile", '<c:url value="/resources/js/cuplayer/CuPlayerSetFile.xml"/>'); //播放器配置文件地址,例SetFile.xml、SetFile.asp、SetFile.php、SetFile.aspx
        so.addVariable("CuPlayerFile", "<c:url value='/file/openfile'/>?filepath=" + filePath); //视频文件地址
        so.addVariable("CuPlayerImage", '<c:url value="/resources/images/website.png"/>');//视频略缩图,本图片文件必须正确
        so.addVariable("CuPlayerWidth", "600"); //视频宽度
        so.addVariable("CuPlayerHeight", "410"); //视频高度
        so.addVariable("CuPlayerAutoPlay", "yes"); //是否自动播放
        so.write("CuPlayer");
    };
    var showMusic =function (filePath){
    	var html='<div id="wrapper"><audio preload="auto" controls><source src="'+filePath+'"></audio></div>';
    	$(".filepreviewarea").append(html);
    	$( '#wrapper audio' ).audioPlayer({
			strPlay: '暂停',
			strPause: '播放',
			strVolume: '声音'
		}); 
    };
</script>
</body>
</html>
