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
                            <spring:message code="nav.menu.datadictionary" text="data dictionary"/><spring:message
                            	 code="nav.menu.manage" text="manage"/>
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i> 
                            <spring:message code="nav.menu.datadictionary" text="data dictionary"/><spring:message
                            	 code="nav.menu.manage" text="manage"/></h2>
                            </div>
                            <div class="box-content">
	                             <div class="navbar-inner">
	                                    <div class="navbar-form navbar-left">
	                                        <div class="form-group">
	                                            <div class="input-group">
	                                                <shiro:hasAnyRoles name="SUPER ADMIN">
	                                                    <a class="createDeneralData btn btn-success" href="#">
	                                                     	  添加通用字段
	                                                    </a>&nbsp;
	                                                    <a class="deleteDictionary btn btn-danger" href="#">
	                                                     	 删除通用字段
	                                                    </a>
	                                                </shiro:hasAnyRoles>
	                                            </div>
	                                        </div>
	                                    </div>
                                </div> 
                                <div class="row">
                                    <div class="col-md-2">
                                        <div id="jstree">
                                            <!-- in this example the tree is populated from inline HTML -->
                                            <ul>
                                                 <li class="jstree-open generaldata"
                                                     title="通用字段数据">通用字段数据
                                                     <ul>
                                                         <li class="jstree-open"
                                                             id="department"  data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
                                                             title="部门">部门
                                                         </li>
                                                         <li class="jstree-open"
                                                             id="year"  data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
                                                             title="年度">年度
                                                         </li>
                                                         <li class="jstree-open"
                                                             id="deadline"  data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
                                                             title="保管期限">保管期限
                                                         </li>
		                                                <c:forEach var="indextable" items="${indextables }" varStatus="">
	                                                         <li class="jstree-open"
	                                                             id="${indextable.indextable }"  data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
	                                                             title="${indextable.name }">${indextable.name }
	                                                         </li>
		                                                </c:forEach>
                                                     </ul>
                                                 </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-10">
                                        <form:form modelAttribute="dictionaryForm" cssClass="form-horizontal"  >
                                            
                                        </form:form>
                                        <div class="table-content">
                                            <table class="table table-striped table-bordered responsive">
                                                <thead>
                                                <tr>
                                                    <th id="th_name">序号</th>
                                                    <th id="th_length">内容</th>
                                                    <th id="th_operation">操作</th>
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
<script src='<c:url value='/resources/vakata-jstree/dist/jstree.js '/>'></script>

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






<script type="text/html" id="FieldTemplate">
    <div class="table-content">
        <table class="table table-striped table-bordered responsive">
            <thead>
            <tr>
                <th id="th_id">序号</th>
                <th id="th_no">编码</th>
                <th id="th_name">内容</th>
                <th id="th_operation">操作</th>
            </tr>
            </thead>
            <tbody>
            {{if generaldata.length == 0}}
            <tr>
                <td style="display:none">无</td>
                <td colspan="20" class="center">无内容！</td>
            </tr>
            {{else}}
            {{each(i,v) generaldata}}
            <tr general={{= general}}>
                <td class="num">{{= (i+1)}}</td>
                <td class="no" >{{= no}}</td>
                <td class="name" >{{= name}}</td>
                <th class="operation">
						<!-- <a class="btn btn-success sureData" title="确认"><i class="glyphicon glyphicon-ok"></i></a>-->
						<a class="btn btn-warning deleteData" title="删除" id="{{= id}}"><i class="glyphicon glyphicon-remove"></i></a>
				</th>
            </tr>
            {{/each}}
            {{/if}}
            <tr general={{= general}}>
                <td class="num">..</td>
                <td class="no" ><input class="form-control" name="general_no" maxlength="32"></td>
                <td class="name" ><input class="form-control" name="general_name" maxlength="32"></td>
                <th class="operation">
					<a class="btn btn-success addData" title="添加"><i class="glyphicon glyphicon-plus"></i></a>
				</th>
            </tr>
            </tbody>
        </table>
    </div>


</script>

