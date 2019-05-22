<%@ page import="com.wangwei.bean.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.wangwei.bean.Account" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>欢迎使用图书后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/theme.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin-forms.css">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body class="admin-validation-page" data-spy="scroll" data-target="#nav-spy" data-offset="200">
<div id="main">
    <header class="navbar navbar-fixed-top navbar-shadow">
        <div class="navbar-branding">
            <a class="navbar-brand" href="../index.html">
                <H3>图书后台管理系统</H3>
            </a>
            <span id="toggle_sidemenu_l" class="ad ad-lines"></span>
        </div>
    </header>
    <aside id="sidebar_left" class="nano nano-light affix">
        <div class="sidebar-left-content nano-content">
            <header class="sidebar-header">
                <div class="sidebar-widget author-widget">
                    <div class="media">
                        <a class="media-left" href="#">
                            <img src="<%=request.getContextPath()%>/images/head.jpg" class="img-responsive">
                        </a>
                        <div class="media-body">
                            <div class="media-author">${account.ninkName}</div>
                            <div class="media-links">
                                <a href="${pageContext.request.contextPath}/backstage/admin/logout">退出</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar-widget search-widget hidden">
                    <div class="input-group">
                        <span class="input-group-addon">
                        <i class="fa fa-search"></i>
                        </span>
                        <input type="text" id="sidebar-search" class="form-control" placeholder="Search...">
                    </div>
                </div>
            </header>
            <ul class="nav sidebar-menu">
                <li class="sidebar-label pt20">图书管理</li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/backstage/admin/books-list">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">图书列表</span>
                    </a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/backstage/admin/books-toAdd">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">图书上架</span>
                    </a>
                </li>
                <li class="sidebar-label pt20">图书分类管理</li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/backstage/admin/catalog-list">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">图书分类列表</span>
                    </a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/backstage/admin/catalog-toAdd">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">添加图书分类</span>
                    </a>
                </li>
                <li class="sidebar-label pt20">个人信息中心</li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/backstage/admin/update-self">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">修改信息</span>
                    </a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/backstage/admin/update-password">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">修改密码</span>
                    </a>
                </li>
                <li class="sidebar-label pt20">订单管理中心</li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/backstage/admin/order">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">订单管理</span>
                    </a>
                </li>
                <li class="sidebar-label pt20">统计功能</li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/backstage/admin/self-all">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">数据统计</span>
                    </a>
                </li>
                <li class="sidebar-label pt20">用户管理</li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/backstage/admin/user-manager">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">用户列表</span>
                    </a>
                </li>
            </ul>
            <div class="sidebar-toggle-mini">
<%--                <a href="login.html">--%>
<%--                    <span class="fa fa-sign-out"></span>--%>
<%--                </a>--%>
            </div>
        </div>
    </aside>
