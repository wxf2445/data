<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
</head>

<body>

<hr>
<footer class="center">
    <jsp:useBean id="nowyear" class="java.util.Date"/>
    <%--<p><a href="<c:url value="/home"/>">多协云首页</a> | <a href="<c:url value="/home/contactus"/>">关于我们</a> | <a href="<c:url value="/home/support"/>">技术支持</a> | <a href="<c:url value="/home/serviceprotocol"/>">服务协议</a></p>--%>
    <p class="copyright">&copy; <fmt:formatDate value="${nowyear }" pattern="yyyy"/> <spring:message code="systemname"
                                                                                                     text="Web Sign Co."/>
        <%-- |--%> <a href="http://www.miitbeian.gov.cn/" style="font-size:1.3rem;"></a></p>
</footer>

<script type="text/javascript">
    $(document).ready(function (e) {
        var date = new Date();
        $(".currentyear").text(date.getFullYear());
    });
</script>
</body>
</html>
