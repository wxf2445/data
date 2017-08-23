<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link href='<c:url value='/resources/css/header.css'/>' rel="stylesheet">
<link href='<c:url value='/resources/css/cropper/cropper.css'/>' rel="stylesheet">
<link href='<c:url value='/resources/css/header/main.css'/>' rel="stylesheet">

<c:url var="defaultUserImg" value="/resources/img/usertype/user_32.png"  />
<shiro:hasRole name="USER">
    <c:set var="userinfo" value="appuserinfo"/>
    <c:url var="imagepath" value="/resources/img/usertype/user.png"/>
</shiro:hasRole>

<shiro:hasRole name="SUPER ADMIN">
    <c:url var="imagepath" value="/resources/img/usertype/administrator_32.png"/>
</shiro:hasRole>
<!-- topbar starts -->
<div class="navbar navbar-default mynavbar" role="navigation">

    <div class="navbar-inner">
        <button type="button" class="navbar-toggle pull-left animated flip" onclick="showMenu(this);">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <div class="col-md-12">
            <div class="col-md-9" id="logoName">
                <h1 class="headtitle">
                    <spring:message code="systemname" text="Web Sign System"/>
                </h1>
            </div>
            <div class="col-md-3">
                <div style="display:inline-block;line-height: 50px;">
                    <img alt="" class="userinfo ${userinfo }"
                         src="${imagepath ne null ?imagepath:defaultUserImg}">
                </div>
                <div class="principalstyle" style="display:inline-block;">
                    <div class="username"><shiro:principal/></div>
                </div>
                <a class="btn pull-right" href="<c:url value="/login/logout" />">
                    <img style="width:35px;height:35px;" alt=""
                         src="<c:url value='/resources/images/header/exit.png' />">
                </a>
            </div>


        </div>
        <%-- <a class="navbar-brand" href="<c:url value="/" />"> <img alt="SLuan Logo" src='<c:url value="/resources/img/logo_sluan.png"/>' class="hidden-xs logo-sluan"/>
        <span><spring:message code="company" text="Hang Zhou ykhl Technology Co."/></span></a> --%>
        <%-- <a class="navbar-brand" href="<c:url value="/" />"> <img alt="Wlw Logo" src='<c:url value='/resources/images/header/logo.png' />' class="hidden-xs logo-sluan"/>
        <span></span></a> --%>
        <!-- <span class="reload navbar-brand" >过60秒刷新一次</span> -->
        <!-- user dropdown starts -->
        <%-- <div class="btn-group pull-right">
        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
            <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> <shiro:principal/></span>
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><a href="<c:url value="/user/profile" />"><spring:message code="profile" text="Profile"/></a></li>
            <li class="divider"></li>
            <li><a href="<c:url value="/login/logout" />"><spring:message code="logout" text="Logout"/></a></li>
        </ul>
    </div> --%>
        <!-- user dropdown ends -->

        <!-- theme selector starts -->
        <%-- <div class="btn-group pull-right theme-container tada">
        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
            <i class="glyphicon glyphicon-tint"></i><span
                class="hidden-sm hidden-xs"> <spring:message code="theme.change" text="Change Theme / Skin"/></span>
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu dropdown-menu-w120" id="themes">
            <li><a data-value="classic" href="#"><i class="whitespace"></i> <spring:message code="theme.classic" text="Classic"/></a></li>
            <li><a data-value="cerulean" href="#"><i class="whitespace"></i> <spring:message code="theme.cerulean" text="Cerulean"/></a></li>
            <li><a data-value="cyborg" href="#"><i class="whitespace"></i> <spring:message code="theme.cyborg" text="Cyborg"/></a></li>
            <li><a data-value="simplex" href="#"><i class="whitespace"></i> <spring:message code="theme.simplex" text="Simplex"/></a></li>
            <li><a data-value="darkly" href="#"><i class="whitespace"></i> <spring:message code="theme.darkly" text="Darkly"/></a></li>
            <li><a data-value="lumen" href="#"><i class="whitespace"></i> <spring:message code="theme.lumen" text="Lumen"/></a></li>
            <li><a data-value="slate" href="#"><i class="whitespace"></i> <spring:message code="theme.slate" text="Slate"/></a></li>
            <li><a data-value="spacelab" href="#"><i class="whitespace"></i> <spring:message code="theme.spacelab" text="Spacelab"/></a></li>
            <li><a data-value="united" href="#"><i class="whitespace"></i> <spring:message code="theme.united" text="United"/></a></li>
        </ul>
    </div> --%>
        <!-- theme selector ends -->

    </div>
</div>
<!-- topbar ends -->
<script type="text/html" id="applyResultTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4>最新申请结果</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                最新申请结果
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <spring:message code="href.confirm"
                                                                               text="Confirm"/></strong></a>
        </div>


    </div>
</script>

<script type="text/html" id="userinfoTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4>用户信息</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.name"
                                                                              text="Name"/></label>

                        <div class="col-sm-3">
                            <input readonly="readonly" class="col-sm-3 form-control" value="{{= username}}">
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.type"
                                                                              text="Type"/></label>

                        <div class="col-sm-3">
                            <select disabled="disabled" class="form-control">
                                <option selected="selected">{{= role.name}}</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.service"
                                                                              text="Service"/></label>

                        <div class="col-sm-3">
                            <input readonly="readonly" class="form-control" value="{{= provider}}">
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.contact"
                                                                              text="Contact"/></label>

                        <div class="col-sm-3">
                            <input readonly="readonly" class="form-control" value="{{= contact}}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.contactinfo"
                                                                              text="ContacInfo"/></label>

                        <div class="col-sm-3">
                            <input readonly="readonly" class="form-control" value="{{= contactinfo}}">
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.mailbox"
                                                                              text="MailBox"/></label>

                        <div class="col-sm-3">
                            <input readonly="readonly" class="form-control" value="{{= email}}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.description"
                                                                              text="Description"/></label>

                        <div class="col-sm-8">
                            <textarea readonly="readonly" class="form-control">{{= description}}</textarea>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <spring:message code="href.confirm"
                                                                               text="Confirm"/></strong></a>
        </div>

        </form>
    </div>
