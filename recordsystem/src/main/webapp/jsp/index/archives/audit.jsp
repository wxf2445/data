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
                            	等待审批 
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i>等待审批 </h2>
                            </div>
                            <div class="box-content">
	                            <!--  <div class="navbar-inner">
                                    <div class="navbar-form navbar-left">
                                        <div class="form-group">
                                            <div class="input-group">
                                                   <a class="createApplication btn btn-success" href="javascript:void(0)">
                                                    	新建申请
                                                   </a>
                                            </div>
                                        </div>
                                    </div>
                                </div> -->
                                
<%-- <div class="navbar-inner">
    <form:form modelAttribute="logSearchForm" action="${logSearchForm}" id="logSearchForm">
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
                                placeholder="操作人" path="key"
                                autocomplete="true"/>
				    <span class="input-group-btn">
				        <button type="button" class="btn btn-info" onclick="inToPage(-1)"><i class="glyphicon glyphicon-search"></i>
				        </button>
				    </span>
                </div>
            </div>
        </div>
    </form:form>
    </div> --%>
                                     <c:url value="/json/archives/audit" var="applicationForm"></c:url>
    <form:form modelAttribute="applicationForm" action="${applicationForm }" id="applicationForm">
    <input type="hidden" name="page" value="1">
    <input type="hidden" name="status" value="0">
    </form:form>
                                <c:set var="page" value="${archivesaudits.getPage() }"></c:set>
                                    <div class="col-md-14">
                                        <form:form modelAttribute="dictionaryForm" cssClass="form-horizontal"  >
                                            
                                        </form:form>
                                        <div class="table-content">
                                            <table class="table table-striped table-bordered responsive">
                                                <thead>
                                                <tr>
                                                    <th id="th_applicator">申请人</th>
                                                    <th id="th_detail">档案</th>
                                                    <th id="th_reason">申请理由</th>
                                                    <th id="th_accesspermission">申请的权限</th>
                                                    <th id="th_time">申请时间</th>
                                                    <th id="th_deadline">失效时间</th>
                                                    <th id="th_status">
                                                    	<select name="status" class="form-control statusChange">
                                                    		<option value="0">审核中</option>
                                                    		<option value="1">审核通过</option>
                                                    		<option value="-1">审核被拒绝</option>
                                                    		<option value="-2">已撤销权限</option>
                                                    	</select>
                                                    </th>
                                                    <th id="th_status">操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                	<c:forEach var="archivesaudit" items="${page.items }" varStatus="">
		                                                <tr type="${archivesaudit.type }" recordid="${archivesaudit.recordid }"
				        		recordtypeid="${archivesaudit.recordtypeid }"  archivesAuditId="${archivesaudit.id }">
		                                                    <td id="th_name">${archivesaudit.userName }</td>
		                                                    <td id="th_detail">${archivesaudit.subject }
				        <button type="button" class="btn btn-success checkdetail" title="查看详情">
				        	<i class="glyphicon glyphicon-hand-up"></i>
				        </button>
				        									</td>
		                                                    <td id="th_reason">${archivesaudit.reason }</td>
		                                                    <td id="th_accesspermission" title="accesspermission">${archivesaudit.accesspermission }</td>
		                                                    <td id="th_time">
		                                                    	<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                            value="${archivesaudit.applytime }"/>
                                                                            </td>
		                                                    <td id="th_deadline">
		                                                    	<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                            value="${archivesaudit.deadline }"/>
                                                                            </td>
                                                           <!--  <td>
                        <button type="button" class="btn btn-success checkdetail" title="通过申请" >
				        	通过
				        </button></td> -->					
				        										<c:choose>
					        										<c:when test="${archivesaudit.status==1 }">
				        									<td style="background:#FF9797">
					        											审核通过
				        									</td>
					        										</c:when>
					        										<c:when test="${archivesaudit.status==0 }">
				        									<td>
					        											审核中
				        									</td>
					        										</c:when>
					        										<c:when test="${archivesaudit.status==-1 }">
				        									<td>
					        											审核被拒绝
				        									</td>
					        										</c:when>
					        										<c:otherwise>
				        									<td>
					        											已撤销权限
				        									</td>
					        										</c:otherwise>
				        										</c:choose>
				        									<td>
				        <button type="button" class="btn btn-success passArchives" title="通过审核">
				        	<i class="glyphicon glyphicon-ok"></i>
				        </button>
				        <button type="button" class="btn btn-danger refuseArchives" title="拒绝审核">
				        	<i class="glyphicon glyphicon-remove"></i>
				        </button>
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
                                        <c:forEach var="p" items="${archivesaudits.showPages()}" varStatus="s">
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
    </div><!--/fluid-row-->


    <div class="modal fade" id="view" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>


