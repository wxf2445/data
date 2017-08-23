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
                            <spring:message code="nav.menu.system" text="system"/><spring:message code="nav.menu.manage" text="Manage"/>
                        </li>
                        <li>
                            	站内公告
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i> 站内公告</h2>
                            </div>
                            <div class="box-content">
	                            <div class="navbar-inner">
	                                    <div class="navbar-form navbar-left">
	                                        <div class="form-group">
	                                            <div class="input-group">
	                                                <shiro:hasAnyRoles name="SUPER ADMIN">
	                                                    <a class="createStation btn btn-success" href="javascript:void(0)">
	                                                     	  添加公告
	                                                    </a>
	                                                </shiro:hasAnyRoles>
	                                            </div>
	                                        </div>
	                                    </div>
                                </div> 
                                
                                     <c:url value="/json/station/manage" var="stationForm"></c:url>
<!-- <div class="navbar-inner"> -->
    <form:form modelAttribute="stationForm" action="${stationForm}" id="stationForm">
        <form:input type="hidden" path="page"/>
        <%-- <div class="navbar-form navbar-right" role="search">
            <div class="form-group">
                <div class="input-daterange input-group" id="datepicker">
                    <form:input class="form-control" placeholder="${placeholder_start}" data-provide="datepicker" data-date-format="yyyy-mm-dd"
                                path="starttime"/>
                    <span class="input-group-addon">${placeholder_to}</span>
                    <form:input class="form-control" placeholder="${placeholder_end}" data-provide="datepicker" data-date-format="yyyy-mm-dd"
                                path="endtime"/>
                    <span class="input-group-addon"><i
                            class="glyphicon glyphicon-calendar"></i></span>
                </div>
            </div>
            <div class="form-group">
                <div class="input-group">
                    <form:input class="form-control"
                                placeholder="关键字" path="key"
                                autocomplete="true"/>
				    <span class="input-group-btn">
				        <button type="button" class="btn btn-info" onclick="inToPage(-1)"><i class="glyphicon glyphicon-search"></i>
				        </button>
				    </span>
                </div>
            </div>
        </div> --%>
    </form:form>
<!-- </div> -->
                                <c:set var="page" value="${stations.getPage() }"></c:set>
                                    <div class="col-md-14">
                                        <form:form modelAttribute="dictionaryForm" cssClass="form-horizontal"  >
                                            
                                        </form:form>
                                        <div class="table-content">
                                            <table class="table table-striped table-bordered responsive">
                                                <thead>
                                                <tr>
                                                    <th id="th_name" title="name">发布人</th>
                                                    <th id="th_title" title="title">公告标题</th>
                                                    <th id="th_event" title="event">公告内容</th>
                                                    <th id="th_time" title="time">发布时间</th>
                                                    <th id="th_operation" title="operation">操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                	<c:forEach var="station" items="${page.items }" varStatus="">
		                                                <tr>
		                                                    <td id="th_name" title="name">${station.operator }</td>
		                                                    <td id="th_event" title="event">${station.title }</td>
		                                                    <td id="th_event" title="event">${station.event }</td>
		                                                    <td id="th_time" title="time">
		                                                    	<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                            value="${station.createtime }"/>
                                                                            </td>
                                                            
		                                                    <td id="th_operation" title="operation">
						<a class="btn btn-warning deleteStation" title="删除" id="${station.id }"><i class="glyphicon glyphicon-remove"></i></a>
											</td>
		                                                </tr>
                                                	</c:forEach>
                                                	<c:if test="${page.items.size()==0 }">
		                                                <tr>
		                                                    <td style="display:none">无</td>
		                                                    <td colspan="20" class="center">暂无内容</td>
		                                                </tr>
                                                	</c:if>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                    
                                    <nav class="center logPage">
                                    	<ul class="pagination">
                                        <c:choose>
                                            <c:when test="${page.currentPage() == page.firstPage()}">
                                                <li class="disabled"><a href="#">&laquo;</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li>
                                                    <a href="#" onclick="inToPage(${page.previousPage()})"><span>&laquo;</span></a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach var="p" items="${stations.showPages()}" varStatus="s">
                                            <c:choose>
                                                <c:when test="${p == page.currentPage()}">
                                                    <li class="active"><a href="#">${p}</a></li>
                                                </c:when>
                                                <c:when test="${p == 0}">
                                                    <li><a>...</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <a onclick="inToPage(${p})"><span>${p}</span></a>
                                                        
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${page.currentPage() == page.lastPage()}">
                                                <li class="disabled"><a href="#">&raquo;</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li>
                                                    <a onclick="inToPage(${page.nextPage()})" ><span>&raquo;</span></a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                </nav>
                                </div>
                                
                                
                                
                            </div>
                        </div>
                    </div>
                    <!--/span-->
                    
                <%@include file="../../footer.jsp" %>
               </div><!--/row-->
            </div>
            <!-- content ends -->
        </div><!--/#content.col-md-0-->
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









