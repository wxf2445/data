<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<!-- jQuery -->
<%--<!--[if lte IE 8]>
<script type="text/javascript">
alert("ie 8");
</script>
<script src="<c:url value='/resources/charisma-master/js/jquery-1.9.0.js'/>"></script>
<![endif]-->--%>
<script type="text/javascript">
    if (!document.addEventListener) {
        document.write('<script src="<c:url value='/resources/charisma-master/js/jquery-1.9.0.js'/>"><\/script>');
    }
    var isCommitted = false;//表单是否已经提交标识，默认为false
    function doSubmit() {
        if (isCommitted == false) {
            isCommitted = true;//提交表单后，将表单是否已经提交标识设置为true
            return true;//返回true让表单正常提交
        } else {
            return false;//返回false那么表单将不提交
        }
    }
    document.oncontextmenu = function() {
        return false;
    }
</script>
<!--[if lt IE 9]>

<script src="<c:url value='/resources/charisma-master/js/jquery-1.9.1.min.js'/>"></script>
<![endif]-->
<!--[if IE]>
<![endif]-->
<!--[if !IE]>
<script src="<c:url value='/resources/charisma-master/js/jquery-1.12.1.min.js'/>"></script>
<![endif]-->
<script src="<c:url value='/resources/charisma-master/js/jquery-1.12.1.min.js'/>"></script>
<%--<script src="<c:url value='/resources/DragDrop/drag-drop.js'/>"></script>
<script src="<c:url value='/resources/DragDrop/jquery.dragdrop.js'/>"></script>--%>
<%-- <link href="<c:url value='/resources/icheck/skins/square/blue.css'/>" rel="stylesheet">
<script src="<c:url value='/resources/icheck/icheck.min.js'/>"></script> --%>


<!-- <div class="checkbox checkbox-primary">
<input type="checkbox" class="styled" id="testcheckbox">
<label for="testcheckbox">
test
</label>
</div> -->
<shiro:authenticated>

</shiro:authenticated>

<div class="modal fade" id="commonModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width:800px;">
        <div class="modal-content">

        </div>
    </div>
</div>
<div class="modal" id="commonModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     class="ui-widget-content"
     aria-hidden="true">
    <div class="modal-dialog" style="width:800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="head"></h4>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <a class="btn btn-primary confirm"
                   data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">确定</span></strong></a>
                <a class="btn btn-primary cancel"
                   data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                        class="btntext">取消</span></strong></a>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="nonFooterModal" tabindex="-1" role="dialog" aria-labelledby="nonFooterModalLabel"
     class="ui-widget-content"
     aria-hidden="true">
    <div class="modal-dialog" style="width:800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="head"></h4>
            </div>
            <div class="modal-body">

            </div>
        </div>
    </div>
</div>


<script type="text/html" id="customModalTemplate">
    <div id="customModal">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">×</button>
            <h4 class="head"></h4>
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
            <a class="btn btn-primary confirm"
               data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                    class="btntext">确定</span></strong></a>
            <a class="btn btn-primary cancel"
               data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span
                    class="btntext">取消</span></strong></a>
        </div>
    </div>
</script>
<script type="text/x-jquery-tmpl" id="fileTemplate">
    <div class="col-md-3 onefile">
    <input class="imgid" type="hidden" value="{{= imgid}}">
        <div class="col-md-12">
            <img src="{{= imgsrc}}" class="col-md-5">

            <span class="filename col-md-7">{{= filename}}</span>

        </div>
        <div class="col-md-12 center">
            <input type="hidden" value="{{= fileClass}}">
            <a class="btn btn-primary preview">预览</a>
            <a class="btn btn-danger delete">删除</a>
        </div>
    </div>

</script>
<script type="text/html" id="loadTemplate">
    <div class="mask">
            <div class="center-block maskTipArea">
                <p>
                    <a><img src="<c:url  value="/resources/img/ajax-loaders/loading3.gif"  />"></a>
                    <span class="maskTip"><strong><b>{{= loadTip}}</b></strong></span>
                </p>
            </div>
    </div>
</script>
<script type="text/x-jquery-tmpl" id="imgTemplate">
<div class='row'>
 <div class="col-sm-12 imgdiv" style="background-color: burlywood;overflow: scroll;height: 300px;">
<img id="{{= imgid}}" class="showimg">
 </div>
 </div>
</script>
<script type="text/x-jquery-tmpl" id="dateTipTemplate">
	<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h4>温馨提示</h4>
	</div>
	<div class="modal-body">
		<div class="box-content">
			<p> <span id="datetip" class="datetip">{{= datetip}}</span></p>
		</div>
	</div>
	<div class="modal-footer">
		<a class="btn btn-primary commonConfirm"
		   data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span class="btntext">确定</span></strong></a>
		<a class="btn btn-primary commonCancel"
		   data-dismiss="modal"><strong><i class="glyphicon glyphicon-share-alt"></i> <span class="btntext">取消</span></strong></a>
	</div>
</div>

</script>
<!--<script async="async" type="text/javascript">
dwr.engine.setActiveReverseAjax(true);
dwr.engine.setNotifyServerOnPageUnload(true);
var userId = '${userId}';
MessagePush.onPageLoad(userId);

var showMessage = function(message) {
noty({
text : message,
layout : "top",
type : "success",
timeout : 1000,
});
//alert(message);
}

var updateApplyCheck = function(message){
if($(".hosapplymenu warningcolor")!=[]){
$(".hosapplymenu").append($("<span class='glyphicon glyphicon-exclamation-sign warningcolor'></span>"));
}
}
$.ajaxSetup({
complete : function(xhr) {
if (xhr.getResponseHeader('E_TIMEOUT') == "1") {
//redirect to login
window.location.reload();
}
}
});
</script>-->
<%
    System.out.println(request.getServletPath());
%>