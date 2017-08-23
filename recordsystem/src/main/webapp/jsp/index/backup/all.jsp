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
    <link href='<c:url value='/resources/css/backup/all.css'/>' rel="stylesheet">


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
                            <a href="<c:url value="/admin/index" />"><spring:message code="breadcrumb.home" text="Home"/></a>
                        </li>
                        <li>
                            系统管理
                        </li>
                        <li>
                            备份设置及管理
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

                                <!-- <blockquote>增量备份及全量备份</blockquote>
                                <a class="btn btn-info dailysetting"><i class="glyphicon glyphicon-book"></i>增量备份设置</a>
                                <a class="btn btn-info fullsetting"><i
                                        class="glyphicon glyphicon-book"></i>全量备份设置</a> -->
                                <blockquote>数据库备份及还原
                                    <div class="btn-group">
                                        <a class="btn btn-success bakcupnow"><i
                                                class="glyphicon glyphicon-adjust"></i>备份当前数据库</a><%--<a
                                            class="btn btn-primary"><i class="glyphicon glyphicon-cloud-upload"></i>上传脚本文件还原</a>--%>
                                    </div>
                                </blockquote>
                                <form id="backupform" name="backupform" class="form-horizontal" method="post"
                                      action="<c:url value="/json/backup/allBackupSave" />">
                                    <input type="hidden" name="pageSize" value="10">
                                    <input type="hidden" name="pageNum" value="1">

                                    <div class="row sqltable">

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

<script src='<c:url value='/resources/js/date.js'/>'></script>
<script src='<c:url value='/resources/js/common/common.js'/>'></script>


<spring:message code="deleteform.message.failed" text="Delete failed!" var="message_delete_failed"/>
<spring:message code="deleteform.message.success" text="Delete success!" var="message_delete_success"/>
<spring:message code="check.success" text="Check Success" var="message_check_success"/>
<spring:message code="check.failure" text="Check Failure" var="message_check_failure"/>
<script type="text/html" id="backupNowTemplate">
    <div class="modal-body">
        <form id="backupnowform" name="backupnowform" class="form-horizontal" method="POST"
              action="<c:url  value="/json/backup/now"  />">
            <div class="form-group">
                <label class="control-label">备份原因描述</label>
                <textarea name="description" class="form-control"></textarea>
            </div>
        </form>
    </div>
</script>
<script type="text/x-jquery-impl" id="sqlTableTemplate">
        <div class="sqltable">
            <table class="table-content table table-striped table-bordered bootstrap-datatable">
                    <thead>
                    <th>备份时间</th>
                    <th>描述</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
            {{if allBackupSave.page.items.length == 0}}
            <tr>
                <td style="display:none">无</td>
                <td colspan="20" class="center">表中数据为空！</td>
            </tr>
            {{else}}
            {{each allBackupSave.page.items}}
                    <tr id="{{= id}}">
                        <td>{{= toTimeString(createtime)}}</td>
                        <td>{{= description}}</td>
                        <td>
                            <a class="btn btn-info delete"><i
                                    class="glyphicon glyphicon-remove"></i>删除</a>
                            <a class="btn btn-info revert"><i
                                    class="glyphicon glyphicon-refresh"></i>还原</a>
                            <a class="btn btn-info download" href="<c:url value="/file/download"/>?filepath={{= sqlpath}}"><i
                                    class="glyphicon glyphicon-download"></i>下载</a>
                        </td>
                    </tr>
           {{/each}}
           {{/if}}
            </tbody>
           </table>
<nav class="center templatenav">
        <ul class="pagination">
            {{if allBackupSave.page.pageNum == 1}}
            <li class="disabled"><a href="#">上一页</a></li>
            {{else}}
            <li><a
                    href="#" id="prev"><span>上一页</span></a>
            </li>
            {{/if}}
            {{each(i,value) allBackupSave.showPages}}
            {{if allBackupSave.page.pageNum == value }}
            <li class="active"><a href="#">{{= value}}</a></li>
            {{else value == 0}}
            <li><a>...</a></li>
            {{else}}
            <li><a href="#" class="toNum"><span>{{= value}}</span></a>
            </li>
            {{/if}}
            {{/each}}
            {{if allBackupSave.page.pageNum == allBackupSave.page.totalPage}}
            <li class="disabled"><a href="#">下一页</a></li>
            {{else}}
            <li><a href="#" id="next"><span>下一页</span></a>
            </li>
            {{/if}}
        </ul>
    </nav>