</div><div class="modal fade " id="checkModal" tabindex="-1" role="dialog" 
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
	            <div class="col-md-9 pull-left fileContent" style="background:#fff;border-radius:5px;border: 1px #ccc solid;">
	            
		            <!-- 标签页开始 -->
		            <div class="col-sm-4  center-block" style="background:#fff">
						<ul id="myTab" class="nav nav-tabs center-block">
						   <li class="active" ><a href="#home" data-toggle="tab">文件信息</a></li>
						   <li><a href="#ios" data-toggle="tab">自定义档案信息</a></li>
						</ul>
					</div>
					<div id="myTabContent" class="tab-content" style="height:94%">
					   <div class="tab-pane fade in active" id="home" style="height:90%">
				         	<select class="form-control choosefile"></select>
			            	<iframe name="openfile" height="100%" width="100%" frameborder="no" scrolling="yes" ></iframe>
					   </div>
					   <div class="tab-pane fade" id="ios" style="overflow:auto;height:98%;width:100%">
						   <table></table>
					   </div>
					</div>
		            <!-- 标签页结束 -->
	                                     
	            </div>
	            <div class="col-md-3 pull-right wordContent"  style="background:#fff;border-radius:5px;border: 1px #ccc solid;"></div>
            </div>
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
                <th id="th_applicator">申请人</th>
                <th id="th_detail">档案</th>
                <th id="th_reason">申请理由</th>
                <th id="th_accesspermission">申请的权限</th>
                <th id="th_time">申请时间</th>
                <th id="th_deadline">失效时间</th>
                <th id="th_status">
                     <select name="status" class="form-control statusChange">
                          <option value="0">审核中</option>
						  {{if nowstatus == 1}}
                          	   <option value="1" selected>审核通过</option>
						  {{else}}
                          	   <option value="1">审核通过</option>
						  {{/if}}
						  {{if nowstatus == -1}}
                          		<option value="-1"  selected>审核被拒绝</option>
						  {{else}}
                          		<option value="-1">审核被拒绝</option>
						  {{/if}}
						  {{if nowstatus == -2}}
                          		<option value="-2" selected>已撤销权限</option>
						  {{else}}
                          		<option value="-2">已撤销权限</option>
						  {{/if}}
                     </select>
                </th>
                <th id="th_status">操作</th>
            </tr>
            </thead>
            <tbody>
            {{if archivesaudits.page.items.length == 0}}
            	<tr>
                	<td style="display:none">无</td>
                	<td colspan="20" class="center">暂无操作</td>
            	</tr>
            {{else}}
            	{{each archivesaudits.page.items}}
            		<tr type="{{= type}}" recordid="{{= recordid}}" recordtypeid="{{= recordtypeid}}" archivesAuditId="{{= id}}">
               			 <td class="th_applicator">{{= userName}}</td>
               			 <td class="th_detail" >{{= subject}}
				        <button type="button" class="btn btn-success checkdetail" title="查看详情">
				        	<i class="glyphicon glyphicon-hand-up"></i>
				        </button>
						</td>
                		 <td class="th_reason" >{{= reason}}</td>
               			 <td class="th_accesspermission" >{{= accesspermission}}</td>
                		 <td class="th_time" >{{= applytime}}</td>
                		 <td class="th_time" >{{= deadline}}</td>
							{{if status==0}}
                		 <td class="th_status">
								审核中
						</td>
							{{else status==1}}
                		 <td class="th_status">
								审核通过
						</td>
							{{else status==-1}}
                		 <td class="th_status">
								审核被拒绝
						</td>
							{{else status==-3}}
                		 <td class="th_status" style="background:#FF9797">
								权限已过期
						</td>
							{{else}}
                		 <td class="th_status" style="background:#FF9797">
								已撤销权限
							{{/if}}
						</td>
				        									<td>
						{{if nowstatus==0}}
				        <button type="button" class="btn btn-success passArchives" title="通过审核">
				        	<i class="glyphicon glyphicon-ok"></i>
				        </button>
				        <button type="button" class="btn btn-danger refuseArchives" title="拒绝">
				        	<i class="glyphicon glyphicon-remove"></i>
				        </button>
						{{/if}}
						{{if nowstatus==1}}
							{{if status!=-2}}
				        		<button type="button" class="btn btn-danger cancelAuthority" title="撤销权限">
				        			<i class="glyphicon glyphicon-arrow-left"></i>
				        		</button>
							{{/if}}
						{{/if}}
				        									</td>
            		</tr>
            	{{/each}}
            {{/if}}
            </tbody>
        </table>
    </div>


