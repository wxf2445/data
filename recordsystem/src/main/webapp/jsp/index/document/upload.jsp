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
                            <spring:message code="nav.menu.record" text="record"/><spring:message code="nav.menu.archive" text="archive"/>
                        </li>
                        <li>
                            归档信息录入
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i>
                                    归档信息录入
                                </h2>
                            </div>
                            <div class="box-content">


                                <form id="recordForm" name="recordForm" method="POST"
                                      action="<c:url value="/document/previewupload"  />" class="form-horizontal"
                                      role="form"
                                      <%--target="fileiframe"--%> enctype="multipart/form-data">
                                    <%--<legend>上传多个文件<b><strong>(请上传pdf文件或者图片,最多上传5个文件,可多选！)</strong></b></legend>
                                    <fieldset>
                                        <div class="">
                                            <input type="hidden" name="temppath" id="temppath">
                                            <input type="hidden" name="filename" id="filename">
                                            &lt;%&ndash;<input id="file_upload" type="file" name="file" multiple/>&ndash;%&gt;
                                                <span class="btn btn-default btn-primary btn-file">
                                                    上传文件<input class="form-control" id="resFile" name="resFile"
                                                               type="file"
                                                               multiple>
                                                </span>
                                            <label id="resFile-error"></label>
                                        </div>
                                        <h3>上传文件显示区域</h3>

                                        <div class="well col-md-12 filewell">
                                            &lt;%&ndash;<div class="col-md-3">
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
                                            </div>&ndash;%&gt;

                                        </div>
                                    </fieldset>
                                    <legend>文件预览区域</legend>
                                    <fieldset>
                                        <div class="filepreviewarea well">
                                            &lt;%&ndash;<iframe id="filepreview" name="filepreview"
                                                    src="<c:url value="/resources/tempfile/test.pdf"  />" width="100%"
                                                    height="500px">


                                            </iframe>&ndash;%&gt;
                                            &lt;%&ndash;<div class="row center">
                                                <img src="<c:url value="/resources/tempfile/news_alt.png"  />">

                                            </div>&ndash;%&gt;
                                            &lt;%&ndash;<iframe src="<c:url value="/template/word" />" width="100%"
                                                    height="500px">

                                            </iframe>&ndash;%&gt;
                                        </div>

                                    </fieldset>
                                    &lt;%&ndash;</form>&ndash;%&gt;
                                    <iframe id="fileiframe" name="fileiframe" style="visibility: hidden;display: none;">

                                    </iframe>--%>
                                    <%--<form class="form-horizontal" role="form">--%>
                                    <legend>选择档案分类</legend>
                                    <fieldset>
                                        <%--<blockquote>固定字段</blockquote>--%>
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

                                        <%--<div class="form-group">
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.record.subject"
                                                    text="Subject"/></label>

                                            <div class="col-sm-3">
                                                <input class="form-control" name="subject">
                                            </div>
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.record.people"
                                                    text="People"/></label>

                                            <div class="col-sm-3">
                                                <input class="form-control" name="people">
                                            </div>


                                        </div>--%>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.record.department" text="Department"/></label>

                                            <div class="col-sm-3">
                                                <select class="form-control" name="department">
                                                    <c:forEach var="department" items="${departments}">
                                                        <option value="${department.id}">${department.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.record.deadline"
                                                    text="Deadline"/></label>

                                            <div class="col-sm-3">
                                                <select class="form-control" name="deadline">
                                                    <c:forEach var="deadline" items="${deadlines}">
                                                        <option value="${deadline.id}">${deadline.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.record.year"
                                                    text="Year"/></label>

                                            <div class="col-sm-3">
                                                <select class="form-control" name="year">
                                                    <c:forEach var="year" items="${years}">
                                                        <option value="${year.id}">${year.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.record.mode"
                                                    text="mode"/></label>

                                            <div class="col-sm-3">
                                                <select class="form-control" name="mode">
                                                    <option value="0">按卷</option>
                                                    <option value="1">按件</option>
                                                </select>
                                            </div>
                                            <%--<label class="col-sm-2 control-label"><spring:message
                                                    code="model.record.sequenceNo"
                                                    text="SequenceNo"/></label>

                                            <div class="col-sm-3">
                                                <input name="sequenceNo" class="form-control">
                                            </div>--%>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label"><spring:message
                                                    code="model.record.description"
                                                    text="description"/></label>

                                            <div class="col-sm-8">
                                                <textarea name="description" class="form-control"></textarea>
                                                <label id="description-error" class="col-sm-1"></label>
                                            </div>
                                        </div>

                                        <div class="customarea">


                                        </div>
                                    </fieldset>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="pull-right">
                                                <a href="#" class="btn btn-success confirmUpload">下一步</a>
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

</div><!--/.fluid-container-->

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
<script src='<c:url value='/resources/charisma-master/bower_components/jquery-tmpl-master/jquery.tmpl.js '/>'></script>
<script src='<c:url value='/resources/charisma-master/bower_components/bootstrap-datepicker-release/js/bootstrap-datepicker.js '/>'></script>
<script src='<c:url value='/resources/charisma-master/bower_components/bootstrap-datepicker-release/js/locales/bootstrap-datepicker.zh-CN.js '/>'></script>
<script src='<c:url value='/resources/js/common/common.js'/>'></script>


<spring:message code="deleteform.message.failed" text="Delete failed!" var="message_delete_failed"/>
<spring:message code="deleteform.message.success" text="Delete success!" var="message_delete_success"/>
<script type="text/x-jquery-tmpl" id="recordTypeTemplate">
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

            <div class="col-sm-3 " id="customFields_{{= fieldName}}">
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
        var showCustomField = function () {
            var type = "_piece";
            if($("[name='mode']").val() == "0"){
                type = "_record";
            }
            $.ajax({
                type: "POST",
                url: '<c:url value="/json/recordtype/getCustomField"  />',
                data: {recordTypeId: $("select[name='recordtype']").val(),type:type},
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
                    $(".customarea [name^='customFields[']").each(function () {
                        var maxlength = $(this).siblings(".customFieldLength").val();
                        $(this).rules("add", {
                            /*required: true,*/
                            maxlength: Number(maxlength),
                        });
                    });
                }
            });
        }
        $("select[name='fonds']").on("change", function (e) {
            $.ajax({
                type: "get",
                url: '<c:url value="/json/recordtype/getByFondsId"  />',
                data: {fondsId: $(this).val()},
                success: function (result) {
                    console.log(result);
                    $("[name='recordtype']").empty();
                    $("#recordTypeTemplate").tmpl(result).appendTo($("[name='recordtype']"));
                    //showCustomField();
                }
            });
        });
        $("select[name='recordtype']").on("change", function (e) {
            //showCustomField();
        });
        $("select[name='mode']").on("change", function (e) {
            //showCustomField();
        });
        //showCustomField();
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
                    required: true,
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
                description:{
                    maxlength: 100
                }
            },
            messages: {
                resFile: {
                    required: "必需上传文件！",
                    extension: "只接收pdf文件或者图片格式!"
                }
            },
            success: function (label, element) {
                var id = label.attr("id");
                label.attr("id", id.replace("[", "-").replace("]", ""));
                console.log(label);
                label.text("${validate_message_ok}").addClass("valid");
                label.removeClass("error");
                label.html("有效");
            }
        });
        $(".confirmUpload").on("click", function (e) {
            $("#recordForm").attr("action", "<c:url value="/record/import"  />");
            if($("#recordForm select[name=fonds]").val()==null){
                noty({
                    text: "暂无全宗，请先添加全宗",
                    layout: "top",
                    type: "error",
                    timeout: 1000
                });
                return;
            }
            if($("#recordForm select[name=recordtype]").val()==null){
                noty({
                    text: "该全宗下暂无档案类型，请先添加档案类型",
                    layout: "top",
                    type: "error",
                    timeout: 1000
                });
                return;
            }
            $("#recordForm").removeAttr("target");
            $("#recordForm").submit();
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
        <c:url value="/resources/uploadify/uploadify.swf"  />',
         'uploader': '
        <c:url value="/json/user/uploadfile"   />',
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

</body>
</html>
