<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <spring:message code="company" text="Hang Zhou ykhl Technology Co." var="company"/>
    <title><spring:message code="company" text="Hang Zhou ykhl Technology Co."/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="ykhl,iSP">
    <meta name="author" content="ykhl">

    <!-- The fav icon -->
    <link rel="shortcut icon" href='<c:url value="/resources/img/favicon.ico"/>'>
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
	<link href='<c:url value='/resources/css/home/adminindex.css'/>' rel="stylesheet">

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js '></script>
    <![endif]-->
</head>
         
    <%@include file="../../softdog.jsp" %>  
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
                        <span class="glyphicon glyphicon-home"></span>
                            <a href="<c:url value="/admin/index" />"><spring:message code="breadcrumb.home" text="Home"/></a>
                        </li>
                    </ul>
                </div>
                <div class="scroll_bar">
              		<%-- <div class="scrollIcon">
              			<img alt="attention" src='<c:url value="/resources/images/5-150626150929-51.gif"/>'>
           			</div> --%>
           			<div class="scrollBox">
	       				<div class="scrollBox1">
		              		<ul>
		              			<c:forEach var="station" items="${stations }" varStatus="k">
		              				<li title="${station.title }">
		              					
		              					<a href="javascript:void(0)" class="stationDetail" thisid="${station.id }">
		              						&nbsp;&nbsp;&nbsp;&nbsp;
		              						<c:if test="${station.title.length()>18 }">
		              							${fn:substring(station.title ,0,18 )}...
		              						</c:if>
		              						<c:if test="${station.title.length()<=18 }">
		              							${station.title == ''?'无标题':station.title}
		              						</c:if>
		              					</a>
		              					<bb style="float:right;width:400px;"><fmt:formatDate value="${station.createtime }" pattern="yyyy-MM-dd HH:mm" /></bb>
		              				</li>
		              			</c:forEach>
		              		</ul>
	              		</div>
	              		<c:if test="${stations.size()>6 }">
		              		<div class="scrollBox2">
			              		<ul>
			              			<c:forEach var="station" items="${stations }" varStatus="k">
			              				<li title="${station.title }">
			              					<a href="javascript:void(0)" class="stationDetail" thisid="${station.id }">
			              						&nbsp;&nbsp;&nbsp;&nbsp;
			              						<c:if test="${station.title.length()>18 }">
			              							${fn:substring(station.title ,0,18 )}
			              						</c:if>
			              						<c:if test="${station.title.length()<=18 }">
			              							${station.title == ''?'无标题':station.title}
			              						</c:if>
			              					</a>
			              					<bb style="float:right;width:400px"><fmt:formatDate value="${station.createtime }" pattern="yyyy-MM-dd HH:mm" /></bb>
			              				</li>
			              			</c:forEach>
			              		</ul>
		              		</div>
	              		</c:if>
              		</div>
              	</div>
              	<div class="clearfix marginB20"></div>
              	<div class="row marginB20">
              		<div class="col-md-6 col-sm-6 col-xs-12">
          			  <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                             <h2>
                             <i class="glyphicon glyphicon-new-window"></i>
                             <span>提交申请状态更新</span>
                             <c:choose>
                             	<c:when test="${archivesAudits_length ==0}">
                             		 <i class="glyphicon glyphicon-exclamation-sign"></i>
                            		<span class="infonum">${archivesAudits_length }条</span>
                             	</c:when>
                             	<c:otherwise>
                             		 <i class="glyphicon glyphicon-exclamation-sign infoShake"></i>
                            		<span class="infonum">${archivesAudits_length }条</span>
                             	</c:otherwise>
                             </c:choose>
                             </h2>
                        </div>
                         <div class="box-content" style="overflow-x:auto;">
                         	<div class="table-content" style="height:300px">
	                         <table id="archivesAuditsList" class="table dataTable stripe table-bordered" Width="100%">
				                      <thead>
				                      <tr>
				                       	<th>档案</th>
				                       	<th>申请权限</th>
				                       	<th>当前状态</th>
				                       	<th>时间</th>
				                       	<th>操作</th>
				                      </tr>
				                      </thead>
				                      <tbody>
										<c:choose>
											<c:when test="${empty archivesAudits }">
												<tr><td class="center" colspan="5">表中暂无数据！</td></tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="archivesAudit" items="${archivesAudits }" varStatus="k">
													<tr>
														<td>${archivesAudit.subject }</td>
														<td>${archivesAudit.accesspermission }</td>
														<c:choose>
															<c:when test="${archivesAudit.status==1 }">
																<td  style="background:#90EE90">
																		审核通过
																</td>
															</c:when>
															<c:when test="${archivesAudit.status==-1 }">
																<td  style="background:#FF9797">
																		审核被拒绝
																</td>
															</c:when>		
						        							<c:when test="${archivesAudit.status==-2 }">
					        									<td style="background:#FF9797">
						        										已撤销权限
					        									</td>
						        							</c:when>	
						        							<c:when test="${archivesAudit.status==-3 }">
					        									<td style="background:#FF9797">
						        										权限已过期
					        									</td>
						        							</c:when>
						        							<c:when test="${archivesAudit.status==0 }">
					        									<td style="background:#EEE8AA">
						        										提交了申请
					        									</td>
						        							</c:when>	
														</c:choose>
														<td><fmt:formatDate value="${archivesAudit.updatetime }" pattern="yyyy-MM-dd HH:mm" /></td>
														<td>
															<c:choose>
							        							<c:when test="${archivesAudit.status==0 }">
															        <button type="button" class="btn btn-info intoAudit" title="查看" thisid="${archivesAudit.id }">
															        	<i class="glyphicon glyphicon-import"></i>
															        </button>
							        							</c:when>	
							        							<c:otherwise>
							        								<c:if test="${archivesAudit.status==1 }">
																        <button type="button" class="btn btn-success viewRecordDocument" title="详细档案"
																        		recordid="${archivesAudit.recordid }" recordtypeid="${archivesAudit.recordtypeid }"
																        		 recordtype="${archivesAudit.type }">
																        	<i class="glyphicon glyphicon-check"></i>
																        </button>
							        								</c:if>
															        <button type="button" class="btn btn-success changeTORead" title="标为已读" thisid="${archivesAudit.id }">
															        	<i class="glyphicon glyphicon-envelope"></i>
															        </button>
														        </c:otherwise>
															</c:choose>
														</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
										
	                       			</tbody>
	                       		</table>
	                       		</div>
                       		</div>
                       </div>
              		</div>
              		
                <shiro:hasAnyRoles name="SUPER ADMIN">
              		<div class="col-md-6 col-sm-6 col-xs-12">
              			 <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                            <h2>
	                            <i class="	glyphicon glyphicon-open"></i>
	                            <span>借出的未归还档提醒</span>
	                            <c:choose>
                             	<c:when test="${archives_length ==0}">
                             		 <i class="glyphicon glyphicon-exclamation-sign"></i>
                            		<span class="infonum">${archives_length }条</span>
                             	</c:when>
                             	<c:otherwise>
                             		 <i class="glyphicon glyphicon-exclamation-sign infoShake"></i>
                            		<span class="infonum">${archives_length }条</span>
                             	</c:otherwise>
                             </c:choose>
                            </h2>
                        </div>
                         <div class="box-content" style="overflow-x:auto">
                         	<div class="table-content" style="height:300px">
	                         <table id="archivesAuditsList" class="table dataTable stripe table-bordered" Width="100%">
				                      <thead>
				                      <tr>
				                       	<th>档案</th>
				                       	<th>借阅人</th>
				                       	<th>联系方式</th>
				                       	<th>预计归还时间</th>
				                       	<th>操作</th>
				                      </tr>
				                      </thead>
				                      <tbody>
										<c:choose>
											<c:when test="${empty archives }">
												<tr><td class="center" colspan="5">表中暂无数据！</td></tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="archives" items="${archives }" varStatus="k">
													<tr>
														<td>${archives.borrowTitle }</td>
														<td>${archives.borrowPerson }</td>
														<td>${archives.phone }</td>
														<td><fmt:formatDate value="${archives.deadline }" pattern="yyyy-MM-dd HH:mm" /></td>
														<td>
					        <button type="button" class="btn btn-success checkDetail" title="查看详情" thisid="${archives.id }">
					        	<i class="glyphicon glyphicon-folder-open"></i>
					        </button>
														</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
	                       			</tbody>
	                       		</table>
	                       		</div>
                       		</div>
                       </div>
              		</div>
              	</div>
              	</shiro:hasAnyRoles>
              	<div class="row marginB20">
              		<div class="col-md-6 col-sm-6 col-xs-12">
          			  <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                             <h2>
                             	<i class="glyphicon glyphicon-envelope"></i>
                             	<span>新邮件提醒</span>
                             	<c:choose>
                             	<c:when test="${pageObj.getPage().totalCount == 0}">
                             		 <i class="glyphicon glyphicon-exclamation-sign"></i>
                            		<span class="infonum">${pageObj.getPage().totalCount}条</span>
                             	</c:when>
                             	<c:otherwise>
                             		 <i class="glyphicon glyphicon-exclamation-sign infoShake"></i>
                            		<span class="infonum">${pageObj.getPage().totalCount}条</span>
                             	</c:otherwise>
                             </c:choose>
                           	</h2>
                        </div>
                         <div class="box-content">
                         	<div class="table-content" style="height:300px">
                         	 <table id="sendEmailList" class="table dataTable stripe table-bordered" Width="100%">
			                      <thead>
			                      <tr>
			                       	<th>编号</th>
			                       	<th>发送人</th>
			                       	<th>主题</th>
			                       	<th>创建时间</th>
			                      </tr>
			                      </thead>
			                      <tbody>
                       				<c:set var="mailLists" value="${pageObj.getPage().items }"></c:set>
									<c:choose>
										<c:when test="${empty mailLists }">
											<tr><td class="center" colspan="4">表中暂无数据！</td></tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="mailInfo" items="${mailLists }" varStatus="k">
												<tr>
													<td>${k.index+1 }</td>
													<td>${mailInfo.formUser }</td>
													<td><a href='<c:url value="/siteEmail/info?mailid=${mailInfo.mailid }"/>'>${mailInfo.title }</a></td>
													<td><fmt:formatDate value="${mailInfo.createTime }" pattern="yyyy-MM-dd HH:mm" /></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
                       			</tbody>
                       		</table>
                         </div>
                        </div>
                       </div>
              		</div>
              	</div>
                <%@include file="../../footer.jsp" %>
            </div>
            <!-- content ends -->
        </div><!--/#content.col-md-0-->
    </div><!--/fluid-row-->
