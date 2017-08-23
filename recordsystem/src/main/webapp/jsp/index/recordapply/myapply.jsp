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
                                                	<option value="1">已通过</option>
                                                	<option value="2">未通过</option>
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
if('${status}'!=null&&'${status}'!=''){
	var checkstatus = "";
   	 if('0'=='${status}'){
   		checkstatus+="<option value='0'  selected='selected'>审核中</option>"+
		  		"<option value='1' >已通过</option>"+
   		  		"<option value='2' >未通过</option>";
   	 }else if('1'=='${status}'){
   		checkstatus+="<option value='0' >审核中</option>"+
	  		"<option value='1'  selected='selected'>已通过</option>"+
		  		"<option value='2' >未通过</option>";
   	 }else{
   		checkstatus+="<option value='0' >审核中</option>"+
	  		"<option value='1' >已通过</option>"+
		  		"<option value='2'  selected='selected'>未通过</option>";
   	 }
     $(".navbar-inner .navbar-left select:nth-child(4)").html(checkstatus);
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
        	 $(".navbar-inner .navbar-left select:last").val("");
        	 $(".navbar-inner .navbar-left select:last").html("");
         }
     });
}
$(document).on("change",".navbar-inner .navbar-left select:first",function(){
	getRecordType($(this).val());
	window.location.href="<c:url value='/recordapply/myapply' />?fondsid="+$(this).val()+"&type="+$(this).next().next().val()+"&status=${status }";

   // showTables("<c:url value='/recordapply/myapply' />?fondsid="+$(this).val()+"&recordtypeid=${recordtypeid }&type="+$(this).next().next().val(), true);
});
$(document).on("change",".navbar-inner .navbar-left select:nth-child(2)",function(){
	 window.location.href="<c:url value='/recordapply/myapply' />?fondsid="+
			$(this).prev().val()+"&recordtypeid="+$(this).val()+"&type="+$(this).next().val()+"&status=${status }";

});
$(document).on("change",".navbar-inner .navbar-left select:nth-child(3)",function(){
	 window.location.href="<c:url value='/recordapply/myapply' />?fondsid="+
			$(this).prev().prev().val()+"&recordtypeid="+$(this).prev().val()+"&type="+$(this).val()+"&status=${status }";

});
$(document).on("change",".navbar-inner .navbar-left select:nth-child(4)",function(){
	 window.location.href="<c:url value='/recordapply/myapply' />?fondsid="+
			$(this).prev().prev().val()+"&recordtypeid="+$(this).prev().prev().val()+"&type="+$(this).prev().val()+"&status="+$(this).val();

});
</script>
                                    <c:url value="/recordapply/myapply" var="searchActoin">
                                    </c:url>
                                    <form:form modelAttribute="searchForm"
                                               action="${searchActoin}?fondsid=${fondsid }&recordtypeid=${recordtypeid }&status=${status }&n=true">
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
                                                    <form:input class="form-control" placeholder="${placeholder_start}" data-provide="datepicker"
                                                     data-date-format="yyyy-mm-dd" path="starttime"/>
                                                    <span class="input-group-addon">${placeholder_to}</span>
                                                    <form:input class="form-control" placeholder="${placeholder_end}" data-provide="datepicker"
                                                     data-date-format="yyyy-mm-dd" path="endtime"/>
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
	                                        	<th>状态</th>
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
                                                    <tr recordid="${record.id }">
                                                        <td>${record.operator }</td>
                                                        <td>${record.subject }</td>
                                                        <td>
                                                            <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                            value="${record.createtime }"/>
                                                        </td>
                                                        <td recordid="${record.id }">
                                                            <c:if test="${record.checkstatus==1 }">
                                                            	已通过审核
                                                            </c:if>
                                                            <c:if test="${record.checkstatus==-1 }">
                                                            	未提交审核
                                                            </c:if>
                                                            <c:if test="${record.checkstatus==0 }">
                                                            	审核中
                                                            </c:if>
                                                            <c:if test="${record.checkstatus==2 }">
                                                            	审核未通过
