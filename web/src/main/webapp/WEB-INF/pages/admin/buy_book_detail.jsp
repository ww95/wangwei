<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
                <div class="jumbotron">
                    <div>
                        <div class="form-group">
                            <label for="exampleInput1">图片</label>
<%--                            <input type="text" value="${buyBook.bbOrder}" name="bbOrder" class="form-control" id="exampleInput1" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">--%>
                        <img src="${pageContext.request.contextPath}${buyBook.books.bPath}">
                        </div>
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
                                <label for="exampleInput7">评论</label>
                                <c:if test="${buyBook.status==3}">
                                    <c:if test="${buyBook.info!=null}">
                                        <p>${buyBook.info}</p>
                                    </c:if>

                                    <c:if test="${buyBook.info==null}">
                                        <p>用户暂时还没评论</p>
                                    </c:if>
                                </c:if>
                            </div>
                    </div>
                        <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='${pageContext.request.contextPath}/backstage/admin/order?pageNum=${pageNum}';">确定</button>
                </div>
        </div>
    </section>
</section>


<jsp:include page="bottom.jsp"/>