<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>

<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 收藏中心</h2>
                <p class="lead"></p>
            </div>
            <form action="${pageContext.request.contextPath}/username/recollecttionAll" method="post">
            <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
                <div class="panel  heading-border">
                    <div class="panel-menu">
                        <input type="hidden" name="pageNum" value="${pageInfo.pageNum}">
                        <div class="row">
                            <div class="hidden-xs hidden-sm col-md-3">
                                <div class="btn-group">
                                    <button type="submit" class="btn btn-default light">
                                        <i class="fa fa-trash"></i>
                                    </button>
<%--                                    <button type="button" class="btn btn-default light">--%>
<%--                                        <i class="fa fa-plus" onclick="javascript:window.location.href='${pageContext.request.contextPath}/backstage/admin/books-toAdd';"></i>--%>
<%--                                    </button>--%>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-9 text-right">
                                <c:if test="${pageInfo.total==0}">
                                    <span id="span">共${pageInfo.total}条 ${pageInfo.pageNum-1}/${pageInfo.pages}</span>
                                </c:if>
                                <c:if test="${pageInfo.total!=0}">
                                    <span id="span">共${pageInfo.total}条 ${pageInfo.pageNum}/${pageInfo.pages}</span>
                                </c:if>
                                <c:if test="${pageInfo.total==0}">
                                    <div class="btn-group">
                                        <button type="button" name="pageNum"  class="btn btn-default light" onclick="javascript:window.location.href='${pageContext.request.contextPath}/username/self-collection?pageNum=0';" >
                                            <i class="fa fa-chevron-left"></i>
                                        </button>
                                        <button type="button" name="pageNum"  class="btn btn-default light" onclick="javascript:window.location.href='${pageContext.request.contextPath}/username/self-collection?pageNum=0';">
                                            <i class="fa fa-chevron-right"></i>
                                        </button>
                                    </div>
                                </c:if>
                                <c:if test="${pageInfo.total!=0}">
                                    <div class="btn-group">
                                        <button type="button" name="pageNum"  class="btn btn-default light" onclick="javascript:window.location.href='${pageContext.request.contextPath}/username/self-collection?pageNum=${pageInfo.pageNum-1}';" >
                                            <i class="fa fa-chevron-left"></i>
                                        </button>
                                        <button type="button" name="pageNum"  class="btn btn-default light" onclick="javascript:window.location.href='${pageContext.request.contextPath}/username/self-collection?pageNum=${pageInfo.pageNum+1}';">
                                            <i class="fa fa-chevron-right"></i>
                                        </button>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body pn">
                        <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                            <thead>
                        <tr class="">
                            <th class="text-center hidden-xs">Select</th>
                            <th class="hidden-xs">图书名称</th>
                            <th class="hidden-xs">类型</th>
                            <th class="hidden-xs">作者</th>
                            <th class="hidden-xs">价格</th>
                            <th>操作</th>
                        </tr>
                            </thead>
                            <tbody id="body">
                            <c:forEach items="${pageInfo.list}" var="books">
                            <tr class="message-unread">
                                <td class="hidden-xs">
                                    <label class="option block mn">
                                        <input type="checkbox" name="mobileos" value="${books.id}">
                                        <span class="checkbox mn"></span>
                                    </label>
                                </td>
                                <td>${books.books.bName}</td>
                                <td>${books.books.catalog.title}</td>
                                <td>${books.books.bCreate}</td>
                                <td>${books.books.bPrice}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/username/toBuyCollection?id=${books.id}">查看</a>
                                    <a href="${pageContext.request.contextPath}/username/self/detailCollection?id=${books.id}&pageNum=${pageInfo.pageNum}">查看</a>
                                    <a href="${pageContext.request.contextPath}/username/recollecttionAll?mobileos=${books.id}&pageNum=${pageInfo.pageNum}">删除</a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
            </form>
        </div>
    </section>
</section>
<jsp:include page="bottom.jsp"/>
