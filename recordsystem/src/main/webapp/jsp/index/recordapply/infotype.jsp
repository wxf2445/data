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

    <link rel="stylesheet" type="text/css" href='<c:url value="/resources/audioPlayer/css/audioplayer.css"/>'>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js '></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href='<c:url value='/resources/img/favicon.ico '/>'>
</head>

<style>
.modal {
  overflow-y: auto;
}

.modal-open {
  overflow: auto;
}
</style>
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
                            <spring:message code="nav.menu.record" text="record"/><spring:message code="nav.menu.archive" text="archive"/>
                        </li>
                        <li>
                            <spring:message code="nav.menu.info" text="info"/><spring:message code="nav.menu.type" text="type"/><spring:message code="nav.menu.manage" text="Manage"/>
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i> 
                                <spring:message code="nav.menu.info" text="info"/><spring:message code="nav.menu.type" text="type"/><spring:message code="nav.menu.manage" text="Manage"/></h2>
                            </div>
                            <div class="box-content">
                                <%--   <c:if test="${userpages eq null}">
                                    <div class="row center">
                                        <div class="col-md-1 col-md-offset-2">
                                      <img src="<c:url value="/resources/img/happy_72.png"/>" />

                                     </div>
                                     <div class="col-md-5 congratuation">
                                      <span>您尚未添加设备！</span>
                                     </div>
                                    </div>
                                </c:if> --%>
                                <%-- <c:if test="${userpages ne null}"> --%>
                                <div class="navbar-inner">
                                    <div class="navbar-form navbar-left">
                                        <div class="form-group">
                                                <select class="form-control" style="width:200px">
                                                	<c:forEach var="fond" items="${fonds }" varStatus="">
                                                		<c:if test="${fond.id==fondsid }">
	                                                		<option value="${fond.id }" selected="selected">${fond.name }</option>
                                                		</c:if>
                                                		<c:if test="${fond.id!=fondsid }">
	                                                		<option value="${fond.id }">${fond.name }</option>
                                                		</c:if>
                                                	</c:forEach>
                                               	</select>
	                                            <select class="form-control"  style="width:200px">
                                                	<!-- <option>1form-form-form-form-</option>
                                                	<option>2</option> -->
                                               	</select>
	                                            <select class="form-control"  style="width:200px">
                                                	<option value="_record">案卷</option>
                                                	<option value="_piece">按件</option>
                                               	</select>
	                                            <select class="form-control"  style="width:200px">
                                                	<option value="0">审核中</option>
                                                	<option value="1">审核通过</option>
                                                	<option value="2">审核未通过</option>
                                               	</select>
                                        </div>
                                    </div>
                                    
