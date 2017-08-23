<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link href='<c:url value='/resources/css/nav.css'/>' rel="stylesheet">
<style type="text/css">
    .accordion > .nav {
        font-size: smaller;
    }

    ul.collapse li a {
        padding-left: 45px;
    }
</style>


<!-- left menu starts -->
<div class="mynavbarbox">
    <div class="sidebar-nav">
        <div class="nav-canvas">
            <!-- 	<div class="nav-sm nav nav-stacked"></div> -->

            <ul class="nav nav-pills nav-stacked main-menu">
                <%-- <li class="nav-header"><spring:message code="nav.menu.main" text="Main"/></li> --%>
                <shiro:hasAnyRoles name="SUPER ADMIN">
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/recordsearch.png' />"><span> 档案查询
</span></a>
                        <ul class="nav nav-pills nav-stacked collapse ">
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/info/content/search" />"><img alt=""
                                                                                               src="<c:url value='/resources/images/nav/indexsearch.png' />"><span>索引查询
 </span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/recordborrow.png' />"><span>档案借阅

</span></a>
                        <ul class="nav nav-pills nav-stacked collapse">
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/manage" />"><img alt=""
                                                                                         src="<c:url value='/resources/images/nav/borrowapply.png' />"><span>借阅申请

 </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/manage" />"><img alt=""
                                                                                         src="<c:url value='/resources/images/nav/waitapply.png' />"><span>等待审批
 </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/manage" />"><img alt=""
                                                                                         src="<c:url value='/resources/images/nav/borrowedrecord.png' />"><span>待归还实体档案
 </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/manage" />"><img alt=""
                                                                                         src="<c:url value='/resources/images/nav/borrowsendrecord.png' />"><span>借阅归还记录
 </span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/formnonetohouse.png' />"><span> 档案归档</span></a>
                        <ul class="nav nav-pills nav-stacked collapse">
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/document/upload" />"><img alt=""
                                                                                           src="<c:url value='/resources/images/nav/realrecordtypein.png' />"><span>归档数据录入</span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/recordapply/infotype" />"><img alt=""
                                                                                                src="<c:url value='/resources/images/nav/myapply.png' />"><span>信息录入申请</span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/manage" />"><img alt=""
                                                                                         src="<c:url value='/resources/images/nav/fonds.png' />"><span>查看归档数据</span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/recordvolume/create" />"><img alt=""
                                                                                               src="<c:url value='/resources/images/nav/recordintohouse.png' />"><span>组卷</span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/directory/outputsetting" />"><img alt=""
                                                                                                          src="<c:url value='/resources/images/nav/recorddiroutput.png' />"><span>目录输出版面设置</span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/directory/output" />"><img alt=""
                                                                                                   src="<c:url value='/resources/images/nav/recorddiroutput.png' />"><span>档案目录输出</span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/intohouse" />"><img alt=""
                                                                                            src="<c:url value='/resources/images/nav/recordintohouse.png' />"><span>归档入库</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/datamanage.png' />"><span> 数据管理</span></a>
                        <ul class="nav nav-pills nav-stacked collapse">

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/edit" />"><img alt=""
                                                                                       src="<c:url value='/resources/images/nav/recorddataedit.png' />"><span>档案数据编辑</span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/directory/indexoutput" />"><img alt=""
                                                                                                        src="<c:url value='/resources/images/nav/indexdataoutput.png' />"><span>索引数据导出</span></a>
                            </li>

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/files/upload" />"><img alt=""
                                                                                        src="<c:url value='/resources/images/nav/attachment.png' />"><span>附件批量上传</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/usepermsetting.png' />"><span> 用户权限管理
</span></a>
                        <ul class="nav nav-pills nav-stacked collapse">

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/user/manage" />"><img alt=""
                                                                                       src="<c:url value='/resources/images/nav/usermanage.png' />"><span>用户管理
 </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/usergroup/manage" />"><img alt=""
                                                                                            src="<c:url value='/resources/images/nav/usergroup.png' />"><span>用户组设置
 </span></a>
                            </li>

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/role/manage" />"><img alt=""
                                                                                       src="<c:url value='/resources/images/nav/permissionmanage.png' />"><span>权限设置
 </span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/datastructure.png' />"><span> 数据结构设置

</span></a>
                        <ul class="nav nav-pills nav-stacked collapse ">

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/fonds/manage" />"><img alt=""
                                                                                        src="<c:url value='/resources/images/nav/fonds.png' />"><span>全宗管理

 </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/recordtype/manage" />"><img alt=""
                                                                                             src="<c:url value='/resources/images/nav/recordtype.png' />"><span>档案类型管理
 </span></a>
                            </li>

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/template/manage" />"><img alt=""
                                                                                           src="<c:url value='/resources/images/nav/datatemmanage.png' />"><span>数据模版管理

                                </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/dictionary/manage" />"><img alt=""
                                                                                             src="<c:url value='/resources/images/nav/datadictionary.png' />"><span>数据字典管理

                                </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/generaldata/manage" />"><img alt=""
                                                                                              src="<c:url value='/resources/images/nav/tree.png' />"><span>通用数据维护

                                </span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/recordstorehouse.png' />"><span>档案库房管理

