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
<style>
.modal {
  overflow-y: auto;
}

.modal-open {
  overflow: auto;
}
</style>
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
                            	电子借阅申请 
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i> 电子借阅申请 &nbsp;—— &nbsp;我的申请 </h2>
                            </div>
                            <div class="box-content">
	                             <div class="navbar-inner">
                                    <div class="navbar-form navbar-left">
                                        <div class="form-group">
                                            <div class="input-group">
                                                   <a class="createApplication btn btn-success" href="javascript:void(0)">
                                                    	新建申请
                                                   </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
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
                                     <c:url value="/json/archives/application" var="applicationForm"></c:url>
    <form:form modelAttribute="applicationForm" action="${applicationForm }" id="applicationForm">
    <input type="hidden" name="page" value="1"></form:form>
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
                                                    <th id="th_status">状态</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                	<c:forEach var="archivesaudit" items="${page.items }" varStatus="">
		                                                <tr type="${archivesaudit.type }" recordid="${archivesaudit.recordid }"
				        		recordtypeid="${archivesaudit.recordtypeid }">
		                                                    <td id="th_name">${archivesaudit.userName }</td>
		                                                    <td id="th_detail">${archivesaudit.subject }
				        <button type="button" class="btn btn-success checkdetail" title="查看详情">
				        	<i class="glyphicon glyphicon-hand-up"></i>
				        </button>
				        									</td>
		                                                    <td id="th_reason">${archivesaudit.reason }</td>
		                                                    <td id="th_accesspermission">${archivesaudit.accesspermission }</td>
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
				        									<td style="background:#90EE90">
					        											审核通过
								        <button type="button" class="btn btn-success viewRecordDocument" title="详细档案"
								        		recordid="${archivesaudit.recordid }" recordtypeid="${archivesaudit.recordtypeid }"
								        		 recordtype="${archivesaudit.type }">
								        	<i class="glyphicon glyphicon-check"></i>
								        </button>
				        									</td>
					        										</c:when>
					        										<c:when test="${archivesaudit.status==0 }">
				        									<td  style="background:#EEE8AA">
					        											审核中
				        									</td>
					        										</c:when>
					        										<c:when test="${archivesaudit.status==-1 }">
				        									<td style="background:#FF9797">
					        											审核被拒绝
				        									</td>
					        										</c:when>
					        										<c:when test="${archivesaudit.status==-3 }">
				        									<td style="background:#FF9797">
					        											权限已过期
				        									</td>
					        										</c:when>
					        										<c:otherwise>
				        									<td style="background:#FF9797">
					        											已撤销权限
				        									</td>
					        										</c:otherwise>
				        										</c:choose>
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

<div class="modal" id="commonModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="width:1080px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="head"></h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <a class="btn btn-primary confirm"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">提交申请</span></strong></a>
                <a class="btn btn-primary cancel"
                   data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">取消</span></strong></a>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="archivesDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="width:800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="head"></h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post" role="form">
                    <div class="form-group imformationArea">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary cancel"
                   data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">关闭</span></strong></a>
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
											            	<iframe name="openfile" id="openfileiframe" height="100%" width="100%" frameborder="no" scrolling="no" ></iframe>
													   </div>
													   <div class="tab-pane fade" id="ios"></div>
													</div>
										            <!-- 标签页结束 -->
									                                     
									            </div>
									            <div class="col-md-3 pull-right wordContent"  style="background:#fff;border-radius:5px;border: 1px #ccc solid;"></div>
								            </div>
								         </div>
								         <div class="modal-footer">
								         </div>
								      </div>
									</div>
								</div>
 <style>
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
                <th id="th_status">状态</th>
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
            		<tr type="{{= type}}" recordid="{{= recordid}}"
				        		recordtypeid="{{= recordtypeid}}">
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
                		 <td class="th_status" style="background:#EEE8AA">
								审核中
						</td>
							{{else status==1}}
                		 <td class="th_status"  style="background:#90EE90">
								审核通过
						</td>
							{{else status==-1}}
                		 <td class="th_status"  style="background:#FF9797">
								审核被拒绝
						</td>
							{{else status==-3}}
                		 <td class="th_status"  style="background:#FF9797">
								权限已过期
						</td>
							{{else}}
                		 <td class="th_status"  style="background:#FF9797">
								已撤销权限
							{{/if}}
						</td>
            		</tr>
            	{{/each}}
            {{/if}}
            </tbody>
        </table>
    </div>


