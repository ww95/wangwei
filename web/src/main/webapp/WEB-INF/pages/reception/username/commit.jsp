<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="top.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
                <div class="jumbotron">

                    <div>

                        <div class="form-group">
                            <label for="exampleInput1">订单编号</label>
                            <input type="text" value="${buyBook.bbOrder}"  class="form-control" id="exampleInput1" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                            <div class="form-group">
                            <label for="exampleInput10">图书名称</label>
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

<%--                            <input type="text" value="${buyBook.books.bPrice}" class="form-control" id="exampleInput4" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">--%>
                            <input type="text" value="<fmt:parseNumber value="${buyBook.books.bPrice*buyBook.books.zhekou}" type="number"></fmt:parseNumber>" class="form-control" id="exampleInput4" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="exampleInput7">图书数量</label>
                            <input type="text" value="${buyBook.number}"  class="form-control" id="exampleInput7" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>

                        <div class="form-group">
                            <label for="exampleInput6">图书总价</label>
                            <input type="text" value="${buyBook.books.bPrice*buyBook.number}" class="form-control" id="exampleInput6" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                        <c:if test="${buyBook.info==null}">
                        <form action="<%=request.getContextPath()%>/username/self/edit" method="post">
                            <div class="form-group">
                                <label for="exampleInput5">评论</label>
                                <div id="exampleInput5" style="align:left">

                                    <input type="hidden" value="${buyBook.id}" name="id" >
                                    <input type="hidden" value="${pageNum}" name="pageNum" >
                                    <textarea cols="30" rows="10" name="info"></textarea>
                                </div>
<%--                                    <input type="text" value="" class="form-control" id="exampleInput5" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">--%>
                            </div>
                            <input type="submit" class="btn btn-primary" value="提交"/>
                        </form>
                        </c:if>
                        <c:if test="${buyBook.info!=null}">
                            <div class="form-group">
                                <label for="exampleInput5">评论</label>
                                <div id="exampleInput5" style="align:left">
                                    <textarea cols="30" rows="10">${buyBook.info}</textarea>
                                </div>
                                    <%--<input type="text" value="" class="form-control" id="exampleInput5" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">--%>
                            </div>
                            <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='${pageContext.request.contextPath}/username/self?pageNum=${pageNum}';">确定</button>
                        </c:if>
                    </div>


                </div>

    </section>
</section>


<jsp:include page="bottom.jsp"/>