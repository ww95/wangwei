<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>

<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 图书订单管理</h2>
                <p class="lead"></p>
            </div>
            <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
                <div class="panel  heading-border">
                    <div class="panel-menu">

                        <div class="row">
                            <div class="hidden-xs hidden-sm col-md-3">
                                <div class="btn-group">
<%--                                    <button type="submit" class="btn btn-default light">--%>
<%--                                        <i class="fa fa-trash"></i>--%>
<%--                                    </button>--%>
<%--                                    <button type="button" class="btn btn-default light">--%>
<%--                                        <i class="fa fa-plus" onclick="javascript:window.location.href='${pageContext.request.contextPath}/backstage/admin/order';"></i>--%>
<%--                                    </button>--%>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-9 text-right">
                                    <span id="span">共${pageInfo.total}条 ${pageInfo.pageNum}/${pageInfo.pages}</span>
                                    <div class="btn-group">
                                        <button type="button" name="pageNum" value="${pageInfo.pageNum-1}" class="btn btn-default light" onclick="javascript:window.location.href='${pageContext.request.contextPath}/backstage/admin/order?pageNum=${pageInfo.pageNum-1}';" >
                                            <i class="fa fa-chevron-left"></i>
                                        </button>
                                        <button type="button" name="pageNum" value="${pageInfo.pageNum+1}" class="btn btn-default light" onclick="javascript:window.location.href='${pageContext.request.contextPath}/backstage/admin/order?pageNum=${pageInfo.pageNum+1}';">
                                            <i class="fa fa-chevron-right"></i>
                                        </button>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body pn">
                        <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                            <thead>
                        <tr class="">
                            <th class="text-center hidden-xs">Select</th>
                            <th class="hidden-xs">订单编号</th>
                            <th class="hidden-xs">图书</th>
                            <th class="hidden-xs">类型</th>
                            <th class="hidden-xs">作者</th>
                            <th class="hidden-xs">价格</th>
                            <th class="hidden-xs">数量</th>
                            <th class="hidden-xs">总价</th>
                            <th>操作</th>
                        </tr>
                            </thead>
                            <tbody id="body">
                            <c:forEach items="${pageInfo.list}" var="buyBooks">
                            <tr class="message-unread">
                                <td class="hidden-xs">
                                    <label class="option block mn">
                                        <input type="checkbox" name="mobileos" value="${books.bId}">
                                        <span class="checkbox mn"></span>
                                    </label>
                                </td>
                                <td>${buyBooks.bbOrder}</td>
                                <td>${buyBooks.books.bName}</td>
                                <td>${buyBooks.books.catalog.title}</td>
                                <td>${buyBooks.books.bCreate}</td>
                                <td>${buyBooks.books.bPrice}</td>
                                <td>${buyBooks.number}</td>
                                <td>${buyBooks.number*buyBooks.books.bPrice}</td>
                                <td>
                                    <c:if test="${buyBooks.status==0}">
                                        <form action="<%=request.getContextPath()%>/backstage/admin/order-manage" method="post">
                                        <input type="hidden" name="id" value="${buyBooks.id}">
                                        <input type="hidden" name="pageNum" value="${pageInfo.pageNum}">
                                        <input type="hidden" name="status" value="2">
                                        <input type="submit" value="发货">
                                        </form>
                                    </c:if>
                                    <c:if test="${buyBooks.status==1}">
                                            <form action="<%=request.getContextPath()%>/backstage/admin/order-manage" method="post">
                                        <input type="hidden" name="id" value="${buyBooks.id}">
                                        <input type="hidden" name="pageNum" value="${pageInfo.pageNum}">
                                        <input type="hidden" name="status" value="2">
                                        <input type="submit" value="极速发货">
                                            </form>
                                    </c:if>
                                    <c:if test="${buyBooks.status==2}">
                                        <a href="${pageContext.request.contextPath}/backstage/admin/buyBooks/detail?id=${buyBooks.id}">发货成功</a>
                                    </c:if>
                                    <c:if test="${buyBooks.status==3}">
                                        <a href="${pageContext.request.contextPath}/backstage/admin/buyBooks/detail?id=${buyBooks.id}">货物已签收</a>
                                    </c:if>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </section>
</section>
<jsp:include page="bottom.jsp"/>
