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
<script type="text/html" id="basicRecordField">
    <div class="row">

        <div class="col-md-6">
            <h3>选择档案类型</h3>

		{{if isModal}}
            <div id="jstree">
		{{else}}
            <div id="jstree2">
		{{/if}}
                <!-- in this example the tree is populated from inline HTML -->
                <ul>
                    {{each fondsTrees}}
                    <li class="jstree-open" id="{{= fonds.id}}" title="{{= fonds.name}}">{{= fonds.name}}
                        <ul>
                            {{each recordTypes}}
                            	<li class="jstree-open recordtypetype"  recordtypeid="{{= id}}" data-jstree='{"icon":"glyphicon glyphicon-leaf"}' title="{{= name}}">{{= name}}
                            	</li>
                            {{/each}}
                        </ul>
                    </li>
                    {{/each}}
                </ul>
            </div>
        </div>
        <br><br><br><br>

		{{if isModal}}
        <div>
			<form id="volumeuploadform" name="volumeuploadform" action="<c:url
       				 value="/json/record/uploadexcel"/>" enctype="multipart/form-data" method="post">
            <div class="col-md-4">
				<input class="form-control" placeholder="尚未选择文件" name="volumefileurl" id="volumefileurl" disabled=disabled>
				<br>
					<input type="radio" name="cover"  value="false" checked>
				<font color="#f00">不覆盖</font>相同{{if type=='_volume'}}案卷号记录{{else}}档号的档案{{/if}}
				<br>
					<input type="radio" name="cover" value="true">
				<font color="#f00">覆盖</font>相同{{if type=='_volume'}}案卷号的记录{{else}}档号的档案{{/if}}
			</div>
            <div class="col-md-2"> 
    				<span class="btn btn-info batch-btn">
    					上传文件<input class="form-control" id="volumefile" name="file" type="file" multiple 
							 accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-excel">
						<input type="hidden" name="recordtypeid">
						<input type="hidden" name="type" >
						<input type="hidden" name="errornums" >
						<input type="hidden" name="successnums" >
						<input type="hidden" name="isexcist" >
						<input type="hidden" name="novolumeno" >
						<input type="hidden" name="nogeneraldata" >
    				</span>
			</div>
			</form>
		</div>
		{{else}}
				<form id="volumemodalform" name="volumemodalform" action="<c:url value="/export/exportExcelModal"  />" method="post" >
					<input type="hidden" name="recordtypeid">
					<input type="hidden" name="type" >
				</form>
		{{/if}}

    </div>
	<div id="record_upload_show" style="display:none">

										<span class="upload_progress">正在处理</span>
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-striped" role="progressbar"
                                                 aria-valuenow="0" aria-valuemin="0"
                                                 aria-valuemax="100">0%
                                            </div>
                                        </div></div>
</script>
<body>
<div class="modal" id="commonModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="head"></h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <a class="btn btn-primary confirm"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">确定上传</span></strong></a>
                <a class="btn btn-primary cancel"
                   data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">取消</span></strong></a>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="commonModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="head"></h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <a class="btn btn-primary confirm"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">下载模板</span></strong></a>
                <a class="btn btn-primary cancel"
                   data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">取消</span></strong></a>
            </div>
        </div>
    </div>