<script type="text/html" id="FieldTemplate">
    <div class="table-content">
        <table class="table table-striped table-bordered responsive">
            <thead>
            <tr>
                <th id="th_name" title="name">发布人</th>
                <th id="th_title" title="title">公告标题</th>
                <th id="th_event" title="event">公告内容</th>
                <th id="th_time" title="time">发布时间</th>
                <th id="th_operation" title="operation">发布时间</th>
            </tr>
            </thead>
            <tbody>
            {{if stations.page.items.length == 0}}
            	<tr>
                	<td style="display:none">无</td>
                	<td colspan="20" class="center">暂无操作</td>
            	</tr>
            {{else}}
            	{{each stations.page.items}}
            		<tr>
               			 <td class="name">{{= operator}}</td>
               			 <td class="title" >{{= title}}</td>
               			 <td class="event" >{{= event}}</td>
                		 <td class="createtime" >{{= createtime}}</td>
		                                                    <td id="th_operation" title="operation">
						<a class="btn btn-warning deleteStation" title="删除" id="{{= id}}"><i class="glyphicon glyphicon-remove"></i></a>
											</td>
            		</tr>
            	{{/each}}
            {{/if}}
            </tbody>
        </table>
    </div>


</script>


<style>
.deleteDataName{
color:#f00}
</style>
<div class="modal fade" id="addStation" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
             	发布公告
            </h4>
         </div>
         <div class="modal-body">
            <div class="box-content center">
            	<p>请输入公告内容</p>
            	<input id="stationTitle" class="form-control"  placeholder="请输入标题，不超过30个字。"
            		onkeyup="if(this.value.length>30) this.value=this.value.substr(0,30)">
            	<textarea rows="5" class="form-control" cols="120" id="stationContent" placeholder="不超过300个字。"  
            	onkeyup="if(this.value.length>300) this.value=this.value.substr(0,300)"></textarea>
          	</div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary">
               						发布
            </button>
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
         </div>
         </div>
	</div>
</div>
<div class="modal fade" id="deleteStation" tabindex="-1" role="dialog" 
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
            	确认删除该条公告？
          	</div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary">
               						确认
            </button>
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">取消
            </button>
         </div>
         </div>
	</div>
</div>
<script>
 
    $(document).ready(function () {
    	$("#datepicker input").datepicker({
            language: 'zh-CN',
            autoclose: true,
            todayHighlight: true
        })
    }); 
    $(document).on('click', '.createStation', function (e) {
    	$(".modal-dialog").not("#deleteStation").width(1000);
    	$("#addStation").modal("show");
        $(document).on('click', '#addStation .btn-primary', function (e) {
        	var title = $("#stationTitle").val().replace(' ','');
        	var content = $("#stationContent").val().replace(' ','');
        	if(content!=''&&title!='')
	            $.ajax({
	                type: "POST",
	                url: "<c:url value="/json/station/add" />",
	                data: {title:title,content:content},
	                success: function (result) {
	                	if(result.status==1){
	                		var pagenum = $("#stationForm input[name=page]").val();
	                		if(pagenum<=0)pagenum = 1;
	                		inToPage(pagenum);
	                		$("#addStation").modal("hide");
	                	}
	                	else
	                        noty({
	                            text: "删除失败！",
	                            layout: "top",
	                            type: "failure",
	                            timeout: 1000,
	                        });
	                	$(document).off('click','#addStation .btn-primary');
	                }
	            });
        });
    });
    $(document).on('click', '.deleteStation', function (e) {
    	$("#deleteStation").modal("show");
    	var id = $(this).attr("id").replace(' ','');
        $(document).on('click', '#deleteStation .btn-primary', function (e) {
        	if(id!='')
	            $.ajax({
	                type: "POST",
	                url: "<c:url value="/json/station/delete" />",
	                data: {id:id},
	                success: function (result) {
	                	if(result.status==1){
	                		var pagenum = $("#stationForm input[name=page]").val();
	                		if(pagenum<=0)pagenum = 1;
	                		inToPage(pagenum);
	                		$("#deleteStation").modal("hide");
	                	}
	                	else
	                        noty({
	                            text: "删除失败！",
	                            layout: "top",
	                            type: "failure",
	                            timeout: 1000,
	                        });
	                	$(document).off('click','#deleteStation .btn-primary');
	                }
	            });
        });
    });
    
    function inToPage(pagenum) {
    	if(pagenum!=-1)
    		$("#stationForm input[name=page]").val(pagenum);
        $("#stationForm").ajaxSubmit({
            dataType: "json",
            type: "post",
            success: function (data, s, xhr) {
                //console.log(status);
                //console.log(xhr);
                    $.each(data.stations.page.items,function(index,content){
                    	content.createtime = new Date(content.createtime).Format("yyyy-MM-dd HH:mm:ss");
                    });
                $("#FieldTemplate").tmpl(data).replaceAll($(".table-content"));

            	var logPage = "<ul class=\"pagination\">";
            	
            	var page = data.pages;
                if(pagenum == 1)
                	logPage+="<li class=\"disabled\"><a>&laquo;</a></li>";
                else
                	logPage+="<li> <a onclick=\"inToPage("+(pagenum-1)+")\"><span>&laquo;</span></a> </li>";
                    $.each(page,function(index,content){
                    	if(content==pagenum){
                    		logPage+="<li class=\"active\"><a>"+content+"</a></li>";
                    	}else if(content==0){
                    		logPage+="<li><a>...</a></li>";
                    	}else{
                    		logPage+="<li><a onclick=\"inToPage("+content+")\"><span>"+content+"</span></a> </li>";
                    	}
                    });
                if(pagenum == data.stations.page.totalPage)
                	logPage+="<li class=\"disabled\"><a>&raquo;</a></li>";
                else
                	logPage+="<li> <a onclick=\"inToPage("+(pagenum+1)+")\" ><span>&raquo;</span></a></li>";
                    	
               	logPage+="</ul>";
               	$(".logPage").html(logPage);
               	
            }
    	});
    };

</script>


</body>
</html>
