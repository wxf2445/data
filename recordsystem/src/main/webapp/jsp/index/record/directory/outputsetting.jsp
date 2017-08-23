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
    <style type="text/css">
        .unCoverVolumeTemplate_body {
            max-height: 400px;
            overflow: scroll
        }

        .applySuccess {
            position: absolute;
            z-index: 9999;
            opacity: 0.9;
            width: 760px;
            text-align: center;
            left: 50%;
            top: -66px;
            margin-left: -380px;
            border-radius: 0px 0px 3px 3px;
            background: #ffffff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
            display: none
        }

        .applySuccess span {
            color: #999999;
            font-size: 16px;
            margin-right: 20px
        }

        .reBuild_nowFile {
            max-height: 200px;
            overflow-y: scroll
        }

        #reBuildVolumeTemplate .modal-body {
            max-height: 450px;
            overflow-y: scroll;
        }

        .reBuild_otherFile label {
            text-align: right;
            line-height: 35px
        }
    </style>

</head>
<body>

<%@include file="../../common/common.jsp" %>
<%@include file="../../../header.jsp" %>

<div class="container-fluid mycontainer">
    <div class="containercontent">

        <%@include file="../../../nav.jsp" %>

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
                            目录输出版面设置
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i> 目录输出版面设置</h2>
                            </div>
                            <div class="box-content">
                                <div class="row">
                                    <div class="col-md-2">
                                        <c:set var="fondss" value="${recordTree.fondss}"/>
                                        <div id="jstree">
                                            <!-- in this example the tree is populated from inline HTML -->
                                            <ul>
                                                <li data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
                                                    class="defaultStyle" id="defaultStyle">
                                                    默认样式
                                                </li>
                                                <c:forEach var="fondsTree" items="${fondss}">
                                                    <li class="jstree-open"
                                                        id="${fondsTree.fonds.id}"
                                                        title="${fondsTree.fonds.name}">${fondsTree.fonds.name}
                                                        <ul>
                                                            <c:forEach var="recordType"
                                                                       items="${fondsTree.recordTypes}">
                                                                <li class="jstree-open"
                                                                    id="${recordType.id}"
                                                                    title="${recordType.name}">${recordType.name}
                                                                    <ul>
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
                                                                        <li data-jstree='{"icon":"<c:url value="/resources/images/jstree/tree.png"  />"}'
                                                                            class="volumeinner">
                                                                            卷内
                                                                        </li>
                                                                        <li data-jstree='{"icon":"<c:url value="/resources/images/jstree/tree.png"  />"}'
                                                                            class="volume">
                                                                            按卷
                                                                        </li>
                                                                        <li data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
                                                                            class="piece">
                                                                            按件
                                                                        </li>
                                                                            <%--</ul>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </li>
                                                        </c:forEach>--%>
                                                                    </ul>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-10 settingarea">


                                    </div>


                                </div>
                            </div>
                        </div>
                        <!--/span-->


                    </div><!--/row-->
                    <%@include file="../../../footer.jsp" %>
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
                    <a href="#" class="btn btn-primary" data-dismiss="modal"><i
                            class="glyphicon glyphicon-share-alt"></i>
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

    <script type="text/html" id="createTypeTemplate">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="optitle">创建按卷</h4>
            </div>
            <div class="modal-body">
                <div class="box-content">
                    <c:url var="createTypeAction" value="/json/recordvolume/create"/>
                    <form:form modelAttribute="typeCreateForm" action="${createTypeAction}" class="form-horizontal"
                               method="post"
                               role="form">

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><spring:message code="model.record.fonds"
                                                                                  text="fonds"/></label>

                            <div class="col-sm-4">
                                <select name="fonds" class="form-control">
                                    {{each fonds}}
                                    <option value="{{= id}}">{{= name}}</option>
                                    {{/each}}
                                </select>
                                <label class="control-label"></label>
                            </div>
                            <label class="col-sm-2 control-label"><spring:message code="model.record.recordtype"
                                                                                  text="recordtype"/></label>

                            <div class="col-sm-4">
                                <select name="recordtype" class="form-control">
                                    {{each recordtypes}}
                                    <option value="{{= id}}">{{= name}}</option>
                                    {{/each}}
                                </select>
                                <label class="control-label"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><spring:message code="model.record.year"
                                                                                  text="year"/></label>

                            <div class="col-sm-4">
                                <input id="year" name="year" class="form-control">
                                <label id="year-error" class="control-label"></label>
                            </div>
                            <label class="col-sm-2 control-label"><spring:message code="model.record.deadline"
                                                                                  text="deadline"/></label>

                            <div class="col-sm-4">
                                <input id="deadline" name="deadline" class="form-control">
                                <label id="deadline-error" class="control-label"></label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><spring:message code="model.record.department"
                                                                                  text="department"/></label>

                            <div class="col-sm-4">
                                <input id="department" name="department" class="form-control">
                                <label id="department-error" class="control-label"></label>
                            </div>
                                <%--<label class="col-sm-2 control-label"><spring:message code="model.record.subject"
                                                                                      text="subject"/></label>

                                <div class="col-sm-4">
                                    <input id="subject" name="subject" class="form-control">
                                    <label id="subject-error" class="control-label"></label>
                                </div>--%>
                        </div>
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
            </div>
            <div class="modal-footer">
                <a href="#" class="createTypeButton btn btn-primary"><strong><i
                        class="glyphicon glyphicon-share-alt"></i>
                    <span class="button1"><spring:message code="href.confirm" text="Confirm"/></span></strong></a>
                <a href="#" class="cancel btn btn-primary" data-dismiss="modal"><strong><i
                        class="glyphicon glyphicon-share-alt"></i> <span class="button2"><spring:message
                        code="href.cancel"
                        text="Cancel"/></span></strong></a>
            </div>

            </form>
        </div>
    </script>

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
                                                                                                 text="Confirm"/></a>
                    </p>
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
                <a href="#" class="checkpass btn btn-primary"><strong><i
                        class="glyphicon glyphicon-share-alt"></i> <span
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
                                <input type="password" name="pwdconfirm" class="form-control"
                                       placeholder="空时，不输入新密码则不修改密码">
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
                        class="glyphicon glyphicon-share-alt"></i> <span class="button2"><spring:message
                        code="href.notpass"
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
                                <p class="form-control-static">{{= name}} <i class="glyphicon glyphicon-tag blue"></i>
                                </p>
                            </div>
                            <label class="col-sm-2 control-label"><spring:message code="model.user.dtuid"
                                                                                  text="Serialnumber"/></label>

                            <div class="col-sm-10">
                                <p class="form-control-static">{{= dtuid}} <i class="glyphicon glyphicon-tag blue"></i>
                                </p>
                            </div>
                            <label class="col-sm-2 control-label"><spring:message code="model.user.checksum"
                                                                                  text="Checksum"/></label>

                            <div class="col-sm-10">
                                <p class="form-control-static">{{= checksum}} <i
                                        class="glyphicon glyphicon-tag blue"></i>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button value="submit" class="btn btn-primary"><i class="glyphicon glyphicon-saved"></i>
                        <spring:message
                                code="href.ok" text="OK"/></button>
                    <a href="#" class="btn btn-primary" data-dismiss="modal"><i
                            class="glyphicon glyphicon-share-alt"></i>
                        <spring:message code="href.cancel" text="Cancel"/></a>
                </div>
            </form>
        </div>
    </script>
    <spring:message code="deleteform.message.failed" text="Delete failed!" var="message_delete_failed"/>
    <spring:message code="deleteform.message.success" text="Delete success!" var="message_delete_success"/>
    <spring:message code="check.success" text="Check Success" var="message_check_success"/>
    <spring:message code="check.failure" text="Check Failure" var="message_check_failure"/>

    <script type="text/html" id="recordListTemplate">
        <div class="row center">
            {{if records.length == 0}}
            <p><strong><b>暂无卷内</b></strong></p>
            {{else}}
            {{each records}}
            {{if isVolume}}
            <div class="col-md-3" recordid="{{= id}}" type="_record">
                {{else}}
                <div class="col-md-3" recordid="{{= id}}" type="_piece">
                    {{/if}}
                    <img class="pointerimg" src="<c:url value="/resources/images/content/document_128.png" />">

                    <p><input type="hidden" value="{{= id}}"><a href="#"><span><b>
                        {{if subject != ''}}
                        {{= subject}}
                        {{else}}
                        暂未填写！
                        {{/if}}
                    </b></span></a></p>
                </div>
                {{/each}}
                {{/if}}
            </div>

    </script>
    <script type="text/html" id="buildVolumeSelectedTemplate">
        <h1>已选择档案</h1>

        <div class="table-content selectedArea">
            <table class="table table-striped table-bordered responsive">
                <thead>
                <tr>
                    <th id="th_type"><spring:message code="model.record.type"
                                                     text="Type"/></th>
                    <th id="th_subject"><spring:message code="model.record.subject"
                                                        text="Subject"/></th>
                    <th id="th_year"><spring:message code="model.record.year"
                                                     text="year"/></th>
                    <th id="th_people"><spring:message code="model.record.people"
                                                       text="people"/></th>
                    <th id="th_department"><spring:message code="model.record.department"
                                                           text="department"/></th>
                    <th id="th_deadline"><spring:message code="model.record.deadline"
                                                         text="deadline"/></th>
                    <th id="th_recordtype"><spring:message code="model.record.recordtype"
                                                           text="recordtype"/></th>
                    <th id="th_createtime"><spring:message code="model.record.createtime"
                                                           text="CreateTime"/></th>
                    <th id="th_select"><spring:message code="model.record.option"
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
        </div>
    </script>
    <script type="text/html" id="buildVolumeSelectTemplate">

        <div class="selectarea">
            <h1>搜索档案</h1>

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
                <div class="navbar-inner">
                    <c:url value="/recordtype/manage" var="searchActoin">
                    </c:url>
                    <form:form modelAttribute="buildRecordSearchForm" action="${searchActoin}">
                        <form:hidden path="orderByClause"/>
                        <form:hidden path="status" value="1"/>
                        <form:hidden path="rccId"/>
                        <form:hidden path="recordCatogory"/>
                        <form:hidden path="rtId" value="{{= rtId}}"/>
                        <form:hidden path="fondsId" value="{{= fondsId}}"/>
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
                        </div>
                    </form:form>
                </div>
            </div>
            <div class="table-content">
                <table class="table table-striped table-bordered responsive">
                    <thead>
                    <tr>
                        <%--<th id="th_select" title="Select"><spring:message code="model.record.select"
                                                                          text="Select"/></th>--%>
                        <th id="th_type"><spring:message code="model.record.type"
                                                         text="Type"/></th>
                        <th id="th_subject"><spring:message code="model.record.subject"
                                                            text="Subject"/></th>
                        <th id="th_year"><spring:message code="model.record.year"
                                                         text="year"/></th>
                        <th id="th_people"><spring:message code="model.record.people"
                                                           text="people"/></th>
                        <th id="th_department"><spring:message code="model.record.department"
                                                               text="department"/></th>
                        <th id="th_deadline"><spring:message code="model.record.deadline"
                                                             text="deadline"/></th>
                        <th id="th_recordtype"><spring:message code="model.record.recordtype"
                                                               text="recordtype"/></th>
                        <th id="th_createtime"><spring:message code="model.record.createtime"
                                                               text="CreateTime"/></th>
                        <th id="th_select"><spring:message code="model.record.option"
                                                           text="Option"/></th>
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
                    <tr id="{{= id}}">


                        <td class="center">
                            {{if isVolume == false}}
                            按件
                            {{else}}
                            按卷
                            {{/if}}
                        </td>
                        <td class="center">{{= subject}}</td>
                        <td class="center">{{= yearString}}</td>
                        <td class="center">{{= people}}</td>
                        <td class="center">{{= departmentString}}</td>
                        <td class="center">{{= deadlineString}}</td>
                        <td class="center">{{= title}}</td>
                        <td class="center">{{= createtime}}</td>
                        <td class="center"><a class="btn btn-success selectRecord"><span>选择</span></a></td>
                    </tr>
                    {{/each}}
                    {{/if}}
                    </tbody>
                </table>
            </div>
        </div>
    </script>
    <script type="text/html" id="documentTemplate">
        <div class="row">
            <div class="col-sm-4">
                <h3>档案属性</h3>

                <p>题名：xxxx</p>

                <p>责任人：xxxx</p>

                <h3>文件列表</h3>
                {{each documents}}
                <p class="">{{= name}}<input type="hidden" id="hiddenfilepath" value="{{= path}}"><a
                        class="btn btn-success filepreview">预览</a>
                </p>
                {{/each}}
            </div>
            <div class="col-sm-8">
                <IFRAME NAME="FILEIFRAME" ID="FILEIFRAME" WIDTH="100%" HEIGHT="800PX">

                </IFRAME>
            </div>
        </div>

    </script>
    <script type="text/x-jquery-tmpl" id="oneTdTemplate">
    <td class="td_{{= colid}}"  >
        XXX
                </td>

    </script>
    <script type="text/x-jquery-tmpl" id="oneThTemplate">
    <th class="newTh" id="th_{{= colid}}">{{= colname}}
                    <input name="cols"  type="hidden" value="{{= colid}}">
                    <input name="colnames"  type="hidden" value="{{= colname}}">
                <a class="btn btn-info toright"><i class="glyphicon glyphicon-arrow-right"></i></a>
                </th>

    </script>
    <script type="text/x-jquery-tmpl" id="defaultStyleTemplate">
