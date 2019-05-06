<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="top.jsp"></jsp:include>
<div class="container">

    <div class=" single_top">
        <div class="single_grid">
            <div class="grid images_3_of_2">
                <ul id="etalage">
                    <li>
                            <img class="etalage_thumb_image" src="${pageContext.request.contextPath}${book.bPath}" style="width: 360px;height: 480px;" class="img-responsive" />
                    </li>
                </ul>
                <div class="clearfix"> </div>
            </div>
            <div class="desc1 span_3_of_2">
                <ul class="back">
                    <li><i class="back_arrow"> </i>点击立即返回<a href="${pageContext.request.contextPath}/index">首页</a></li>
                </ul>
                <h1>书籍：${book.bName}</h1>
                <h1>作者：${book.bCreate}</h1>
                <ul class="price_single">
                    <li class="head"><h2>价格：￥<fmt:formatNumber value="${book.bPrice*book.zhekou}" type="number"></fmt:formatNumber> </h2></li>
                    <c:if test="${book.bNumber!=0}">
                    <li class="head"><h2>库存:${book.bNumber}</h2></li>
                    </c:if>
                    <c:if test="${book.bNumber==0}">
                        <li class="head"><h2>图书已卖完</h2></li>
                    </c:if>
                    <div class="clearfix"> </div>
                </ul>
                <p>${book.bInfo}</p>
                <c:if test="${username != null}">
                    <c:if test="${carBook==null}">
                        <a href="<%=request.getContextPath()%>/username/addCar?id=${book.bId}" class="now-get">添加购物车</a>
                    </c:if>
                    <c:if test="${carBook!=null}">
                        <a href="<%=request.getContextPath()%>/username/reAddCar?id=${book.bId}&carid=${carBook.id}" class="now-get">已添加购物车</a>
                    </c:if>
                <a href="<%=request.getContextPath()%>/username/toBuyBook?id=${book.bId}" class="now-get">购买图书</a>
                    <c:if test="${collection==null}">
                        <a href="<%=request.getContextPath()%>/username/collecttion?id=${book.bId}" class="now-get">收藏图书</a>
                    </c:if>
                    <c:if test="${collection!=null}">
                        <a href="<%=request.getContextPath()%>/username/recollecttion?id=${collection.id}&bid=${book.bId}" class="now-get">已收藏图书</a>
                    </c:if>

                </c:if>
                <c:if test="${username == null}">
                    <a href="<%=request.getContextPath()%>/toLogin" class="now-get">添加购物车</a>
                    <a href="<%=request.getContextPath()%>/toLogin" class="now-get">购买图书</a>
                    <a href="<%=request.getContextPath()%>/toLogin" class="now-get">收藏图书</a>
                </c:if>
            </div>
            <div class="clearfix"> </div>
        </div>
        <ul id="flexiselDemo1">
            <c:forEach items="${booksDemo}" var="book">
                <li>
                    <img src="${pageContext.request.contextPath}${book.bPath}" />
                    <div class="grid-flex">
                        <a href="${pageContext.request.contextPath}/detail?bid=${book.bId}">${book.bName}</a>
                        <p><a href="${pageContext.request.contextPath}/detail?bid=${book.bId}">${book.bCreate}</a></p>
                        <p><a href="${pageContext.request.contextPath}/detail?bid=${book.bId}">￥<fmt:formatNumber type="number" value="${book.bPrice*book.zhekou}"></fmt:formatNumber></a></p>
                        <p><a href="${pageContext.request.contextPath}/detail?bid=${book.bId}">${book.bNumber}</a></p>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <script type="text/javascript">
            $(window).load(function() {
                $("#flexiselDemo1").flexisel({
                    visibleItems: 5,
                    animationSpeed: 1000,
                    autoPlay: true,
                    autoPlaySpeed: 3000,
                    pauseOnHover: true,
                    enableResponsiveBreakpoints: true,
                    responsiveBreakpoints: {
                        portrait: {
                            changePoint:480,
                            visibleItems: 1
                        },
                        landscape: {
                            changePoint:640,
                            visibleItems: 2
                        },
                        tablet: {
                            changePoint:768,
                            visibleItems: 3
                        }
                    }
                });

            });
        </script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/reception/js/jquery.flexisel.js"></script>

        <!---->
        <div class="toogle">
             <h3 class="m_3">评论区</h3>
            <%--这里存放着评论--%>
            <c:forEach items="${bookInfo}" var="buyBook">
                <c:if test="${buyBook.info!=null}">
                <span>${buyBook.account.account}:</span>
                <p>${buyBook.info}</p>
                </c:if>
            </c:forEach>
        </div>
    </div>

    <!--左侧菜单 这里用jsp的动态进行导入 -->
    <div class="sub-cate">
        <div class=" top-nav rsidebar span_1_of_left">
            <h3 class="cate">导航条</h3>
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
    </div>
    <div class="clearfix"> </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script>
    var msg="${msg}";
    if (msg!=""){
        alert(msg);
    }
</script>