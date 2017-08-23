<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmtutc" uri="/tags/utcdate" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir="ltr">
<head>

    <title><%-- ${information.title } --%></title>

    <script type="text/javascript">
        document.oncontextmenu = function() {
            return false;
        }
        window.onload=function(){
            if (!!window.ActiveXObject || "ActiveXObject" in window) {
            	document.getElementById("img_div").style.width="100%";
            	document.getElementById("img_div").style.height="100%";
            	document.getElementById("img_div").style.overflow="scroll";
            }
      }
    </script>
</head>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
String url = request.getParameter("url");//用request得到 
%> 
<body tabindex="1">
<div id="img_div">
	<img class="image"/>
</div>
</body>
</html>