<script type="text/javascript">
getRecordType($(".navbar-inner .navbar-left select:first").val());
//alert('${type}');
//alert('${recordtypeid }')
if('${type}'!=null&&'${type}'!=''){
	var type = "";
   	 if('_record'=='${type}'){
   		  type+="<option value='_record'  selected='selected'>案卷</option>"+
   		  		"<option value='_piece' >按件</option>";
   	 }else{
  		  type+="<option value='_record' >案卷</option>"+
   		  		"<option value='_piece'  selected='selected'>按件</option>";
   	 }
     $(".navbar-inner .navbar-left select:nth-child(3)").html(type);
}
function getRecordType(value){
	 $.get("<c:url value='/recordapply/recordType' />", {
		 fondsid: value,
		 recordtypeid:'${recordtypeid }'
     }, function (result) {
         var recordType = result.recordtypes;
         var recordTypeOption ="";
         if(recordType!=null&&recordType!=""){
             for(var i=0;i<recordType.length;i++){
            	 if(recordType[i].id=='${recordtypeid}'){
                   	recordTypeOption+="<option value="+recordType[i].id+"  selected='selected'>"+recordType[i].name+"</option>";
            	 }else{
                   	recordTypeOption+="<option value="+recordType[i].id+" >"+recordType[i].name+"</option>";
            	 }
             }
              $(".navbar-inner .navbar-left select:nth-child(2)").html(recordTypeOption);
         }else{
        	 $(".navbar-inner .navbar-left select:nth-child(3)").val("");
        	 $(".navbar-inner .navbar-left select:nth-child(3)").html("");
         }
     });
	 var checkstatus = '${checkstatus}';
	 if(checkstatus=='')checkstatus = 0;
	 //alert(checkstatus);
	 $(".navbar-inner .navbar-left select option[value='"+checkstatus+"']").attr("selected","selected");
}
$(document).on("change",".navbar-inner .navbar-left select:first",function(){
	getRecordType($(this).val());
	window.location.href="<c:url value='/recordapply/infotype' />?fondsid="+$(this).val()+"&type="+$(this).next().next().val();

   // showTables("<c:url value='/recordapply/infotype' />?fondsid="+$(this).val()+"&recordtypeid=${recordtypeid }&type="+$(this).next().next().val(), true);
});
$(document).on("change",".navbar-inner .navbar-left select:nth-child(2)",function(){
	 window.location.href="<c:url value='/recordapply/infotype' />?fondsid="+
			$(this).prev().val()+"&recordtypeid="+$(this).val()+"&type="+$(this).next().val(); 

});
$(document).on("change",".navbar-inner .navbar-left select:nth-child(3)",function(){
	 window.location.href="<c:url value='/recordapply/infotype' />?fondsid="+
			$(this).prev().prev().val()+"&recordtypeid="+$(this).prev().val()+"&type="+$(this).val(); 

});
$(document).on("change",".navbar-inner .navbar-left select:nth-child(4)",function(){
	 window.location.href="<c:url value='/recordapply/infotype' />?fondsid="+
			$(this).prev().prev().prev().val()+"&recordtypeid="+$(this).prev().prev().val()+"&type="+$(this).prev().val()+"&checkstatus="+$(this).val(); 

});
</script>
                                    <c:url value="/recordapply/infotype" var="searchActoin">
                                    </c:url>
                                    <form:form modelAttribute="searchForm"
                                               action="${searchActoin}?fondsid=${fondsid }&recordtypeid=${recordtypeid }&n=true">
                                        <form:hidden path="orderByClause"/>
                                        <spring:message code="placeholder.start" text="Start" var="placeholder_start"/>
                                        <spring:message code="placeholder.to" text="To" var="placeholder_to"/>
                                        <spring:message code="placeholder.end" text="End" var="placeholder_end"/>
                                        <spring:message code="placeholder.keyword.name" text="Keyword"
                                                        var="placeholder_keyword_name"/>
                                        <spring:message code="placeholder.search" text="Search"
                                                        var="placeholder_search"/>
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
                                                    <spring:message code="model.user.name" text="Search"
                                                                    var="placeholder_search"/>
                                                    <form:input class="form-control"
                                                                placeholder="${placeholder_search}" path="key"
                                                                autocomplete="true"/>
						                            <span class="input-group-btn">
						                              <button type="submit" class="btn btn-info"><i class="glyphicon glyphicon-search"></i>
						                              </button>
						                            </span>
                                                </div>
                                            </div>
                                        </div> --%>
                                    </form:form>
                                </div>
                                <c:set var="page" value="${records.getPage() }"></c:set>
                               
                                <div class="table-content">
                                    <table class="table table-striped table-bordered responsive">
                                        <thead>
	                                        <tr>
	                                        	<th>申请人</th>
	                                        	<th>申请内容</th>
	                                        	<th>申请时间</th>
	                                        	<th>操作</th>
	                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty page.items }">
                                                <tr>
                                                    <td style="display:none">无</td>
                                                    <td colspan="20" class="center">表中数据为空！</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="record" items="${page.items }" varStatus="">
                                                    <tr>
                                                        <td>${record.operator }</td>
                                                        <td>${record.subject }</td>
                                                        <td>
                                                            <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                            value="${record.createtime }"/>
                                                        </td>
	                                                        <td class="" recordid="${record.id }">
	                                                            <c:if test="${record.checkstatus==1 }">
	                                                            	审核通过
                          <a class="btn btn-danger review" recordid='${record.id }' type='${type }' recordtypeid='${recordtypeid } '
                          	title="打回重审"><i class="glyphicon glyphicon-circle-arrow-left"></i></a>
	                                                            </c:if>
	                                                            <c:if test="${record.checkstatus==0 }">
					                                        		<a href="#" class="btn btn-default btn-sm startCheck">
															          <span class="glyphicon glyphicon-pencil"></span> 开始审核
															        </a>
															        <a href="#" class="btn btn-danger btn-sm checkFail">
															          <span class="glyphicon glyphicon-ban-circle"></span> 驳回申请
															        </a>
	                                                            </c:if>
	                                                            <c:if test="${record.checkstatus==2 }">
	                                                            	审核未通过
	                                                            </c:if>
	                                                        </td>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                        </tbody>
                                    </table>
                                </div> 
                                
                                <nav class="center">
                                    <ul class="pagination">
                                        <c:choose>
                                            <c:when test="${page.currentPage() == page.firstPage()}">
                                                <li class="disabled"><a href="#">&laquo;</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li>
                                                    <a href="<c:url value="/recordapply/infotype?fondsid=${fondid }&recordtypeid=${recordtypeid }&type=${type }&
                                                    n=true&page=${page.previousPage()}&size=${page.getPageSize()}&checkstatus=${checkstatus}"/>"><span>&laquo;</span></a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach var="p" items="${records.showPages()}" varStatus="s">
                                            <c:choose>
                                                <c:when test="${p == page.currentPage()}">
                                                    <li class="active"><a href="#">${p}</a></li>
                                                </c:when>
                                                <c:when test="${p == 0}">
                                                    <li><a>...</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <a href="<c:url value="/recordapply/infotype?fondsid=${fondid }&recordtypeid=${recordtypeid }&type=${type }&
                                                        n=true&page=${p}&size=${page.getPageSize()}&checkstatus=${checkstatus}"/>"/><span>${p}</span></a>
                                                        
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
                                                    <a href="<c:url value="/recordapply/infotype?fondsid=${fondid }&recordtypeid=${recordtypeid }&type=${type }&
                                                    n=true&typeId=${typeId }&page=${page.nextPage()}&size=${page.getPageSize()}&checkstatus=${checkstatus}"/>"><span>&raquo;</span></a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                </nav>
                                
                                
                                
                                
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
								         <div class="modal-footer">
								            <button type="button" class="btn btn-default checkPass">
								               		审核通过
								            </button>
								            <button type="button" class="btn btn-danger checkFail" 
								               data-dismiss="modal">驳回申请
								            </button>
								         </div>
								      </div>
									</div>
								</div>
								<div class="modal fade " id="whyCheckFail" tabindex="-1" role="dialog" 
								   aria-labelledby="myModalLabel" aria-hidden="true">
								   <div class="modal-dialog">
								      <div class="modal-content">
								         <div class="modal-header">
								            <button type="button" class="close" 
								               data-dismiss="modal" aria-hidden="true">
								                  &times;
								            </button>
								            <h4 class="modal-title" id="myModalLabel">
								               驳回申请
								            </h4>
								         </div>
								         <div class="modal-body">
								         	<h5>驳回理由及建议：</h5>
								            <input type="text" name="failReason" class="col-sm-12 form-control"/>
                        					<label class="col-sm-2 control-label" style="color:#f00;display:none">不能为空</label>
								         </div>
								         <div class="modal-footer">
								            <button type="button" class="btn btn-default checkPass">
								               发送
								            </button>
								            <button type="button" class="btn btn-danger checkFail" >
								            	取消
								            </button>
								         </div>
								      </div>
									</div>
								</div>
                                <div class="modal fade " id="checkPassRecordNo" tabindex="-1" role="dialog" 
								   aria-labelledby="myModalLabel" aria-hidden="true">
								   <div class="modal-dialog">
								      <div class="modal-content">
								         <div class="modal-header">
								            <button type="button" class="close" 
								               data-dismiss="modal" aria-hidden="true">
								                  &times;
								            </button>
								            <h4 class="modal-title" id="myModalLabel">
								             		  注意
								            </h4>
								         </div>
								         <div class="modal-body">
    										<div class="box-content">
	                							<!-- <div class="alert alert-info">提示：档号不填将后台自动生成</div> -->
		             	 						<form:form id="sureRecordNoForm">
	                            	  				<div class="form-group">
										                <label class="col-sm-4 control-label"><b>档号</b></label>
										
										                <div class="col-sm-5">
										            		<input type="text" name="recordno" class="col-sm-4 form-control"/>
										                </div>
										                <div class="col-sm-1">
								                    		<a class="btn btn-info check">检测</a>
										                </div>
										                <div class="col-sm-2">
	                            	  						<label id="recordno-error" class="control-label"></label>
										                </div>
										
									            	</div>
	                            	  				<div class="form-group">
										                <label class="col-sm-4 control-label"><b>系统建议档案号</b></label>
										
										                <div class="col-sm-5">
										            		<input type="text" name="sys_recordno" class="col-sm-4 form-control" disabled/>
										                </div>
										                <div class="col-sm-1">
										                </div>
										                <div class="col-sm-2">
										                </div>
										
									            	</div>
	                        					</form:form>
                        					</div>
								         </div>
								         <div class="modal-footer">
								            <button type="button" class="btn btn-default sureRecordNo">
								              	 发送
								            </button>
								            <button type="button" class="btn btn-danger" data-dismiss="modal" >
								            	取消
								            </button>
								         </div>
								      </div>
									</div>
								</div>
								
                                <div class="modal fade " id="review" tabindex="-1" role="dialog" 
								   aria-labelledby="myModalLabel" aria-hidden="true">
								   <div class="modal-dialog">
								      <div class="modal-content">
								         <div class="modal-header">
								            <button type="button" class="close" 
								               data-dismiss="modal" aria-hidden="true">
								                  &times;
								            </button>
								            <h4 class="modal-title" id="myModalLabel">
								             		  注意
								            </h4>
								         </div>
								         <div class="modal-body">
								         		确定将该条审核打回重审？
								         </div>
								         <div class="modal-footer">
								            <button type="button" class="btn btn-default sureReView">
								              	 确定
								            </button>
								            <button type="button" class="btn btn-danger" data-dismiss="modal" >
								            	取消
								            </button>
								         </div>
								      </div>
									</div>
								</div>
