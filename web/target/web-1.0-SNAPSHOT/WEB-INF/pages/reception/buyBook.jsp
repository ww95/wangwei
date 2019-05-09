<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="top.jsp"></jsp:include>
<div class="container">

    <div class="account_grid">
        <div class=" login-right">
<%--            <h3>订单详情</h3>--%>
            <div>
                <span>订单详情<label>*</label></span>
<%--                <input type="text" name="books.bName" value="${book.bName}" class="form-control" readonly="readonly">--%>
            </div>
            <form action="<%=request.getContextPath()%>/username/buyBook" method="post" id="myForm">
                <p>订单号:${order}</p>
                <input name="bbOrder" type="hidden" value="${order}">
                <input type="hidden" name="BId" value="${book.bId}">
                <input type="hidden" name="numbers" value="${number}">
                <input type="hidden" name="status" value="0">
                <div>
                    <span>图书名称<label>*</label></span>
                    <input type="text" name="books.bName" value="${book.bName}" class="form-control" readonly="readonly">
                </div>
                <div>
                    <span>图书类型<label>*</label></span>
                    <input type="text" name="books.catalog.title" value="${book.catalog.title}" class="form-control" readonly="readonly">
                </div>
                <div>
                    <span>单价<label>*</label></span>
                    <input type="text" id="price" name="books.bPrice" value="" class="form-control" readonly="readonly">
                </div>
                <script>
                    var xiaoshou = document.getElementById("price");
                    xiaoshou.value = <fmt:formatNumber value="${book.bPrice*book.zhekou}" type="number"></fmt:formatNumber>
                </script>
                <div>
                    <span>数量<label>*</label></span>
                    <input type="text" id="number"  name="number" class="form-control" value="1">
                </div>
                <div>
                    <span>总价<label>*</label></span>
                    <input type="text" id="total" name="totial" value="" class="form-control" readonly="readonly">
                </div>
                <input type="submit" value="确定购买">
                <input type="button" id="button" style="background: #F97E76;
    color: #FFF;
    font-size: 1em;
    padding: 0.5em 1.2em;
    transition: 0.5s all;
    -webkit-transition: 0.5s all;
    -moz-transition: 0.5s all;
    -o-transition: 0.5s all;
    display: inline-block;
    text-transform: uppercase;
    border: none;
    outline: none;" value="取消">
                <%--默认的是1--%>
                <input type="hidden" id="isPay" name="isPay" value="1">
                <script>
                    var button = document.getElementById("button");
                    button.onmouseover = function(){
                        button.style.backgroundColor="rgba(255, 255, 255, 0.21)";
                        button.style.color="#F07818";
                    }
                    button.onmouseout = function(){
                        button.style.background="none";
                        button.style.color="#fff";
                        button.style.backgroundColor="#F07818";
                    }
                    button.onclick = function () {
                        var flag = confirm("确定离开,还有订单没支付");
                        if (flag==true){
                            document.getElementById("isPay").value=0;
                            alert(document.getElementById("isPay"));
                            document.getElementById("myForm").submit();
                        }
                    }
                </script>
            </form>
        </div>
    <%--菜单导航区域--%>
    <div class="sub-cate">
        <div class=" top-nav rsidebar span_1_of_left">
            <h3 class="cate">CATEGORIES</h3>
            <ul class="menu">
                <c:forEach items="${root.children}" var="cata1"><li class="item1"><a href="#">${cata1.title}<img class="arrow-img" src="<%=request.getContextPath()%>/reception/images/arrow1.png" alt=""/> </a>
                    <ul class="cute">
                        <c:forEach items="${cata1.children}" var="cata2">
                            <li class="subitem1"><a href="product.html">${cata2.title} </a></li>
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
        var number = document.getElementById("number");
        var price = document.getElementById("price");
        var total = document.getElementById("total");
       document.getElementById("total").value=document.getElementById("number").value*document.getElementById("price").value;
       number.onkeyup =function () {
           document.getElementById("total").value=document.getElementById("number").value*document.getElementById("price").value;
       }
        number.onkeyup =function () {
            document.getElementById("total").value=document.getElementById("number").value*document.getElementById("price").value;
        }
    </script>