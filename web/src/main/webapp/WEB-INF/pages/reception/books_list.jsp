<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"></jsp:include>
<div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
<div class="container">
    <div class="banner-menu">

        <div class="shoes-grid">
<%--            <div class="wmuSlider example1 slide-grid">--%>
<%--                <div class="wmuSliderWrapper">--%>
<%--&lt;%&ndash;                    <c:forEach items="${books}" var="books">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <article style="position: absolute; width: 100%; opacity: 0;">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="banner-matter">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <img class="img-responsive banner-bag" src="<%=request.getContextPath()%>${books.bPath}" alt=" " style="width: 285px;height: 407px;" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="banner-off">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <h2>${books.bName}</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <span>${books.bCreate}</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <span>${books.bPrice}</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        &lt;%&ndash;                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <p>${books.bInfo}</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    <a class="now-get" href="${pageContext.request.contextPath}/detail?bid=${books.bId}">立即购买</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <div class="clearfix"> </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </article>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </c:forEach>&ndash;%&gt;--%>
<%--                </div>--%>
<%--                <ul class="wmuSliderPagination">--%>
<%--&lt;%&ndash;                    <c:forEach items="${books}" varStatus="index">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        &lt;%&ndash;varStatus表示循环的信息量&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <li><a href="#" class="">${index.index}</a></li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </c:forEach>&ndash;%&gt;--%>
<%--                </ul>--%>
<%--            </div>--%>

            <script src="<%=request.getContextPath()%>/reception/js/jquery.wmuSlider.js"></script>
            <script>
                $('.example1').wmuSlider();
            </script>
            <div class="shoes-grid-left">
            </div>
<%--            <div class="products">--%>
<%--                <h5 class="latest-product">销售榜</h5>--%>
<%--                <a class="view-all" href="product.html">VIEW ALL<span> </span></a>--%>
<%--            </div>--%>
            <c:forEach items="${lists}" var="book">
                <div class=" chain-grid grid-top-chain">
                    <a href="<%=request.getContextPath()%>/detail?bid=${book.bId}"><img class="img-responsive chain" style="height: 304px;width: 220px;" src="${pageContext.request.contextPath}${book.bPath}" alt=" " /></a>
<%--                    <span class="star"> </span>--%>
                    <div class="grid-chain-bottom">
                        <span>${book.bName}</span>
                        <div class="star-price">
                            <div class="dolor-grid">
                                <span class="actual">${book.bPrice}$</span>
<%--                                <span class="reducedfrom">${book.bPrice}$</span>--%>
                            </div>
<%--                            <a class="now-get get-cart" href="#">ADD TO CART</a>--%>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

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
            <!--这里是存放左侧推荐图书-->
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
</div>
<jsp:include page="bottom.jsp"></jsp:include>