<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>欢迎使用网站后台管理系统</title>
    <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme" />
    <meta name="description" content="AbsoluteAdmin - A Responsive HTML5 Admin UI Framework">
    <meta name="author" content="AbsoluteAdmin">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/theme.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin-forms.css">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body class="external-page external-alt sb-l-c sb-r-c">
<div id="main" class="animated fadeIn">
    <section id="content_wrapper">
        <section id="content">
            <div class="admin-form theme-info mw500" id="login">
                <div class="content-header">
                    <h1> Book</h1>
                    <p class="lead">欢迎使用图书网站后台管理管理系统</p>
                </div>
                <div class="panel mt30 mb25">

                    <form method="post" action="${pageContext.request.contextPath}/backstage/login" id="contact">
                        <%--1表示后台管理用户--%>
                        <input type="hidden" name="status" id="status" value="1"/>
                        <div class="panel-body bg-light p25 pb15">
                            <div class="section">
                                <label for="account" class="field-label text-muted fs18 mb10">账号</label>
                                <label for="account" class="field prepend-icon">
                                    <input type="text" name="account" id="account" class="gui-input" placeholder="请输入账号...">
                                    <label for="account" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="section">
                                <label for="password" class="field-label text-muted fs18 mb10">密码</label>
                                <label for="password" class="field prepend-icon">
                                    <input type="password" name="password" id="password" class="gui-input" placeholder="请输入密码...">
                                    <label for="password" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                </label>
                            </div>
                        </div>

                        <div class="panel-footer clearfix">
                            <button type="submit" class="button btn-primary mr10 pull-right" id="submit" onclick="return login()">登陆</button>
                            <label class="switch ib switch-primary mt10">
<%--                                <input type="checkbox" name="remember" id="remember" checked>--%>
<%--                                <label for="remember" data-on="是" data-off="否"></label>--%>
<%--                                <span>记住我</span>--%>
                            </label>
                            <%--<input type="checkbox" name="remember" id="remember">--%>
                            <%--<span>记住我</span>--%>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </section>
</div>
<script>
    var msg = "${msg}";
    if(msg!=""){
        alert(msg);
    }
    function login() {
        var flag = true;
        var accountRegex = /[a-zA-Z0-9!@#$%^&*()]{5,12}/;
        var psswordRegex = /[a-zA-Z0-9!@#$%^&*()]{5,12}/;
        if(!accountRegex.test(document.getElementById("account").value)||!psswordRegex.test(document.getElementById("password").value)){
            alert("用户名或密码格式输入错误，请重新输入")
            flag = false;
        }
        // alert(flag)
        return flag;
    }
</script>
</body>
</html>