</div>
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
                            数据管理
                        </li>
                        <li>
                           批量上传著录信息
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
                                    <blockquote>案卷批量上传著录信息<b></b>
    <span class="btn btn-info batch-btn volumemodal">
   		 获取模板
    </span>
    <span class="btn btn-info batch-btn volumefilebutton">
   		 上传文件
    </span>

                                    </blockquote>
                                    <blockquote>卷内批量上传著录信息<b><strong>(案卷号必须与数据库中对应)</strong></b>
    <span class="btn btn-info batch-btn recordmodal">
   		 获取模板
    </span>
    <span class="btn btn-info batch-btn recordfilebutton">
   		 上传文件
    </span>
                                    </blockquote>

                                    <blockquote>按件批量上传著录信息<b><strong></strong></b>
    <span class="btn btn-info batch-btn piecemodal">
   		 获取模板
    </span>
    <span class="btn btn-info batch-btn piecefilebutton">
   		 上传文件
    </span>
                                    </blockquote>

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
var success_num = -1;
var failure_num = -1;
    $(document).ready(function () {
    	var submit_lock = false;
    	$(".volumefilebutton").on("click", function (e) {
            $.ajax({
                type: "GET",
                url: "<c:url value="/json/recordtype/selectAccessTree"  />",
                data: {},
                success: function (result) {
                    $("#commonModal3 .modal-body").empty();
                    $("#commonModal3 .modal-header .head").text("上传案卷著录信息");
                    result.isModal = true;
                    result.type = "_volume";
                    $("#basicRecordField").tmpl(result).appendTo($("#commonModal3 .modal-body"));
		            $("#jstree").jstree();
		            $("#commonModal3").modal("show");
		            $(document).off('click', '#commonModal3 .confirm');
		            $(document).on('click', '#commonModal3 .confirm', function (e) {
		            	var chosedType = $(".recordtypetype a.jstree-clicked").closest("li");
		            	if(chosedType.length<1){
		                    noty({
		                        text: "请选择档案类型！",
		                        layout: "top",
		                        type: "failure",
		                        timeout: 1000
		                    });
		                    return;
		            	}
		            	if($("#volumefile").val()==''){
		            		$("#volumefileurl").css("border","1px solid #f00");
		                    return;
		            	}
		            		
		           	    var recordtypeid =chosedType.attr("recordtypeid");
		           	 	$("#volumeuploadform input[name=recordtypeid]").val(recordtypeid);
		           	 	$("#volumeuploadform input[name=type]").val("_volume");
		           	 	var form = $("#volumeuploadform");
	                    $(form).attr("action","<c:url value="/json/record/uploadexcel"/>");
	                    if(submit_lock)return;
	                    submit_lock = true;
			           	$(form).ajaxSubmit({
			                 dataType: "json",
			                 type: "post",
			                 success: function (data, s, xhr) {
			                	 submit_lock = false;
			                	 var count = data.count;
		                	 	 if(count == -1){
				                     noty({
				                         text: "信息字段不对应",
				                         layout: "top",
				                         type: "failure",
				                         timeout: 1000
				                     }); 
		                	 	 }else if(count > 0 || count==0){
		                	 		 success_num = count;
		                	 		 failure_num = (data.errornums.length+data.isexcist.length
			                        		 +data.novolumeno.length+data.nogeneraldata.length);
				                     noty({
				                         text: "成功"+count+"条目,失败"+failure_num+"条目",
				                         layout: "top",
				                         type: "success",
				                         timeout: 1000
				                     }); 
				                     if(data.errornums.length+data.isexcist.length+data.novolumeno.length+data.nogeneraldata.length==0)return;
									 $("#volumeuploadform input[name=errornums]").val(data.errornums.join(","));
									 $("#volumeuploadform input[name=successnums]").val(data.successnums.join(","));
									 $("#volumeuploadform input[name=isexcist]").val(data.isexcist.join(","));
									 $("#volumeuploadform input[name=novolumeno]").val(data.novolumeno.join(","));
									 $("#volumeuploadform input[name=nogeneraldata]").val(data.nogeneraldata.join(","));
				                     $(form).attr("action","<c:url value="/export/getErrorExcel"  />");
				                     $(form).submit();
		                    	 }else{
				                     noty({
				                         text: "失败",
				                         layout: "top",
				                         type: "failure",
				                         timeout: 1000
				                     }); 
		                    	}
			                 }
			         	});
			           	uploadRecordCheck();
		           });
                }
            });
        });
    	$(".volumemodal").on("click", function (e) {
            $.ajax({
                type: "GET",
                url: "<c:url value="/json/recordtype/selectAccessTree"  />",
                data: {},
                success: function (result) {
                    $("#commonModal4 .modal-body").empty();
                    $("#commonModal4 .modal-header .head").text("获取案卷著录模板");
                    result.isModal = false;
                    $("#basicRecordField").tmpl(result).appendTo($("#commonModal4 .modal-body"));
		            $("#jstree2").jstree();
		            $("#commonModal4").modal("show");
		            $(document).off('click', '#commonModal4 .confirm');
		            $(document).on('click', '#commonModal4 .confirm', function (e) {
		            	var chosedType = $(".recordtypetype a.jstree-clicked").closest("li");
		            	if(chosedType.length<1){
		                    noty({
		                        text: "请选择档案类型！",
		                        layout: "top",
		                        type: "failure",
		                        timeout: 1000
		                    });
		                    return;
		            	}

		           	    var recordtypeid = chosedType.attr("recordtypeid");
		           	 	$("#volumemodalform input[name=recordtypeid]").val(recordtypeid);
		           	 	$("#volumemodalform input[name=type]").val("_volume");
		           	 	$("#volumemodalform").submit();
		           });
                }
            });
        });
        $(".recordmodal").on("click", function (e) {
            $.ajax({
                type: "GET",
                url: "<c:url value="/json/recordtype/selectAccessTree"  />",
                data: {},
                success: function (result) {
                    $("#commonModal4 .modal-body").empty();
                    $("#commonModal4 .modal-header .head").text("获取卷内著录模板");
                    result.isModal = false;
                    $("#basicRecordField").tmpl(result).appendTo($("#commonModal4 .modal-body"));
		            $("#jstree2").jstree();
		            $("#commonModal4").modal("show");
		            $(document).off('click', '#commonModal4 .confirm');
		            $(document).on('click', '#commonModal4 .confirm', function (e) {
		            	var chosedType = $(".recordtypetype a.jstree-clicked").closest("li");
		            	if(chosedType.length<1){
		                    noty({
		                        text: "请选择档案类型！",
		                        layout: "top",
		                        type: "failure",
		                        timeout: 1000
		                    });
		                    return;
		            	}

		           	    var recordtypeid = chosedType.attr("recordtypeid");
		           	 	$("#volumemodalform input[name=recordtypeid]").val(recordtypeid);
		           	 	$("#volumemodalform input[name=type]").val("_record");
		           	 	$("#volumemodalform").submit();
		           });
                }
            });
        });
        $(".recordfilebutton").on("click", function (e) {
            $.ajax({
                type: "GET",
                url: "<c:url value="/json/recordtype/selectAccessTree"  />",
                data: {},
                success: function (result) {
                    $("#commonModal3 .modal-body").empty();
                    $("#commonModal3 .modal-header .head").text("上传卷内著录信息");
                    result.isModal = true;
                    result.type = "_record";
                    $("#basicRecordField").tmpl(result).appendTo($("#commonModal3 .modal-body"));
		            $("#jstree").jstree();
		            $("#commonModal3").modal("show");
		            $(document).off('click', '#commonModal3 .confirm');
		            $(document).on('click', '#commonModal3 .confirm', function (e) {
		            	var chosedType = $(".recordtypetype a.jstree-clicked").closest("li");
		            	if(chosedType.length<1){
		                    noty({
		                        text: "请选择档案类型！",
		                        layout: "top",
		                        type: "failure",
		                        timeout: 1000
		                    });
		                    return;
		            	}
		            	if($("#volumefile").val()==''){
		            		$("#volumefileurl").css("border","1px solid #f00");
		                    return;
		            	}
		           	    var recordtypeid =chosedType.attr("recordtypeid");
		           	 	$("#volumeuploadform input[name=recordtypeid]").val(recordtypeid);
		           	 	$("#volumeuploadform input[name=type]").val("_record");
		           	 	var form = $("#volumeuploadform");
	                    $(form).attr("action","<c:url value="/json/record/uploadexcel"/>");
	                    if(submit_lock)return;
	                    submit_lock = true;
			           	$(form).ajaxSubmit({
			                 dataType: "json",
			                 type: "post",
			                 success: function (data, s, xhr) {
			                     submit_lock = false;
			                	 var count = data.count;
			                		 
		                	 	 if(count == -1){
				                     noty({
				                         text: "信息字段不对应",
				                         layout: "top",
				                         type: "failure",
				                         timeout: 1000
				                     }); 
		                	 	 }else if(count > 0 || count==0){
		                	 		 success_num = count;
		                	 		 failure_num = (data.errornums.length+data.isexcist.length
			                        		 +data.novolumeno.length+data.nogeneraldata.length);
				                     noty({
				                         text: "成功"+count+"条目,失败"+failure_num+"条目",
				                         layout: "top",
				                         type: "success",
				                         timeout: 1000
				                     }); 
				                     if(data.errornums.length+data.isexcist.length+data.novolumeno.length+data.nogeneraldata.length==0)return;
									 $("#volumeuploadform input[name=errornums]").val(data.errornums.join(","));
									 $("#volumeuploadform input[name=successnums]").val(data.successnums.join(","));
									 $("#volumeuploadform input[name=isexcist]").val(data.isexcist.join(","));
									 $("#volumeuploadform input[name=novolumeno]").val(data.novolumeno.join(","));
									 $("#volumeuploadform input[name=nogeneraldata]").val(data.nogeneraldata.join(","));
				                     $(form).attr("action","<c:url value="/export/getErrorExcel"  />");
				                     $(form).submit();
		                    	 }else{
				                     noty({
				                         text: "失败",
				                         layout: "top",
				                         type: "failure",
				                         timeout: 1000
				                     }); 
		                    	}
			                 }
			         	});
			           	uploadRecordCheck();
		           });
                }
            });
        });
        $(".piecemodal").on("click", function (e) {
            $.ajax({
                type: "GET",
                url: "<c:url value="/json/recordtype/selectAccessTree"  />",
                data: {},
                success: function (result) {
                    $("#commonModal4 .modal-body").empty();
                    $("#commonModal4 .modal-header .head").text("获取按件著录模板");
                    result.isModal = false;
                    $("#basicRecordField").tmpl(result).appendTo($("#commonModal4 .modal-body"));
		            $("#jstree2").jstree();
		            $("#commonModal4").modal("show");
		            $(document).off('click', '#commonModal4 .confirm');
		            $(document).on('click', '#commonModal4 .confirm', function (e) {
		            	var chosedType = $(".recordtypetype a.jstree-clicked").closest("li");
		            	if(chosedType.length<1){
		                    noty({
		                        text: "请选择档案类型！",
		                        layout: "top",
		                        type: "failure",
		                        timeout: 1000
		                    });
		                    return;
		            	}

		           	    var recordtypeid = chosedType.attr("recordtypeid");
		           	 	$("#volumemodalform input[name=recordtypeid]").val(recordtypeid);
		           	 	$("#volumemodalform input[name=type]").val("_piece");
		           	 	$("#volumemodalform").submit();
		           });
                }
            });
        });
        $(".piecefilebutton").on("click", function (e) {
            $.ajax({
                type: "GET",
                url: "<c:url value="/json/recordtype/selectAccessTree"  />",
                data: {},
                success: function (result) {
                    $("#commonModal3 .modal-body").empty();
                    $("#commonModal3 .modal-header .head").text("上传按件著录信息");
                    result.isModal = true;
                    result.type = "_piece";
                    $("#basicRecordField").tmpl(result).appendTo($("#commonModal3 .modal-body"));
		            $("#jstree").jstree();
		            $("#commonModal3").modal("show");
		            $(document).off('click', '#commonModal3 .confirm');
		            $(document).on('click', '#commonModal3 .confirm', function (e) {
		            	var chosedType = $(".recordtypetype a.jstree-clicked").closest("li");
		            	if(chosedType.length<1){
		                    noty({
		                        text: "请选择档案类型！",
		                        layout: "top",
		                        type: "failure",
		                        timeout: 1000
		                    });
		                    return;
		            	}
		            	if($("#volumefile").val()==''){
		            		$("#volumefileurl").css("border","1px solid #f00");
		                    return;
		            	}
		           	    var recordtypeid =chosedType.attr("recordtypeid");
		           	 	$("#volumeuploadform input[name=recordtypeid]").val(recordtypeid);
		           	 	$("#volumeuploadform input[name=type]").val("_piece");
		           	 	var form = $("#volumeuploadform");
	                    $(form).attr("action","<c:url value="/json/record/uploadexcel"/>");
	                    if(submit_lock)return;
	                    submit_lock = true;
			           	$(form).ajaxSubmit({
			                 dataType: "json",
			                 type: "post",
			                 success: function (data, s, xhr) {

		                	 	 if(data.type == -1){
				                     noty({
				                         text: "请确认文件格式",
				                         layout: "top",
				                         type: "failure",
				                         timeout: 1000
				                     }); 
				                     return ;
		                	 	 }
			                     submit_lock = false;
			                	 var count = data.count;
		                	 	 if(count == -1){
				                     noty({
				                         text: "字段信息与该档案类型不对应",
				                         layout: "top",
				                         type: "failure",
				                         timeout: 1000
				                     }); 
				                     $("#record_upload_show").show();
		                	 	 }else if(count > 0 || count==0){
		                	 		 success_num = count;
		                	 		 failure_num = (data.errornums.length+data.isexcist.length
			                        		 +data.novolumeno.length+data.nogeneraldata.length);
				                     noty({
				                         text: "成功"+count+"条目,失败"+failure_num+"条目",
				                         layout: "top",
				                         type: "success",
				                         timeout: 1000
				                     }); 
				                     if(data.errornums.length+data.isexcist.length+data.novolumeno.length+data.nogeneraldata.length==0)return;
									 $("#volumeuploadform input[name=errornums]").val(data.errornums.join(","));
									 $("#volumeuploadform input[name=successnums]").val(data.successnums.join(","));
									 $("#volumeuploadform input[name=isexcist]").val(data.isexcist.join(","));
									 $("#volumeuploadform input[name=novolumeno]").val(data.novolumeno.join(","));
									 $("#volumeuploadform input[name=nogeneraldata]").val(data.nogeneraldata.join(","));
				                     $(form).attr("action","<c:url value="/export/getErrorExcel"  />");
				                     $(form).submit();
		                    	 }else{
				                     noty({
				                         text: "失败",
				                         layout: "top",
				                         type: "failure",
				                         timeout: 1000
				                     }); 
		                    	}
			                 }
			         	});
			           	uploadRecordCheck();
		           });
                }
            });
        });
    });
    String.prototype.endWith=function(str){
    	if(str==null||str==""||this.length==0||str.length>this.length)
    	  return false;
    	if(this.substring(this.length-str.length)==str)
    	  return true;
    	else
    	  return false;
    	return true;
    	}
    $(document).on('change', '#volumefile', function (e) {
    	if($(this).val()!=''){
    		if(!$(this).val().endWith(".xls")&&!$(this).val().endWith(".xlsx")){
                noty({
                    text: "文件格式必须为xls或者slsx",
                    layout: "top",
                    type: "success",
                    timeout: 1000
                });
    		}
            $("#volumefileurl").val(".../"+$(this).val().substring($(this).val().lastIndexOf("\\")+1,$(this).val().length));
    		$("#volumefileurl").css("border","");
    	}
   });

    function checkUpload(){
    	$.ajax({
            type: "POST",
            url: "<c:url value="/json/record/checkuploadrecord"  />",
            success: function (result) {
            	var uploadResult = result.uploadRecordSession;
            	if(uploadResult==null){
            		if(success_num!=-1||failure_num!=-1){
                		$(".upload_progress").html("导入完毕.成功"+success_num+"条，失败："+failure_num+"条");
                    	$('.progress .progress-bar').attr('data-transitiongoal',100).progressbar({display_text: 'fill'});
            		}
            		else
            			setTimeout("checkUpload()", 500 );
                	
            	}else{
                	var number = uploadResult.number;
                	var total = uploadResult.total;
                	var subject = uploadResult.subject;
                	$('.progress .progress-bar').attr('data-transitiongoal', parseInt(number*100/total))
                			.progressbar({display_text: 'fill'});
                	$(".upload_progress").html("正在处理第"+number+"条："+subject+"，共"+total+"条。")
    				if(number!=total)
                    	setTimeout("checkUpload()", 500 );
    				else
    					$('.progress .progress-bar').attr('data-transitiongoal',100).progressbar({display_text: 'fill'});
            	}
            }
        });
    }
    function uploadRecordCheck(){
    	$("#record_upload_show").show();
        $('.progress .progress-bar').progressbar({
            display_text: 'fill'
        });
        $('.progress .progress-bar').attr('data-transitiongoal', 0).progressbar({display_text: 'fill'});
        setTimeout("checkUpload()", 500 );
    }
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
