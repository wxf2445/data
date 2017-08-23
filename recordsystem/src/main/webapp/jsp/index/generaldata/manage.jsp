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
                          	  档案字段维护
                        </li>
                    </ul>
                </div>

                <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <div class="box-header well" data-original-title="">
                                <h2><i class="glyphicon glyphicon-hdd"></i>   档案字段维护</h2>
                            </div>
                            <div class="box-content">
                                <div class="row">
                                    <div class="col-md-2">
                                        <c:set var="fondss" value="${recordTree.fondss}"/>
                                        <div id="jstree">
                                            <!-- in this example the tree is populated from inline HTML -->
                                            <ul>
                                                <c:forEach var="fondsTree" items="${fondss}">
                                                    <li class="jstree-open"
                                                        id="${fondsTree.fonds.id}"
                                                        title="${fondsTree.fonds.name}">${fondsTree.fonds.name}
                                                        <ul>
                                                            <c:forEach var="recordType"
                                                                       items="${fondsTree.recordTypes}">
                                                                <li class="jstree-open"
                                                                    id="${recordType.id}" 
                                                                    title="${recordType.name}">${recordType.name}
                                                                     <ul> 
                                                                            <%--<c:forEach var="recordCategory"
                                                                                       items="${recordCategoryTrees}">
                                                                                <li
                                                                                        id="${recordCategory.recordCategory.id}">${recordCategory.recordCategory.des}
                                                                                    <ul>
                                                                                        <c:forEach
                                                                                                var="recordCategoryContent"
                                                                                                items="${recordCategory.recordCategoryContents}">
                                                                                            <li
                                                                                                    id="${recordCategoryContent.id}">${recordCategoryContent.name}
                                                                                                <ul>--%>
                                                                        <li data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
                                                                            class="dictionary" tableid='${fondsTree.fonds.fondsno }_${recordType.typeno}_piece' tabletype="_piece">
                                                                         按件
                                                                        </li> 
                                                                        <li data-jstree='{"icon":"glyphicon glyphicon-leaf"  }'
                                                                            class="dictionary" tableid='${fondsTree.fonds.fondsno }_${recordType.typeno}_record' tabletype="_record">
                                                                           卷内
                                                                        </li>
                                                                        <li data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
                                                                            class="dictionary" tableid='${fondsTree.fonds.fondsno }_${recordType.typeno}_volume' tabletype="_volume">
                                                                          案卷
                                                                        </li> 
			                                                            <%-- <c:forEach var="table"
			                                                                       items="${recordType.tables}">
	                                                                        <li data-jstree='{"icon":"glyphicon glyphicon-leaf"}'
	                                                                            class="template" tableid='${table.tableid }'>
	                                                                            ${table.name }
	                                                                        </li>
			                                                            </c:forEach> --%>
                                                                            <%--</ul>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </li>
                                                        </c:forEach>--%>
                                                                    </ul>  
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </li>
                                                </c:forEach>
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
                                                    <th id="th_name" >字段名</th>
                                                    <th id="th_length" >字段长度</th>
                                                    <th id="th_fieldNo" >字段编码</th>
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




<script type="text/html" id="recordListTemplate">
<div class="row center">
    {{if records.length == 0}}
        <p><strong><b>暂无卷内</b></strong></p>
    {{else}}
    {{each records}}
		{{if isVolume}}
    <div class="col-md-3" recordid="{{= id}}" type="_record">
		{{else}}
    <div class="col-md-3" recordid="{{= id}}" type="_piece">
		{{/if}}
        <img class="pointerimg" src="<c:url value="/resources/images/content/document_128.png" />">

        <p ><input type="hidden" value="{{= id}}"><a href="#"><span><b>
            {{if subject != ''}}
            {{= subject}}
            {{else}}
            暂未填写！
            {{/if}}
        </b></span></a></p>
    </div>
    {{/each}}
{{/if}}
</div>

    </script>