</script>
<script type="text/html" id="basicRecordField">
    <div class="row">

        <div class="col-md-4">
            <h3>选择档案类型</h3>

            <div id="jstree" style="min-height:450px">
                <!-- in this example the tree is populated from inline HTML -->
                <ul>
                    {{each fondsTrees}}
                    <li class="jstree-open" id="{{= fonds.id}}" title="{{= fonds.name}}">{{= fonds.name}}
                        <ul>
                            {{each recordTypes}}
                            	<li class="jstree-open "data-jstree='{"icon":"glyphicon glyphicon-leaf"}' title="{{= name}}">{{= name}}
                                 <ul>
                           		 	<li class="jstree-open recordtypetype" data-jstree='{"icon":"glyphicon glyphicon-leaf"}' recordtypeid="{{= id}}" type="_record">
										卷内
                            	 	</li>
                           		 	<li class="jstree-open recordtypetype" data-jstree='{"icon":"glyphicon glyphicon-leaf"}' recordtypeid="{{= id}}" type="_piece">
										按件
                            	 	</li>
                          		 </ul>
                            	</li>
                            {{/each}}
                        </ul>
                    </li>
                    {{/each}}
                </ul>
            </div>
        </div>
        <h3 id="secondTitle"  style="display:none">请先确定要申请权限的档案</h3>
        <div class="well col-md-8 applicationNoDiv" style="display:none">
			<input name="applicationNo" placeholder="请输入档案号或题名" class="form-control applicationNo">
        </div>

    	<div class="well col-md-8 resultArea" style="display:none;">


   		 </div>

    	<div class="well col-md-8 reasonDiv" style="display:none">
			<textarea class="form-control" placeholder="请填写申请理由（可不填）"></textarea>
		</div>
    </div>
</script><script type="text/html" id="information">
    {{each information}}
		{{if fieldvalue != null && fieldvalue !='null' && fieldvalue!=''}}
		<div class="well col-sm-6">{{= name}}：{{= fieldvalue}}</div>
		{{/if}}
	{{/each}}
