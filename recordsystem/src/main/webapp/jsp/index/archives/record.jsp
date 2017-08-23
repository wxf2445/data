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
                            	档案借阅
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i> 借阅登记</h2>
                            </div>
                            <div class="box-content">
                                
                                     <c:url value="/json/archives/record" var="archivesSearchForm"></c:url>
<div class="navbar-inner">
    <form:form modelAttribute="archivesSearchForm" action="${archivesSearchForm}" id="archivesSearchForm">
        <form:input type="hidden" path="page"/>
        <div class="navbar-form navbar-right" role="search">
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
                                placeholder="案卷号/档案号" path="key"
                                autocomplete="true"/>
				    <span class="input-group-btn">
				        <button type="button" class="btn btn-info" onclick="inToPage(-1)"><i class="glyphicon glyphicon-search"></i>
				        </button>
				    </span>
                </div>
            </div>
        </div>
    </form:form>
    </div>
                                <c:set var="page" value="${archives.getPage() }"></c:set>
                                    <div class="col-md-14">
                                        <form:form modelAttribute="dictionaryForm" cssClass="form-horizontal"  >
                                            
                                        </form:form>
                                        <div class="table-content">
                                            <table class="table table-striped table-bordered responsive">
                                                <thead>
                                                <tr>
                                                    <th id="th_borrowNo">案卷号/档案号</th>
                                                    <th id="th_borrowunits">借阅单位</th>
                                                    <th id="th_borrowPerson">借阅人</th>
                                                    <th id="th_title">借阅标题</th>
                                                    <th id="th_borrowtime">借阅时间</th>
                                                    <th id="th_returnPerson">归还人</th>
                                                    <th id="th_operation">事件</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                	<c:forEach var="archive" items="${page.items }" varStatus="">
		                                                <tr>
		                                                    <td id="th_borrowNo">${archive.borrowNo }</td>
		                                                    <td id="th_borrowunits">${archive.borrowunits }</td>
		                                                    <td id="th_operation">${archive.borrowPerson }</td>
                                                    		<th id="th_title">${archive.borrowTitle }</th>
		                                                    <td id="th_borrowtime">
		                                                    	<fmt:formatDate pattern="yyyy-MM-dd"
                                                                            value="${archive.borrowtime }"/>
                                                                            </td>
		                                                    <td id="th_deadline">${archive.returnPerson }
                                                                            </td>
                                                                            
                                                            <td>
                                                            	<c:choose>
                                                            		<c:when test="${archive.status==0 }">
                                                            			借阅
                                                            		</c:when>
                                                            		<c:otherwise>
                                                            			归还
                                                            		</c:otherwise>
                                                           		</c:choose>
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
                                                <li class="disabled"><a href="javascript:void(0)">&laquo;</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li>
                                                    <a href="javascript:void(0)" onclick="inToPage(${page.previousPage()})"><span>&laquo;</span></a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach var="p" items="${archives.showPages()}" varStatus="s">
                                            <c:choose>
                                                <c:when test="${p == page.currentPage()}">
                                                    <li class="active"><a href="javascript:void(0)">${p}</a></li>
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
                                                <li class="disabled"><a href="javascript:void(0)">&raquo;</a></li>
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









<script type="text/html" id="FieldTemplate">
    <div class="table-content">
        <table class="table table-striped table-bordered responsive">
            <thead>
            <tr>
                 <th id="th_borrowNo">案卷号/档案号</th>
                 <th id="th_borrowunits">借阅单位</th>
                 <th id="th_borrowPerson">借阅人</th>
                 <th id="th_title">借阅标题</th>
                 <th id="th_borrowtime">借阅时间</th>
                 <th id="th_returnPerson">归还人</th>
                 <th id="th_operation">事件</th>
            </tr>
            </thead>
            <tbody>
            {{if archives.page.items.length == 0}}
            	<tr>
                	<td style="display:none">无</td>
                	<td colspan="20" class="center">暂无操作</td>
            	</tr>
            {{else}}
            	{{each archives.page.items}}
            		<tr>
               			 <td class="th_borrowNo">{{= borrowNo}}</td>
               			 <td class="th_borrowunits">{{= borrowunits}}</td>
               			 <td class="th_borrowPerson">{{= borrowPerson}}</td>
               			 <td class="th_title">{{= borrowTitle}}</td>
               			 <td class="th_borrowtime" >{{= borrowtime}}</td>
                		 <td class="th_returnPerson" >{{= returnPerson}}</td>
                         <td>{{if status==0}}
								借阅
							{{else}}
								归还
							{{/if}}
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

<script>
 
    $(document).ready(function () {
    	$("#datepicker input").datepicker({
            language: 'zh-CN',
            autoclose: true,
            todayHighlight: true
        })
    }); 
    function inToPage(pagenum) {
    	if(pagenum!=-1)
    		$("#archivesSearchForm input[name=page]").val(pagenum);
        $("#archivesSearchForm").ajaxSubmit({
            dataType: "json",
            type: "post",
            success: function (data, s, xhr) {
            	pagenum = $("#archivesSearchForm input[name=page]").val();
                //console.log(status);
                //console.log(xhr);
                    $.each(data.archives.page.items,function(index,content){
                    	content.borrowtime = new Date(content.borrowtime).Format("yyyy-MM-dd");
                    	content.deadline = new Date(content.deadline).Format("yyyy-MM-dd");
                    });
                $("#FieldTemplate").tmpl(data).replaceAll($(".table-content"));

            	var logPage = "<ul class=\"pagination\">";
            	
            	var page = data.pages;
                if(pagenum == 1)
                	logPage+="<li class=\"disabled\"><a>&laquo;</a></li>";
                else
                	logPage+="<li> <a onclick=\"inToPage("+(pagenum-1)+")\"><span>&laquo;</span></a> </li>";
                	//alert(logs.showPages);
                    $.each(page,function(index,content){
                    	if(content==pagenum){
                    		logPage+="<li class=\"active\"><a>"+content+"</a></li>";
                    	}else if(content==0){
                    		logPage+="<li><a>...</a></li>";
                    	}else{
                    		logPage+="<li><a onclick=\"inToPage("+content+")\"><span>"+content+"</span></a> </li>";
                    	}
                    });
                if(pagenum == data.archives.page.totalPage)
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
