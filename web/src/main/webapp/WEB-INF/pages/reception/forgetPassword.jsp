<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"></jsp:include>
<div class="container">

    <div class="account_grid">
        <div class=" login-right">
            <h3>REGISTERED CUSTOMERS</h3>
            <p>If you have an account with us, please log in.</p>
            <form action="<%=request.getContextPath()%>/forgetPwd" method="post">
                <input type="hidden" name="status" value="0">

                <div>
                    <span>Email Address<label>*</label></span>
                    <input type="text" value="" name="account">
                </div>
                <div>
                    <span>Password<label>*</label></span>
                    <input type="password" value="" name="password">
                </div>
                <input type="submit" value="Login">
            </form>
        </div>
        <div class=" login-left">
            <h3>NEW CUSTOMERS</h3>
            <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
            <a class="acount-btn" href="register.html">Create an Account</a>
        </div>
        <div class="clearfix"> </div>
    </div>
    <%--菜单导航区域--%>
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
    <div class="clearfix"> </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script>
    var msg="${msg}";
    if(msg!=""){
        alert(msg);
    }
</script>