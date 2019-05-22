<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
    <section id="content_wrapper">
        <section id="content" class="table-layout animated fadeIn">
            <div class="tray tray-center">
                <div class="jumbotron">
                    <h1 class="display-4">你好, ${account.ninkName}!</h1>
                    <p>用户管理中心</p>
                </div>
<%--                <div>--%>
<%--                    <nav aria-label="Page navigation example">--%>
<%--                        <ul class="pagination">--%>
<%--                            <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/backstage/admin/self-all?pageNum=${pageInfo.pageNum-1}">Previous</a></li>--%>
<%--                            <c:forEach begin="1" end="${pageInfo.pages}" step="1" varStatus="index">--%>
<%--                                <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/backstage/admin/self-all?pageNum=${index.index}">${index.index}</a></li>--%>
<%--                            </c:forEach>--%>
<%--                            <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/backstage/admin/self-all?pageNum=${pageInfo.pageNum+1}">Next</a></li>--%>
<%--                        </ul>--%>
<%--                    </nav>--%>
<%--                </div>--%>
                <table class="table">
                    <thead>
                    <tr>
<%--                        <th scope="col">#</th>--%>
                        <th scope="col">用户名</th>
                        <th scope="col">昵称</th>
                        <th scope="col">状态</th>
                        <th scope="col">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${pageInfo.list}" varStatus="index">
                        <tr>
<%--                            <th scope="row">${index.index+1}</th>--%>
                            <td>${user.account}</td>
                            <td>${user.ninkName}</td>
                                <c:if test="${user.is_normal==0}">
                                    <td>用户异常</td>
                                    <td><a href="<%=request.getContextPath()%>/backstage/admin/normal?id=${user.id}&pageNum=${pageInfo.pageNum}">恢复</a></td>
                                </c:if>
    <c:if test="${user.is_normal==1}">
                                    <td>用户正常</td>
        <td><a href="<%=request.getContextPath()%>/backstage/admin/renormal?id=${user.id}&pageNum=${pageInfo.pageNum}">禁止</a></td>
                                </c:if>


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