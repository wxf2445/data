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
    <link href='<c:url value='/resources/charisma-master/css/bootstrap-progressbar-3.3.4.css'/>' rel="stylesheet">

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.commoncom/svn/trunk/html5.js '></script>
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
                            数据管理
                        </li>
                        <li>
                            附件批量上传
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
                                    <div class="col-md-2">
                                        <c:set var="fondss" value="${recordTree.fondss}"/>
                                        <div id="jstree">
                                            <!-- in this example the tree is populated from inline HTML -->
                                            <ul>
                                                <c:forEach var="fondsTree" items="${fondss}">
                                                    <li class="jstree-open"
                                                        id="${fondsTree.fonds.id}"
                                                        title="${fondsTree.fonds.name}">${fondsTree.fonds.name}
                                                        <ul>
                                                            <c:forEach var="recordType"
                                                                       items="${fondsTree.recordTypes}">
                                                                <li data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
                                                                    class="recordtype"
                                                                    id="${recordType.id}"
                                                                    title="${recordType.name}">${recordType.name}
                                                                        <%--<ul>--%>
                                                                        <%--<c:forEach var="recordCategory"
                                                                                   items="${recordCategoryTrees}">
                                                                            <li
                                                                                    id="${recordCategory.recordCategory.id}">${recordCategory.recordCategory.des}
                                                                                <ul>
                                                                                    <c:forEach
                                                                                            var="recordCategoryContent"
                                                                                            items="${recordCategory.recordCategoryContents}">
                                                                                        <li
                                                                                                id="${recordCategoryContent.id}">${recordCategoryContent.name}
                                                                                            <ul>--%>
                                                                        <%--<li data-jstree='{"icon":"<c:url value="/resources/images/jstree/tree.png"  />"}'
                                                                            class="volume">
                                                                            按卷
                                                                        </li>--%>
                                                                        <%--<li data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
                                                                            class="record">
                                                                            临时档案
                                                                        </li>--%>
                                                                        <%--<li data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
                                                                            class="piece">
                                                                            按件
                                                                        </li>--%>
                                                                        <%--</ul>
                                                                    </li>
                                                                </c:forEach>
                                                            </ul>
                                                        </li>
                                                    </c:forEach>--%>
                                                                        <%--</ul>--%>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-10 operatorarea">
                                        <form id="recorduploadform" name="recorduploadform" action="<c:url
        value="/json/record/batchupload"/>" enctype="multipart/form-data">
                                            <input name="recordTypeId"  type="hidden"  >
                                            <div class="form-group">
                                                <label class="control-label col-sm-2"><b>批量上传类型:</b></label>

                                                <div class="col-sm-3">
                                                    <select name="type" class="form-control ">
                                                        <option value="0">按卷内</option>
                                                        <option value="1">按件</option>
                                                    </select>
                                                </div>
                                                <span class="btn btn-info batch-btn"><b>选择文件</b>
                                                    <input class="form-control" id="recordfile" name="recordfile" type="file" multiple="true">
                                                </span>
                                                <a class="btn btn-primary beginUpload">开始上传</a>
                                            </div>
                                        </form>
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-striped" role="progressbar"
                                                 aria-valuenow="0" aria-valuemin="0"
                                                 aria-valuemax="100">0%
                                            </div>
                                        </div>
                                        <div class="resulttable"></div>

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
<script src='<c:url
                value='/resources/charisma-master/bower_components/responsive-tables/responsive-tables.js '/>'></script>
<!-- tour plugin -->
<script src='<c:url
                value='/resources/charisma-master/bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js '/>'></script>
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
<script src='<c:url
                value='/resources/charisma-master/bower_components/jquery-validation-1.13.1/lib/jquery.form.js '/>'></script>
<!-- validate.js for form submit on ajax -->
<script src='<c:url
                value='/resources/charisma-master/bower_components/jquery-validation-1.13.1/dist/jquery.validate.js '/>'></script>
<script src='<c:url
                value='/resources/charisma-master/bower_components/jquery-validation-1.13.1/dist/localization/messages_zh.js '/>'></script>
<!-- application script for Charisma demo -->
<script src='<c:url value='/resources/charisma-master/js/charisma.js '/>'></script>
<script src='<c:url value='/resources/charisma-master/bower_components/jquery-tmpl-master/jquery.tmpl.js '/>'></script>
<script src='<c:url
                value='/resources/charisma-master/bower_components/bootstrap-datepicker-release/js/bootstrap-datepicker.js '/>'></script>
<script src='<c:url
                value='/resources/charisma-master/bower_components/bootstrap-datepicker-release/js/locales/bootstrap-datepicker.zh-CN.js '/>'></script>

<script src='<c:url value='/resources/js/date.js '/>'></script>
<script src='<c:url value='/resources/vakata-jstree/dist/jstree.js '/>'></script>

