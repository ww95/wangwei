<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <%--<div class="content-header">--%>
                <%--<h2> 图书信息</h2>--%>
            <%--</div>--%>
                <div class="jumbotron">
<%--                    <h1 class="display-4">图书信息----${book.bName}</h1>--%>
                    <p><img id="exampleInput12" src="${pageContext.request.contextPath}${buyBook.books.bPath}" width="200px" height="200px">
                    <input type="button" onclick="javascript:window.location.href='${pageContext.request.contextPath}/username/self?pageNum=${pageNum}';" value="返回"></p>
                    <p></p>
                    <div>
<%--                        <div class="form-group">--%>
<%--                            <label for="exampleInput6">图片</label>--%>
<%--                            <img id="exampleInput6" src="${pageContext.request.contextPath}${book.bPath}" width="200px" height="200px">--%>
<%--                            &lt;%&ndash;<input type="text" value="${book.bPath}" class="form-control" id="exampleInput6" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">&ndash;%&gt;--%>
<%--                        </div>--%>
                        <div class="form-group">
                            <label for="exampleInput1">订单编号</label>
                            <input type="text" value="${buyBook.bbOrder}" name="bbOrder" class="form-control" id="exampleInput1" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                            <div class="form-group">
                            <label for="exampleInput1">图书名称</label>
                            <input type="text" value="${buyBook.books.bName}"  class="form-control" id="exampleInput10" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="exampleInput2">图书类型</label>
                            <input type="text" value="${buyBook.books.catalog.title}" class="form-control" id="exampleInput2" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="exampleInput3">图书作者</label>
                            <input type="text" value="${buyBook.books.bCreate}" class="form-control" id="exampleInput3" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="exampleInput4">图书价格</label>
                            <input type="text" value="${buyBook.books.bPrice}" class="form-control" id="exampleInput4" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="exampleInput7">图书数量</label>
                            <input type="text" value="${buyBook.number}" name="number" class="form-control" id="exampleInput7" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                            <div class="form-group">
                                <label for="exampleInput6">图书总价</label>
                                <input type="text" value="${buyBook.books.bPrice*buyBook.number}" class="form-control" id="exampleInput6" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label for="exampleInput7">操作</label>
                                <!--商家暂时未发货-->
                                <c:if test="${buyBook.status==0}">
                                <p>商家暂未发货请<a href="${pageContext.request.contextPath}/username/self/reminder?id=${buyBook.id}&pageNum=${pageNum}">催单</a></p>
                            </c:if>
                                <!--商家未发货，顾客未收货-->
                                <c:if test="${buyBook.status==1}">
                                    <p>催单成功 请耐心等待</p>
                                </c:if>
                                <!--商家发货，顾客未收货-->
                                <c:if test="${buyBook.status==2}">
                                    <p>商家发货，货物正在向你飞来,请<a href="${pageContext.request.contextPath}/username/self/sign?id=${buyBook.id}&pageNum=${pageNum}">签收</a></p>
                                </c:if>
                                <!--商家发货，顾客收货-->
                                <c:if test="${buyBook.status==3}">
                                    <c:if test="${buyBook.info==null}">
                                        <p>货物已收取，请对图书<button type="button" class="btn btn-primary" onclick="javascript:window.location.href='${pageContext.request.contextPath}/username/self/toEdit?id=${buyBook.id}&pageNum=${pageNum}';">评论</button></p>
                                    </c:if>

                                    <c:if test="${buyBook.info!=null}">
                                        <p>已经对图书评论，请<a href="${pageContext.request.contextPath}/username/self/toEdit?id=${buyBook.id}&pageNum=${pageNum}">查看评论</a></p>
                                    </c:if>

                                </c:if>
                            </div>
                    </div>
                        <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='${pageContext.request.contextPath}/username/self?pageNum=${pageNum}';">确定</button>
                </div>

    </section>
</section>


<jsp:include page="bottom.jsp"/>