</div>




































































</script>
<script type="text/x-jquery-impl" id="resultTemplate">
    <table class="table table-striped table-bordered bootstrap-datatable">
        <thead>
        <th>案卷号</th>
        <th>上传附件成功的卷内顺序号</th>
        <th>上传附件失败的卷内顺序号</th>
        </thead>
        {{each(i,v) nos }}
        <tr>
            <td>{{= v}}</td>
            <td>{{= sort(successNos[v].successSequence)}}</td>
            <td>{{= sort(successNos[v].failureSequence)}}</td>
        </tr>
        {{/each}}
        {{if failureNos.length >0}}
        <tr>
            <td>{{= sort(failureNos)}}</td>
            <td colspan="2">不存在相应的案卷号！</td>
        </tr>
        {{/if}}
    </table>



































































</script>

<script type="text/x-jquery-impl" id="dailySettingTemplate">
    <div class="modal-body">
        <div class="table-content">
            <form id="dailyForm" name="dailyForm">
                <table class="dailysettingtable table table-striped table-bordered bootstrap-datatable">
                    <thead>
                    <th>星期</th>
                    <th>小时(0~23)</th>
                    <th>分(0~59)</th>
                    <th>秒(0~59)</th>
                    <th>开启/关闭</th>
                    </thead>
                    <tbody>
                    {{each(i,v) time}}
                    <tr>
                        <td><span>{{= v}}</span></td>
                        {{if isSelected(backsmap,i+1)}}
                        <td>
                        <input name="{{= i}}_hour" id="{{= i}}_hour" type="text"  value="{{= getHour(backsmap[i+1])}}">
                            <label id="{{= i}}_hour-error"></label>
                        </td>
                        <td><input name="{{= i}}_minute" id="{{= i}}_minute" type="text" value="{{= getMinute(backsmap[i+1])}}">
                            <label id="{{= i}}_minute-error"></label>
                        </td>
                        <td><input name="{{= i}}_second" id="{{= i}}_second" type="text" value="{{= getSecond(backsmap[i+1])}}">
                            <label id="{{= i}}_second-error"></label>
                        </td>
                        <td><input type="checkbox" class="selectdate" weekindex="{{= i==6? 1: i+2}}" checked></td>
                       {{else}}
                       <td>
                        <input name="{{= i}}_hour" id="{{= i}}_hour" type="text" class="ignore" disabled >
                            <label id="{{= i}}_hour-error"></label>
                        </td>
                        <td><input name="{{= i}}_minute" id="{{= i}}_minute" type="text" class="ignore" disabled >
                            <label id="{{= i}}_minute-error"></label>
                        </td>
                        <td><input name="{{= i}}_second" id="{{= i}}_second" type="text" class="ignore" disabled>
                            <label id="{{= i}}_second-error"></label>
                        </td>
                        <td><input type="checkbox" class="selectdate" weekindex="{{= i==6? 1 : i+2}}" ></td>
                       {{/if}}
                    </tr>
                    {{/each}}
                    </tbody>
                </table>
            </form>
        </div>
    </div>































































</script>
<script type="text/javascript">
    function pages(totalPage) {
        var pages = [];
        for (var i = 1; i <= totalPage; i++) {
            pages.push(i);
        }
        return pages;
    }
    function toTimeString(mills) {
        var date = new Date(mills);
        return date.Format("yyyy-MM-dd HH:mm:ss");
    }
    function getHour(expression) {
        var hour = "";
        if (expression != undefined) {
            hour = expression.split(" ")[2];
        }
        return hour;
    }
    function getMinute(expression) {
        var minute = "";
        if (expression != undefined) {
            minute = expression.split(" ")[1];
        }
        return minute;
    }
    function getSecond(expression) {
        var second = "";
        if (expression != undefined) {
            second = expression.split(" ")[0];
        }
        return second;
    }
    function isSelected(map, key) {
        return map[key] != undefined;
    }
