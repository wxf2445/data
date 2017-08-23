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
    <link href='<c:url value='/resources/charisma-master/css/uploadify.css '/>' rel="stylesheet">

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
                            <spring:message code="nav.menu.userinfo" text="UserInfo"/>
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i> <spring:message code="nav.menu.userinfo"
                                                                                            text="UserInfo"/><a
                                        style="margin-top: -5px;margin-left: 5px;"
                                        class="btn btn-primary editinfo"><i class="glyphicon glyphicon-edit"></i></a>
                                </h2>
                            </div>
                            <div class="box-content">
                                <form class="form-horizontal" role="form">
                                    <input id="userid" type="hidden" value="${user.userid}">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"><spring:message code="model.user.name"
                                                                                              text="Name"/></label>

                                        <div class="col-sm-3">
                                            <p class="col-sm-3 form-control-static">${user.username}</p>
                                        </div>
                                        <label class="col-sm-2 control-label"><spring:message code="model.user.email"
                                                                                              text="Email"/></label>

                                        <div class="col-sm-3">
                                            <p class="col-sm-3 form-control-static">${user.email}</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"><spring:message
                                                code="model.user.cellphone"
                                                text="Phone"/></label>

                                        <div class="col-sm-3">
                                            <p class="col-sm-3 form-control-static">${user.phone}</p>
                                        </div>
                                        <label class="col-sm-2 control-label"><spring:message code="model.user.teamname"
                                                                                              text="Teamname"/></label>

                                        <div class="col-sm-3">
                                            <p class="col-sm-3 form-control-static">${user.teamname}</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"><spring:message
                                                code="model.user.teampeonum" text="Teampeonum"/></label>

                                        <div class="col-sm-3">
                                            <p class="col-sm-3 form-control-static">${user.teampeonum}</p>
                                        </div>
                                        <label class="col-sm-2 control-label"><spring:message
                                                code="model.user.schoolname"
                                                text="Schoolname"/></label>

                                        <div class="col-sm-3">
                                            <p class="col-sm-3 form-control-static">${user.schoolname}</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label"><spring:message
                                                code="model.user.teachername" text="Teachername"/></label>

                                        <div class="col-sm-3">
                                            <p class="col-sm-3 form-control-static">${user.teachername}</p>
                                        </div>
                                        <label class="col-sm-2 control-label"><spring:message
                                                code="model.user.applydata"
                                                text="Applydata"/></label>

                                        <div class="col-sm-3">
                                            <c:url value="/file/download" var="filedownloadurl">
                                                <c:param name="filepath" value="${user.applydata}"/>
                                            </c:url>
                                            <a class="btn btn-primary download" href="${filedownloadurl}"
                                               target="_new"><i
                                                    class="glyphicon glyphicon-download"></i></a>
                                            <a class="btn btn-primary upload"><i
                                                    class="glyphicon glyphicon-cloud-upload"></i></a>
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


<script type="text/html" id="offercerttemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h3>温馨提示：</h3>

        </div>
        <div class="modal-body">
            <div class="box-content">
                是否确定要给user"E药方"服务商发送数字证书？
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i>
                <spring:message code="href.confirm" text="Confirm"/></strong></a>
            <a href="#" class="btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i>
                <spring:message code="href.cancel" text="Cancel"/></strong></a>
        </div>
    </div>
</script>
<script type="text/x-jquery-tmpl" id="uploadTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="optitle">上传文件</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <div class="center">
                <input id="file_upload" type="file" name="file"/>
                </div>
            </div>
        </div>
            <div class="modal-footer">
            <a href="#" class="uploadbutton btn btn-primary"><strong><i class="glyphicon glyphicon-share-alt"></i>
                <span class="button1"><spring:message code="href.confirm" text="Confirm"/></span></strong></a>
            <a href="#" class="btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <span class="button2"><spring:message code="href.cancel"
                                                                                                     text="Cancel"/></span></strong></a>
        </div>
     </div>



































































































































































































































































</script>
<script type="text/x-jquery-tmpl" id="editInfoTemplate">
<div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="optitle">编辑用户</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <c:url var="editUserAction" value="/json/user/edit"/>
                <form id="userCreateForm" action="${editUserAction}" class="form-horizontal"
                           role="form" enctype="multipart/form-data">
    <input type="hidden" name="userid" value="{{= userid}}">

    <div class="form-group">
    <label class="col-sm-2 control-label"><spring:message code="model.user.name"
                                                          text="Name"/></label>

    <div class="col-sm-4">
    <input name="registerName" class="form-control" placeholder="{{= username }}"
    disabled="disabled" value="{{= username }}">
    <label id="registerName-error" class=""></label>
    </div>
    </div>
    <div class="form-group">
    <label class="col-sm-2 control-label"><spring:message code="model.user.email"
                                                          text="email"/></label>

    <div class="col-sm-4">
    <input type="email" name="email" class="form-control" placeholder="{{= email}}" value="{{= email}}">
    <label id="email-error" class=""></label>
    </div>
    <label class="col-sm-2 control-label"><spring:message code="model.user.cellphone"
                                                          text="Contact"/></label>

    <div class="col-sm-4">
    <input name="phone" class="form-control" placeholder="{{= phone}}"
    value="{{= phone}}">
    <label id="phone-error" class=""></label>
    </div>
    </div>
    <div class="form-group">
    <label class="col-sm-2 control-label"><spring:message code="model.user.teamname"
                                                          text="ContacInfo"/></label>

    <div class="col-sm-4">
    <input name="teamname" class="form-control" placeholder="{{= teamname}}"
    value="{{= teamname}}">
    <label id="teamname-error" class=""></label>
    </div>
    <label class="col-sm-2 control-label"><spring:message code="model.user.teampeonum"
                                                          text="MailBox"/></label>

    <div class="col-sm-4">
    <input name="teampeonum" class="form-control" placeholder="{{= teampeonum}}" value="{{= teampeonum}}">
    <label id="teampeonum-error" class=""></label>
    </div>
    </div>
    <div class="form-group">
    <label class="col-sm-2 control-label"><spring:message code="model.user.schoolname"
                                                          text="Description"/></label>

    <div class="col-sm-4">
    <input name="schoolname" placeholder="{{= schoolname}}" class="form-control" value="{{= schoolname}}">
    <label id="schoolname-error" class=""></label>
    </div>
    <label class="col-sm-2 control-label"><spring:message code="model.user.teachername"
                                                          text="Teachername"/></label>

    <div class="col-sm-4">
    <input name="teachername" placeholder="{{= teachername}}" class="form-control" value="{{= teachername}}">
    <label id="teachername-error" class=""></label>
    </div>
    </div>
    <%--<div class="form-group">
    <label class="col-sm-2 control-label"><spring:message code="model.user.applydata"
                                                          text="applydata"/></label>

    <div class="col-sm-4">
    <input name="applydata" type="file" class="form-control" >
    <label id="applydata-error" class=""></label>
    </div>

    </div>--%>
