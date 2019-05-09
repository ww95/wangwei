<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="jumbotron">
                <%--                    <h1 class="display-4">图书信息----${book.bName}</h1>--%>
                <p><img id="exampleInput12" src="${pageContext.request.contextPath}${collectionBook.books.bPath}" width="200px" height="200px">
                    <input type="button" onclick="javascript:window.location.href='${pageContext.request.contextPath}/username/self-collection?pageNum=${pageNum}';" value="返回"></p>
                <p></p>
                <div>
                <div class="jumbotron">
                    <div>
<%--                        <div class="form-group">--%>
<%--                            <label for="exampleInput1">订单编号</label>--%>
<%--                            <input type="text" value="${collectionBook.bbOrder}" name="bbOrder" class="form-control" id="exampleInput1" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">--%>
<%--                        </div>--%>
                            <div class="form-group">
                            <label for="exampleInput10">图书名称</label>
                            <input type="text" value="${collectionBook.books.bName}"  class="form-control" id="exampleInput10" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="exampleInput2">图书类型</label>
                            <input type="text" value="${collectionBook.books.catalog.title}" class="form-control" id="exampleInput2" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="exampleInput3">图书作者</label>
                            <input type="text" value="${collectionBook.books.bCreate}" class="form-control" id="exampleInput3" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="exampleInput4">图书价格</label>
                            <input type="text" value="${collectionBook.books.bPrice}" class="form-control" id="exampleInput4" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="exampleInput7">图书数量</label>
                            <input type="text" value="${collectionBook.books.bNumber}" name="number" class="form-control" id="exampleInput7" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
<%--                            <div class="form-group">--%>
<%--                                <label for="exampleInput6">图书总价</label>--%>
<%--                                <input type="text" value="${buyBook.books.bPrice*buyBook.number}" class="form-control" id="exampleInput6" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="exampleInput7">操作</label>--%>
<%--                            </div>--%>
                    </div>
                        <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='${pageContext.request.contextPath}/username/self-collection?pageNum=${pageNum}';">返回</button>
                        <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='${pageContext.request.contextPath}/username/toBuyBook?id=${collectionBook.books.bId}';">立即购买</button>
                        <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='${pageContext.request.contextPath}/username/recollecttionAll?mobileos=${collectionBook.id}&pageNum=${pageNum}';">取消收藏</button>
                </div>
                </div>
    </section>
</section>


<jsp:include page="bottom.jsp"/>