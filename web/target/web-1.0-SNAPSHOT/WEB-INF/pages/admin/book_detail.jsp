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
                    <h1 class="display-4">图书信息----${book.bName}</h1>
                    <p><img id="exampleInput6" src="${pageContext.request.contextPath}${book.bPath}" width="200px" height="200px">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" onclick="javascript:window.location.href='${pageContext.request.contextPath}/backstage/admin/books-list?pageNum=${pageNum}';" value="返回"></p>
                    <p></p>
                    <div>
                        <%--<div class="form-group">--%>
                            <%--<label for="exampleInput6">图片</label>--%>
                            <%--<img id="exampleInput6" src="${pageContext.request.contextPath}${book.bPath}" width="200px" height="200px">--%>
                            <%--&lt;%&ndash;<input type="text" value="${book.bPath}" class="form-control" id="exampleInput6" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">&ndash;%&gt;--%>
                        <%--</div>--%>
                        <div class="form-group">
                            <label for="exampleInput1">图书类型</label>
                            <input type="text" value="${book.catalog.title}" class="form-control" id="exampleInput1" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="exampleInput2">图书名称</label>
                            <input type="text" value="${book.bName}" class="form-control" id="exampleInput2" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="exampleInput3">图书作者</label>
                            <input type="text" value="${book.bCreate}" class="form-control" id="exampleInput3" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="exampleInput4">图书价格</label>
                            <input type="text" value="${book.bPrice}" class="form-control" id="exampleInput4" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="exampleInput7">图书数量</label>
                            <input type="text" value="${book.bNumber}" class="form-control" id="exampleInput7" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">
                        </div>
                            <div class="form-group">
                                <label for="exampleInput5">图书描述</label>
                                <div id="exampleInput5" style="align:left">
                                    ${book.bInfo}
                                </div>
                                <%--<input type="text" value="" class="form-control" id="exampleInput5" aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">--%>
                            </div>
                    </div>
                        <button type="button" class="btn btn-primary" onclick="javascript:window.location.href='${pageContext.request.contextPath}/backstage/admin/books-list?&pageNum=${pageNum}';">确定</button>
                </div>

    </section>
</section>


<jsp:include page="bottom.jsp"/>