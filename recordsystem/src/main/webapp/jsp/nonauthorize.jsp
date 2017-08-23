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
    <!-- The styles -->
    <link id="bs-css" href='<c:url value='/resources/charisma-master/css/bootstrap-cerulean.min.css '/>'
          rel="stylesheet">
    <link href='<c:url value='/resources/css/common/common.css '/>' rel="stylesheet">
</head>

<body>
<%@include file="index/common/common.jsp" %>
<div class="ch-container" style="height: 100%;background: #947474;">
    <div class="blank" style="height: 40%;"></div>
    <div class="row" style="text-align: center;">
        <img src="<c:url value="/resources/images/nonauthority/lock.png" />">
    </div>
    <div class="row" style="text-align: center;">
        <span><b><strong>您无权进入当前页面！</strong></b><a class="btn btn-primary" onclick="window.history.go(-1)">返回上一页</a></span>
    </div>
</div>

<script src='<c:url value='/resources/charisma-master/bower_components/bootstrap/dist/js/bootstrap.min.js'/>'></script>
</body>
</html>