</span></a>
                        <ul class="nav nav-pills nav-stacked collapse">

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/storehouse/manage" />"><img alt=""
                                                                                             src="<c:url value='/resources/images/nav/housesetting.png' />"><span>库房设置

 </span></a>
                            </li>
                                <%--<li class=""><a class="ajax-link"
                                                href="<c:url value="/recordtype/manage" />"><img alt=""
                                                                                                 src="<c:url value='/resources/images/nav/recordtype.png' />"><span>档案柜、架设置

     </span></a>
                                </li>

                                <li class=""><a class="ajax-link"
                                                href="<c:url value="/cabinet/manage" />"><img alt=""
                                                                                             src="<c:url value='/resources/images/nav/tree.png' />"><span>档案实体位置管理

                                    </span></a>
                                </li>
                                <li class=""><a class="ajax-link"
                                                href="<c:url value="/enviroment/manage" />"><img alt=""
                                                                                             src="<c:url value='/resources/images/nav/tree.png' />"><span>温、湿度记录

                                    </span></a>
                                </li>--%>
                        </ul>
                    </li>
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/systemmanage.png' />"><span>系统管理
</span></a>
                        <ul class="nav nav-pills nav-stacked collapse">

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/password/modify" />"><img alt=""
                                                                                           src="<c:url value='/resources/images/nav/passwordmodify.png' />"><span>密码修改

 </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/log/manage" />"><img alt=""
                                                                                      src="<c:url value='/resources/images/nav/operatorlog.png' />"><span>操作日志
 </span></a>
                            </li>

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/site/remainder" />"><img alt=""
                                                                                          src="<c:url value='/resources/images/nav/siteinform.png' />"><span>站内通告
                                </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/site/email" />"><img alt=""
                                                                                      src="<c:url value='/resources/images/nav/siteemail.png' />"><span>站内邮件




                                </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/server/settings" />"><img alt=""
                                                                                           src="<c:url value='/resources/images/nav/serversetting.png' />"><span>服务器设置

                                </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/backup" />"><img alt=""
                                                                                  src="<c:url value='/resources/images/nav/backup.png' />"><span>备份设置及管理

                                </span></a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasAnyRoles>

                <shiro:hasAnyRoles name="USER">
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/recordsearch.png' />"><span> 档案查询
</span></a>
                        <ul class="nav nav-pills nav-stacked collapse ">
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/info/content/search" />"><img alt=""
                                                                                               src="<c:url value='/resources/images/nav/indexsearch.png' />"><span>索引查询
 </span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/recordborrow.png' />"><span>档案借阅

</span></a>
                        <ul class="nav nav-pills nav-stacked collapse">
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/manage" />"><img alt=""
                                                                                         src="<c:url value='/resources/images/nav/borrowapply.png' />"><span>借阅申请

 </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/manage" />"><img alt=""
                                                                                         src="<c:url value='/resources/images/nav/waitapply.png' />"><span>等待审批
 </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/manage" />"><img alt=""
                                                                                         src="<c:url value='/resources/images/nav/borrowedrecord.png' />"><span>待归还实体档案
 </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/manage" />"><img alt=""
                                                                                         src="<c:url value='/resources/images/nav/borrowsendrecord.png' />"><span>借阅归还记录
 </span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/formnonetohouse.png' />"><span> 档案归档</span></a>
                        <ul class="nav nav-pills nav-stacked collapse">
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/document/upload" />"><img alt=""
                                                                                           src="<c:url value='/resources/images/nav/realrecordtypein.png' />"><span>归档数据录入</span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/recordapply/myapply" />"><img alt=""
                                                                                               src="<c:url value='/resources/images/nav/fonds.png' />"><span>我的申请</span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/manage" />"><img alt=""
                                                                                         src="<c:url value='/resources/images/nav/fonds.png' />"><span>查看归档数据</span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/direcotry/output" />"><img alt=""
                                                                                                   src="<c:url value='/resources/images/nav/recorddiroutput.png' />"><span>目录输出版面设置</span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/direcotry/output" />"><img alt=""
                                                                                                   src="<c:url value='/resources/images/nav/recorddiroutput.png' />"><span>档案目录输出</span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/recordvolume/create" />"><img alt=""
                                                                                               src="<c:url value='/resources/images/nav/recordintohouse.png' />"><span>归档入库</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/datamanage.png' />"><span> 数据管理</span></a>
                        <ul class="nav nav-pills nav-stacked collapse">

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/edit" />"><img alt=""
                                                                                       src="<c:url value='/resources/images/nav/recorddataedit.png' />"><span>档案数据编辑</span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/record/index/export" />"><img alt=""
                                                                                               src="<c:url value='/resources/images/nav/indexdataoutput.png' />"><span>索引数据导出</span></a>
                            </li>

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/files/upload" />"><img alt=""
                                                                                        src="<c:url value='/resources/images/nav/attachment.png' />"><span>附件批量上传</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/usepermsetting.png' />"><span> 用户权限管理
