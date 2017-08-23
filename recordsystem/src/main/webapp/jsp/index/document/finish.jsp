<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script src="<c:url value='/resources/charisma-master/js/jquery-1.12.1.min.js'/>"></script>
<script src="<c:url value='/resources/js/common/common.js'/>"></script>
<%
    System.out.println(request.getParameter("test"));
    System.out.println("resourcePath:" + request.getAttribute("resourcePath"));
    System.out.println(request.getAttribute("localpath"));
    System.out.println(request.getAttribute("filesuffix"));
    System.out.println(request.getContextPath());
%>
<script type="text/javascript">
    var resourcePath = '<%=request.getAttribute("resourcePath")%>';
    var localpath = '<%=request.getAttribute("localpath")%>';
    var suffix = '<%=request.getAttribute("filesuffix")%>';
    var root = '<%=request.getContextPath()%>';
    var ready = '<%=request.getAttribute("ready")%>';
    var prepath = root + "/" + resourcePath;
    console.info("resourcepath:" + resourcePath);
    console.log(localpath);
    console.log(prepath);
    console.log(ready);
    var file_size = 0;
    var avi_setInterval;
    function checkavi(path){
        $.post("<c:url value="/document/checkavi"  />", {path: path}, function (data, s, xh) {
        	if(file_size == data.file_size){
        		window.clearInterval(avi_setInterval);
        		window.parent.showVideo("/" + path);
                $(".preview.disabled",window.parent.document).html("预览");
                $(".preview.disabled",window.parent.document).removeClass("disabled");
        		return ;
        	}
        	file_size = data.file_size;
        });
    }
    $(window.parent.document).find(".filepreviewarea").empty();
    var pre = "";
    if ($.inArray(suffix, PdfExtension) != -1 || $.inArray(suffix, OfficeExtension) != -1) {
        pre = $("<iframe id='tempiframe' name='tempiframe' src='" + prepath + "' width='100%'height='500px'> </iframe>");
        $(window.parent.document).find(".filepreviewarea").append(pre);
        //$(".filepreviewarea iframe#tempiframe").attr("src","<c:url value='/jsp/pdf.jsp'/>?url="+fullpath);
        console.log(window.parent.document.getElementById('tempiframe'));
        //var thisnum = window.parent.document.getElementById('tempiframe').contentWindow.getAllPage();
        //var allnum = $(window.parent.document).find("#pagenum").val();
        //$(window.parent.document).find("#pagenum").val(allnum+thisnum);
        window.parent.document.getElementById('tempiframe').src = "<c:url value='/jsp/pdf.jsp'/>?url=" + resourcePath;
    } else if ($.inArray(suffix, ImgExtension) != -1) {
        pre = $("<div class='row center' style='width: 100%;height:500px'> <img src='<c:url value='/file/openfile'/>?filepath=" + resourcePath + "'> </div>");
        $(window.parent.document).find(".filepreviewarea").append(pre);
    } else if ($.inArray(suffix, VideoExtension) != -1) {
    	if(resourcePath == undefined){
    		alert("缺失ffmpeg.exe文件,请联系管理员！");
    	}
    	var file_suffix = resourcePath.substring(resourcePath.lastIndexOf('.'),resourcePath.length);
    	if( file_suffix == '.avi' || file_suffix == '.mov'){
    		if(ready == 'true'){
        		window.parent.showVideo("/" + resourcePath);
    		}else{
        		window.parent.showVideo("/" + resourcePath);
        		avi_setInterval = setInterval("checkavi('"+resourcePath+"')",5000);
       		}
    	}else{

            $(".preview.disabled",window.parent.document).html("预览");
            $(".preview.disabled",window.parent.document).removeClass("disabled");
        	window.parent.showVideo("/" + resourcePath);
    	}
    	
    	//alert(resourcePath);
    	
    }else if($.inArray(suffix, MusicEXtension) != -1){
    	 window.parent.showMusic("/" + resourcePath);
    }
</script>
</body>
</html>