<script type="text/javascript" src="<c:url value='/resources/audioPlayer/js/audioplayer.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/cuplayer/swfobject.js'/>"></script>
                                <script>


                                $(document).on("click",".review",function(){
                                	var recordid = $(this).attr("recordid");
                                	$("#review").modal('show');
                                	$(document).off("click",".sureReView");
                                    $(document).on("click",".sureReView",function(){
                                    	$.post("<c:url value='/json/record/refusePass'  />", {
		                             		 	recordid:recordid,
		                             		 	recordtypeid:'${recordtypeid }',
		                             		 	failReason:'',type:'${type}'
		                       		 	 }, function (data, s, xh) {
		                             		 if(data.status==1){
		                                       noty({
		                                           text: "成功！",
		                                           layout: "top",
		                                           type: "success",
		                                           timeout: 1000,
		                                           onClosed: function () {
		                                               window.location.reload();
		                                           }
		                                       });
		                             		 }else{
		                                       noty({
		                                           text: "失败",
		                                           layout: "top",
		                                           type: "failure",
		                                           timeout: 1000,
		                                           onClosed: function () {
		                                               window.location.reload();
		                                           }
		                                       });
		                             		 }
		                             		$("#review").modal('hide');
		                             	 });
                                    });
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
                                	$("#wrapper").remove();$("#CuPlayer").remove();
                                	var html='<div id="wrapper"><audio preload="auto" controls><source src="'+'<c:url value='/file/openfile'/>?filepath='+filePath+'"></audio></div>';
                                	$(".fileContent iframe").before(html);
                                    $(".fileContent iframe").hide();
                                	$( '#wrapper audio' ).audioPlayer({
                                		strPlay: '暂停',
                                		strPause: '播放',
                                		strVolume: '声音'
                                	}); 
                                }
                     $(document).ready(function () {
                     	$("#datepicker input").datepicker({
                             language: 'zh-CN',
                             autoclose: true,
                             todayHighlight: true
                         })
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
                     $(document).on("click",".startCheck",function(){

                        	$("#CuPlayer").remove();
                       	$("#wrapper").remove();
                         $(".fileContent iframe").show();
                         $(".changePicture").remove();
                     	var recordid = $(this).parent().attr("recordid");
                     	 $.get("<c:url value='/json/record/detail'  />", {recordid:recordid,recordtypeid:'${recordtypeid }',type:'${type}'}, function (data, s, xh) {
                              $("#checkModal .modal-body select.choosefile").html("");
                     		 var documents = data.documents;
                     		 if(documents!=null&&documents!=''){
                                  for(var i=0;i<documents.length;i++){
                                      //$("#checkModal .modal-body select.choosefile").append("<option value='<c:url value='/'/>"+documents[i].path+"'>"+getFileName(documents[i].path)+"</option>");
                                      $("#checkModal .modal-body select.choosefile").append("<option value='"+documents[i].path+"'>"+getFileName(documents[i].path)+"</option>");
                                  }

                                  var file_path = encodeURI(encodeURI(documents[0].path));
                                  var suffix = getSuffix(file_path);
                              	if($.inArray(suffix, PdfExtension) != -1 || $.inArray(suffix, OfficeExtension) != -1){
                                      $(".fileContent iframe").attr("src","<c:url value='/jsp/pdf.jsp'/>?url="+file_path);
                                 	$(".fileContent iframe").attr("scrolling","no");
                              	}else if ($.inArray(suffix, ImgExtension) != -1){
                                     /* $(".fileContent iframe").load(function(){ 
                                     	$(".fileContent iframe").contents().find("img").css({"height":"100%","width":"100%"});
                                     }); */
                                     $(".fileContent iframe").attr("src", "<c:url value='/jsp/image.jsp'/>");
                                     $(".fileContent iframe").load(function(){ 	
                                      	 $(".fileContent iframe").contents().find("img").attr("src", "<c:url value='/file/openfile'/>?filepath=" + file_path);
                                     }); 
                                     $(".fileContent iframe").attr("scrolling","yes");
                                     $("#checkModal .modal-footer").prepend(
                                             " <a href=\"javascript:void(0)\" onclick='smallerImage()' class=\"btn btn-success changePicture\">" +
                                             "    		缩小" +
                                             " </a>"
                                     );
                                     $("#checkModal .modal-footer").prepend(
                                             " <a href=\"javascript:void(0)\" onclick='biggerImage()' class=\"btn btn-success changePicture\">" +
                                             "    		放大" +
                                             " </a>"
                                     );
                              	}else if ($.inArray(suffix, VideoExtension) != -1) {
                                    window.showVideo("/" + file_path);
                                }else if($.inArray(suffix, MusicEXtension) != -1){
                                	 window.showMusic("/" + file_path);
                                }
                     		 }else{
                                  $(".fileContent iframe").attr("src","");
                     		 }
                     		 
                              $("#checkModal .modal-footer .checkPass").attr("recordid",recordid);

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
                     $(document).on("change","#checkModal .modal-body select.choosefile",function(){
                         var file_path = encodeURI(encodeURI($(this).val()));
                         var suffix = getSuffix(file_path);
                         $(".changePicture").remove();
                     	if($.inArray(suffix, PdfExtension) != -1 || $.inArray(suffix, OfficeExtension) != -1){
                             $(".fileContent iframe").attr("src","<c:url value='/jsp/pdf.jsp'/>?url="+file_path);
                        	$(".fileContent iframe").attr("scrolling","no");
                     	}else if ($.inArray(suffix, ImgExtension) != -1){
                            /* $(".fileContent iframe").load(function(){ 
                            	$(".fileContent iframe").contents().find("img").css({"height":"100%","width":"100%"});
                            }); */
                            $(".fileContent iframe").attr("src", "<c:url value='/jsp/image.jsp'/>");
                            $(".fileContent iframe").load(function(){ 	
                             	 $(".fileContent iframe").contents().find("img").attr("src", "<c:url value='/file/openfile'/>?filepath=" + file_path);
                            }); 
                            $(".fileContent iframe").attr("scrolling","yes");
                            $("#checkModal .modal-footer").prepend(
                                    " <a href=\"javascript:void(0)\" onclick='smallerImage()' class=\"btn btn-success changePicture\">" +
                                    "    		缩小" +
                                    " </a>"
                            );
                            $("#checkModal .modal-footer").prepend(
                                    " <a href=\"javascript:void(0)\" onclick='biggerImage()' class=\"btn btn-success changePicture\">" +
                                    "    		放大" +
                                    " </a>"
                            );
                     	}else if ($.inArray(suffix, VideoExtension) != -1) {
                           window.parent.showVideo("/" + file_path);
                       }else if($.inArray(suffix, MusicEXtension) != -1){
                       	 window.parent.showMusic("/" + file_path);
                       }
                     });
                     $(document).on("click",".checkFail",function(){
                     	var recordid = $(this).parent().attr("recordid");
                         $("#checkModal .modal-footer .checkPass").attr("recordid",recordid);
                     	$('#whyCheckFail').modal('show');
                     });
                     $(document).on("click","#whyCheckFail .checkFail",function(){
                     	$('#whyCheckFail').modal('hide');
                     });
                     $(".check").on("click", function (e) {
                         $.ajax({
                             type: "POST",
                             url: '<c:url value="/json/record/checkrecordno"/>',
                             data:{
                                 recordno: function () {
                                     return $('#checkPassRecordNo input[name=recordno]').val();;
                                 },
                                 fondsid: function () {
                                     return '${fondsid}';
                                 },
                                 recordtypeid: function () {
                                     return '${recordtypeid }';
                                 }
                             },
                             success: function (result) {
                                 if(result){
                                     $("#recordno-error").html("<span class='red'>档号可以使用!</span>");
                                 }else{
                                     $("#recordno-error").html("<span class='red'>档号已存在!</span>");
                                 }
                             }
                         });
                     });
                     $(document).on("click",".checkModal .checkPass",function(){
                        	 var recordid = $("#checkModal .modal-footer .checkPass").attr("recordid");
                          var fondsId = '${fondsid}';
                          var recordTypeId = '${recordtypeid }';
                          if('${type}'=="_piece"){
                              $('#checkPassRecordNo').modal('show');
                         	 $.get("<c:url value='/json/record/getrecordno'  />",{recordid:recordid,recordtypeid:recordTypeId,type:'${type}'}, function (data, s, xh) {
                    			$('#checkPassRecordNo input[name=recordno]').val(data.recordno);
                    			$('#checkPassRecordNo input[name=recordno]').attr("placeholder",data.recordno);
                    			$('#checkPassRecordNo input[name=sys_recordno]').val(data.recordno);
                 			 });
                           
                          $(document).on("click","#checkPassRecordNo .sureRecordNo",function(){
                          	 if ($('#recordno-error').html()==''){
                                 noty({
                                     text: "档号还未检验",
                                     layout: "top",
                                     type: "failure",
                                     timeout: 1000,
                                     onClosed: function () {
                                     }
                                 });
                          		 return ;
                          	 }
                          	 if($('#recordno-error span').html()=='档号已存在!'){
                          		 return;
                          	 }
                             $('#checkPassRecordNo').modal('hide');
                          	 var recordno = $("#sureRecordNoForm input[name=recordno]").val();
                          	 $.post("<c:url value='/json/record/checkPass'  />", 
                        			 {recordid:recordid,recordtypeid:recordTypeId,type:'${type}',recordno:recordno}, function (data, s, xh) {
                          		 if(data.status==1){
                                   	 $('#checkModal').modal('hide');
                                    noty({
                                        text: "成功！",
                                        layout: "top",
                                        type: "success",
                                        timeout: 1000,
                                        onClosed: function () {
                                            window.location.reload();
                                        }
                                    });
                          		 }else{
                                    noty({
                                        text: "失败",
                                        layout: "top",
                                        type: "failure",
                                        timeout: 1000,
                                        onClosed: function () {
                                            //window.location.reload();
                                        }
                                    });
                          		 }
                            	//$('#checkModal').modal('show');
                            	$(document).off("click","#checkPassRecordNo .sureRecordNo");
                             });
                           });
                          }else{
                         	 $.post("<c:url value='/json/record/checkPass'  />", 
                       			 {recordid:recordid,recordtypeid:recordTypeId,type:'${type}',recordno:''}, function (data, s, xh) {
                         		 if(data.status==1){
                                   noty({
                                       text: "成功！",
                                       layout: "top",
                                       type: "success",
                                       timeout: 1000,
                                       onClosed: function () {
                                           window.location.reload();
                                       }
                                   });
                         		 }else{
                                   noty({
                                       text: "失败",
                                       layout: "top",
                                       type: "failure",
                                       timeout: 1000,
                                       onClosed: function () {
                                           //window.location.reload();
                                       }
                                   });
                         		 }
                           });
                          }
                     	//$('#whyCheckFail').modal('hide');
                     });
                     $(document).on("click",".checkModal .checkFail",function(){
                     	$('#whyCheckFail').modal('show');
                     });
                     $(document).on("click","#whyCheckFail .checkPass",function(){
                     	var recordid = $("#checkModal .modal-footer .checkPass").attr("recordid");
                     	var failReason = $(this).parent().parent().find("input[name=failReason]").val();
                     	if(failReason.replace(' ','')==''){
                     		$(this).parent().parent().find("label").show();
                     		return ;
                     	}else{
                     		$(this).parent().parent().find("label").attr("display","none");
                     	}
                     	
                     	 $.post("<c:url value='/json/record/refusePass'  />", {
                     		 	recordid:recordid,
                     		 	recordtypeid:'${recordtypeid }',
                     		 	failReason:failReason,type:'${type}'
               		 	 }, function (data, s, xh) {
                     		 if(data.status==1){
                               noty({
                                   text: "成功！",
                                   layout: "top",
                                   type: "success",
                                   timeout: 1000,
                                   onClosed: function () {
                                       window.location.reload();
                                   }
                               });
                     		 }else{
                               noty({
                                   text: "失败",
                                   layout: "top",
                                   type: "failure",
                                   timeout: 1000,
                                   onClosed: function () {
                                       window.location.reload();
                                   }
                               });
                     		 }
                     	 });
                     	$('#whyCheckFail').modal('show');
                     });
                                </script>
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
<script type="text/html" id="FieldTemplate">
    <div class="table-content">
        <table class="table table-striped table-bordered responsive">
            <thead>
            <tr>
                <th id="th_name">字段名</th>
                <th id="th_length">字段长度</th>
                <th id="th_fieldNo">字段编码</th>
            </tr>
            </thead>
            <tbody>
            {{if tablefields.length == 0}}
            <tr>
                <td style="display:none">无</td>
                <td colspan="20" class="center">表中数据为空！</td>
            </tr>
            {{else}}
            {{each tablefields}}
            <tr>
                <td class="name">{{= name}}</td>
                <td class="length" >{{= length}}</td>
                <td class="fieldNo">{{= fieldNo}}</td>
            </tr>
            {{/each}}
            {{/if}}
            <tr>
                <td colspan="20" class="center">档号规则:{{= rule}}</td>
            </tr>
            </tbody>
        </table>
    </div>


</script>
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





<spring:message code="deleteform.message.failed" text="Delete failed!" var="message_delete_failed"/>
<spring:message code="deleteform.message.success" text="Delete success!" var="message_delete_success"/>
<spring:message code="check.success" text="Check Success" var="message_check_success"/>
<spring:message code="check.failure" text="Check Failure" var="message_check_failure"/>


<script>
    /*function checkcondition() {
     var starttime = $("#starttime").val();
     var startdate = new Date(starttime);
     var endtime = $("#endtime").val();
     var enddate = new Date(endtime);
     if (startdate.getTime() > enddate.getTime()) {
     alert("搜索提示：起始日期必须小于结束日期！请重新选择日期！！");
     return false;
     }
     }*/

</script>


</body>
</html>