</div>
</body>
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

<div class="modal" id="sureIsRead" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="width:800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="head"></h4>
            </div>
            <div class="modal-body">
            	确认将该条标为已读？
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary confirm"
                   data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">确定</span></strong></a>
                <a class="btn btn-primary cancel"
                   data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">关闭</span></strong></a>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="stationDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="width:800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="head"></h4>
            </div>
            <div class="modal-body">
            	<center>
            		<div><h2 name="stationTitle"></h2></div>
            	</center>
            	<div class="col-md-4" style="float:right">发布人：<bb name="stationOperator"></bb></div>
            	<br>
            	<br>
            	<div class="well"><bb name="stationEvent"></bb></div>
            	<div class="col-md-4" style="float:right">发布时间：<bb name="stationTime"></bb></div>
            	<br>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary cancel"
                   data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">关闭</span></strong></a>
            </div>
        </div>
    </div>
</div>



<div class="modal" id="checkDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="width:800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="head"></h4>
            </div>
            <div class="well modal-body"> 
            			<table class="center" style="width:100%;" border="2" bordercolor="#000000">
							<tbody>
								<tr>
									<td>借阅单位</td>
									<td colspan="5">
										<bb name="borrowunits"></bb>
									</td>
								</tr>
								<tr>
									<td>借阅日期</td>
									<td class="input-daterange input-group datepicker" style="border:0px solid #000">
										<bb name="borrowtime" ></bb>
									</td>
									<td>借阅人</td>
									<td>
										<bb name="borrowPerson" ></bb>
                           			</td>
									<td>联系电话</td>
									<td>
										<bb name="phone" ></bb>
									</td>
								</tr>
								<tr>
									<td>借阅是由</td>
									<td colspan="5">
										<bb name="reason" ></bb>
                            		</td>
								</tr>
								<tr>
									<td>借阅档案案卷号/档案号</td>
									<td colspan="5">
										<bb name="borrowNo" ></bb>
									</td>
								</tr>
								<tr>
									<td>借阅档案题名</td>
									<td colspan="5">
										<bb name="borrowTitle" ></bb>
                            		</td>
								</tr>
								<tr>
									<td>备注</td>
									<td colspan="5">
										<bb name="description" ></bb>
                           				
									</td>
								</tr>
								<tr>
									<td>预计归还日期</td>
									<td colspan="5" class="datepicker">
										<bb name="deadline" ></bb>
                            			
									</td>
								</tr>
							</tbody>
							</table>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary cancel"
                   data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">关闭</span></strong></a>
            </div>
        </div>
    </div>