<div class="modal fade" id="deleteDataDiv" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
             	删除
            </h4>
         </div>
         <div class="modal-body">
            <div class="box-content">
            	确定要删除<span class="deleteDataName"></span>?
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
<div class="modal fade" id="sureDataDiv" tabindex="-1" role="dialog" 
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
            	<!-- 注意！添加后<font color="#f00"> 不能删除</font>， -->确定要添加<span class="deleteDataName"></span>?
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
<div class="modal fade" id="deleteDictionary" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
             	确认删除
            </h4>
         </div>
         <div class="modal-body">
            <div class="box-content">
            	注意！删除字段可能导致<font color="#f00"> 数据丢失</font>，确定要删除<span class="deleteFieldName" style="color:#f00"></span>?
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

<script type="text/html" id="createDictionary">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="optitle">创建
                            <spring:message code="nav.menu.datadictionary" text="data dictionary"/><spring:message
                            	 code="nav.menu.manage" text="manage"/></h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <c:url var="createGeneralData" value="/json/generaldata/create"/>
                <form:form modelAttribute="generalDataCreateForm" action="${createGeneralData}" class="form-horizontal" method="post"
                           role="form">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><spring:message code="nav.menu.datadictionary" text="data dictionary"/><spring:message
														 code="model.recordtype.name" text="Name"/></label>
                        <div class="col-sm-4">
                            <input id="name" name="name" class="form-control">
                            <label id="name-error" class="control-label"></label>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="createGeneralData btn btn-primary"><strong><i class="glyphicon glyphicon-share-alt"></i>
                <span class="button1"><spring:message code="href.confirm" text="Confirm"/></span></strong></a>
            <a href="#" class="cancel btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <span class="button2"><spring:message code="href.cancel"
                                                                                                     text="Cancel"/></span></strong></a>
        </div>

        </form>
    </div>