</script>

<div class="modal" id="archivesDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="width:800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="head"></h4>
            </div>
            <div class="modal-body">
            	<div class="box-content" id="chooseFailureTime">
	                <form class="form-horizontal" method="post"
	                           role="form">
	                    <div class="form-group">
	                        <label class="col-sm-4 control-label" style="padding:8px 4px"><p>请选择权限失效日期:</p></label>
	
	                        <div class="col-sm-4">
	            				<input data-date-format="yyyy-mm-dd 23:59:59" class="form-control" name="deadline" placeholder="点击输入">
	                        </div>
	                        <label id="email-error" class="col-md-1"></label>
	                    </div>
                    </form>
            		<br> 
            	</div>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary confirm"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">确认</span></strong></a>
                <a class="btn btn-primary cancel"
                   data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">关闭</span></strong></a>
            </div>
        </div>
    </div>
</div>
<style>
.deleteDataName{
color:#f00}
                                .checkModal{
                                	width:90%;
                                	height:700px
                                }
                                .checkModal .fileContent{
                                	height:600px;
                                }
                                .checkModal .wordContent{
                                	height:600px
                                }
</style>

<script>

	$(document).on('click', '.passArchives', function (e) {
		var archivesAuditId = $(this).closest("tr").attr("archivesAuditId");
		$("#archivesDialog .head").html("通过申请");
		var content = 
        	"<div class=\"box-content\" id=\"chooseFailureTime\">"+
		    "    <form class=\"form-horizontal\" method=\"post\""+
		    "               role=\"form\">"+
		    "        <div class=\"form-group\">"+
		    "            <label class=\"col-sm-4 control-label\" style=\"padding:8px 4px\"><p>请选择权限失效日期:</p></label>"+
		    "            <div class=\"col-sm-4\">"+
		    "				<input data-date-format=\"yyyy-mm-dd 23:59:59\" class=\"form-control\" name=\"deadline\" placeholder=\"点击输入\">"+
		    "            </div>"+
		    "            <label id=\"email-error\" class=\"col-md-1\"></label>"+
		    "        </div>"+
		    "    </form>"+
			"	<br> "+
			"</div>";
		$("#archivesDialog .modal-body").html(content);

    	$("#archivesDialog input").datepicker({
            language: 'zh-CN',
            autoclose: true,
            todayHighlight: true
        })
		$("#archivesDialog .modal-body #chooseFailureTime").css("display","");
		$("#archivesDialog .modal-body bb").remove();
		$("#archivesDialog").modal("show");
		$(document).off('click', '#archivesDialog .confirm');
		$(document).on('click', '#archivesDialog .confirm', function (e) {
			var deadline = $("#archivesDialog input[name=deadline]").val();
			if(deadline.replace(' ','')=='')return;
			$("#archivesDialog").modal("hide");
	    	$.ajax({
	            type: "POST",
	            url: "<c:url value="/json/archives/passArchives"  />",
	            data: {id:archivesAuditId,deadline:deadline},
	            success: function (result) {
	            	if(result.status==1){
	                    noty({
	                        text: "已通过申请！",
	                        layout: "top",
	                        type: "success",
	                        timeout: 1000,
	                        onClosed: function () {
	                        	inToPage(-1);
	                        }
	                    });
	            	}else{
	                    noty({
	                        text: "操作失败！",
	                        layout: "top",
	                        type: "failure",
	                        timeout: 1000
	                    });
	            	}

		    		$("#archivesDialog").modal("hide");
	            }
	        });
		});
	});  
	$(document).on('click', '.refuseArchives', function (e) {
		var archivesAuditId =  $(this).closest("tr").attr("archivesAuditId");
		$("#archivesDialog .head").html("拒绝申请");
		$("#archivesDialog .modal-body #chooseFailureTime").css("display","none");
		$("#archivesDialog .modal-body").append("<bb>确认拒绝该申请?</bb>");
		$("#archivesDialog").modal("show");
		$(document).off('click', '#archivesDialog .confirm');
		$(document).on('click', '#archivesDialog .confirm', function (e) {
	    	$.ajax({
	            type: "POST",
	            url: "<c:url value="/json/archives/refuseArchives"  />",
	            data: {id:archivesAuditId},
	            success: function (result) {
	            	if(result.status==1){
	                    noty({
	                        text: "已拒绝申请！",
	                        layout: "top",
	                        type: "success",
	                        timeout: 1000,
	                        onClosed: function () {
	                        	inToPage(-1);
	                        }
	                    });
	            	}else{
	                    noty({
	                        text: "操作失败！",
	                        layout: "top",
	                        type: "failure",
	                        timeout: 1000
	                    });
	            	}
	        		$("#archivesDialog").modal("hide");
	            }
	        });
		});
	});  
	$(document).on('click', '.cancelAuthority', function (e) {
		var archivesAuditId =  $(this).closest("tr").attr("archivesAuditId");
		$("#archivesDialog .head").html("撤销权限");
		$("#archivesDialog .modal-body").html("确认撤销权限？");

		$("#archivesDialog").modal("show");
		$(document).off('click', '#archivesDialog .confirm');
		$(document).on('click', '#archivesDialog .confirm', function (e) {
	    	$.ajax({
	            type: "POST",
	            url: "<c:url value="/json/archives/cancelAuthority"  />",
	            data: {id:archivesAuditId},
	            success: function (result) {
	            	if(result.status==1){
	                    noty({
	                        text: "已撤销权限！",
	                        layout: "top",
	                        type: "success",
	                        timeout: 1000,
	                        onClosed: function () {
	                        	inToPage(-1);
	                        }
	                    });
	            	}else{
	                    noty({
	                        text: "操作失败！",
	                        layout: "top",
	                        type: "failure",
	                        timeout: 1000
	                    });
	            	}

		    		$("#archivesDialog").modal("hide");
	            }
	        });
		});
	});  
	
	
    $(document).ready(function () {
    	$("#datepicker input").datepicker({
            language: 'zh-CN',
            autoclose: true,
            todayHighlight: true
        })
    	$("#archivesDialog input").datepicker({
            language: 'zh-CN',
            autoclose: true,
            todayHighlight: true
        })
    }); 
    function inToPage(pagenum) {
		var status = $("#applicationForm input[name=status]").val();
    	if(pagenum!=-1)
    		$("#applicationForm input[name=page]").val(pagenum);
        $("#applicationForm").ajaxSubmit({
            dataType: "json",
            type: "post",
            success: function (data, s, xhr) {
            	data.nowstatus = status;
            	pagenum = $("#applicationForm input[name=page]").val();
                //console.log(data);
                //console.log(xhr);
                    $.each(data.archivesaudits.page.items,function(index,content){
                    	content.applytime = new Date(content.applytime).Format("yyyy-MM-dd HH:mm:ss");
                    	if(content.deadline!=null)
                    		content.deadline = new Date(content.deadline).Format("yyyy-MM-dd HH:mm:ss");
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
                if(pagenum == data.archivesaudits.page.totalPage)
                	logPage+="<li class=\"disabled\"><a>&raquo;</a></li>";
                else
                	logPage+="<li> <a onclick=\"inToPage("+(pagenum+1)+")\" ><span>&raquo;</span></a></li>";
                    	
               	logPage+="</ul>";
               	$(".logPage").html(logPage);
               	
            }
    	});
    };

    $(document).on('change', '.statusChange', function (e) {
    	var status = $(this).val();
		$("#applicationForm input[name=status]").val(status);
		var pagenum = 1;
		inToPage(pagenum);
   });  
    function getFileName(url){	
     	if(url.split("\\").length>0)
         	url=url.split("/");
        	else
        		url=url.split("\\");//这里要将 \ 转义一下
     	return url[url.length-1];
     }
     function getSuffix(url){	
     	if(url.split("\\").length>0)
         	url=url.split("/");
        	else
        		url=url.split("\\");//这里要将 \ 转义一下
      	var suffix = url[url.length-1].split(".");
        return suffix[suffix.length - 1].toLowerCase();
     }function biggerImage(){
    	var img = $(".fileContent iframe").contents().find("img");
    	var width = img.width();
    	var height = img.height();
    	img.width(width*1.1);
    	img.height(height*1.1);
    }
    function smallerImage(){
    	var img = $(".fileContent iframe").contents().find("img");
    	var width = img.width();
    	var height = img.height();
    	img.width(width*0.9);
    	img.height(height*0.9);
    }

    $(document).on("click", ".printFile", function () {
   	 var path = $(this).attr("path");
    	if (!!window.ActiveXObject || "ActiveXObject" in window) {
    		$("#pdfprintdiv").remove();
    		$("body").append("<div id=\"pdfprintdiv\"></div>");
		    var pdfprintdiv = document.getElementById("pdfprintdiv");
		
		    var p = document.createElement("object");
		    try {
		        p.id = "createPDF";
		        p.classid = "CLSID:CA8A9780-280D-11CF-A24D-444553540000";
		        p.width = 1;
		        p.height = 1;
		        //p.setAttribute("src","<c:url value='/file/openfile'/>?filepath="+path)
			    var param = document.createElement("param");
		        param.name="SRC";
		        param.setAttribute("value","<c:url value='/file/printfile2'/>?filepath="+path);
		        //param.value="<c:url value='/file/downloadfile'/>?filepath="+path; ;
		        //p.src = "<c:url value='/file/openfile'/>?filepath="+path;// 处理中文名称
		        p.appendChild(param);
		        //alert("<c:url value='/file/openfile'/>?filepath="+path)
		        pdfprintdiv.appendChild(p);
		        p.printWithDialog();// 带打印窗口的直接打印
		        //p.printAll();//直接打印
		        //p.print();
		    } catch (e) {
		        // alert(e);
		        alert('提示：请确保已安装Adobe Reader，并开启Adobe加载项！');
		    } 
	    
    	}else{

        	$("#printIframe").remove(); 
        	$("body").append("<iframe style=\"display:none\" id=\"printIframe\" ></iframe>");

           $("#printIframe").load(function(){ 	
           	$("#printIframe")[0].contentWindow.print();
           }); 
       	 $("#printIframe").attr("src", "<c:url value='/file/printfile'/>?filepath="+path);
        	//alert("<iframe style=\"display:none\" id=\"printIframe\" src=\"<c:url value='/file/openfile'/>?filepath="+path+"\"></iframe>"); 
    	}
   });
    var viewfile = false, downloadfile = false, print = false, accessrecord = false;
     $(document).on("click",".checkdetail",function(){
      	var recordid = $(this).closest("tr").attr("recordid");
     	var recordtypeid = $(this).closest("tr").attr("recordtypeid");
     	var type = $(this).closest("tr").attr("type");$.get("<c:url value='/json/record/checkdetail'  />", {recordid:recordid,recordtypeid:recordtypeid,type:type}, function (data, s, xh) {
   		 viewfile = false,downloadfile = false,print = false,accessrecord = false;
			 $.each(data.codes,function(index,content){
				 if(content == 'viewfile'){
					 viewfile = true;
				 }
				 else if(content == 'downloadfile'){
					 downloadfile = true;
				 }
				 else if(content == 'print'){
					 print = true;
				 }
				 else if(content == 'accessrecord'){
					 accessrecord = true;
				 }
			 })
			 if(!accessrecord){
				 noty({
                 text: "暂无权限。<button class=\"putApplication\" recordid=\""+recordid+"\" type=\""+type+"\" recordtypeid=\""+recordType+"\">申请权限</button>",
                 layout: "top",
                 type: "failure",
                 timeout: 1000,
                });
				 return;
			 }
            $("#checkModal .modal-body select.choosefile").html("");
            $("#checkModal .modal-footer").html("");
            if(viewfile){
	    		 	var documents = data.documents;
	    		 	if(documents!=null&&documents!=''){
   	                 for(var i=0;i<documents.length;i++){
   	                     //$("#checkModal .modal-body select.choosefile").append("<option value='<c:url value='/'/>"+documents[i].path+"'>"+getFileName(documents[i].path)+"</option>");
   	                     $("#checkModal .modal-body select.choosefile").append("<option value='"+documents[i].path+"'>"+getFileName(documents[i].path)+"</option>");
   	                 }

                     var file_path = encodeURI(encodeURI(documents[0].path));
                     var suffix = getSuffix(file_path);
                     if ($.inArray(suffix, PdfExtension) != -1 || $.inArray(suffix, OfficeExtension) != -1) {
                         $(".fileContent iframe").attr("src", "<c:url value='/jsp/pdf.jsp'/>?url=" + file_path);
                         $(".fileContent iframe").attr("scrolling", "no");
                         if (downloadfile)
                             $("#checkModal .modal-footer").html(
                                     " <a href=\"<c:url value='/file/downloadfile'/>?filepath=" + file_path + "\" class=\"btn btn-success\">" +
                                     "    		保存至本地" +
                                     " </a>"
                             );
                         if (print) {
                          	if($.inArray(suffix, OfficeExtension) == -1)
                                $("#checkModal .modal-footer").append(
                                        " <a href=\"javascript:void(0)\" class=\"btn btn-success openPicture\">" +
                                        "    		编辑档案该页" +
                                        " </a>"
                                );
                            $("#checkModal .modal-footer").append(
                                    " <a href=\"javascript:void(0)\" class=\"btn btn-success printFile\" path=\""+file_path+"\">" +
                                    "    		打印附件" +
                                    " </a>"
                            );

                            $("#checkModal .modal-footer").append(
                                    " <a href=\"javascript:void(0)\" onclick='biggerImage()' class=\"btn btn-success\">" +
                                    "    		放大" +
                                    " </a>"
                            );
                            $("#checkModal .modal-footer").append(
                                    " <a href=\"javascript:void(0)\" onclick='smallerImage()' class=\"btn btn-success\">" +
                                    "    		缩小" +
                                    " </a>"
                            );
                             $(document).off("click", ".openPicture");
                             $(document).on("click", ".openPicture", function () {
                                 var pagenum = 0;
                                 if (document.getElementById('openfileframe') != null) {
                                     pagenum = document.getElementById('openfileframe').contentWindow.getPage();
                                 }
                                 window.open("<c:url value='/jsp/print.jsp'/>?url=" + file_path + "&pagenum=" + pagenum);
                             });
                         }
                     } else if ($.inArray(suffix, ImgExtension) != -1) {
                         if (downloadfile)
                             $("#checkModal .modal-footer").html(
                                     " <a href=\"<c:url value='/file/downloadfile'/>?filepath=" + file_path + "\" class=\"btn btn-success\">" +
                                     "    		保存至本地" +
                                     " </a>"
                             );
                         $(".fileContent iframe").attr("src", "<c:url value='/jsp/image.jsp'/>");
                         $(".fileContent iframe").load(function(){ 	
                          	 $(".fileContent iframe").contents().find("img").attr("src", "<c:url value='/file/openfile'/>?filepath=" + file_path);
                         }); 
                         $(".fileContent iframe").attr("scrolling", "yes");
                         if (print)
                             $("#checkModal .modal-footer").append(
                                     " <a href=\"<c:url value='/jsp/print.jsp'/>?url=" + file_path + "\" target=\"_blank\"  class=\"btn btn-success\">" +
                                     "    		编辑并打印 " +
                                     " </a>"
                             );
                     } else if ($.inArray(suffix, VideoExtension) != -1) {
                         if (downloadfile)
                             $("#checkModal .modal-footer").html(
                                     " <a href=\"<c:url value='/file/downloadfile'/>?filepath=" + file_path + "\" class=\"btn btn-success\">" +
                                     "    		保存至本地" +
                                     " </a>"
                             );
                         window.showVideo("/" + file_path);
                     }else if($.inArray(suffix, MusicEXtension) != -1){
                         if (downloadfile)
                             $("#checkModal .modal-footer").html(
                                     " <a href=\"<c:url value='/file/downloadfile'/>?filepath=" + file_path + "\" class=\"btn btn-success\">" +
                                     "    		保存至本地" +
                                     " </a>"
                             );
                     	 window.showMusic("/" + file_path);
                     }
	    		 	}else{
	                 	$(".fileContent iframe").attr("src","");
	    		 	}
            }else{
	                 $(".fileContent iframe").attr("src","<c:url value='/jsp/noaccess.jsp'/>");
            }

   		 var information = data.information;
            $("#checkModal .wordContent").html("<br><br>");
            if(information!=null&&information!='')
                for(var i=0;i<information.length;i++){
                	if(information[i].fieldvalue!=null&&information[i].fieldvalue!=""&&information[i].fieldvalue!="null")
                    	$("#checkModal .wordContent").append("<p>"+information[i].name+":<strong>"+information[i].fieldvalue+"</strong></p>");
                    if(information[i].fieldname=='subject'){
                   	 if(information[i].fieldvalue!=null&&information[i].fieldvalue!=""&&information[i].fieldvalue!="null")
                   	 	$("#myModalLabel").html(information[i].fieldvalue);
                   	 else
                    	 	$("#myModalLabel").html("无题名");
                    }
                }

   		var filecontent = data.filecontent;
    		$("#ios").html("<table class='table table-striped'></table>");
    		if(filecontent!=null&&filecontent!=''&&filecontent.length!=0){
    			var tds = filecontent[0];
    			var f_td = "";
    			for(var i=0;i<tds.length;i++)f_td+="<td>"+tds[i].columnname+"</td>";
   				$("#ios table").append("<tr>"+f_td+"<tr>");
            	for(var i=0;i<filecontent.length;i++){
            		var p = "";
            		for(var j=0;j<filecontent[i].length;j++){
            			p+="<td>"+filecontent[i][j].columnvalue+"</td>";
            		}
            		$("#ios table").append("<tr>"+p+"</tr>");
            	}
    		}else{
        		$("#ios").append("<p>暂无内容</p>");
    		}
            
        	$('#checkModal').modal('show');
        });
    });
     $(document).on("change", "#checkModal .modal-body select.choosefile", function () {
    	 var file_path = encodeURI(encodeURI($(this).val()));
 		var suffix = getSuffix($(this).val());
 		$("#checkModal .modal-footer").html("");
      	if($.inArray(suffix, PdfExtension) != -1 || $.inArray(suffix, OfficeExtension) != -1){

             $(".fileContent iframe").attr("src","<c:url value='/jsp/pdf.jsp'/>?url="+file_path);
        		$(".fileContent iframe").attr("scrolling","no");
 			 if(downloadfile){
                	$("#checkModal .modal-footer").html(
 	   				           " <a href=\"<c:url value='/file/downloadfile'/>?filepath="+file_path+"\" class=\"btn btn-success\">"+
 	   				           "    		保存至本地"+
 	   				           " </a>"
 	                 		);
 			 }
 			 if(print){
              	if($.inArray(suffix, OfficeExtension) == -1)
                     $("#checkModal .modal-footer").append(
                             " <a href=\"javascript:void(0)\" class=\"btn btn-success openPicture\">" +
                             "    		编辑档案该页" +
                             " </a>"
                     );
                 $("#checkModal .modal-footer").append(
                         " <a href=\"javascript:void(0)\" class=\"btn btn-success printFile\" path=\""+file_path+"\">" +
                         "    		打印附件" +
                         " </a>"
                 );
            		$(document).off("click",".openPicture");
 				$(document).on("click",".openPicture",function(){
               		var pagenum =  0;
                      if (document.getElementById('openfileframe') != null) {
                      	pagenum = document.getElementById('openfileframe').contentWindow.getPage();
                      } 
                      window.open("<c:url value='/jsp/print.jsp'/>?url="+file_path+"&pagenum="+pagenum);
 				});
 			 }
     	} else if ($.inArray(suffix, ImgExtension) != -1){

            $(".fileContent iframe").attr("src", "<c:url value='/jsp/image.jsp'/>");
            $(".fileContent iframe").load(function(){ 	
             	 $(".fileContent iframe").contents().find("img").attr("src", "<c:url value='/file/openfile'/>?filepath=" + file_path);
            }); 
             $(".fileContent iframe").attr("scrolling","yes");
 			 if(downloadfile){
               	$("#checkModal .modal-footer").html(
 	   				           " <a href=\"<c:url value='/file/downloadfile'/>?filepath="+file_path+"\" class=\"btn btn-success\">"+
 	   				           "    		保存至本地"+
 	   				           " </a>"
 	                 		);
 			 }
 				 if(print){
           		$("#checkModal .modal-footer").append(
 				           " <a href=\"<c:url value='/jsp/print.jsp'/>?url="+file_path+"\" target=\"_blank\"  class=\"btn btn-success\">"+
 				           "    		编辑并打印 "+
 				           " </a>"
              		);
 				 }
 				$("#checkModal .modal-footer").append(
                        " <a href=\"javascript:void(0)\" onclick='biggerImage()' class=\"btn btn-success\">" +
                        "    		放大" +
                        " </a>"
                );
                $("#checkModal .modal-footer").append(
                        " <a href=\"javascript:void(0)\" onclick='smallerImage()' class=\"btn btn-success\">" +
                        "    		缩小" +
                        " </a>"
                );
     	}else if ($.inArray(suffix, VideoExtension) != -1) {
 			 if(downloadfile){
 	               	$("#checkModal .modal-footer").html(
 		   				           " <a href=\"<c:url value='/file/downloadfile'/>?filepath="+file_path+"\" class=\"btn btn-success\">"+
 		   				           "    		保存至本地"+
 		   				           " </a>"
 		                 		);
 				 }
             window.showVideo("/" + $(this).val());
         }else if($.inArray(suffix, MusicEXtension) != -1){
 			 if(downloadfile){
 	               	$("#checkModal .modal-footer").html(
 		   				           " <a href=\"<c:url value='/file/downloadfile'/>?filepath="+file_path+"\" class=\"btn btn-success\">"+
 		   				           "    		保存至本地"+
 		   				           " </a>"
 		                 		);
 				 }
         	 window.showMusic("/" + file_path);
         }
     });

    function showVideo(filePath) {//<strong>温馨提示：您的Flash Player版本过低，请<a href="http://www.CuPlayer.com/">点此进行网页播放器升级</a>！</strong>
    	$("#CuPlayer").remove();$("#wrapper").remove();
        var html = '<div class="video" id="CuPlayer" style="height:100%;width:100%"></div>';
        $(".fileContent iframe").before(html);
        $(".fileContent iframe").hide();
        var so = new SWFObject('<c:url value="/resources/js/cuplayer/CuPlayerMiniV4.swf"/>', "CuPlayerV4", "100%", "100%", "9", "#000000");
        so.addParam("allowfullscreen", "true");
        so.addParam("allowscriptaccess", "always");
        so.addParam("wmode", "opaque");
        so.addParam("quality", "high");
        so.addParam("salign", "lt");
        so.addVariable("CuPlayerSetFile", '<c:url value="/resources/js/cuplayer/CuPlayerSetFile.xml"/>'); //播放器配置文件地址,例SetFile.xml、SetFile.asp、SetFile.php、SetFile.aspx
        //window.open("<c:url value='/file/openfile'/>?filepath="+filePath);
        so.addVariable("CuPlayerFile", "<c:url value='/file/openfile'/>?filepath="+filePath); //视频文件地址
        so.addVariable("CuPlayerImage", '<c:url value="/resources/images/videoStop.jpg"/>');//视频略缩图,本图片文件必须正确
        so.addVariable("CuPlayerWidth", "600"); //视频宽度
        so.addVariable("CuPlayerHeight", "410"); //视频高度
        so.addVariable("CuPlayerAutoPlay", "yes"); //是否自动播放
        so.write("CuPlayer");
    }
    function showMusic(filePath){
    	$("#CuPlayer").remove();$("#wrapper").remove();
    	var html='<div id="wrapper"><audio preload="auto" controls><source src="'+'<c:url value='/file/openfile'/>?filepath='+filePath+'"></audio></div>';
    	$(".fileContent iframe").before(html);
        $(".fileContent iframe").hide();
    	$( '#wrapper audio' ).audioPlayer({
    		strPlay: '暂停',
    		strPause: '播放',
    		strVolume: '声音'
    	}); 
    }
    
    
</script>


</body>
</html>
