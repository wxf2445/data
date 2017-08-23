<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

</head>

<body>
<shiro:guest>
    <script>
        location.href = '<c:url value="/login" />';
    </script>
</shiro:guest>
<shiro:user>
    <script>
        location.href = '<c:url value="/admin/index" />';
    </script>
    <%--<shiro:hasAnyRoles name="USER">
        <script>
            location.href = '<c:url value="/admin/index" />';
        </script>
    </shiro:hasAnyRoles>
    <shiro:hasRole name="SUPER ADMIN">
        <script>
            location.href = '<c:url value="/admin/index" />';
        </script>
    </shiro:hasRole>--%>
</shiro:user>
</body>
</html>
