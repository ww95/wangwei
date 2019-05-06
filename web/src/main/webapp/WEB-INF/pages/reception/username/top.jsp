<%@ page import="com.wangwei.bean.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.wangwei.bean.Account" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户个人信息中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/theme.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin-forms.css">
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
                <H3>用户个人信息中心</H3>
            </a>
            <span id="toggle_sidemenu_l" class="ad ad-lines"></span>
        </div>
    </header>
    <aside id="sidebar_left" class="nano nano-light affix">
        <div class="sidebar-left-content nano-content">
            <header class="sidebar-header">
                <div class="sidebar-widget author-widget">
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
                <li class="sidebar-label pt20">个人中心</li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/username/toInfoManage">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">信息管理</span>
                    </a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/username/toupdatePwd">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">修改密码</span>
                    </a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/index">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">返回</span>
                    </a>
                </li>
                <li class="sidebar-label pt20">图书管理</li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/username/self">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">订单中心</span>
                    </a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/username/self-car">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">购物车</span>
                    </a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/username/self-collection">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">收藏中心</span>
                    </a>
                </li>
                </li>
            </ul>
            <div class="sidebar-toggle-mini">
                <a href="login.html">
                    <span class="fa fa-sign-out"></span>
                </a>
            </div>
        </div>
    </aside>
