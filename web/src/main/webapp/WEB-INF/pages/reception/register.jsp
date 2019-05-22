<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"></jsp:include>
<div class="container">

    <div class="register">
        <form action="/register" method="post">
            <input type="hidden" name="status" value="0">
            <div class="  register-top-grid">
                <h3>PERSONAL INFORMATION</h3>
                <div class="mation">
                    <span>用户名<label>*</label></span>
                    <input type="text" id="account" onchange="return userSubmit()" name="account">
                    <span id="account-span" style="color: red"></span>
                    <span>用户昵称<label>*</label></span>
                    <input type="text" id="ninkName" name="ninkName">

                    <span>密码<label>*</label></span>
                    <input type="password" id="password" onchange="return dataSubmit()" name="password">
                    <span id="password-span" style="color: red"></span>
                    <span>确认密码<label>*</label></span>
                    <input type="password" id="newPassword" onchange="return repwdSubmit()" name="newPassword">
                    <span id="newPassword-span" style="color: red"></span>
                </div>
                <script>
                    var flag = true;
                    var account = document.getElementById("account");
                    var password = document.getElementById("password");
                    var newPassword = document.getElementById("newPassword");
                    var accountRegex = /^[a-zA-Z0-9_-]{5,16}$/;
                    function dataSubmit() {
                        if(!accountRegex.test(password.value)){
                            document.getElementById("password-span").innerText="密码格式输入错误，请重新输入,格式为数字，字母，!@#$%^&*()5-12位";
                            flag = false;
                        }else{
                            document.getElementById("password-span").innerText="";
                        }
                        return flag;
                    }
                    function userSubmit() {
                        if(!accountRegex.test(account.value)){
                            document.getElementById("account-span").innerText="密码格式输入错误，请重新输入,格式为数字，字母，!@#$%^&*()5-12位";
                            flag = false;
                        }else{
                            document.getElementById("account-span").innerText="";
                        }
                        return flag;
                    }
                    function repwdSubmit() {
                        if(!accountRegex.test(newPassword.value)){
                            document.getElementById("newPassword-span").innerText="密码格式输入错误，请重新输入,格式为数字，字母，!@#$%^&*()5-12位";
                            flag = false;
                        }else{
                            document.getElementById("newPassword-span").innerText="";
                        }
                        return flag;
                    }
                </script>
                <div class="clearfix"> </div>
<%--                <a class="news-letter" href="#">--%>
<%--                    <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Sign Up</label>--%>
<%--                </a>--%>
            </div>
            <div class="login-right">
                    <input type="submit" value="用户注册">
                    <div class="clearfix"> </div>
            </div>
        </form>
        <div class="clearfix"> </div>
        <div class="register-but">
            <form>
<%--                <input type="submit" value="submit">--%>
                <div class="clearfix"> </div>
            </form>
        </div>
    </div>
    <div class="sub-cate">
        <div class=" top-nav rsidebar span_1_of_left">
            <h3 class="cate">CATEGORIES</h3>
            <ul class="menu">
                <c:forEach items="${root.children}" var="cata1"><li class="item1"><a href="#">${cata1.title}<img class="arrow-img" src="<%=request.getContextPath()%>/reception/images/arrow1.png" alt=""/> </a>
                    <ul class="cute">
                        <c:forEach items="${cata1.children}" var="cata2">
                            <li class="subitem1"><a href="<%=request.getContextPath()%>/sreachByType?id=${cata2.id}">${cata2.title} </a></li>
                        </c:forEach>
                    </ul>
                </li>
                </c:forEach>
            </ul>
        </div>
        <!--initiate accordion-->
        <script type="text/javascript">
            $(function() {
                var menu_ul = $('.menu > li > ul'),
                    menu_a  = $('.menu > li > a');
                menu_ul.hide();
                menu_a.click(function(e) {
                    e.preventDefault();
                    if(!$(this).hasClass('active')) {
                        menu_a.removeClass('active');
                        menu_ul.filter(':visible').slideUp('normal');
                        $(this).addClass('active').next().stop(true,true).slideDown('normal');
                    } else {
                        $(this).removeClass('active');
                        $(this).next().stop(true,true).slideUp('normal');
                    }
                });

            });
        </script>
        <div class=" chain-grid menu-chain">
            <a href="${pageContext.request.contextPath}/detail?bid=${hot.bId}"><img class="img-responsive chain" src="<%=request.getContextPath()%>${hot.bPath}" alt=" " /></a>
            <div class="grid-chain-bottom chain-watch">
                <span class="actual dolor-left-grid">${hot.bName}</span>
                <h6>${hot.bInfo}</h6>
            </div>
        </div>
        <a class="view-all all-product" href="<%=request.getContextPath()%>/getBooksAll">查看所有<span> </span></a>
    </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script>
    var msg = "${msg}";
    if(msg!=""){
        alert(msg);
    }
</script>