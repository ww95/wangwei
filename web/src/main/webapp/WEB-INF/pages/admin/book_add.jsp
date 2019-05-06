<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 上架图书</h2>
            </div>
            <form action="${pageContext.request.contextPath}/backstage/admin/books-add" method="post" enctype="multipart/form-data">
                <div class="form-group">
                <label for="exampleInput6">图书图片</label>
                <input type="file"  class="form-control" id="exampleInput6" aria-describedby="emailHelp" placeholder="Enter email" name="bPath">
                </div>
                <div class="form-group">
                    <label for="language">图书类型</label>
                    <select id="language" name="bType">
                        <c:forEach items="${root.children}" var="cat1">
                            <c:forEach items="${cat1.children}" var="cat2">
                                <option value="${cat2.id}">${cat1.title}->${cat2.title}</option>
                            </c:forEach>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleInput2">图书名称</label>
                    <input type="text"  class="form-control" id="exampleInput2" aria-describedby="emailHelp" placeholder="请输入图书名称" name="bName">
                </div>
                <div class="form-group">
                    <label for="exampleInput3">图书作者</label>
                    <input type="text"class="form-control" id="exampleInput3" aria-describedby="emailHelp" placeholder="请输入图书作者" name="bCreate">
                </div>
                <div class="form-group">
                    <label for="exampleInput4">图书销售价格</label>
                    <input type="text"  class="form-control" id="exampleInput4" aria-describedby="emailHelp" placeholder="请输入价格" name="bPrice">
                </div>
                <div class="form-group">
                    <label for="exampleInput8">图书进货价格</label>
                    <input type="text"  class="form-control" id="exampleInput8" aria-describedby="emailHelp" placeholder="请输入价格" name="jinhuo">
                </div>
                <div class="form-group">
                    <label for="exampleInput9">折扣率</label>
                    <input type="text"  class="form-control" id="exampleInput9" aria-describedby="emailHelp" placeholder="请输入价格" name="zhekou">
                </div>
                <div class="form-group">
                    <label for="exampleInput7">图书数量</label>
                    <input type="text"  class="form-control" id="exampleInput7" aria-describedby="emailHelp" placeholder="请输入数量" name="bNumber">
                </div>
                <div class="form-group">
                    <label for="exampleInput5">图书描述</label>
                    <textarea id="exampleInput5" cols="50" name="bInfo" placeholder="请输入描述"></textarea>
                    <%--<input type="text" value="" class="form-control"  aria-describedby="emailHelp" placeholder="Enter email" readonly="readonly">--%>
                </div>
                <input type="submit" class="btn btn-primary"></input>
            </form>
        </div>
    </section>
</section>


<jsp:include page="bottom.jsp"/>