</span></a>
                        <ul class="nav nav-pills nav-stacked collapse">

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/user/manage" />"><img alt=""
                                                                                       src="<c:url value='/resources/images/nav/usermanage.png' />"><span>用户管理
 </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/usergroup/manage" />"><img alt=""
                                                                                            src="<c:url value='/resources/images/nav/usergroup.png' />"><span>用户组设置
 </span></a>
                            </li>

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/role/manage" />"><img alt=""
                                                                                       src="<c:url value='/resources/images/nav/permissionmanage.png' />"><span>权限设置
 </span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/datastructure.png' />"><span> 数据结构设置

</span></a>
                        <ul class="nav nav-pills nav-stacked collapse ">

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/fonds/manage" />"><img alt=""
                                                                                        src="<c:url value='/resources/images/nav/fonds.png' />"><span>全宗管理

 </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/recordtype/manage" />"><img alt=""
                                                                                             src="<c:url value='/resources/images/nav/recordtype.png' />"><span>档案类型管理
 </span></a>
                            </li>

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/template/manage" />"><img alt=""
                                                                                           src="<c:url value='/resources/images/nav/datatemmanage.png' />"><span>数据模版管理

                                </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/dictionary/manage" />"><img alt=""
                                                                                             src="<c:url value='/resources/images/nav/datadictionary.png' />"><span>数据字典管理

                                </span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/recordstorehouse.png' />"><span>档案库房管理

</span></a>
                        <ul class="nav nav-pills nav-stacked collapse">

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/storehouse/manage" />"><img alt=""
                                                                                             src="<c:url value='/resources/images/nav/housesetting.png' />"><span>库房设置

 </span></a>
                            </li>
                                <%--<li class=""><a class="ajax-link"
                                                href="<c:url value="/recordtype/manage" />"><img alt=""
                                                                                                 src="<c:url value='/resources/images/nav/recordtype.png' />"><span>档案柜、架设置

     </span></a>
                                </li>

                                <li class=""><a class="ajax-link"
                                                href="<c:url value="/cabinet/manage" />"><img alt=""
                                                                                             src="<c:url value='/resources/images/nav/tree.png' />"><span>档案实体位置管理

                                    </span></a>
                                </li>
                                <li class=""><a class="ajax-link"
                                                href="<c:url value="/enviroment/manage" />"><img alt=""
                                                                                             src="<c:url value='/resources/images/nav/tree.png' />"><span>温、湿度记录

                                    </span></a>
                                </li>--%>
                        </ul>
                    </li>
                    <li class="accordion"><a class="ajax-link" href="#"><img alt=""
                                                                             src="<c:url value='/resources/images/nav/systemmanage.png' />"><span>系统管理
</span></a>
                        <ul class="nav nav-pills nav-stacked collapse">

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/password/modify" />"><img alt=""
                                                                                           src="<c:url value='/resources/images/nav/passwordmodify.png' />"><span>密码修改

 </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/operotor" />"><img alt=""
                                                                                    src="<c:url value='/resources/images/nav/operatorlog.png' />"><span>操作日志
 </span></a>
                            </li>

                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/site/remainder" />"><img alt=""
                                                                                          src="<c:url value='/resources/images/nav/siteinform.png' />"><span>站内通告
                                </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/site/email" />"><img alt=""
                                                                                      src="<c:url value='/resources/images/nav/siteemail.png' />"><span>站内邮件




                                </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/server/settings" />"><img alt=""
                                                                                           src="<c:url value='/resources/images/nav/serversetting.png' />"><span>服务器设置

                                </span></a>
                            </li>
                            <li class=""><a class="ajax-link"
                                            href="<c:url value="/backup" />"><img alt=""
                                                                                  src="<c:url value='/resources/images/nav/backup.png' />"><span>备份设置及管理

                                </span></a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasAnyRoles>


            </ul>
        </div>
    </div>
</div>
<!--/span-->
<!-- left menu ends -->

<noscript>
    <div class="alert alert-block col-md-12">
        <h4 class="alert-heading">Warning!</h4>

        <p>
            You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
                                target="_blank">JavaScript</a> enabled to use this site.
        </p>
    </div>
</noscript>

<script type="text/javascript">
    var oldnavid = document.cookie;
    if (oldnavid != null) {
        oldnavid = oldnavid.split("=")[1];
        if (oldnavid == '') {
            $(".devicemonitornav").find("li:first").addClass("active");
            document.cookie = "navid="
                    + $(".devicemonitornav").find("li:first").attr("id");
        } else {
            var navid = '${navid}';
            if (oldnavid == navid) {
                $(".main-menu").find(".active").removeClass("active");
                $("#" + navid).addClass("active");
            } else {
                document.cookie = "navid=" + navid;
            }
        }
    }
</script>

