<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>

<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 图书列表管理</h2>
                <p class="lead"></p>
            </div>
            <form action="${pageContext.request.contextPath}/backstage/admin/books-remove" method="post">
            <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
                <div class="panel  heading-border">
                    <div class="panel-menu">

                        <div class="row">
                            <div class="hidden-xs hidden-sm col-md-3">
                                <div class="btn-group">
                                    <button type="submit" class="btn btn-default light">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                    <button type="button" class="btn btn-default light">
                                        <i class="fa fa-plus" onclick="javascript:window.location.href='${pageContext.request.contextPath}/backstage/admin/books-toAdd';"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-9 text-right">
                                    <span id="span">共${pageInfo.total}条 ${pageInfo.pageNum}/${pageInfo.pages}</span>
                                    <div class="btn-group">
                                        <button type="button" name="pageNum" value="${pageInfo.pageNum-1}" class="btn btn-default light" onclick="javascript:window.location.href='${pageContext.request.contextPath}/backstage/admin/books-list?pageNum=${pageInfo.pageNum-1}';" >
                                            <i class="fa fa-chevron-left"></i>
                                        </button>
                                        <button type="button" name="pageNum" value="${pageInfo.pageNum+1}" class="btn btn-default light" onclick="javascript:window.location.href='${pageContext.request.contextPath}/backstage/admin/books-list?pageNum=${pageInfo.pageNum+1}';">
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
                            <th class="hidden-xs">名称</th>
                            <th class="hidden-xs">作者</th>
                            <th class="hidden-xs">价格</th>
                            <th class="hidden-xs">数量</th>
                            <th class="hidden-xs">折扣率</th>
                            <th>操作</th>
                        </tr>
                            </thead>
                            <tbody id="body">
                            <c:forEach items="${pageInfo.list}" var="books">
                            <tr class="message-unread">
                                <td class="hidden-xs">
                                    <label class="option block mn">
                                        <input type="checkbox" name="mobileos" value="${books.bId}">
                                        <span class="checkbox mn"></span>
                                    </label>
                                </td>
                                <td>${books.bName}</td>
                                <td>${books.bCreate}</td>
                                <td>${books.bPrice}</td>
                                <td>${books.bNumber}</td>
                                <td>${books.zhekou}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/backstage/admin/books-detail?id=${books.bId}&pageNum=${pageInfo.pageNum}">查看</a>
                                    <a href="${pageContext.request.contextPath}/backstage/admin/books-toEdit?id=${books.bId}&pageNum=${pageInfo.pageNum}">编辑</a>
                                    <a href="${pageContext.request.contextPath}/backstage/admin/books-toAddNumber?id=${books.bId}&pageNum=${pageInfo.pageNum}">进货</a>
                                    <a href="${pageContext.request.contextPath}/backstage/admin/books-remove?mobileos=${books.bId}&pageNum=${pageInfo.pageNum}">删除</a>
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