<form id="outputSettingForm" class="form-horizontal" name="outputSettingForm" method="post" action="<c:url
            value="/json/outputsetting/setting/setDefault"/>">
        <input name="filename" type="hidden" value="默认打印文件" >
        <input name="eid" type="hidden" value="{{= defaultStyle !=null ? defaultStyle.eid:''}}" >
        <input name="format" type="hidden" value="{{= format}}" >
    <div class="row">
        <blockquote><b>修改输出(打印)参数</b></blockquote>

        <div class="col-md-12">
            <div class="col-md-6">
            <label class="control-label">列宽</label>
            {{if defaultStyle != undefined && defaultStyle!=null}}
            <input class="form-control" name="colwidth"  value="{{= defaultStyle.colwidth}}" placeholder="{{= defaultStyle.colwidth}}">
            {{else}}
            <input class="form-control" >
            {{/if}}
            <label id="colwidth-error" class="control-label"></label>
            </div>
            <div class="col-md-6">
            <label class="control-label">字号</label>
            {{if defaultStyle != undefined && defaultStyle!=null}}
                <input class="form-control" name="fontsize" value="{{= defaultStyle.fontsize}}" placeholder="{{= defaultStyle.fontsize}}">
            {{else}}
                <input class="form-control" name="fontsize">
            {{/if}}
            <label id="fontsize-error" class="control-label"></label>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-6">
            <label class="control-label">行高</label>
            {{if defaultStyle != undefined && defaultStyle!=null}}
            <input class="form-control" name="lineheight" value="{{= defaultStyle.lineheight}}" placeholder="{{= defaultStyle.lineheight}}">
            {{else}}
            <input class="form-control" name="lineheight">
            {{/if}}
            <label id="lineheight-error" class="control-label"></label>
            </div>
            <div class="col-md-6">
            <label class="control-label">打印尺寸(mm)</label>
            {{if defaultStyle != undefined && defaultStyle!=null}}
                <select class="form-control" name="style">
                    <option value="A3" {{= defaultStyle.style == "A3"?"selected":""}}>A3(297*410)</option>
                    <option value="A4" {{= defaultStyle.style == "A4"?"selected":""}}>A4(210*297)</option>
                </select>
            {{else}}
                <select class="form-control" name="style">
                    <option value="A3" >A3</option>
                    <option value="A4" >A4</option>
                </select>
            {{/if}}
            <label id="style-error" class="control-label"></label>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-6">
            <label class="control-label">左边距(mm)</label>
            {{if defaultStyle != undefined && defaultStyle!=null}}
            <input class="form-control" name="leftmargin" value="{{= defaultStyle.leftmargin}}" placeholder="{{= defaultStyle.leftmargin}}">
            {{else}}
            <input class="form-control" name="leftmargin">
            {{/if}}
            <label id="leftmargin-error" class="control-label"></label>
            </div>
            <div class="col-md-6">
            <label class="control-label">右边距(mm)</label>
            {{if defaultStyle != undefined && defaultStyle!=null}}
            <input class="form-control" name="rightmargin" value="{{= defaultStyle.rightmargin}}" placeholder="{{= defaultStyle.rightmargin}}">
            {{else}}
            <input class="form-control" name="rightmargin">
            {{/if}}
            <label id="rightmargin-error" class="control-label"></label>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-6">
            <label class="control-label">上边距(mm)</label>
            {{if defaultStyle != undefined && defaultStyle!=null}}
            <input class="form-control" name="topmargin" value="{{= defaultStyle.topmargin}}" placeholder="{{= defaultStyle.topmargin}}">
            {{else}}
            <input class="form-control" name="topmargin">
            {{/if}}
            <label id="topmargin-error" class="control-label"></label>
            </div>
            <div class="col-md-6">
            <label class="control-label">下边距(mm)</label>
            {{if defaultStyle != undefined && defaultStyle!=null}}
            <input class="form-control" name="bottommargin" value="{{= defaultStyle.bottommargin}}" placeholder="{{= defaultStyle.bottommargin}}">
            {{else}}
            <input class="form-control" name="bottommargin">
            {{/if}}
            <label id="bottommargin-error" class="control-label"></label>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-6">
            <label class="control-label">打印方向</label>
            {{if defaultStyle != undefined && defaultStyle!=null}}
                <select class="form-control" name="direction">
                    <option value="0" {{= defaultStyle.direction == false?"selected":""}}>纵向</option>
                    <option value="1" {{= defaultStyle.direction == true?"selected":""}}>横向</option>
                </select>
            {{else}}
                <select class="form-control" name="direction">
                    <option value="0" >纵向</option>
                    <option value="1" >横向</option>
                </select>
            {{/if}}
            <label id="direction-error" class="control-label"></label>
            </div>
        </div>
    </div>