</div>    

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
<script type="text/javascript" src="<c:url value='/resources/js/cuplayer/swfobject.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/audioPlayer/js/audioplayer.js'/>"></script>
<script type="text/javascript">
     if($(".scrollBox li").length>=8){
     	var timer=null;
    	var Obj1= $(".scrollBox .scrollBox1");
    	var topValue1 = Obj1.offset().top;
    	var leftvalue;
    	var leftValue1 = Obj1.offset().left;
    	var height = Obj1.height();
    	var Obj2= $(".scrollBox .scrollBox2");
    	var topValue2 = Obj2.offset().top;
    	function scroll(){
    		var value = 0;
    		var value1= Obj1.offset().top;
    		var value2= Obj2.offset().top;
    		if($(".mynavbarbox").is(":hidden")){
    			if(window.innerWidth>400)leftValue =90;
    			else leftValue =50;
    		}
    		else leftValue = leftValue1;
    		if(value1<0){
    			value = value1;
    			if((-value)>=height-topValue1) {
    				Obj1.offset({top:topValue2,left:leftValue});
    			}
    			else{
    				Obj1.offset({top:(value-1),left:leftValue});
    			}
    			Obj2.offset({top:(value2-1),left:leftValue});
    		}
    		else if(value2<0) {
    			value = value2;
    			if((-value)>=height-topValue1) {
    				Obj2.offset({top:topValue2,left:leftValue});
    			}
    			else{
    				Obj2.offset({top:(value-1),left:leftValue});
    			}
    			Obj1.offset({top:(value1-1),left:leftValue});
    		}else{
    			Obj1.offset({top:(value1-1),left:leftValue});
    			Obj2.offset({top:(value2-1),left:leftValue});
    		}
    	}
    	timer = setInterval("scroll()", 100); 
    	$(".scrollBox ul").bind("mouseover",function(){
    		clearInterval(timer);
    	});
    	$(".scrollBox ul").bind("mouseout",function(){
    		timer = setInterval("scroll()", 100); 
    	}); 
    } 

     $(document).on('click', '.intoAudit', function (e) {
    	 window.location.href="<c:url value="/archives/audit"  />";
    }); 
    $(document).on('click', '.changeTORead', function (e) {
    	var id = $(this).attr("thisid");
    	var tr = $(this).closest("tr");
    	$("#sureIsRead").modal("show");
        $(document).off('click', '#sureIsRead .confirm');
        $(document).on('click', '#sureIsRead .confirm', function (e) {
	    	$.ajax({
	            type: "POST",
	            url: "<c:url value="/json/archives/auditisread"  />",
	            data: {id:id},
	            success: function (result) {
	            	if(result.status == 1)
	            		tr.remove();
	            	else
	                    noty({
	                        text: "操作失败！",
	                        layout: "top",
	                        type: "failure",
	                        timeout: 1000
	                    });
	            	$("#sureIsRead").modal("hide");
	            }
	        });
        });
   }); 

    $(document).on('click', '.checkDetail', function (e) {
    	var id = $(this).attr("thisid");
    	$.ajax({
            type: "POST",
            url: "<c:url value="/json/archives/getAArchives"  />",
            data: {id:id},
            success: function (result) {
            	var archives = result.archives;
            		var checkDetail = $("#checkDetail");
            		checkDetail.find("bb[name=borrowunits]").html(archives.borrowunits);
            		checkDetail.find("bb[name=borrowtime]").html(new Date(archives.borrowtime).Format("yyyy-MM-dd HH:mm:ss"));
            		checkDetail.find("bb[name=borrowPerson]").html(archives.borrowPerson);
            		checkDetail.find("bb[name=phone]").html(archives.phone);
            		checkDetail.find("bb[name=reason]").html(archives.reason);
            		checkDetail.find("bb[name=borrowNo]").html(archives.borrowNo);
            		checkDetail.find("bb[name=borrowTitle]").html(archives.borrowTitle);
            		checkDetail.find("bb[name=description]").html(archives.description);
                    var date = new Date(archives.deadline);
                    date = date.Format("yyyy-MM-dd HH:mm:ss");
            		checkDetail.find("bb[name=deadline]").html(date);
                	$("#checkDetail").modal("show");
            }
        }); 
   }); 
    $(document).on('click', '.stationDetail', function (e) {
    	var id = $(this).attr("thisid");
    	$.ajax({
            type: "POST",
            url: "<c:url value="/json/station/getOneStation"  />",
            data: {id:id},
            success: function (result) {
            	var station = result.station;
            		var checkDetail = $("#stationDetail");
            		checkDetail.find("h2[name=stationTitle]").html(station.title);
            		checkDetail.find("bb[name=stationEvent]").html(station.event);
            		checkDetail.find("bb[name=stationOperator]").html(station.operator);
                    var date = new Date(station.createtime);
                    date = date.Format("yyyy-MM-dd HH:mm:ss");
            		checkDetail.find("bb[name=stationTime]").html(date);
                	$("#stationDetail").modal("show");
            }
        }); 
   }); 
    
    $(document).on("click",".viewRecordDocument",function(){
        var recordid = $(this).attr("recordid");
        var recordtypeid = $(this).attr("recordtypeid");
        var type = $(this).attr("recordtype");
        getDetail(recordid,recordtypeid,type);
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
    function getDetail(recordid,recordType,type) {


       	$("#CuPlayer").remove();
      	$("#wrapper").remove();
        $(".fileContent iframe").show();
    	

  		 var viewfile = false,downloadfile = false,print = false,accessrecord = false;
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
            if(viewfile){
	    		 	var documents = data.documents;
	    		 	if(documents!=null&&documents!=''){
	    	            $("#checkModal .modal-body select.choosefile").html("");
	   	                 for(var i=0;i<documents.length;i++){
	   	                     //$("#checkModal .modal-body select.choosefile").append("<option value='<c:url value='/'/>"+documents[i].path+"'>"+getFileName(documents[i].path)+"</option>");
	   	                     $("#checkModal .modal-body select.choosefile").append("<option value='"+documents[i].path+"'>"+getFileName(documents[i].path)+"</option>");
   	                 }

                     var file_path = encodeURI(encodeURI(documents[0].path));
                     var suffix = getSuffix(file_path);
                     $("#checkModal .modal-footer").html("");
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
                         $(".fileContent iframe").attr("src", "<c:url value='/jsp/image.jsp'/>");
                         $(".fileContent iframe").load(function(){ 	
                          	 $(".fileContent iframe").contents().find("img").attr("src", "<c:url value='/file/openfile'/>?filepath=" + file_path);
                         }); 
                         $(".fileContent iframe").attr("scrolling", "yes");
                         if(downloadfile){
                           	$("#checkModal .modal-footer").html(
     	   				           " <a href=\"<c:url value='/file/downloadfile'/>?filepath="+file_path+"\" class=\"btn btn-success\">"+
     	   				           "    		保存至本地"+
     	   				           " </a>"
     	                 		);
     			 }
                         if (print)
                             $("#checkModal .modal-footer").html(
                                     " <a href=\"<c:url value='/jsp/print.jsp'/>?url=" + file_path + "\" target=\"_blank\"  class=\"btn btn-success\">" +
                                     "    		编辑并打印 " +
                                     " </a>"
                             );$("#checkModal .modal-footer").append(
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
                         window.showVideo("/" + file_path);
                         if(downloadfile){
         	               	$("#checkModal .modal-footer").html(
         		   				           " <a href=\"<c:url value='/file/downloadfile'/>?filepath="+file_path+"\" class=\"btn btn-success\">"+
         		   				           "    		保存至本地"+
         		   				           " </a>"
         		                 		);
         				 }
                     }else if($.inArray(suffix, MusicEXtension) != -1){
                     	 window.showMusic("/" + file_path);
                     	 if(downloadfile){
         	               	$("#checkModal .modal-footer").html(
         		   				           " <a href=\"<c:url value='/file/downloadfile'/>?filepath="+file_path+"\" class=\"btn btn-success\">"+
         		   				           "    		保存至本地"+
         		   				           " </a>"
         		                 		);
         				 }
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
    $(document).on("change","#checkModal .modal-body select.choosefile",function(){
    	var file_path = encodeURI(encodeURI($(this).val()));
    	var suffix = getSuffix(file_path);
        $("#checkModal .modal-footer").html("");
     	if($.inArray(suffix, PdfExtension) != -1 || $.inArray(suffix, OfficeExtension) != -1){

            $(".fileContent iframe").attr("src","<c:url value='/jsp/pdf.jsp'/>?url="+file_path);
       		$(".fileContent iframe").attr("scrolling","no");

			 if(downloadfile){
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
			 if(print){
           		$("#checkModal .modal-footer").append(
	   				           " <a href=\"javascript:void()\" class=\"btn btn-success openPicture\">"+
	   				           "    		编辑档案该页"+
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

				 if(print){
          		$("#checkModal .modal-footer").html(
				           " <a href=\"<c:url value='/jsp/print.jsp'/>?url="+file_path+"\" target=\"_blank\"  class=\"btn btn-success\">"+
				           "    		编辑并打印 "+
				           " </a>"
             		);
				 }
                 $(".fileContent iframe").attr("src", "<c:url value='/jsp/image.jsp'/>");
                 $(".fileContent iframe").load(function(){ 	
                  	 $(".fileContent iframe").contents().find("img").attr("src", "<c:url value='/file/openfile'/>?filepath=" + file_path);
                 }); 
           $(".fileContent iframe").attr("scrolling","yes");
    	}else if ($.inArray(suffix, VideoExtension) != -1) {
            window.showVideo("/" + file_path);
        }else if($.inArray(suffix, MusicEXtension) != -1){
        	 window.showMusic("/" + file_path);
        }
    });

    function showVideo(filePath) {
        var html = '<div class="video" id="CuPlayer" style="height:100%;width:100%"><strong>温馨提示：您的Flash Player版本过低，请<a href="http://www.CuPlayer.com/">点此进行网页播放器升级</a>！</strong></div>';
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
</html>