<script type="text/html" id="FieldTemplate">
    <div class="table-content">
        <table class="table table-striped table-bordered responsive">
            <thead>
            <tr>
                <th id="th_name">字段名</th>
                <th id="th_length">字段长度</th>
                <th id="th_fieldNo">字段编码</th>
                <th id="th_operation">操作</th>
            </tr>
            </thead>
            <tbody>
            {{if tablefields.length == 0}}
            <tr>
                <td style="display:none">无</td>
                <td colspan="20" class="center">无字段</td>
            </tr>
            {{else}}
            {{each tablefields}}
            <tr>
                <td class="name">{{= name}}</td>
                <td class="length" >{{= length}}</td>
                <td class="fieldNo">{{= fieldNo}}</td>
                <td class="operation"> 
				</td>
            </tr>
            {{/each}}
            {{/if}}
            <tr recordtypeid="{{= recordtypeid}}" type="{{= type}}">
                <td class="name"><input name="fieldName" class="form-control"></td>
                <td class="length" ><input name="length" class="form-control" type="text" onkeyup='this.value=this.value.replace(/\D/gi,"")' maxlength="3"></td>
                <td class="fieldNo"></td>
                <td class="operation"> 
					<a class="btn btn-success addField" title="添加"><i class="glyphicon glyphicon-plus"></i></a>
				</td>
            </tr>
            <tr>
				{{if type=='_volume' }}
                	<td colspan="20" class="center">案卷号规则:{{= rule}}</td>
				{{else}}
                	<td colspan="20" class="center">档号规则:{{= rule}}</td>
				{{/if}}
            </tr>
            </tbody>
        </table>
    </div>


</script>

<div class="modal fade" id="sureAddField" tabindex="-1" role="dialog" 
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
            	注意！添加后<font color="#f00"> 不能删除</font>，确定要添加<span class="fieldData"  style="color:#f00"></span>?
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

<script>

    $(document).ready(function () {
        $('#jstree').jstree();
        var showTables = function (url,recordtypeid,type) {
            $(".modal-dialog").not(".checkModal").width(1000);
            $.ajax({
                type: "GET",
                url: url,
                data: {recordtypeid:recordtypeid,tabletype:type},
                success: function (result) {
                	result.type = type;
                	result.recordtypeid = recordtypeid;
                    $("#FieldTemplate").tmpl(result).replaceAll($(".table-content"));
                }
            });
        }

        $("#jstree").delegate("li.dictionary", "click", function (e) {
            var recordtypeid = $(this).closest("li.jstree-open").attr("id");
            var type = $(this).attr("tabletype");
            showTables("<c:url value="/json/dictionary/manage" />",recordtypeid,type);
        });
        $(document).on('click', '.addField', function (e) {
        	var tr = $(this).parent().parent();
        	var fieldName = tr.find("input[name=fieldName]").val();
        	var length = tr.find("input[name=length]").val();
        	if(fieldName.replace(' ','').replace(/(\n)+|(\r\n)+/g, "")==''||length.replace(' ','').replace(/(\n)+|(\r\n)+/g, "")=='')
        		return ;
        	$('#sureAddField').modal("show");
        	$("#sureAddField .fieldData").html(fieldName);
            var type = tr.attr("type");
            var recordtypeid = tr.attr("recordtypeid");
            $("#sureAddField").delegate(".btn-primary", "click", function (e) {
                $.ajax({
                    type: "POST",
                    url: "<c:url value="/json/dictionary/addField" />",
                    data: {recordtypeid:recordtypeid,tabletype:type,fieldName:fieldName,length:length},
                    success: function (result) {
                    	result.type = type;
                    	result.recordtypeid = recordtypeid;
                        $("#FieldTemplate").tmpl(result).replaceAll($(".table-content")); 
                    	$('#sureAddField').modal("hide");
                        noty({
                            text: "成功！",
                            layout: "top",
                            type: "success",
                            timeout: 1000,
                            onClosed: function () {
                            	
                            }
                        });
                    }
                });
            })
        });
    });

</script>


</body>
</html>