</script>
<script>
    $(document).ready(function () {
        $(".bakcupnow").on("click", function (e) {
            $("#backupNowTemplate").tmpl().replaceAll("#commonModal2 .modal-body");
            $("#commonModal2").modal("show");
            $("#commonModal2 .confirm").removeAttr("data-dismiss");
            var bkNowValidator = $('#backupnowform').validate({
                submitHandler: function (form) {
                    $("#commonModal2").modal("hide");
                    $(form).ajaxSubmit({
                        dataType: "json",
                        type: "post",
                        success: function (result, status, xhr) {
                            console.log(result);
                            if (result.status == true) {
                                noty({
                                    text: "备份成功",
                                    layout: "top",
                                    type: "success",
                                    timeout: 1000,
                                    onClosed: function () {
                                        showTable();
                                    }
                                });
                            } else {
                                noty({
                                    text: "备份失败",
                                    layout: "top",
                                    type: "failure",
                                    timeout: 1000,
                                    onClosed: function () {
                                    }
                                });
                            }
                        }
                    });
                },
                ignore: ".ignore",
                errorPlacement: function (error, element) {
                    //$(element).siblings("label.error").remove();
                    var id = error.attr("id");
                    error.attr("id", id.replace("[", "-").replace("]", ""));
                    console.log(error);
                    console.log(element);
                    error.replaceAll($("#" + $(element).attr("name").replace("[", "-").replace("]", "") + "-error"));
                },
                rules: {
                    description: {
                        maxlength: 32
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
            $(".confirm").on("click", function (e) {
                $("#backupnowform").submit();
            });

        });
        var showTable = function () {
            $("#backupform").ajaxSubmit({
                /*dataType: "json",*/
                type: "post",
                success: function (data, status, xhr) {
                    console.log(data);
                    $("#sqlTableTemplate").tmpl(data).replaceAll("#backupform .sqltable");
                    var currentPage = Number($(".pagination li.active a").text());
                    $("#next").on("click", function (e) {
                        $("#backupform #pageNum").val(currentPage + 1);
                        showTable();
                    });
                    $("#prev").on("click", function (e) {
                        $("#backupform #pageNum").val(currentPage - 1);
                        showTable();
                    });
                    $(".toNum").on("click", function (e) {
                        $("#backupform #pageNum").val($(this).find("span").text());
                        showTable();
                    });
                    $(".delete").on("click", function (e) {
                        var id = $(this).closest("tr").attr("id");
                        $.ajax({
                            type: "POST",
                            url: "<c:url  value="/json/backup/delete"  />",
                            //contentType: "application/json",
                            data: {index: id},
                            success: function (result) {
                                if (result.status == true) {
                                    noty({
                                        text: "删除成功",
                                        layout: "top",
                                        type: "success",
                                        timeout: 1000,
                                        onClosed: function () {
                                            showTable();
                                        }
                                    });
                                } else {
                                    noty({
                                        text: "删除失败",
                                        layout: "top",
                                        type: "failure",
                                        timeout: 1000
                                    });
                                }
                            }
                        });
                    });
                    $(".revert").on("click", function (e) {
                        var id = $(this).closest("tr").attr("id");
                        $.ajax({
                            type: "POST",
                            url: "<c:url  value="/json/backup/revert"  />",
                            //contentType: "application/json",
                            data: {index: id},
                            success: function (result) {
                                if (result.status == true) {
                                    noty({
                                        text: "还原成功",
                                        layout: "top",
                                        type: "success",
                                        timeout: 1000,
                                        onClosed: function () {
                                            showTable();
                                        }
                                    });
                                } else {
                                    noty({
                                        text: "还原失败",
                                        layout: "top",
                                        type: "failure",
                                        timeout: 1000
                                    });
                                }
                            }
                        });
                    });
                }
            });
        }
        showTable();
        var backupsetting = function (geturl, editurl) {
            $.ajax({
                type: "get",
                url: geturl,
                data: {},
                success: function (result) {
                    console.log(result);
                    var hasWeeks = result.hasWeeks;
                    result.time = ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期天'];
                    console.log(result);
                    $("#dailySettingTemplate").tmpl(result).replaceAll($("#commonModal2 .modal-body"));
                    $("#commonModal2").modal("show");
                    $("#commonModal2 .confirm").removeAttr("data-dismiss");
                    var dailyFormValidator = $('#dailyForm').validate({
                        ignore: ".ignore",
                        errorPlacement: function (error, element) {
                            //$(element).siblings("label.error").remove();
                            var id = error.attr("id");
                            error.attr("id", id.replace("[", "-").replace("]", ""));
                            console.log(error);
                            console.log(element);
                            error.replaceAll($("#" + $(element).attr("name").replace("[", "-").replace("]", "") + "-error"));
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
                    $("#dailyForm [name$='_hour']").each(function () {
                        $(this).rules("add", {
                            required: true,
                            number: true,
                            range: [0, 23]
                        });
                    });
                    $("#dailyForm [name$='_minute']").each(function () {
                        $(this).rules("add", {
                            required: true,
                            number: true,
                            range: [0, 59]
                        });
                    });
                    $("#dailyForm [name$='_second']").each(function () {
                        $(this).rules("add", {
                            required: true,
                            number: true,
                            range: [0, 59]
                        });
                    });

                    $(".selectdate").off("click").on("click", function (e) {
                        console.log("selectdate");
                        var textinput = $(this).closest("tr").find("input[type='text']");
                        if (!$(this).is(":checked")) {
                            textinput.addClass("ignore");
                            $.each(textinput, function (i, v) {
                                //dailyFormValidator.element($(v));
                                $(v).next().removeAttr("class").html("");
                            });

                            textinput.attr("disabled", true);
                        } else {
                            textinput.removeClass("ignore");
                            textinput.attr("disabled", false);
                        }
                    });

                    $(".confirm").off("click").on("click", function (e) {
                        if ($("#dailyForm").valid()) {
                            var cronExpressions = [];
                            $.each($(".selectdate:checked"), function (i, v) {
                                var minute = $(v).closest("tr").find("input[name$='_minute']").val();
                                var hour = $(v).closest("tr").find("input[name$='_hour']").val();
                                var second = $(v).closest("tr").find("input[name$='_second']").val();
                                var weekindex = $(v).attr("weekindex");
                                var cronExpression = second + " " + minute + " " + hour + " ? * " + weekindex;
                                cronExpressions.push(cronExpression);
                            });
                            var data = {cronExpressions: cronExpressions, hasWeeks: hasWeeks};
                            console.log(data);
                            $.ajax({
                                type: "POST",
                                url: editurl,
                                contentType: "application/json",
                                data: JSON.stringify(data),
                                success: function (result) {
                                    console.log(result);
                                    if (result.status == true) {
                                        noty({
                                            text: "修改成功",
                                            layout: "top",
                                            type: "success",
                                            timeout: 1000,
                                            onClosed: function () {
                                                $("#commonModal2").modal("hide");
                                            }
                                        });
                                    } else {
                                        noty({
                                            text: "修改失败",
                                            layout: "top",
                                            type: "failure",
                                            timeout: 1000,
                                            onClosed: function () {
                                                $("#commonModal2").modal("hide");
                                            }
                                        });
                                    }
                                }
                            });
                        }
                    });
                }
            });
        }
        $(".dailysetting").off("click").on("click", function (e) {
            backupsetting('<c:url value="/json/backup/dailybackup/info"  />', '<c:url value="/json/backup/dailybackup/modify"  />');
        });
        $(".fullsetting").off("click").on("click", function (e) {
            backupsetting('<c:url value="/json/backup/fullbackup/info"  />', '<c:url value="/json/backup/fullbackup/modify"  />');
        });
        $("#recorduploadform .batch-btn input[type='file']").on("change", function (e) {
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
                var tip = $("<p class='uploadtip alert alert-info'><b>您将要批量上传案卷号为<span class='blue'>" + volumeno + "</span>下从顺序号为从<span class='blue'>" + firstsquence + "到" + lastsquence + "</span>的附件!</b><a class='btn btn-info confirmupload'>确定上传</a></p>");
                var form = $(this).closest("form");

                if (form.find(".uploadtip").length == 0) {
                    form.append(tip);
                } else {
                    tip.replaceAll(form.find(".uploadtip"));
                }
                $("#recorduploadform .confirmupload").on("click", function (e) {
                    $(form).ajaxSubmit({
                        dataType: "json",
                        type: "post",
                        success: function (data, s, xhr) {

                            var tips = $("<div class='well uploadtip'></div>");
                            var successNos = data.successNos;

                            if (!$.isEmptyObject(successNos)) {
                                var nos = $.getKeys(successNos);
                                data.nos = nos;
                            }
                            console.log(data);
                            tips.append($("#resultTemplate").tmpl(data));
                            tips.replaceAll(form.find(".uploadtip"));
                        }
                    });
                });
            }
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