<a href="<c:url value='/record/reimport'  />?recordId=${record.id }&pattern=${type=='_piece'?'1':'0' }&recordTypeId=${recordtypeid }&fondsId=${fondsid }&recordTypeName=${recordTypeName }&status=${status }
&fondsName=${fondsName }&reimport=true" class="btn btn-warning" title="修改内容"><i class="glyphicon glyphicon-pencil"></i></a>

                    <a class="btn btn-success viewFailReason" title="查看未通过原因"><i class="glyphicon glyphicon-info-sign"></i></a>
                                                            </c:if>
                                                        </td>
                                                        <td class="" recordid="${record.id }" recordtypeid="${recordtypeid }" type="${type }">
                    <a class="btn btn-success viewDocument" title="查看具体信息"><i class="glyphicon glyphicon-check"></i></a>
                     						<c:if test="${record.checkstatus==2 }">
                     							<a class="btn btn-danger deleteApply" title="删除记录"><i class="glyphicon glyphicon-remove"></i></a>
                     						</c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                        </tbody>
                                    </table>
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
								            <h4 class="modal-title" >
								               	未通过申请
								            </h4>
								         </div>
								         <div class="modal-body">
								         	<h5>理由及建议：</h5>
                        					<div class="control-form"></div>
								         </div>
								         <div class="modal-footer">
								            <button type="button" class="btn btn-danger whyCheckFail" >
								            	关闭
								            </button>
								         </div>
								      </div>
									</div>
								</div>
                                
                                <nav class="center">
                                    <ul class="pagination">
                                        <c:choose>
                                            <c:when test="${page.currentPage() == page.firstPage()}">
                                                <li class="disabled"><a href="#">&laquo;</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li>
                                                    <a href="<c:url value="/recordapply/myapply?fondsid=${fondid }&recordtypeid=${recordtypeid }&type=${type }&n=true&page=${page.previousPage()}&status=${status }&size=${page.getPageSize()}"/>"><span>&laquo;</span></a>
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
                                                        <a href="<c:url value="/recordapply/myapply?fondsid=${fondid }&recordtypeid=${recordtypeid }&type=${type }&n=true&page=${p}&status=${status }&size=${page.getPageSize()}"/>"/><span>${p}</span></a>
                                                        
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
                                                    <a href="<c:url value="/recordapply/myapply?fondsid=${fondid }&recordtypeid=${recordtypeid }&type=${type }&n=true&typeId=${typeId }&page=${page.nextPage()}&status=${status }&size=${page.getPageSize()}"/>"><span>&raquo;</span></a>
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
											            	<iframe name="openfile" height="100%" width="100%" frameborder="no" scrolling="no" ></iframe>
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
							            </div>
								      </div>
									</div>
								</div>
                                
                                <script>
                                $(document).on("click",".viewFailReason",function(){
                                	var recordid = $(this).closest("tr").attr("recordid");
	                               	 $.get("<c:url value='/recordapply/getFailReason'  />", {recordid:recordid}, function (data, s, xh) {
	                               		 $("#whyCheckFail .modal-body div").html(data.failReason);
	                               	 });
                                	$('#whyCheckFail').modal('show');
                                });
                                $(document).on("click",".whyCheckFail",function(){
                                	$('#whyCheckFail').modal('hide');
                                });
                                function getFileName(url){	
                                	if(url.split("\\").length==1)
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
                                $(document).on("click",".viewDocument",function(){


                                   	$("#CuPlayer").remove();
                                  	$("#wrapper").remove();
                                    $(".fileContent iframe").show();
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
                                             $("#checkModal .modal-footer").html("");
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
                                                $("#checkModal .modal-footer").html(
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
                                    $("#checkModal .modal-footer").html("");
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

                                       $("#checkModal .modal-footer").html(
                                               " <a href=\"javascript:void(0)\" onclick='biggerImage()' class=\"btn btn-success\">" +
                                               "    		放大" +
                                               " </a>"
                                       );
                                       $("#checkModal .modal-footer").append(
                                               " <a href=\"javascript:void(0)\" onclick='smallerImage()' class=\"btn btn-success\">" +
                                               "    		缩小" +
                                               " </a>"
                                       );
                                       $(".fileContent iframe").attr("scrolling","yes");
                                	}else if ($.inArray(suffix, VideoExtension) != -1) {
                                      window.showVideo("/" + file_path);
                                  }else if($.inArray(suffix, MusicEXtension) != -1){
                                  	 window.showMusic("/" + file_path);
                                  }
                                });
                                /* $(document).on("click",".checkFail",function(){
                                	var recordid = $(this).parent().attr("recordid");
                                    $("#checkModal .modal-footer .checkPass").attr("recordid",recordid);
                                	$('#whyCheckFail').modal('show');
                                });
                                $(document).on("click","#whyCheckFail .checkFail",function(){
                                	$('#whyCheckFail').modal('hide');
                                });
                                $(document).on("click",".checkModal .checkPass",function(){
                                   var recordid = $("#checkModal .modal-footer .checkPass").attr("recordid");
                               	 $.get("<c:url value='/json/record/checkPass'  />", {recordid:recordid,recordtypeid:'${recordtypeid }',type:'${type}'}, function (data, s, xh) {
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
                                 	$('#checkModal').modal('show');
                                 });
                                	$('#checkModal').modal('hide');
                                	$('#whyCheckFail').modal('hide');
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
                                }); */
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



<script type="text/javascript" src="<c:url value='/resources/audioPlayer/js/audioplayer.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/cuplayer/swfobject.js'/>"></script>
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
                <a href="#" class="btn btn-primary" data-dismiss="modal"><i class="glyphicon glyphicon-share-alt"></i>
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


<script type="text/html" id="deleteApplyTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4>温馨提示：</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <p class="deletetip">是否确定要删除该条记录？</p>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="deleteApplybutton btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <spring:message code="href.confirm"
                                                                               text="Confirm"/></strong></a>
            <a href="#" class="btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <spring:message code="href.cancel"
                                                                               text="Cancel"/></strong></a>
        </div>
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
                                                                                             text="Confirm"/></a></p>
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
            <a href="#" class="checkpass btn btn-primary"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
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
                            <input type="password" name="pwdconfirm" class="form-control" placeholder="空时，不输入新密码则不修改密码">
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
                    class="glyphicon glyphicon-share-alt"></i> <span class="button2"><spring:message code="href.notpass"
                                                                                                     text="Not pass"/></span></strong></a>
        </div>

        </form>
    </div>
</script>
<script type="text/html" id="viewInfoTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="optitle">审核用户</h4>
        </div>
        <div class="modal-body">
            <div class="box-content">
                <c:url var="createUserAction" value="/user/create"/>
                <form:form modelAttribute="userCreateForm" action="${createUserAction}" class="form-horizontal"
                           role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.name"
                                                                              text="Name"/></label>

                        <div class="col-sm-4">
                            <input id="tempusername" name="tempusername" class="form-control">
                            <label id="tempusername-error" class="control-label"></label>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.type"
                                                                              text="Type"/></label>

                        <div class="col-sm-4">
                            <select name="usertype" class="form-control">
                                <option value="2">应用服务商</option>
                                <option value="3">医院集成服务商</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.password"
                                                                              text="Password"/></label>

                        <div class="col-sm-4">
                            <input type="password" id="userpassword" name="userpassword" class="form-control">
                            <label id="userpassword-error" class=""></label>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.service"
                                                                              text="Service"/></label>

                        <div class="col-sm-4">
                            <input name="provider" id="provider" class="form-control">
                            <label id="provider-error" class=""></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.pwdconfirm"
                                                                              text="Pwdconfirm"/></label>

                        <div class="col-sm-4">
                            <input type="password" name="pwdconfirm" id="pwdconfirm" class="form-control">
                            <label id="pwdconfirm-error" class=""></label>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.contact"
                                                                              text="Contact"/></label>

                        <div class="col-sm-4">
                            <input name="contact" id="contact" class="form-control">
                            <label id="contact-error" class=""></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.contactinfo"
                                                                              text="ContacInfo"/></label>

                        <div class="col-sm-4">
                            <input name="contactinfo" class="form-control">
                            <label id="contactinfo-error" class=""></label>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.mailbox"
                                                                              text="MailBox"/></label>

                        <div class="col-sm-4">
                            <input name="email" class="form-control">
                            <label id="email-error" class=""></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><spring:message code="model.user.description"
                                                                              text="Description"/></label>

                        <div class="col-sm-10">
                            <textarea name="description" class="form-control"></textarea>
                            <label id="description-error" class=""></label>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" class="createuserbutton btn btn-primary"><strong><i class="glyphicon glyphicon-share-alt"></i>
                <span class="button1"><spring:message code="href.pass" text="Pass"/></span></strong></a>
            <a href="#" class="btn btn-primary" data-dismiss="modal"><strong><i
                    class="glyphicon glyphicon-share-alt"></i> <span class="button2"><spring:message code="href.notpass"
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
                            <p class="form-control-static">{{= name}} <i class="glyphicon glyphicon-tag blue"></i></p>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.dtuid"
                                                                              text="Serialnumber"/></label>

                        <div class="col-sm-10">
                            <p class="form-control-static">{{= dtuid}} <i class="glyphicon glyphicon-tag blue"></i></p>
                        </div>
                        <label class="col-sm-2 control-label"><spring:message code="model.user.checksum"
                                                                              text="Checksum"/></label>

                        <div class="col-sm-10">
                            <p class="form-control-static">{{= checksum}} <i class="glyphicon glyphicon-tag blue"></i>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button value="submit" class="btn btn-primary"><i class="glyphicon glyphicon-saved"></i> <spring:message
                        code="href.ok" text="OK"/></button>
                <a href="#" class="btn btn-primary" data-dismiss="modal"><i class="glyphicon glyphicon-share-alt"></i>
                    <spring:message code="href.cancel" text="Cancel"/></a>
            </div>
        </form>
    </div>
</script>
<script type="text/html" id="deviceTemplate">
    <tr id="t_{{= deviceid}}">
        <td>{{= dtuid}}</td>
        <td>{{= checksum}}</td>
        <td>
            {{if acstatus=='active'}}
            激活
            {{else}}
            未激活
            {{/if}}
        </td>
        <td>{{= description}}</td>
    </tr>
</script>
<script type="text/x-jquery-impl" id="memberListTemplate">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4>查看用户拥有的团队成员</h4>
        </div>
        <div class="modal-body">
                <div class="box-content">
                    <table class="table table-striped table-bordered responsive">
                        <thead>
                        <tr>
                            <th id="th_teamusername" title="teamusername"><spring:message code="model.member.name"
                                                                                          text="Name"/></th>
                            <th id="th_sex" title="sex"><spring:message
        code="model.member.sex" text="sex"/></th>
                            <th id="th_grade" title="grade"><spring:message
        code="model.member.grade" text="grade"/></th>
                            <th id="th_profession" title="profession"><spring:message
        code="model.member.profession" text="profession"/></th>
                            <th id="th_work" title="work"><spring:message
        code="model.member.work" text="work"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        {{each members}}
                        <tr id="">
                            <td>{{= teamusername}}</td>
                            <td>
                                {{if sex == true}}
                                    <img src="<c:url value="/resources/images/gender/male.png"/>" >
                                {{else}}
                                    <img src="<c:url value="/resources/images/gender/female.png"/>" >
                                {{/if}}
                            </td>
                            <td>{{= grade}}</td>
                            <td>{{= profession}}</td>
                            <td>{{= work}}</td>
                        </tr>
                        {{/each}}
                        </tbody>
                    </table>
                </div>
        </div>
        <div class="modal-footer">
                <a href="#" class="btn btn-primary" data-dismiss="modal"><i class="glyphicon glyphicon-share-alt"></i>
                    <spring:message code="href.close" text="Close"/></a>
        </div>
    </div>
































































































</script>
<spring:message code="deleteform.message.failed" text="Delete failed!" var="message_delete_failed"/>
<spring:message code="deleteform.message.success" text="Delete success!" var="message_delete_success"/>
<spring:message code="check.success" text="Check Success" var="message_check_success"/>
<spring:message code="check.failure" text="Check Failure" var="message_check_failure"/>


<script>


     $(document).ready(function () {
     	$("#datepicker input").datepicker({
             language: 'zh-CN',
             autoclose: true,
             todayHighlight: true
         })
     }); 
    $(document).ready(function () {
    	
        $(".deleteuser").on("click", function (e) {
            var userid = $(this).closest("tr").attr("id");
            var result = {datetip: "您确定要删除该用户吗？"};
            $('#deleteApplyTemplate').tmpl(result).replaceAll($('#commonModal .modal-content'));
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


        $(".viewTeamMember").on("click", function (e) {
            var userid = $(this).closest("tr").attr("id");
            $.get("<c:url value="/json/member/viewall"  />", {userid: userid}, function (data, status, xh) {
                console.log(data);
                var result = {members: data};
                $('#memberListTemplate').tmpl(result).replaceAll($('#commonModal .modal-content'));
                $('#commonModal').modal("show");
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


        $('.createuser').on('click', function (e) {
            e.preventDefault();
            $('#viewInfoTemplate').tmpl().replaceAll($('#view .modal-content'));
            $(".modal-dialog").width(800);
            $(".optitle").text("创建用户");
            $(".button1").text("确定");
            $(".button2").text("取消");
            $('#view').modal('show');
            $('#view #userCreateForm').validate(
                    {
                        errorPlacement: function (error, element) {
                            error.replaceAll($("#" + $(element).attr("name") + "-error"));
                        },
                        rules: {
                            tempusername: {
                                maxlength: 16,
                                required: true,
                                remote: {
                                    url: '<c:url value="/json/user/checkname"/>',
                                    type: 'post',
                                    dataType: 'json',
                                    data: {
                                        username: function () {
                                            return $("[name='tempusername']").val();
                                        }
                                    }
                                }
                            },
                            userpassword: {
                                rangelength: [6, 18],
                                required: true,
                                isPassword: true
                            },
                            pwdconfirm: {
                                rangelength: [6, 18],
                                required: true,
                                confirmPwd: "#userpassword"
                            },
                            provider: {
                                maxlength: 16,
                                required: true
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
                                isEmail: true,
                                remote: {
                                    url: '<c:url value="/json/user/email"/>',
                                    type: 'post',
                                    dataType: 'json',
                                    data: {
                                        username: function () {
                                            return $("[name='email']").val();
                                        }
                                    }
                                }
                            },
                            description: {
                                maxlength: 32,
                            }
                        },
                        messages: {
                            tempusername: {
                                required: "必填项！",
                                remote: "重名！"
                            },
                            userpassword: {
                                required: "必填！"
                            },
                            pwdconfirm: {
                                required: "必填！",
                            },
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
                                isEmail: "邮箱格式错误，请输入正确格式！",
                                remote: "该邮箱已使用，请重新输入！"
                            }
                        },
                        success: function (label) {
                            label.text("${validate_message_ok}").addClass("valid");
                            label.removeClass("error");
                            label.html("有效");
                        }
                    });
            $(".createuserbutton").on('click', function (e) {
                if ($('#userCreateForm').valid()) {
                    $('#userCreateForm').submit();
                }
            });
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
        
        
        $(document).on("click", ".deleteApply", function(){ 

            var result = {datetip: "您确定要删除该条记录吗？"};
            $('#deleteApplyTemplate').tmpl(result).replaceAll($('#commonModal .modal-content'));
            $('#commonModal').modal("show");

        	var recordid = $(this).closest("td").attr("recordid");
        	var recordtypeid = $(this).closest("td").attr("recordtypeid");
        	var type = $(this).closest("td").attr("type");
        	
            $(".deleteApplybutton").on("click", function (e) {
                $.post("<c:url value="/json/record/deleteApply"  />", {recordid: recordid,recordtypeid:recordtypeid,type:type}, function (data, status, xh) {
                    
                    if (data.status == 1) {
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