<script src='<c:url value='/resources/js/common/common.js'/>'></script>
<script
        src='<c:url value='/resources/charisma-master/js/bootstrap-progressbar.js '/>'></script>

<spring:message code="deleteform.message.failed" text="Delete failed!" var="message_delete_failed"/>
<spring:message code="deleteform.message.success" text="Delete success!" var="message_delete_success"/>
<spring:message code="check.success" text="Check Success" var="message_check_success"/>
<spring:message code="check.failure" text="Check Failure" var="message_check_failure"/>
<script type="text/x-jquery-impl" id="tableTemplate">
    <table  class="resulttable table table-striped table-bordered bootstrap-datatable">
    <tbody>

        <tr>
            <td>上传成功的档号</td>
            <td>
            {{= successNos.join(",")}}
            </td>
        </tr>

        <tr>
            <td>上传失败的档号</td>
            <td> {{= failureNos.join(",")}}</td>
        </tr>
        </tbody>
    </table>








</script>
<script type="text/x-jquery-impl" id="pieceResultTemplate">
    <table class="table table-striped table-bordered bootstrap-datatable">
        <thead>
        <th>上传附件成功的档号</th>
        <th>上传附件失败的档号</th>
        </thead>
        <tr>
            <td>{{= sort(successNos)}}</td>
            <td>{{= sort(failureNos)}}</td>
        </tr>
    </table>





</script>
<script type="text/javascript">
    function sort(array) {
        array.sort(function (a, b) {
            return a - b
        });
        return array.join(",");
    }
</script>
<script>
    $(document).ready(function () {
        var recordType = "";

        $('#jstree').jstree();
        $("#jstree").delegate(".recordtype a", "click", function (e) {
            recordType = $(this).closest("li").attr("id");
            $("#recorduploadform [name='recordTypeId']").val(recordType);
        });
        $("#jstree").jstree(true).select_node($(".recordtype:first").attr("id"));
        recordType = $(".recordtype:first").attr("id");
        $("#recorduploadform [name='recordTypeId']").val(recordType);
        $('.progress .progress-bar').progressbar({
            display_text: 'fill'
        });
        var showResult = function (data) {

            $('.progress .progress-bar').attr('data-transitiongoal', 100).progressbar({display_text: 'fill'});
            $("#tableTemplate").tmpl(data).replaceAll($(".operatorarea .resulttable"));
        };
        var batchUploadFile = function() {
            $("#recorduploadform").ajaxSubmit({
                dataType: "json",
                type: "post",
                ContentType:"text/html",
                success: function (data, s, xhr) {
                    console.log(data);
                    showResult(data);
                }
            });
        }

        $("#recorduploadform [name='type']").on("change", function (e) {
            var url = '<c:url value="/json/record/piecebatchupload" />';
            if($(this).val() == '0'){
                url = '<c:url value="/json/record/batchupload" />';
            }
            $("#recorduploadform").attr("action",url);
        });
        $("#recorduploadform .beginUpload").on("click", function (e) {
            var files = $("#recordfile")[0].files;
            if (!files) {
                files = this.value;
            }
            batchUploadFile();
        });
        $("#pieceuploadform .batch-btn input[type='file']").on("change", function (e) {
            var files = $(this)[0].files;
            if (files) {
                var first = files[0].name;
                var firstsquence = 1;
                var lastsquence = 1;
                var volumeno = first.substring(0, first.lastIndexOf("-"));
                for (var i = 0; i < files.length; i++) {
                    var filename = files[i].name;
                    var temp = Number(filename.substring(filename.lastIndexOf("-") + 1, filename.lastIndexOf(".")));
                    if (firstsquence > temp) {
                        firstsquence = temp;
                    }
                    if (lastsquence < temp) {
                        lastsquence = temp;
                    }
                }
                var tip = $("<p class='uploadtip alert alert-info'><b>您将要批量上传案件顺序号从<span class='blue'>" + firstsquence + "到" + lastsquence + "</span>的按件附件!</b><a class='btn btn-info confirmupload'>确定上传</a></p>");
                var form = $(this).closest("form");

                if (form.find(".uploadtip").length == 0) {
                    form.append(tip);
                } else {
                    tip.replaceAll(form.find(".uploadtip"));
                }
                $("#pieceuploadform .confirmupload").on("click", function (e) {
                    $(form).ajaxSubmit({
                        dataType: "json",
                        type: "post",
                        success: function (data, s, xhr) {

                            var tips = $("<div class='well uploadtip'></div>");
                            /*var successNos = data.successNos;*/

                            /*if (!$.isEmptyObject(successNos)) {
                             var nos = $.getKeys(successNos);
                             data.nos = nos;
                             }*/
                            console.log(data);
                            tips.append($("#pieceResultTemplate").tmpl(data));
                            tips.replaceAll(form.find(".uploadtip"));
                        }
                    });
                });
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
