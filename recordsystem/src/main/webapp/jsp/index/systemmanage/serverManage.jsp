<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
		.pralivte{
			position:relative;
		}
		.sendBtn{
			position: absolute;
			margin-top:12px;
		}
		.loadImage{
			    position: absolute;
			    top:40%;
			    left: 40%;
			    display: none;
		}
		.height30{
			height:30px;
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
                             服务器设置
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i>服务器列表</h2>
                            </div>
                             <div class="box-content">
			                  	<ul id="myTab" class="nav nav-tabs">
								   <li id="data" class="active"><a href="#dataTabContent" data-toggle="tab">数据库服务器</a></li>
								   <li id="file"><a  href="#fileTabContent" data-toggle="tab">附件服务器</a></li>
								   <li id="application"><a  href="#applicationTabContent" data-toggle="tab">应用服务器</a></li>
								   <li id="backups" ><a href="#backupsTabContent" data-toggle="tab">备份服务器</a></li>
							   	</ul>
								<div id="TabContent" class="tab-content pralivte">
									<div id="loadImg" class="loadImage"><img alt="loading" src='<c:url value="/resources/images/loading.gif"/>'></div>
								   <div class="tab-pane fade in active tableCreateBtnF" id="dataTabContent">
							  		<div class="height30">
	                                   <%--  <div class="navbar-form navbar-left">
	                                    	<a href='<c:url value="/siteEmail/send"/>' class="btn btn-success"><i class="glyphicon glyphicon-send"></i><span style="margin-left:6px;">发送</span></a>
	                                    </div> --%>
                           			 </div>
				                      <div class="table-content">
					                      <table id="sendEmailList" class="table dataTable stripe table-bordered" Width="100%">
					                      <thead>
					                      <tr>
					                       	<th>编号</th>
					                       	<th>ip地址</th>
					                       	<th>端口号</th>
					                       	<th>用户名</th>
					                       	<th>密码</th>
					                       	<!-- <th>修改时间</th> -->
					                       	<!-- <th>操作</th> -->
					                      </tr>
					                      </thead>
					                      <tbody>
					                      	<c:set var="serverList" value="${server.getPage().items }"></c:set>
												<c:choose>
													<c:when test="${empty serverList }">
														<tr><td class="center" colspan="5">表中暂无数据！</td></tr>
													</c:when>
													<c:otherwise>
														<c:forEach var="server" items="${serverList }" varStatus="k">
															<tr id="${server.id }">
																<td>${k.index+1 }</td>
																<td>${server.ip }</td>
																<td>${server.port }</td>
																<td>${server.serverUsername }</td>
																<td>${server.serverPwd }</td>
																<%-- <td><fmt:formatDate value="${server.editTime }" pattern="yyyy-MM-dd HH:mm" /></td> --%>
																<%-- <td>
																	<a class="viewmail btn btn-primary" title="设置"  href='<c:url value="/server/edit?id=${server.id }"/>'>
											                           <i class="glyphicon glyphicon-edit"></i>
																	</a>
																</td> --%>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
					                      </tbody>
				                      </table>
				                    </div>
				                    <nav class="center">
		                                <ul class="pagination">
		                                <c:set var="page" value="${server.getPage()}"></c:set>
		                                <c:set var="nowPage" value="${page.currentPage() }"></c:set>
		                                	<c:choose>
		                                		<c:when test="${nowPage == page.firstPage() }">
		                                			 <li class="disabled" id="firstPage" name="1"><a href="javascript:void(0);">«</a></li>
		                                		</c:when>
		                                		<c:otherwise>
		                                			 <li id="firstPage" name="1"><a href="javascript:void(0);">«</a></li>
		                                		</c:otherwise>
		                                	</c:choose>
		                                    <c:forEach var="pageList" items="${server.showPages() }" varStatus="k">
		                                    	<c:choose>
		                                    		<c:when test="${nowPage == k.index+1 }">
	                                    				<li class="active"><a href="javascript:void(0)">${nowPage }</a></li>
		                                    		</c:when>
		                                    		<c:otherwise>
		                                    			 <li><a href="javascript:void(0);">${k.index+1 }</a></li>
		                                    		</c:otherwise>
		                                    	</c:choose>
		                                    </c:forEach>
		                                    <c:choose>
		                                    	<c:when test="${nowPage == page.lastPage()}">
		                                    		<li class="disabled" id="lastPage" name="2"><a href="javascript:void(0);"><span>»</span></a></li>
		                                    	</c:when>
		                                    	<c:otherwise>
		                                    		 <li id="lastPage" name="2"><a href="javascript:void(0);">»</a></li>
		                                    	</c:otherwise>
		                                    </c:choose>     
		                                </ul>
		                            </nav>
								   </div>
									<div class="tab-pane fade tableCreateBtnF" id="fileTabContent">
										<div class="height30"></div>
				                      	<div class="table-content">
					                      <table id="sendEmailList" class="table dataTable stripe table-bordered" Width="100%">
					                      <thead>
					                      <tr>
					                       	<th>编号</th>
					                       	<th>ip地址</th>
					                       	<th>端口号</th>
				                       	   	<th>用户名</th>
					                       	<th>密码</th>
					                       	<!-- <th>修改时间</th> -->
					                       	<!-- <th>操作</th> -->
					                      </tr>
					                      </thead>
					                      <tbody></tbody>
				                      </table>
				                    </div>
				                    <nav class="center"></nav>
									</div>
									<div class="tab-pane fade tableCreateBtnF" id="applicationTabContent">
										<div class="height30"></div>
				                      	<div class="table-content">
					                      <table id="sendEmailList" class="table dataTable stripe table-bordered" Width="100%">
						                      <thead>
							                      <tr>
							                       	<th>编号</th>
							                       	<th>ip地址</th>
							                       	<th>端口号</th>
						                          	<th>用户名</th>
							                       	<th>密码</th>
							                       	<!-- <th>修改时间</th> -->
							                       	<!-- <th>操作</th> -->
							                      </tr>
						                      </thead>
					                      		<tbody></tbody>
				                      		</table>
				                   		</div>
				                    <nav class="center"></nav>
									</div>
									<div class="tab-pane fade tableCreateBtnF" id="backupsTabContent">
										<div class="height30"></div>
				                      	<div class="table-content">
					                      <table id="sendEmailList" class="table dataTable stripe table-bordered" Width="100%">
						                      <thead>
							                      <tr>
							                       	<th>编号</th>
							                       	<th>ip地址</th>
							                       	<th>端口号</th>
						                       	   	<th>用户名</th>
							                       	<th>密码</th>
							                       	<!-- <th>修改时间</th> -->
							                       	<!-- <th>操作</th> -->
							                      </tr>
						                      </thead>
					                      		<tbody></tbody>
				                      		</table>
				                   		</div>
				                    <nav class="center"></nav>
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
  <%--    <div class="modal fade" id="view" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4>温馨提示：</h4>
            </div>
            <div class="modal-body">
              恭喜你，信息修改成功！
            </div>
            <div class="modal-footer">
                <a href="#" class="confirm btn btn-primary" data-dismiss="modal"><i
                        class="glyphicon glyphicon-share-alt"></i> <spring:message code="href.confirm" text="Confirm"/></a>
            </div>
        </div>
        </div>
    </div> --%>
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
<script type="text/html" id="dataTemplate">
	<tbody>
	<span>{{= items.length}}</span>
		{{if items.length>0}}
			{{each(i,server) items}}
				<tr id="{{= server.id}}">
					<td>{{= (nowPage-1)*10+i+1}}</td>
					<td>{{= server.ip}}</td>
					<td>{{= server.port}}</td>
					<td>{{= server.serverUsername}}</td>
					<td>{{= server.serverPwd}}</td>
				</tr>
			{{/each}}
			{{else}}
				<tr><td class="center" colspan="5">表中暂无数据！</td></tr>
		{{/if}}
	</tbody>
</script>
<script type="text/html" id="navTemplate">
	  <nav class="center">
		 <ul class="pagination">
			{{if nowPage == firstPage}}
				 <li class="disabled firstPage" name="{{= nowPage-1}}"><a href="javascript:void(0);">«</a></li>
				{{else}}
				 <li class="firstPage" name="{{= nowPage-1}}"><a href="javascript:void(0);">«</a></li>
			{{/if}}
			{{each(i,page) showPages}}
				{{if nowPage == i+1}}
				<li class="active"><a href="javascript:void(0);">{{= page}}</a></li>
				{{else}}
				<li><a href="javascript:void(0);">{{= page}}</a></li>
				{{/if}}
			{{/each}}
			{{if nowPage == lastPage}}
				 <li class="disabled lastPage" name="{{= nowPage+1}}"><a href="javascript:void(0);">»</a></li>
				{{else}}
				 <li class="lastPage" name="{{= nowPage+1}}"><a href="javascript:void(0);">»</a></li>
			{{/if}}
		 </ul>
	</nav>
</script>
<script type="text/javascript">
/* $(document).ready(function () {
	  var setPwdInfo = '${reusltInfo}';
	  if(setPwdInfo != "" && setPwdInfo){
        $("#view").modal('show');
    }
}); */
	function dateToString(date){
		var date1 =new Date(date);
		var year =  date1.getFullYear();
		var month =  date1.getMonth()+1;
		var day = date1.getDate();
		var hour = date1.getHours();
		var minute = date1.getMinutes();
		if(month<=9){
			month="0"+month;
		}
		if(date<=9){
			date="0"+date;
		}
		if(hour<=9){
			hour="0"+hour;
		}
		if(minute<=9){
			minute="0"+minute;
		}
		return year+"-"+month+"-"+day+" "+hour+":"+minute;
	}
	$("#TabContent").delegate("nav ul.pagination li a","click",function(){
		if($(this).parent().hasClass("disabled") || $(this).parent().hasClass("active")){
			return;
		}else{
		$("#loadImg").show();
		var typedata;
		$("#myTab li").each(function(i,el){
			if($(el).hasClass("active")){
				typedata = $(el).attr("id");
				return false;
			}			
		});
		var num = parseInt($(this).text()); 
		var flag = $(this).parent().attr("name");
		if(flag){
			num = parseInt(flag);
		}
		$.post('<c:url value="/json/server/data"/>',{n:num,type:typedata},function(data){
			console.info(data);
			$("#dataTemplate").tmpl(data).replaceAll($("#"+typedata+"TabContent table tbody"));
			$("#navTemplate").tmpl(data).replaceAll($("#"+typedata+"TabContent nav"));
			$("#loadImg").hide();
		},"json");
		}
	});
	 $("#myTab li").on("click",function(){
		 var typedata = $(this).attr("id");
		 var tablebodyChilds = $("#"+typedata+"TabContent table tbody").children();
		if(tablebodyChilds.length == 0){
			$("#loadImg").show();
			$.post('<c:url value="/json/server/data/"/>',{type:typedata},function(data){
					console.info(data);
					$("#dataTemplate").tmpl(data).replaceAll($("#"+typedata+"TabContent table tbody"));
					$("#navTemplate").tmpl(data).replaceAll($("#"+typedata+"TabContent nav"));
					$("#loadImg").hide();
			},"json");
		}else{
			return;
		}
	}); 
</script>
</body>
</html>
