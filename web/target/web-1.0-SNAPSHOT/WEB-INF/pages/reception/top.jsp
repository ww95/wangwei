<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link href="<%=request.getContextPath()%>/reception/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!--theme-style-->
    <link href="<%=request.getContextPath()%>/reception/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!--//fonts-->
    <script src="<%=request.getContextPath()%>/reception/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/reception/js/jquery.easydropdown.js"></script>
    <!--script-->
</head>
<body>
<!--header-->
<div class="header">
    <div class="top-header">
        <div class="container">
            <div class="top-header-left">
                <ul class="support">
                    <li><a href="#"><label> </label></a></li>
                    <li><a href="#">24x7 在线<span class="live"> support</span></a></li>
                </ul>
                <ul class="support">
                    <li class="van"><a href="#"><label> </label></a></li>
                    <li><a href="#">Free shipping <span class="live">on order over 500</span></a></li>
                </ul>
                <div class="clearfix"> </div>
            </div>
            <div class="top-header-right">
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="bottom-header">
        <div class="container">
            <div class="header-bottom-left">
                <div class="logo">
                    <a href="index.html"><img src="<%=request.getContextPath()%>/reception/images/logo.png" alt=" " /></a>
                </div>
                <div class="search">
                    <form action="<%=request.getContextPath()%>/sreach">
                        <input type="text" name="search" value="${sreach}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" >
                        <input type="submit"  value="SEARCH">
                    </form>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="header-bottom-right">
                <ul class="men-grid">
                    <c:if test="${username==null}">
                        <li class="login"><a href="${pageContext.request.contextPath}/toLogin"><span> </span>LOGIN</a></li>
                        <li class="cart"><a href="${pageContext.request.contextPath}/toLogin"><span> </span>CART</a></li>
                        <div class="sign-up-right">
                            <a href="${pageContext.request.contextPath}/toRegister">SIGNUP</a>
                        </div>
                    </c:if>
                    <c:if test="${username!=null}">
                        <li><a href="${pageContext.request.contextPath}/username/self"><span> </span>${username.account}</a></li>
                        <li class="cart"><a href="<%=request.getContextPath()%>/username/self-car"><span> </span>CART</a></li>
                        <div class="sign-up-right">
                            <a href="${pageContext.request.contextPath}/username/logout">LOGOUT</a>
                        </div>
                    </c:if>

                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!---->