<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
    <section id="content_wrapper">
        <section id="content" class="table-layout animated fadeIn">
            <div class="tray tray-center">
                <div class="jumbotron">
                    <h1 class="display-4">你好, ${account.ninkName}!</h1>
                    <p class="lead">数据统计是使用大量数据、统计和定量分析、解释和预测以及基于事实的管理来推动决策过程与实现价值增生。</p>
                    <hr class="my-4">
                    <p>我们通过数据统计分析出图书销售情况，减少盲目的进货。</p>
                </div>
                <div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/backstage/admin/self-all?pageNum=${pageInfo.pageNum-1}">Previous</a></li>
                            <c:forEach begin="1" end="${pageInfo.pages}" step="1" varStatus="index">
                                <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/backstage/admin/self-all?pageNum=${index.index}">${index.index}</a></li>
                            </c:forEach>
                            <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/backstage/admin/self-all?pageNum=${pageInfo.pageNum+1}">Next</a></li>
                        </ul>
                    </nav>
                </div>
                <table class="table">
                    <thead>
                    <tr>
<%--                        <th scope="col">#</th>--%>
                        <th scope="col">图书名</th>
                        <th scope="col">库存</th>
                        <th scope="col">进货总价</th>
                        <th scope="col">销售数量</th>
                        <th scope="col">销售总价</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="books" items="${pageInfo.list}" varStatus="index">
                        <tr>
<%--                            <th scope="row">${index.index+1}</th>--%>
                            <td>${books.bName}</td>
                            <td>${books.bNumber}</td>
                            <td>${books.totalJinhuo}</td>
                            <c:forEach items="${buyBookList}" var="buyBook">
                                <c:if test="${buyBook.BId==books.bId}">
                                    <td>${buyBook.sumNumber}</td>
                                </c:if>
                            </c:forEach>

                        </tr>
                    </c:forEach>
                    <tr></tr>
                    <tr>
                        <th scope="row">总计</th>
                        <td></td>
                        <td>${Stock}</td>
                        <td></td>
                        <td>${sale}</td>

                    </tr>
                    </tbody>
                </table>
<div>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/backstage/admin/self-all?pageNum=${pageInfo.pageNum-1}">Previous</a></li>
            <c:forEach begin="1" end="${pageInfo.pages}" step="1" varStatus="index">
                <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/backstage/admin/self-all?pageNum=${index.index}">${index.index}</a></li>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/backstage/admin/self-all?pageNum=${pageInfo.pageNum+1}">Next</a></li>
        </ul>
    </nav>
</div>

            </div>
        </section>
    </section>
<jsp:include page="bottom.jsp"/>