<hr>
        <div class="pull-right">
            <button class="btn btn-info confirm" type="submit">确定</button>
        </div>
    </form>

    </script>
    <script type="text/x-jquery-tmpl" id="colSetTemplate">
    <form id="outputSettingForm" class="form-horizontal" name="outputSettingForm" method="post" action="<c:url
            value="/json/outputsetting/setting/modify"/>">
        <input name="category" type="hidden" value="{{= type}}" >
        <input name="fonds" type="hidden" value="{{= fondsId}}" >
        <input name="recordtype" type="hidden" value="{{= recordType}}" >
        <input name="filename" type="hidden" value="{{= filename}}" >
        <input name="format" type="hidden" value="{{= format}}" >

    <div class="row selectCol">
        <blockquote><b>选择输出字段及列宽（单位：mm）</b></blockquote>
        <div class="col-md-12 center">
        <div class="table-content">
        {{if isOutPutSettingExist == true}}
        <table class="table table-striped table-bordered responsive">
            <thead>
            <tr>
        {{each(i,v) cols}}
        {{if v != 'fondsid'}}
        <%--<div class="col-md-2">--%>
        <td>
        <label>{{= colMap[v]}}</label><br>
            {{if colIsSelected(v,ordercols) == true}}
                <input id="{{= v}}"  type="checkbox" checked>
            {{else}}
                <input id="{{= v}}"  type="checkbox" >
            {{/if}}

            </td>
        <%--</div>--%>
        {{/if}}
        {{/each}}
        </tr>
        </thead>
        <tbody>
        <tr>
        {{each(i,v) cols}}
        {{if v != 'fondsid'}}
        <%--<div class="col-md-2">--%>
        <td>
                {{if getColIndex(v,ordercols)!=-1}}
                <input name="width[{{= v}}]" class="width_{{= v}}" value="{{= colWidthList[getColIndex(v,ordercols)]}}" placeholder="{{= colWidthList[getColIndex(v,ordercols)]}}" style="width:100%"><br>
                {{else}}
                <input name="width[{{= v}}]" class="width_{{= v}}" disabled value="{{= defaultWidth}}" placeholder="{{= defaultWidth}}" style="width:100%"><br>
                {{/if}}
                <label id="width-error"></label>
        </td>
         {{/if}}
         {{/each}}
        </tr>
        </tbody>
        </table>
        {{else}}
        <table class="table table-striped table-bordered responsive">
            <thead>
            <tr>
        {{each(i,v) cols}}
        {{if v != 'fondsid'}}

        <%--<div class="col-md-2">--%>
            <td>

            <label>{{= colMap[v]}}</label><br>
            <input id="{{= v}}"  type="checkbox" checked>
            </td>
        <%--</div>--%>
        {{/if}}
        {{/each}}
        </tr>
        </thead>
        <tbody>
        <tr>
                {{each(i,v) cols}}
                    {{if v != 'fondsid'}}
        <%--<div class="col-md-2">--%>
                    <td>
                    <input name="width[{{= v}}]" class="width_{{= v}}" value="{{= defaultWidth}}" placeholder="{{= defaultWidth}}" style="width:100%"><br>
                    </td>
                    {{/if}}
                {{/each}}
        </tr>
        </tbody>
        </table>
        {{/if}}
        </div>
        </div>
    </div>

    <div class="row">
        <blockquote><b>修改输出(打印)参数</b></blockquote>

        <div class="col-md-12">
            <div class="col-md-6">
            <label class="control-label">标题</label>
            {{if isOutPutSettingExist == true}}
            <input class="form-control" name="title" value="{{= outPutSetting.title}}" placeholder="{{= outPutSetting.title}}">
            {{else}}
            <input class="form-control" name="title" value="{{= title}}" placeholder="{{= title}}">
            {{/if}}
            <label id="title-error" class="control-label"></label>
            </div>
            <div class="col-md-6">
            <label class="control-label">字号</label>
            {{if isOutPutSettingExist == true}}
                <input class="form-control" name="fontsize" value="{{= outPutSetting.fontsize}}" placeholder="{{= outPutSetting.fontsize}}">
            {{else}}
                <input class="form-control" name="fontsize">
            {{/if}}
            <label id="fontsize-error" class="control-label"></label>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-6">
            <label class="control-label">行高</label>
            {{if isOutPutSettingExist == true}}
            <input class="form-control" name="lineheight" value="{{= outPutSetting.lineheight}}" placeholder="{{= outPutSetting.lineheight}}">
            {{else}}
            <input class="form-control" name="lineheight">
            {{/if}}
            <label id="lineheight-error" class="control-label"></label>
            </div>
            <div class="col-md-6">
            <label class="control-label">打印尺寸(mm)</label>
            {{if isOutPutSettingExist == true}}
                <select class="form-control" name="style">
                    <option value="A3" {{= outPutSetting.style == "A3"?"selected":""}}>A3(297*410)</option>
                    <option value="A4" {{= outPutSetting.style == "A4"?"selected":""}}>A4(210*297)</option>
                </select>
            {{else}}
                <select class="form-control" name="style">
                    <option value="A3" >A3</option>
                    <option value="A4" >A4</option>
                </select>
            {{/if}}
            <label id="style-error" class="control-label"></label>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-6">
            <label class="control-label">左边距(mm)</label>
            {{if isOutPutSettingExist == true}}
            <input class="form-control" name="leftmargin" value="{{= outPutSetting.leftmargin}}" placeholder="{{= outPutSetting.leftmargin}}">
            {{else}}
            <input class="form-control" name="leftmargin">
            {{/if}}
            <label id="leftmargin-error" class="control-label"></label>
            </div>
            <div class="col-md-6">
            <label class="control-label">右边距(mm)</label>
            {{if isOutPutSettingExist == true}}
            <input class="form-control" name="rightmargin" value="{{= outPutSetting.rightmargin}}" placeholder="{{= outPutSetting.rightmargin}}">
            {{else}}
            <input class="form-control" name="rightmargin">
            {{/if}}
            <label id="rightmargin-error" class="control-label"></label>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-6">
            <label class="control-label">上边距(mm)</label>
            {{if isOutPutSettingExist == true}}
            <input class="form-control" name="topmargin" value="{{= outPutSetting.topmargin}}" placeholder="{{= outPutSetting.topmargin}}">
            {{else}}
            <input class="form-control" name="topmargin">
            {{/if}}
            <label id="topmargin-error" class="control-label"></label>
            </div>
            <div class="col-md-6">
            <label class="control-label">下边距(mm)</label>
            {{if isOutPutSettingExist == true}}
            <input class="form-control" name="bottommargin" value="{{= outPutSetting.bottommargin}}" placeholder="{{= outPutSetting.bottommargin}}">
            {{else}}
            <input class="form-control" name="bottommargin">
            {{/if}}
            <label id="bottommargin-error" class="control-label"></label>
            </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-6">
            <label class="control-label">打印方向</label>
            {{if isOutPutSettingExist == true}}
                <select class="form-control" name="direction">
                    <option value="0" {{= outPutSetting.direction == false?"selected":""}}>纵向</option>
                    <option value="1" {{= outPutSetting.direction == true?"selected":""}}>横向</option>
                </select>
            {{else}}
                <select class="form-control" name="direction">
                    <option value="0" >纵向</option>
                    <option value="1" >横向</option>
                </select>
            {{/if}}
            <label id="direction-error" class="control-label"></label>
            </div>
        </div>
    </div>
    <div class="row tablesetting">
        <blockquote><b>修改输出(打印)样式</b></blockquote>
        <div class="col-md-12 well center">
        <h1 class="head">{{= title}}</h1>
        <div class="table-content">
        {{if isOutPutSettingExist == false}}
        <table class="table table-striped table-bordered responsive">
            <thead>
            <tr>
                {{each(i,v) cols}}
                {{if v != 'fondsid'}}
                {{if i == cols.length-1}}
                <th id="th_{{= v}}" >
                <a class="btn toleft"><i class="glyphicon glyphicon-arrow-left"></i></a>
                {{= colMap[v]}}
                    <input name="cols"  type="hidden" value="{{= v}}">
                    <input name="colnames"  type="hidden" value="{{= colMap[v]}}">
                </th>
                {{else i== 0}}
                <th id="th_{{= v}}" >{{= colMap[v]}}
                <input name="cols"  type="hidden" value="{{= v}}">
                    <input name="colnames"  type="hidden" value="{{= colMap[v]}}">
                <a class="btn  toright"><i class="glyphicon glyphicon-arrow-right"></i></a>
                </th>
                {{else}}
                <th id="th_{{= v}}"  >
                <a class="btn  toleft"><i class="glyphicon glyphicon-arrow-left"></i></a>
                {{= colMap[v]}}
                    <input name="cols"  type="hidden" value="{{= v}}">
                    <input name="colnames"  type="hidden" value="{{= colMap[v]}}">
                <a class="btn toright"><i class="glyphicon glyphicon-arrow-right"></i></a>
                </th>
                {{/if}}
                {{/if}}
                {{/each}}
            </tr>
            </thead>
            <tbody>
                <tr>
                {{each(i,v) cols}}
                {{if v != 'fondsid'}}
                <td class="td_{{= v}}"  >
                    XXX
                </td>
                {{/if}}
                {{/each}}
                </tr>
                <%--<tr>
                <td>test</td>
                <td>test</td>
                <td>test</td>
                <td>test</td>
                <td>test</td>
                <td>test</td>
                <td>test</td>
                </tr>--%>
            </tbody>
            </table>
            {{else}}
            <table class="table table-striped table-bordered responsive">
                <thead>
                <tr>
                    {{each(i,v) ordercols}}
                    {{if v != 'fondsid'}}
                    {{if i == ordercols.length-1}}
                    <th id="th_{{= v}}" >
                    <a class="btn toleft"><i class="glyphicon glyphicon-arrow-left"></i></a>
                    {{= colMap[v]}}
                        <input name="cols"  type="hidden" value="{{= v}}">
                        <input name="colnames"  type="hidden" value="{{= colMap[v]}}">
                    </th>
                    {{else i == 0}}
                    <th id="th_{{= v}}" >{{= colMap[v]}}
                        <input name="cols"  type="hidden" value="{{= v}}">
                        <input name="colnames"  type="hidden" value="{{= colMap[v]}}">
                        <a class="btn toright"><i class="glyphicon glyphicon-arrow-right"></i></a>
                    </th>
                    {{else}}
                    <th id="th_{{= v}}" >
                    <a class="btn toleft"><i class="glyphicon glyphicon-arrow-left"></i></a>
                    {{= colMap[v]}}
                        <input name="cols"  type="hidden" value="{{= v}}">
                        <input name="colnames"  type="hidden" value="{{= colMap[v]}}">
                        <a class="btn toright"><i class="glyphicon glyphicon-arrow-right"></i></a>
                    </th>
                    {{/if}}
                    {{/if}}
                    {{/each}}
                </tr>
                </thead>
                <tbody>
                    <tr>
                    {{each(i,v) ordercols}}
                    {{if v != 'fondsid'}}
                    <td class="td_{{= v}}"  >
                       XXX
                    </td>
                    {{/if}}
                    {{/each}}
                    </tr>
                </tbody>
            </table>
            {{/if}}
            </div>
        </div>
    </div>
        <hr>
        <div class="pull-right">
            <a class="btn btn-info confirm">确定</a>
        </div>
    </form>

    </script>
    <script type="text/javascript">
        var colCache = {}
        function colIsSelected(v, ordercols) {
            return $.inArray(v, ordercols) != -1;
        }
        function getColIndex(v, ordercols) {
            if (colCache[v] == null || colCache[v] == undefined) {
                colCache[v] = $.inArray(v, ordercols);
            }
            return colCache[v];
        }
    </script>


    <script type="text/html" id="RecordTemplate">
        <div class="table-content">
            <table class="table table-striped table-bordered responsive">
                <thead>
                <tr>
                    <th id="th_type"><spring:message code="model.record.type"
                                                     text="Type"/></th>
                    <th id="th_no"><spring:message code="model.record.recordNo"
                                                   text="Type"/></th>
                    {{if isVolume == true}}
                    <th id="th_innersize"><spring:message code="model.record.innersize"
                                                          text="innersize"/></th>
                    <th id="th_timerange"><spring:message code="model.record.timerange"
                                                          text="timerange"/></th>
                    {{/if}}
                    <th id="th_pagenum"><spring:message code="model.record.pagenum"
                                                        text="pagenum"/></th>
                    <th id="th_subject"><spring:message code="model.record.subject"
                                                        text="Subject"/></th>

                    <th id="th_operator"><spring:message code="model.record.operator"
                                                         text="operator"/></th>
                    <th id="th_address"><spring:message code="model.record.address"
                                                        text="Address"/></th>
                    <th id="th_people"><spring:message code="model.record.people"
                                                       text="people"/></th>
                    <%--<th id="th_year" title="year"><spring:message code="model.record.year" text="year"/></th>
                    <th id="th_department" title="department"><spring:message code="model.record.department"
                                                                  text="department"/></th>
                    <th id="th_deadline" title="deadline"><spring:message code="model.record.deadline"
                                                                          text="deadline"/></th>--%>
                    <th id="th_description"><spring:message code="model.record.description"
                                                            text="description"/></th>
                    <th id="th_recordtype"><spring:message code="model.record.recordtype"
                                                           text="recordtype"/></th>
                    <th id="th_createtime"><spring:message code="model.record.createtime"
                                                           text="CreateTime"/></th>
                    <%--{{if isVolume == false}}
                    <th id="th_status" title="Status"><spring:message code="model.record.status"
                                                                      text="Status"/></th>
                    {{/if}}--%>
                    <th class="actions w90"><spring:message code="actions"
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
                <tr id="{{= id}}">
                    <td class="center">
                        {{if isVolume == false}}
                        按件
                        {{else}}
                        按卷
                        {{/if}}
                    </td>
                    {{if isVolume == false}}
                    <td class="recordNo">{{= recordno}}</td>
                    {{else}}
                    <td class="volumeNo">{{= volumeno}}</td>
                    <td class="innersize">{{= innersize}}</td>
                    <td class="timerange">{{= timerange}}</td>
                    {{/if}}
                    <td class="pagenum">{{= pagenum}}</td>
                    <td class="subject">{{= subject}}</td>
                    <td class="operator">{{= operator}}</td>
                    <td class="address">{{= address}}</td>
                    <td class="people">{{= people}}</td>
                    <td class="des">{{= description}}</td>
                    <%--<td class="year" id="{{= year}}">{{= yearString}}</td>
                        <td class="department" id="{{= department}}">{{= departmentString}}</td>
                        <td class="deadline" id="{{= deadline}}">{{= deadlineString}}</td>--%>
                    <td class="recordtype">{{= title}}</td>
                    <td class="createtime">{{= createtime}}</td>
                    {{if isVolume == false}}
                    <%--<td class="status">
                        {{if tableid == null}}
                        <span class="label label-danger">尚未录入</span>
                        {{else}}
                        <span class="label label-success">已录入</span>
                        {{/if}}
                    </td>--%>
                    {{/if}}
                    <td class="center">
                        {{if isVolume == false}}

                        <a class="btn btn-success viewDocument" title="查看具体信息"><i class="glyphicon glyphicon-check"></i></a>
                        <%--{{if tableid == null}}
                        <a class="btn btn-success importinfo" title="录入信息"><i class="glyphicon glyphicon-import"></i></a>
                        {{/if}}--%>
                        {{else}}
                        <%--<a class="btn btn-success reBuildVolume" title="重新组卷"><i class="glyphicon glyphicon-road"></i></a>
                       <a class="btn btn-success uncoverVolume" title="拆卷"><i class="glyphicon glyphicon-open"></i></a>&ndash;%&gt;
                       <a class="btn btn-success buildVolume" title="组卷"><i class="glyphicon glyphicon-inbox"></i></a>--%>
                        <a class="btn btn-success viewInnerRecord" title="查看卷内"><i
                                class="glyphicon glyphicon-inbox"></i></a>
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
                        href="#" class="toNum"><span>{{= value}}</span></a>
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
                    <h5>当前卷下的按件</h5>
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
                            <td>按件</td>
                            <td>subject</td>
                            <td>1111</td>
                            <td>asd</td>
                            <td>sad</td>
                            <td>201609</td>
                            <td>科技档案</td>
                            <td>14463023432</td>
                        </tr>

                        <tr>
                            <td>按件</td>
                            <td>subject</td>
                            <td>1112</td>
                            <td>asd</td>
                            <td>sad</td>
                            <td>201609</td>
                            <td>文书档案</td>
                            <td>14463023432</td>
                        </tr>
                        <tr>
                            <td>按件</td>
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
                    <h5>当前卷下的按件</h5>
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
                            <td>按件</td>
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
                            <td>按件</td>
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
                            <button type="button" class="btn btn-muted pull-right disabled removeChosedFile">移除所选按件
                            </button>
                        </div>
                    </div>
                    <h5>其他按件</h5>

                    <div class="navbar-form navbar-left col-sm-12 pull-left" role="search" style="padding-left:0px">
                        <div class="daterange input-group">
                            <input id="starttime" name="starttime" placeholder="起始日期" class="form-control" type="text"
                                   value="">
                            <span class="input-group-addon">到</span>
                            <input id="endtime" name="endtime" placeholder="截止日期" class="form-control" type="text"
                                   value="">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                        <div class="input-group">
                            <input id="key" name="key" placeholder="名称" class="form-control" type="text" value=""
                                   autocomplete="true">
	              	 	<span class="input-group-btn">
	              	  		<button class="btn btn-info searchbutton"><i class="glyphicon glyphicon-search"></i>
                            </button>
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
                            <td>按件</td>
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
                            <td>按件</td>
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
                            <button type="button" class="btn btn-muted pull-right disabled addChosedFile">添加所选按件
                            </button>
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
        $(document).on("click", "#unCoverVolumeTemplate .applyForUncover span", function () {
            $(".applySuccess").show().animate({top: "0px"});
            ftime = setInterval(function () {
                fade_time--;
                if (fade_time == 0) {
                    isApplyUnCover = 1;
                    $(".applySuccess").animate({top: "-66px"});
                    clearInterval(ftime);
                }
            }, 500);
            fade_time = 4;
            $(".uncoverVolume").attr("title", "申请中");
            $(".uncoverVolume").removeClass("btn-success").addClass("btn-muted");
            if (isApplyUnCover == 1) {
                aution = setInterval(function () {
                    applyUnCover_time--;
                    if (applyUnCover_time == 0) {
                        $("#unCoverVolumeTemplate .applyForUncover span").html("确认拆卷");
                        $(".uncoverVolume").attr("title", "拆卷");
                        $(".uncoverVolume").removeClass("btn-muted").addClass("btn-success");
                        $("#unCoverVolumeTemplate").removeClass("applyForUncover");
                        clearInterval(aution);
                    }
                }, 500);
                applyUnCover_time = 4;
            }
        });
        $(document).on("click", "#reBuildVolumeTemplate .applyForReBuild span", function () {
            $(".applySuccess").show().animate({top: "0px"});
            ftime = setInterval(function () {
                fade_time--;
                if (fade_time == 0) {
                    isApplyReBuild = 1;
                    $(".applySuccess").animate({top: "-66px"});
                    clearInterval(ftime);
                }
            }, 500);
            fade_time = 4;
            $(".reBuildVolume").attr("title", "申请中");
            $(".reBuildVolume").removeClass("btn-success").addClass("btn-muted");
            if (isApplyReBuild == 1) {
                $(".removeChosedFile").removeClass("btn-muted").removeClass("disabled").addClass("btn-primary");
                $(".addChosedFile").removeClass("btn-muted").removeClass("disabled").addClass("btn-primary");
                artion = setInterval(function () {
                    applyReBuild_time--;
                    if (applyReBuild_time == 0) {
                        $("#reBuildVolumeTemplate .applyForReBuild span").html("重新组卷");
                        $(".reBuildVolume").attr("title", "重新组卷");
                        $(".reBuildVolume").removeClass("btn-muted").addClass("btn-success");
                        $("#reBuildVolumeTemplate").removeClass("applyForReBuild");
                        clearInterval(artion);
                    }
                }, 500);
                applyReBuild_time = 4;
            }
        });

        //移除所选按件
        $(function () {
            $(".removeChosedFile").click(function () {
                $(".reBuild_nowFile input[type='checkbox']:checked").each(function () {
                    var removeHasChecked = $(this).parents("tr").index();
                    $("table.reBuild_nowFile tbody").find("tr:eq(" + removeHasChecked + ")").remove();
                });
            });
        });
        //添加所选按件
        $(function () {
            $(".addChosedFile").click(function () {
                $(".reBuild_otherFile input[type='checkbox']:checked").each(function () {
                    var addHasChecked = $(this).parents("tr").index();
                    for (var i = 0; i <= addHasChecked; i++) {
                        addHasCheckedArray[i] = $("table.reBuild_otherFile tbody").find("tr:eq(" + addHasChecked + ")").html();
                        $("table.reBuild_nowFile tbody").append(addHasCheckedArray[i]);
                    }
                    $("table.reBuild_otherFile tbody").find("tr:eq(" + addHasChecked + ")").remove();

                });

            });
        });
    </script>

    <div class="modal fade " id="checkModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog checkModal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        <!-- 计算机学院2016届毕业生档案 -->
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="box-content">
                        <div class="btn-group pull-left"></div>
                        <div class="clearfix"></div>
                        <div class="col-md-9 pull-left fileContent"
                             style="background:#fff;border-radius:5px;border: 1px #ccc solid;">

                            <!-- 标签页开始 -->
                            <div class="col-sm-3  center-block" style="background:#fff;border-bottom:1pxsolid #ccc;">
                                <ul id="myTab" class="nav nav-tabs center-block" style="list-style-type:none;">
                                    <li class="active"><a href="#home" data-toggle="tab">文件信息</a></li>
                                    <li><a href="#ios" data-toggle="tab">档案内容</a></li>
                                </ul>
                            </div>
                            <div id="myTabContent" class="tab-content" style="height:94%">
                                <div class="tab-pane fade in active" id="home" style="height:90%">
                                    <select class="form-control choosefile"></select>
                                    <iframe name="openfile" height="100%" width="100%" frameborder="no"
                                            scrolling="no"></iframe>
                                </div>
                                <div class="tab-pane fade" id="ios"></div>
                            </div>
                            <!-- 标签页结束 -->

                        </div>
                        <div class="col-md-3 pull-right wordContent"
                             style="background:#fff;border-radius:5px;border: 1px #ccc solid;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .checkModal {
            width: 90%;
            height: 700px
        }

        .checkModal .fileContent {
            height: 600px;
        }

        .checkModal .wordContent {
            height: 600px
        }

    </style>
    <script>

        $(document).ready(function () {
            var selectedRecords = [];
            var fondsId = "";
            var recordType = "";
            var fondsName = "";
            var recordTypeName = "";
            var isVolume = true;
            var isVolumeInner = false;
            $('#jstree').jstree();
            function getDefaultColWidth(colnums) {
                var leftmargin = 10;
                var rightmargin = 12;
                var style = $("[name='style']").length == 0 ? "A4" : $("[name='style']").val();

                return ((Style_Setting[style].realWidth - leftmargin - rightmargin) / colnums).toPrecision(2);
            }

            var showDefault = function () {

                $.ajax({
                    type: "POST",
                    url: "<c:url value="/json/outputsetting/defaultStyle"  />",
                    data: {},
                    success: function (result) {
                        result.format = "excel";
                        $(".settingarea").empty();
                        $("#defaultStyleTemplate").tmpl(result).appendTo($(".settingarea"));
                        $("#outputSettingForm").validate({
                            //ignore:".ignore",
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
                                                text: "设置成功！",
                                                layout: "top",
                                                type: "success",
                                                timeout: 1000
                                                /*onClosed: function () {
                                                 showSetting();
                                                 }*/
                                            });

                                        } else if (status == 0) {
                                            noty({
                                                text: "设置失败！",
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
                                $(element).nextAll("label").remove();
                                error.appendTo($(element).parent());
                                if ($(element).attr("name") == 'title') {
                                    $(".tablesetting .head").text($(element).val());
                                }
                            },
                            rules: {
                                lineheight: {
                                    maxlength: 4,
                                    required: true,
                                    number: true
                                },
                                leftmargin: {
                                    maxlength: 4,
                                    required: true,
                                    number: true
                                },
                                rightmargin: {
                                    maxlength: 4,
                                    required: true,
                                    number: true
                                },
                                topmargin: {
                                    maxlength: 4,
                                    required: true,
                                    number: true
                                },
                                bottommargin: {
                                    maxlength: 4,
                                    required: true,
                                    number: true
                                },
                                fontsize: {
                                    maxlength: 3,
                                    required: true,
                                    number: true
                                },
                                colwidth: {
                                    maxlength: 32,
                                    required: true
                                }
                                /* width:{
                                 maxlength: 2,
                                 required: true,
                                 number: true,
                                 exportColWidthMax:true
                                 }*/
                                /*colwidth: {
                                 maxlength: 3,
                                 required: true,
                                 number: true,
                                 exportColWidth:true
                                 }*/
                            },
                            success: function (label) {
                                label.text("${validate_message_ok}").addClass("valid");
                                label.removeClass("error");
                                label.html("有效");
                            }
                        });
                    }
                });
            }
            var showSetting = function () {
                var tableSuffix = "_piece";
                var type = "_piece";

                if (isVolumeInner) {
                    type = "_record";
                    tableSuffix = "_record";
                } else if (isVolume) {
                    type = "_record";
                    tableSuffix = "_volume";
                }
                $.ajax({
                    type: "POST",
                    url: "<c:url value="/json/record/getRecordColumns"  />",
                    data: {recordTypeId: recordType, tablesuffix: tableSuffix, isInner: isVolumeInner},
                    success: function (result) {
                        console.log(result);
                        $(".settingarea").empty();
                        result.type = tableSuffix;
                        result.fondsId = fondsId;
                        result.recordType = recordType;
                        result.filename = recordTypeName + "按卷目录";
                        result.title = recordTypeName + "分类按卷目录";
                        result.format = "xls";
                        var outPutSetting = result.outPutSetting;

                        var colsnums = 0;
                        if (outPutSetting != undefined) {
                            result.ordercols = outPutSetting.outputcolorder.split("-");
                            colsnums = result.ordercols.length;
                            result.colWidthList = outPutSetting.colwidth.split("-");
                        } else {
                            colsnums = result.cols.length - 1;
                        }
                        result.defaultWidth = getDefaultColWidth(colsnums);
                        colCache = {};
                        $("#colSetTemplate").tmpl(result).appendTo($(".settingarea"));
                        $("#outputSettingForm").validate({
                            //ignore:".ignore",
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
                                                text: "设置成功！",
                                                layout: "top",
                                                type: "success",
                                                timeout: 1000,
                                                onClosed: function () {
                                                    showSetting();
                                                }
                                            });

                                        } else if (status == 0) {
                                            noty({
                                                text: "设置失败！",
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
                                $(element).nextAll("label").remove();
                                error.appendTo($(element).parent());
                                if ($(element).attr("name") == 'title') {
                                    $(".tablesetting .head").text($(element).val());
                                }
                            },
                            rules: {
                                lineheight: {
                                    maxlength: 4,
                                    required: true,
                                    number: true
                                },
                                leftmargin: {
                                    maxlength: 4,
                                    required: true,
                                    number: true
                                },
                                rightmargin: {
                                    maxlength: 4,
                                    required: true,
                                    number: true
                                },
                                topmargin: {
                                    maxlength: 4,
                                    required: true,
                                    number: true
                                },
                                bottommargin: {
                                    maxlength: 4,
                                    required: true,
                                    number: true
                                },
                                fontsize: {
                                    maxlength: 3,
                                    required: true,
                                    number: true
                                },
                                title: {
                                    maxlength: 32,
                                    required: true
                                }
                                /* width:{
                                 maxlength: 2,
                                 required: true,
                                 number: true,
                                 exportColWidthMax:true
                                 }*/
                                /*colwidth: {
                                 maxlength: 3,
                                 required: true,
                                 number: true,
                                 exportColWidth:true
                                 }*/
                            },
                            success: function (label) {
                                label.text("${validate_message_ok}").addClass("valid");
                                label.removeClass("error");
                                label.html("有效");
                            }
                        });

                        $("#outputSettingForm input[name^='width[']").each(function () {
                            /*var maxlength = $(this).siblings(".customFieldLength").val();*/
                            $(this).rules("add", {
                                maxlength: 2,
                                required: true,
                                number: true,
                                exportColWidthMax: true
                            });
                        });
                        //$("#commonModal2 .modal-header .head").text("档案目录输出");
                        //$("#commonModal2").modal("show");
                        $(".selectCol input[type='checkbox']").on("click", function (e) {
                            $("#th_" + $(this).attr("id")).toggle();
                            $(".td_" + $(this).attr("id")).toggle();
                            var thiswidth = $(".selectCol").find(".width_" + $(this).attr("id"));
                            if (!$(this).prop("checked")) {
                                $("#th_" + $(this).attr("id")).find("[name='cols']").attr("disabled", true);
                                $("#th_" + $(this).attr("id")).find("[name='colnames']").attr("disabled", true);
                                thiswidth.attr("disabled", true);
                                thiswidth.siblings("label").text("");
                                //thiswidth.addClass("ignore");
                            } else {
                                if ($("#th_" + $(this).attr("id")).length == 0) {
                                    var col = {
                                        colid: $(this).attr("id"),
                                        colname: $(this).siblings("label").text()
                                    }
                                    $("#oneThTemplate").tmpl(col).prependTo($(".tablesetting thead tr"));
                                    $("#oneTdTemplate").tmpl(col).prependTo($(".tablesetting tbody tr"));
                                } else {
                                    $("#th_" + $(this).attr("id")).find("[name='cols']").removeAttr("disabled");
                                    $("#th_" + $(this).attr("id")).find("[name='colnames']").removeAttr("disabled");
                                }
                                thiswidth.removeAttr("disabled");
                                //thiswidth.removeClass("ignore");
                            }
                        });
                        $(".tablesetting").delegate("th .toleft", "click", function (e) {
                            var thisth = $(this).closest("th");
                            var prevth = thisth.prevAll(":visible:first");
                            if (thisth.next().length == 0) {
                                thisth.append($("<a class='btn toright'><i class='glyphicon glyphicon-arrow-right'></i></a>"));
                                prevth.find(".toright").remove();
                            } else if (prevth.prev().length == 0) {
                                prevth.prepend($("<a class='btn toleft'><i class='glyphicon glyphicon-arrow-left'></i></a>"));
                                thisth.find(".toleft").remove();
                            }
                            thisth.fadeOut("5000");
                            thisth.after(prevth).fadeIn('slow');
                        });
                        $(".tablesetting").delegate("th .toright", "click", function (e) {
                            var thisth = $(this).closest("th");
                            var nextth = thisth.nextAll(":visible:first");
                            if (thisth.prev().length == 0) {
                                thisth.prepend($("<a class='btn toleft'><i class='glyphicon glyphicon-arrow-left'></i></a>"));
                                nextth.find(".toleft").remove();
                            } else if (nextth.next().length == 0) {
                                nextth.append($("<a class='btn toright'><i class='glyphicon glyphicon-arrow-right'></i></a>"));
                                thisth.find(".toright").remove();
                            }
                            thisth.fadeOut("5000");
                            thisth.before(nextth).fadeIn('slow');
                        });
                        $(".confirm").on("click", function (e) {
                            $("#outputSettingForm").submit();
                        });
                    }
                });
            }

            var clickTree = function (context) {
                var recordTypeLi = context.closest(".jstree-children").closest("[role=treeitem]");
                recordType = recordTypeLi.attr("id");
                recordTypeName = recordTypeLi.attr("title");
                var fondsLi = recordTypeLi.closest(".jstree-children").closest("[role=treeitem]");
                fondsId = fondsLi.attr("id");
                fondsName = fondsLi.attr("title");
                console.log(recordType);
                console.log(recordTypeName);
                console.log(fondsId);
                $("#rtId").val(recordType);
                $("#fondsId").val(fondsId);
                $("#page").val(1);
                $("#size").val(5);
                showSetting();
            }

            $("#jstree").delegate(".defaultStyle", "click", function (e) {
                showDefault();
            });

            $("#jstree").delegate(".volumeinner a", "click", function (e) {
                isVolumeInner = true;
                isVolume = true;
                clickTree($(this));
            });

            $("#jstree").delegate(".volume a", "click", function (e) {
                isVolumeInner = false;
                isVolume = true;
                clickTree($(this));
            });

            $("#jstree").delegate(".piece a", "click", function (e) {
                isVolumeInner = false;
                isVolume = false;
                clickTree($(this))
            });
            //$("#jstree").jstree(true).select_node($(".volume:first").attr("id"));
            //clickTree($(".volume:first a"));
            var defaultNodeId = "defaultStyle";
            $("#jstree").jstree(true).select_node(defaultNodeId);
            showDefault();
            $(".searchbutton").on("click", function (e) {
                e.preventDefault();
                var params = $("#recordSearchForm").serialize();
                console.log(params);

                var treeitem = $(".jstree-clicked").closest("[role=treeitem]");
                var url = "<c:url value="/json/record/manage" />";
                var isVolume = false;
                if (treeitem.hasClass("volume")) {
                    url = "<c:url value="/json/recordvolume/manage" />";
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

            $('.createrecord').on('click', function (e) {
                e.preventDefault();
                var getFondsAndType = function () {
                    $.ajax({
                        type: "GET",
                        url: "<c:url value="/json/recordvolume/getFondsAndType"  />",
                        data: {},
                        success: function (result) {
                            console.log(result);
                            $('#createTypeTemplate').tmpl(result).replaceAll($('#view .modal-content'));
                            $(".modal-dialog").width(800);
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
                                                        }
                                                    }
                                                }
                                            },
                                            typedes: {
                                                maxlength: 16,
                                                required: true
                                            }
                                        },
                                        messages: {
                                            typename: {
                                                required: "必填项！",
                                                remote: "重名！"
                                            },
                                            typedes: {
                                                required: "必填！"
                                            }
                                        },
                                        success: function (label) {
                                            label.text("${validate_message_ok}").addClass("valid");
                                            label.removeClass("error");
                                            label.html("有效");
                                        }
                                    });
                            $(".createTypeButton").on('click', function (e) {
                                if ($('#typeCreateForm').valid()) {
                                    $('#typeCreateForm').submit();
                                }
                            });
                        }
                    });
                }
                getFondsAndType();
                $("#typeCreateForm [name='fonds']").on("change", function (e) {
                    alert("test");
                })
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
