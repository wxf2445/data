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
    <title><spring:message code="company"
                           text="Hang Zhou SLuan Technology Co."/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link id="bs-css" href='<c:url value="/resources/css/homeheader.css"/>' rel="stylesheet"/>
    <%--<script type="text/javascript" src="<c:url value="/resources/js/loading.js" />"></script>--%>
</head>
<body>
<div style="min-width:1200px;">
    <div class="container-fluid">
        <div class="navbar navbar-default mynavbar row">
            <div class="navbar-header newbrand">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div id="navbar" class="navbar-collapse collapse" aria-expanded="false"
                 style="background-color: rgba(0,0,0,.075);">
                <div class="newbrand col-lg-1 col-md-1 col-sm-1 col-xs-1 col-sm-offset-1 homeheader-padl"
                     style="padding-right:0px;text-align:left;">
                    <a href="<c:url value='/login'/>">
                        <img src="<c:url value="/resources/images/website.png"  />"
                             style="max-width:80%!important;font-size:14px;"/>
                    </a>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 log-message-div">
                    <strong class="log-message"><spring:message code="title_log_message" text="system"/></strong>
                </div>
                <%--<div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-3 col-lg-3 col-md-3 col-sm-3 col-xs-3 right homeheader-padr">
                    <a href="<c:url value="/login"/>" class="small-blue-font">
                        <spring:message code="welcome.to.platform" text="Platform entrance"></spring:message>
                    </a>
                    &nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#" class="small-blue-font" id="sequ">
                        <spring:message code="welcome.to.community" text="Community entrance"></spring:message>
                    </a>
                </div>--%>
                <%--<ul class="col-lg-9 col-md-9 col-sm-9 col-xs-9 nav navbar-nav inline  mymenu menu homeheader-padl" style="margin-left:0px !important;margin-right:0px !important;">
                    <li class="${param.menu eq '0' ?'active':'' } "><a href="<c:url value="/home"/>" class="header-a black-font"><spring:message  code="home" text="Home" /></a>
                    <li class="${param.menu eq '1' ?'active':'' }"><a href="<c:url value="/home/productintroduce"/>" class="header-a black-font"><spring:message  code="nav.menu.product" text="Product Presentation" /></a>
                        <ul class="unstyled myhomeul">
                            <li><a href="<c:url value="/home/productintroducedetails-tab-13" />">温湿度变送器</a></li>
                            <li><a href="<c:url value="/home/productintroducedetails-tab-10" />">GPRS智能温度保温箱</a></li>
                            <li><a href="<c:url value="/home/productintroducedetails-tab-11" />">冷链车监控仪</a></li>
                            <li><a href="<c:url value="/home/productintroducedetails-tab-12" />">冷库温湿度监控仪</a></li>
                            <li><a href="<c:url value="/home/productintroducedetails-tab-12-2" />">冷柜温湿度监控仪</a></li>
                            <li><a href="<c:url value="/home/productintroducedetails-tab-10-2" />">蓝牙智能温度保温箱</a></li>
                            <li><a href="<c:url value="/home/productintroducedetails-tab-14" />">便携式记录仪</a></li>
                        </ul>
                    </li>
                    <li class="${param.menu eq '6' ?'active':'' }"><a href="<c:url value="/home/solution"/>" class="header-a black-font">解决方案</a>
                        <ul class="unstyled myhomeul">
                            <li><a class="solutiontitle" href="<c:url value="/home/solutiondetails?type=car" />">冷链车监测方案</a></li>
                            <li><a class="solutiontitle" href="<c:url value="/home/solutiondetails?type=box" />">智能保温箱方案</a></li>
                            <li><a class="solutiontitle" href="<c:url value="/home/solutiondetails?type=gui" />">冷库/柜方案</a></li>
                            <li><a class="solutiontitle" href="<c:url value="/home/solutiondetails?type=jilu" />">便携式记录仪方案</a></li>
                        </ul>
                    </li>
                    <li class="${param.menu eq '5' ?'active':'' }"><a href="<c:url value="/home/support"/>" class="header-a black-font">技术支持</a></li>
                    <li class="${param.menu eq '3' ?'active':'' }"><a href="<c:url value="/home/newslist"/>" class="header-a black-font">新闻资讯</a></li>
                    <li class="${param.menu eq '4' ?'active':'' }"><a href="<c:url value="/home/contactus"/>" class="header-a black-font">关于我们</a></li>
                    <li class="${param.menu eq '7' ?'active':'' }"><a href="#" class="header-a black-font" id="market">多协商城</a></li>
                </ul>--%>
                <%--<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 homeheader-padr">
                    <div class="input-group paddings">
                        <input type="text" id="condition" class="form-control border-blue home-input"
                               style="padding:6px 12px; border-bottom-left-radius: 20px;border-top-left-radius: 20px;"
                               placeholder="关键字">
							<span class="input-group-btn myhearder-button">
			        			<button class="btn btu-default nav-btu " onclick="search()" type="button"
                                        style="margin-top:0px;width:50px;border-bottom-right-radius: 20px;border-top-right-radius: 20px;">
                                    <span class="glyphicon glyphicon-search"></span></button>
			      			</span>
                    </div><!-- /input-group -->
                </div>--%>
            </div>
            <!-- /nav.span6 [MainNavigation] -->
        </div>
        <!-- /.row [Logo, MainNavigation] -->
    </div>
    <!-- /.container -->
</div>
<!-- /.mainNav -->
<!-- /header -->
<div class="developer-backshadow"></div>
<div class="developer">
    <div class="developer-floater"></div>
    <div class=" center">
        <div class="developer-content">
            <h2 class="title developer-message">"功能建设中，敬请期待..."</h2>
        </div>
    </div>
</div>
<script src="<c:url value="/resources/charisma-master/bower_components/jquery/jquery.min.js"/>"></script>
<script>
    function search() {
        /*var url = "http://www.baidu.com/baidu";
         var condition = $("#condition").val();
         url = url + "?tn=baidu&wd=site:websystem.com " + condition;
         window.open(url);*/
    }
    $(function () {
        $("#sequ").click(function () {
            $(".developer-backshadow").show();
            $(".developer").show();
        });
        $("#market").click(function () {
            $(".developer-backshadow").show();
            $(".developer").show();
        });
        $(".developer").click(function () {
            $(".developer").hide();
            $(".developer-backshadow").hide();

        });
    })
</script>


</body>
</html>