</script>
<!-- Cropping modal -->
<div class="container" id="crop-avatar">
    <div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog"
         tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <c:url var="uploadpicvar" value="/json/user/uploadpic"/>
                <form class="avatar-form" action="${uploadpicvar}" enctype="multipart/form-data" method="post">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" id="avatar-modal-label">Change Avatar</h4>
                    </div>
                    <div class="modal-body">
                        <div class="avatar-body">

                            <!-- Upload image and data -->
                            <div class="avatar-upload">
                                <input type="hidden" class="avatar-src" name="avatar_src">
                                <input type="hidden" class="avatar-data" name="avatar_data">
                                <label for="avatarInput">Local upload</label>
                                <input type="file" class="avatar-input" id="avatarInput" name="avatar_file">
                            </div>

                            <!-- Crop and preview -->
                            <div class="row">
                                <div class="col-md-9">
                                    <div class="avatar-wrapper"></div>
                                </div>
                                <div class="col-md-3">
                                    <div class="avatar-preview preview-lg"></div>
                                    <div class="avatar-preview preview-md"></div>
                                    <div class="avatar-preview preview-sm"></div>
                                </div>
                            </div>

                            <div class="row avatar-btns">
                                <div class="col-md-9">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary" data-method="rotate"
                                                data-option="-90" title="Rotate -90 degrees">Rotate Left
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="rotate"
                                                data-option="-15">-15deg
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="rotate"
                                                data-option="-30">-30deg
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="rotate"
                                                data-option="-45">-45deg
                                        </button>
                                    </div>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary" data-method="rotate"
                                                data-option="90" title="Rotate 90 degrees">Rotate Right
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="rotate"
                                                data-option="15">15deg
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="rotate"
                                                data-option="30">30deg
                                        </button>
                                        <button type="button" class="btn btn-primary" data-method="rotate"
                                                data-option="45">45deg
                                        </button>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <button type="submit" class="btn btn-primary btn-block avatar-save">Done</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div> -->
                </form>
            </div>
        </div>
    </div><!-- /.modal -->
</div>
<!-- <script src='<c:url value='/resources/js/cropper.js'/>'></script>
<script src='<c:url value='/resources/js/header/main.js'/>'></script> -->
<shiro:hasRole name="SUPER ADMIN">

    <script type="text/javascript">
        $(document).ready(function () {
            var loginName = "<shiro:principal/>";

            $(".toMonitor").on("click", function (e) {
                //打开一个不被拦截的新窗口
                var newWindow = window.open();
                $.ajax({
                    type: "POST",
                    url: '<c:url value="/json/monitor/getAuthid" />',
                    success: function (result) {
                        var authid = result.authid;
                        var url = result.url;
                        var href = url + "?auth=" + authid + "&loginName=" + loginName;
                        //修改新窗口的url
                        newWindow.location.href = href;
                        /*var open = $("<a id='openMonitor' target='_blank' href='" + href + "' style='display:none;'><span>test</span></a>");
                         open.appendTo($(document.body));
                         $(document.body).find("a#openMonitor")[0].click();*/
                        //window.open(href, "_new");
                        /*$("#toMonitorForm").attr("action", href);
                         $("#toMonitorForm").submit();*/
                        /* $(".realToMonitor").attr("href", href);
                         $(".realToMonitor").click();*/
                        //$(obj.document).html(str_response);
                    }
                });
            });
        });
    </script>
    <%--<a class="realToMonitor" href="#" target="_new"><span>ffd</span></a>

    <form target="_new" id="toMonitorForm" method="get">
    </form>--%>
</shiro:hasRole>
<script type="text/javascript">
    $(".applyresult").on('click', function (e) {
        $.ajax({
            type: "POST",
            url: "<c:url value="/json/app/applyresult" />",
            beforeSend: function (xhr) {

            },
            success: function (result) {
                $('#applyResultTemplate').tmpl(result).replaceAll($('#view .modal-content'));
                $(".modal-dialog").width(800);
                $('#view').modal('show');
            }
        });
    });
    $(".username").on('click', function (e) {
        var username = $(".username").text();
        $.get("<c:url value="/json/user/viewbyname" />", {
            username: username
        }, function (result) {
            $('#userinfoTemplate').tmpl(result).replaceAll($('#view .modal-content'));
            $(".modal-dialog").width(800);
            $('#view').modal('show');
        });
    });
    $(".userinfo").on('click', function (e) {
        var username = $(".username").text();
        $.get("<c:url value="/json/user/viewbyname" />", {
            username: username
        }, function (result) {
            $('#userinfoTemplate').tmpl(result).replaceAll($('#view .modal-content'));
            $(".modal-dialog").width(800);
            $('#view').modal('show');
        });
    });
    function showMenu(el) {
        if ($(".mynavbarbox"))
            if ($(".mynavbarbox").hasClass("disShow")) {
                $(".mynavbarbox").removeClass("disShow disPosition");
            } else {
                $(".mynavbarbox").addClass("disShow disPosition");
            }
    }
    /* $(".hospitalinfo").on('click', function(e) {
     $('#hospitaluserinfoTemplate').tmpl().replaceAll($('.modal-content'));
     $(".modal-dialog").width(800);
     $('#view').modal('show');
     }); */
</script>
