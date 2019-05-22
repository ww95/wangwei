<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="top.jsp"></jsp:include>
<div class="container">
    <div class="banner-menu">
        <div class="shoes-grid">
            <div class="account_grid">
                    <%--            <h3>订单详情</h3>--%>
                    <form action="<%=request.getContextPath()%>/username/buyBook" method="post" id="myForm">
                        <div>
<%--                            <h3>订单详情<label>*</label></h3>--%>
                            <%--                <input type="text" name="books.bName" value="${book.bName}" class="form-control" readonly="readonly">--%>
                        </div>
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
                        <input type="submit" style="background: #F97E76;
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
    outline: none;" value="确定购买">
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
                <div class="clearfix"> </div>
            </div>
        </div>
    <div class="sub-cate">
        <img src="<%=request.getContextPath()%>${book.bPath}" style="width: 200px;height: 250px;">
    </div>
        <div class="clearfix"> </div>
    </div>
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