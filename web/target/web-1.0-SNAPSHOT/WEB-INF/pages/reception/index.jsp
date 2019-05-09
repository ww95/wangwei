<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="top.jsp"></jsp:include>
<div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
<div class="container">
    <div class="banner-menu">

        <div class="shoes-grid">
            <div class="wmuSlider example1 slide-grid">
                <div class="wmuSliderWrapper">
                    <c:forEach items="${books}" var="books">
                    <article style="position: absolute; width: 100%; opacity: 0;">
                        <div class="banner-matter">
                            <img class="img-responsive banner-bag" src="<%=request.getContextPath()%>${books.bPath}" alt=" " style="width: 285px;height: 407px;" />
                            <div class="banner-off">
                                <h3>${books.bName}</h3>
                                <span>${books.bCreate}</span>
                                <br>

                                <span><fmt:formatNumber type="number" value="${books.bPrice*books.zhekou}"></fmt:formatNumber></span>
<%--                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et </p>--%>
                                <p>${books.bInfo}</p>
                                <a class="now-get" href="${pageContext.request.contextPath}/detail?bid=${books.bId}">立即购买</a>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </article>
                    </c:forEach>
                </div>
                <ul class="wmuSliderPagination">
                    <c:forEach items="${books}" varStatus="index">
                        <%--varStatus表示循环的信息量--%>
                        <li><a href="#" class="">${index.index}</a></li>
                    </c:forEach>
                </ul>
            </div>

            <script src="<%=request.getContextPath()%>/reception/js/jquery.wmuSlider.js"></script>
            <script>
                $('.example1').wmuSlider();
            </script>
            <!--这里存放着下面两个-->
            <div class="shoes-grid-left">
            </div>
            <div class="products">
                <h5 class="latest-product">人气榜</h5>
                <a class="view-all" href="<%=request.getContextPath()%>/getBooksAll">VIEW ALL<span> </span></a>
            </div>
            <div class="product-left">
                <c:forEach items="${renqi}" var="book">
                    <div class=" chain-grid grid-top-chain">
                        <a href="${pageContext.request.contextPath}/detail?bid=${book.bId}"><img class="img-responsive chain" style="width: 179px;height: 250px;" src="${pageContext.request.contextPath}${book.bPath}" alt=" " /></a>
                        <div class="grid-chain-bottom">
                            <span>${book.bName}</span>
                            <div class="star-price">
                                <div class="dolor-grid">
                                    <span class="actual"><fmt:formatNumber type="number" value="${book.bPrice*book.zhekou}"></fmt:formatNumber>$</span>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="clearfix"> </div>
            </div>
            <div class="products">
                <h5 class="latest-product">推荐榜</h5>
                <a class="view-all" href="<%=request.getContextPath()%>/getBooksAll">VIEW ALL<span> </span></a>
            </div>
            <div class="product-left">
                <c:forEach items="${xiaoshou}" var="book">
                    <div class=" chain-grid grid-top-chain">
                        <a href="${pageContext.request.contextPath}/detail?bid=${book.bId}"><img class="img-responsive chain" style="width: 179px;height: 250px;" src="${pageContext.request.contextPath}${book.bPath}" alt=" " /></a>
                        <div class="grid-chain-bottom">
                            <span>${book.bName}</span>
                            <div class="star-price">
                                <div class="dolor-grid">
                                    <span class="actual"><fmt:formatNumber type="number" value="${book.bPrice*book.zhekou}"></fmt:formatNumber>$</span>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="clearfix"> </div>
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