<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 上架图书</h2>
            </div>
            <form action="${pageContext.request.contextPath}/backstage/admin/books-addNumber" method="post">
                <input type="hidden" value="${book.bId}" name="bId">
                <div class="form-group">
                <label for="exampleInput6">图书图片</label>
                    <img src="<%=request.getContextPath()%>${book.bPath}">
                <input type="hidden"  class="form-control" id="exampleInput6" aria-describedby="emailHelp" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label for="exampleInput2">图书名称</label>
                    <input type="text"  class="form-control" id="exampleInput2" value="${book.bPrice}" aria-describedby="emailHelp" readonly="readonly">
                </div>
                <div class="form-group">
                    <label for="exampleInput7">图书数量</label>
                    <input type="text"  class="form-control" id="exampleInput7" aria-describedby="emailHelp" placeholder="请输入数量" name="bNumber">
                </div>
                <input type="submit" class="btn btn-primary"></input>
            </form>
        </div>
    </section>
</section>


<jsp:include page="bottom.jsp"/>