</script>
<script type="text/html" id="resultField">

	<table class="table table-striped table-bordered table-content" style="word-wrap:break-word;word-break:break-all;">
        <thead>
        <tr>
            <th class="th_radio">选择</th>
            <th class="th_recordno" title="档号">档号</th>
            <th class="th_subject" title="题名" >题名</th>
            <th class="th_description" title="描述">描述</th>
            <th class="th_accesspermission" title="权限">权限</th>
        </tr>
        </thead>
        <tbody>
		{{if records.length==0}}
        <tr>
            <td style="display:none">无</td>
            <td colspan="20" class="center">表中数据为空！</td>
        </tr>
		{{else}}
			{{each records.page.items}}
        		<tr type="{{= type}}" recordid="{{= id}}" recordtypeid="{{= recordtypeid}}" subject="{{= subject}}">
            		<th class="th_radio" title="档号"><input type="checkbox" class="form-control checkradio"></th>
           		 	<td class="th_recordno">{{= recordNo}}</td>
            		<td class="th_subject" width=\"500px\" style="white-space:normal">{{= subject}}<button type="button" class="btn btn-success checkdetail" title="查看详情">
				        	<i class="glyphicon glyphicon-hand-up"></i>
				        </button>
				        </td>
            		<td class="th_description">{{= description}}</td>
            		<td class="th_accesspermission"><div style="display:none">
						<input name="checkbox" type="checkbox" value="40">查看附件
						<input name="checkbox" type="checkbox" value="41">下载附件
						<input name="checkbox" type="checkbox" value="42">打印
						</div>
					</td>
        		</tr>
			{{/each}}
			{{if records.length == 5}}
       		  	<tr class="hasMore">
            		<td colspan="20" class="center">......</td>
        		</tr>
			{{/if}}
		{{/if}}
        </tbody>
    </table>
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
    		$("#applicationForm input[name=page]").val(pagenum);
        $("#applicationForm").ajaxSubmit({
            dataType: "json",
            type: "post",
            success: function (data, s, xhr) {

            	pagenum = $("#applicationForm input[name=page]").val();
                //console.log(status);
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
    var recordtypeid="",type="",key="";
    function searchRecord(page){
		$.ajax({
               type: "POST",
               url: "<c:url value="/json/archives/searchRecord"  />",
               data: {recordtypeid:recordtypeid,type:type,key:key,page:page},
               success: function (result) {
             	  result.type = type;
             	  result.recordtypeid = recordtypeid;
              	  $(".resultArea").html("");
                   $("#resultField").tmpl(result).appendTo($(".resultArea"));
              	  $(".resultArea").show();
              	  
              	  var logPage = "<ul class=\"pagination\" >";
                   var pages = result.records.showPages;
                   if (page == 1)
                       logPage += "<li class=\"disabled\"><a>&laquo;</a></li>";
                   else
                       logPage += "<li> <a onclick=\"searchRecord(" + (page - 1) + ")\"><span>&laquo;</span></a> </li>";
                   //alert(logs.showPages);
                   $.each(pages, function (index, content) {
                       if (content == page) {
                           logPage += "<li class=\"active\"><a>" + content + "</a></li>";
                       } else if (content == 0) {
                           logPage += "<li><a>...</a></li>";
                       } else {
                           logPage += "<li><a onclick=\"searchRecord(" + content + ")\"><span>" + content + "</span></a> </li>";
                       }
                   });
                   if (page == result.records.page.totalPage)
                       logPage += "<li class=\"disabled\"><a>&raquo;</a></li>";
                   else
                       logPage += "<li> <a onclick=\"searchRecord(" + (page + 1) + ")\" ><span>&raquo;</span></a></li>";

                   logPage += "</ul>";
                	  $(".resultArea").append(logPage);
               }
           });
	  }
    $(document).on('click', '.createApplication', function (e) {
         $.ajax({
             type: "GET",
             url: "<c:url value="/json/recordtype/getAllBasicField"  />",
             data: {},
             success: function (result) {
                 $("#commonModal3 .modal-body").empty();
                 $("#commonModal3 .modal-header .head").text("申请权限");
                 $("#basicRecordField").tmpl(result).appendTo($("#commonModal3 .modal-body"));
                 $("#jstree").jstree();
                 $("#commonModal3").modal("show");
                 $(document).off('click', '.recordtypetype');
                 $(document).on('click', '.recordtypetype', function (e) {
                 	  recordtypeid = $(this).attr("recordtypeid");
                 	  type = $(this).attr("type");
                 	  $("#secondTitle").show();
                 	  $(".applicationNoDiv").show();
                 	  $('.applicationNo').val("");
                 	 
                 	  $(".resultArea").hide();
                      $(document).off('keyup', '.applicationNo');
                      $(document).on('keyup', '.applicationNo', function (e) { 
                    	  key = $(this).val();
                    	  searchRecord(1);
                     }); 
                 }); 
             }
         });
    	
    });  
    $(document).on('click', '.checkradio', function (e) {
    	if($(this).is(':checked')){
       		$(".checkradio").parent().parent().hide();
       		$(this).parent().parent().show();
       		$(this).parent().parent().find("div").show();
       		$(".reasonDiv").show();
       		$(".hasMore").hide();
    	}else{
       		$(".checkradio").parent().parent().show();
       		$(this).parent().parent().find("div").hide();
       		$(".reasonDiv").hide();
       		$(".hasMore").hide();
    	}
   }); 
    $(document).on('click', '.checkdetail', function (e) {
    	var record = $(this).closest("tr");
    	var recordtypeid = record.attr("recordtypeid");
    	var recordid = record.attr("recordid");
    	var type = record.attr("type");
    	$.ajax({
            type: "POST",
            url: "<c:url value="/json/archives/getOneArchives"  />",
            data: {recordtypeid:recordtypeid,type:type,recordid:recordid},
            success: function (result) {
            	if(result.error==1){
                    noty({
                        text: "通用字段数据已丢失",
                        layout: "top",
                        type: "failure",
                        timeout: 1000,
                        onClosed: function () {
                        	
                        }
                    });
            	}
            	$("#archivesDetail .imformationArea").empty();
                $("#information").tmpl(result).appendTo($("#archivesDetail .imformationArea"));
            	$("#archivesDetail").modal("show");
            }
        });
   });  

    $(document).on('click', '#commonModal3 .confirm', function (e) {
    	if($("input.checkradio[type=checkbox]:checked").length!=1){
    		$(".choosetable tr:first th:first").css("background","#f00");
    		return;
    	}
    	else
    		$(".choosetable tr:first th:first").css("background","#F5F5F5");
    	var permissionInput = $("input.checkradio[type=checkbox]:checked").parent().parent().find("div input[type=checkbox]:checked");
    	if(permissionInput.length<1){
    		$(".choosetable tr:first th:last").css("background","#f00");
    		return ;
    	}else{
    		$(".choosetable tr:first th:last").css("background","#F5F5F5");
    	}
    	$("#commonModal3").modal("hide");
    	var accesspermission = new Array();
    	for(var i=0;i<permissionInput.length;i++){
    		accesspermission.push(permissionInput.eq(i).val())
    	}
    	var record = $("input.checkradio[type=checkbox]:checked").closest("tr");
    	var recordtypeid = record.attr("recordtypeid");
    	var recordid = record.attr("recordid");
    	var type = record.attr("type");
    	var subject = record.attr("subject");
    	var reason = $(".reasonDiv textarea").val();
    	//alert(recordtypeid+" "+type+" "+recordid+" "+subject+" "+reason+" "+accesspermission);
    	$.ajax({
            type: "POST",
            url: "<c:url value="/json/archives/sendApplication"  />",
            data: {recordtypeid:recordtypeid,type:type,recordid:recordid,subject:subject,reason:reason,accesspermission:accesspermission.join(",")},
            success: function (result) {
            	if(result.status==1){
                    noty({
                        text: "提交申请成功！",
                        layout: "top",
                        type: "success",
                        timeout: 1000,
                        onClosed: function () {
                        	inToPage(-1);
                        }
                    });
            	}else if(result.status==-1){
                    noty({
                        text: "请勿重复提交！",
                        layout: "top",
                        type: "failure",
                        timeout: 1000
                    });
            	}else{
                    noty({
                        text: "提交申请失败！",
                        layout: "top",
                        type: "failure",
                        timeout: 1000
                    });
            	}
            }
        });
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
     }
     function biggerImage(){
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
    $(document).on("click",".viewRecordDocument",function(){
        var recordid = $(this).attr("recordid");
        var recordtypeid = $(this).attr("recordtypeid");
        var type = $(this).attr("recordtype");
        getDetail(recordid,recordtypeid,type);
    });
    

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

var viewfile = false,downloadfile = false,print = false,accessrecord = false;
    function getDetail(recordid,recordType,type) {


       	$("#CuPlayer").remove();
      	$("#wrapper").remove();
        $(".fileContent iframe").show();
    	

   	 $.get("<c:url value='/json/record/checkdetail'  />", {recordid:recordid,recordtypeid:recordType,type:type}, function (data, s, xh) {
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
    }
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
            window.showVideo("/" + file_path);
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