</script>
<style>
.deleteDataName{
color:#f00}
</style>

<script>

    $(document).ready(function () {
        $('#jstree').jstree();
        var showTables = function (url,general) {
            $(".modal-dialog").width(1000);
            $.ajax({
                type: "GET",
                url: url,
                data: {tablename:general},
                success: function (result) {
                	result.general = general;
                    $("#FieldTemplate").tmpl(result).replaceAll($(".table-content"));
                }
            });
        }
        $(document).on('click', '.createGeneralData', function (e) {
        	$('#view #generalDataCreateForm').submit();
        });
        $(document).on('click', '.createDeneralData', function (e) {
            $('#createDictionary').tmpl().replaceAll($('#view .modal-content'));
            $('#view').modal('show');
            $('#view #generalDataCreateForm').validate(
                    {
                        submitHandler: function (form) {
                            $(form).ajaxSubmit({
                                dataType: "json",
                                type: "post",
                                success: function (data, s, xhr) {
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
                        	name: {
                                maxlength: 16,
                                required: true,
                                remote: {
                                    url: '<c:url value="/json/generaldata/checkname"/>',
                                    type: 'post',
                                    dataType: 'json',
                                    data: {
                                    	name: function () {
                                            return $("[name='name']").val();
                                        }
                                    }
                                }
                            }
                        },
                        messages: {
                        	name: {
                                remote: "重名！"
                            }
                        },
                        success: function (label) {
                            label.text("${validate_message_ok}").addClass("valid");
                            label.removeClass("error");
                            label.html("有效");
                        }
                    });
        });

        $("#jstree").delegate(".generaldata li", "click", function (e) {
            var general = $(this).attr("id");
            //alert(recordtypeid+" "+type);
            showTables("<c:url value="/json/generaldata/manage" />",general);
        });
        $(document).on('click', '.addData', function (e) {
        	var input = $(this).parent().parent().find("input[name=general_name]");
        	var no_input = $(this).parent().parent().find("input[name=general_no]");
        	var general = $(this).closest("tr").attr("general");
        	var value = input.val().replace(/\ +/g,"").replace(/[\r\n]/g,"");
        	var no = no_input.val().replace(/\ +/g,"").replace(/[\r\n]/g,"");
        	if(value=='')return false;
        	var names = $(".table tbody tr .name");
        	if(names.length>0){
            	for(var i=0;i<names.length;i++){
            		if(names.html().replace(/\ +/g,"").replace(/[\r\n]/g,"")==value){
                        noty({
                            text: "内容重复，添加失败！",
                            layout: "top",
                            type: "failure",
                            timeout: 1000,
                        });
                        return false;
            		}
            	}
        	}
        	$('#sureDataDiv').modal("show");
        	$("#sureDataDiv .deleteDataName").html(name);
            $(document).on('click', '#sureDataDiv .btn-primary', function (e) {
	            $.ajax({
	                type: "POST",
	                url: "<c:url value="/json/generaldata/add" />",
	                data: {tablename:general,name:value,no:no},
	                success: function (result) {
	                	result.general = general;
	                    //$("#FieldTemplate").tmpl(result).replaceAll($(".table-content"));
	                    $("#FieldTemplate").tmpl(result).replaceAll($(".table-content"));
	                    $('#sureDataDiv').modal("hide");
	                    
	                }
	            });
	            $(document).off('click', '#sureDataDiv .btn-primary');
            });
        });
/*         $(document).on('click', '.sureData', function (e) {
        	var id = $(this).parent().parent().find("td.id").html();
        	var name = $(this).parent().parent().find("td.name").html();
        	var general = $(this).closest("tr").attr("general");
        	$('#sureDataDiv').modal("show");
        	$("#sureDataDiv .deleteDataName").html(name);
            $(document).on('click', '#sureDataDiv .btn-primary', function (e) {
            	id = id.replace(/\ +/g,"").replace(/[\r\n]/g,"");
	        	if(id!='')
		            $.ajax({
		                type: "POST",
		                url: "<c:url value="/json/generaldata/sure" />",
		                data: {tablename:general,id:id},
		                success: function (result) {
		                	result.general = general;
		                    $("#FieldTemplate").tmpl(result).replaceAll($(".table-content"));
		                    $('#sureDataDiv').modal("hide");
		                }
		            });
            });
        }); */

        $(document).on('click', '.deleteData', function (e) {
        	var id = $(this).attr("id");
        	var name = $(this).parent().parent().find("td.name").html();
        	var general = $(this).closest("tr").attr("general");
        	$('#deleteDataDiv').modal("show");
        	$("#deleteDataDiv .deleteDataName").html(name);
            $(document).on('click', '#deleteDataDiv .btn-primary', function (e) {
            	id = id.replace(/\ +/g,"").replace(/[\r\n]/g,"");
	        	if(id!='')
		            $.ajax({
		                type: "POST",
		                url: "<c:url value="/json/generaldata/delete" />",
		                data: {tablename:general,id:id},
		                success: function (result) {
		                	result.general = general;
		                    $("#FieldTemplate").tmpl(result).replaceAll($(".table-content"));
		                    $('#deleteDataDiv').modal("hide");
		                }
		            });
	        	$(document).off('click', '#deleteDataDiv .btn-primary');
            });
        });

        $(document).on('click', '.deleteDictionary', function (e) {
        	var deleteDictionary = $(".generaldata a.jstree-clicked").closest("li[aria-level=2]");
        	//alert(deleteDictionary.length);
        	if(deleteDictionary.length==0) return ;
        	$("#deleteDictionary").modal("show");
        	$("#deleteDictionary .deleteFieldName").html(deleteDictionary.attr("title"));
			var id = deleteDictionary.attr("id");
            $(document).on('click', '#deleteDictionary .btn-primary', function (e) {
            	id = id.replace(/\ +/g,"").replace(/[\r\n]/g,"");
	        	if(id!='')
		            $.ajax({
		                type: "POST",
		                url: "<c:url value="/json/generaldata/deleteDictionary" />",
		                data: {indextable:id},
		                success: function (result) {
		                	if(result.status==1)
                                window.location.reload();
		                	else
		                        noty({
		                            text: "删除失败！",
		                            layout: "top",
		                            type: "failure",
		                            timeout: 1000,
		                        });
		                	$(document).off('click','#deleteDictionary .btn-primary');
		                }
		            });
            });
        });
        
    });

</script>


</body>
</html>