</form>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="edituserbutton btn btn-primary"><strong><i class="glyphicon glyphicon-share-alt"></i>
                <span class="button1"><spring:message code="href.confirm" text="Confirm"/></span></strong></a>
            <a href="#" class="btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <span class="button2"><spring:message code="href.cancel"
                                                                                                     text="Cancel"/></span></strong></a>
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
<script type="text/html" id="sensorTemplate">
    <tr id="t_{{= sensorid}}">
        <td><input type="checkbox" name="devices" value="{{= sensorid}}"/></td>
        <td>{{= sensorid}}</td>
        <td>{{= name}}</td>
        <td>{{= deviceid}}</td>
        <td>{{= description}}</td>
    </tr>
</script>
<spring:message code="deleteform.message.failed" text="Delete failed!" var="message_delete_failed"/>
<spring:message code="deleteform.message.success" text="Delete success!" var="message_delete_success"/>

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

        $(".upload").on("click", function (e) {
            $('#uploadTemplate').tmpl().replaceAll($('#commonModal .modal-content'));

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

            $('#file_upload').uploadify({
                'swf': '<c:url value="/resources/uploadify/uploadify.swf"  />',
                'uploader': '<c:url value="/json/user/uploadfile"   />',
                'height': 50,
                'width': 250,
                'auto': false,
                'formData': {'userid': $("#userid").val()},
                'fileDataName': 'file',
                'buttonText': '选择上传文件...',
                'fileTypeExts': '*.doc; *.docx; *.zip;*.rar',
                'multi': false,
                'method': 'post',
                'queueSizeLimit': 1,
                fileSizeLimit: '20MB',
                'overrideEvents': ['onCancel', 'onUploadError', 'onSelectError', 'onDialogClose'],
                'onSelectError': uploadify_onSelectError,
                'onUploadError': uploadify_onUploadError,
                'onUploadStart': function (files) {
                    alert("onUploadStart!");
                },
                /*'debug': true,*/
                /*'onUploadStart': function (file) {
                 var param = {};
                 param.picHref = $('#file_upload_href').val();
                 $("#file_upload").uploadify("settings", "formData", param);
                 },*/
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
                    $('#commonModal').modal('hide');
                    /*var imgUrl = uploadCommon.getPath(data);*/
                    /*$("#imgUrl").val(imgUrl);// 返回的图片路径保存起来
                     $("#thumbImg").attr("src", IMAGE_FILE_PATH + imgUrl);// 更新logo显示*/
                    /*uploadCommon.uploadImageBtnStyle("imgUrl");
                     uploadCommon.initPreviewAfterUpload(data); // 新图片预览*/
                }
            });
            $(".uploadbutton").on("click", function (e) {
                $('#file_upload').uploadify('upload', '*');
            });
            $('#commonModal').modal('show');
        });

        $('.offercert').on('click', function (e) {
            $('#offercerttemplate').tmpl().replaceAll($('.modal-content'));
            $('#view').modal('show');
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
// 				warningtemplate.find('.warningdevicename').text(devicesensorview.deviceview.name);
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
                    prevli = "<li class=\"prevbutton disabled\"><a  href=\"#\">&laquo;</a></li>";
                } else {
                    var prevpage = page - 1;
                    var url = "<c:url value='/json/device/warning?page="+prevpage+"&size="+size+"'/>";
                    prevli = "<li class=\"prevbutton nondisabled\"><a  href=\"" + url + "\">&laquo;</a></li>";
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
                    ${p}"><a  href="
                    <c:url value="/json/device/warning?n=${n}&typeId=${typeId }&page=${p}&size=${warningpage.getPageSize()}&sn=true"/>">
                    ${p}</a></li> */
                }
                var nextli = "";
                if (page == totalPage) {
                    nextli = "<li class=\"nextbutton disabled\"><a  href=\"#\">&raquo;</a></li>";
                } else {
                    var prevpage = page - 1;
                    var url = "<c:url value='/json/device/warning?page="+prevpage+"&size="+size+"'/>";
                    nextli = "<li class=\"nextbutton nondisabled\"><a  href=\"" + url + "\">&raquo;</a></li>";
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
                 // 			$('.breadcrumbdiv').after(warningtemplate);
                 alert("test!"); */

            });
            return false;
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
