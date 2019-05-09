<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 个人信息</h2>
            </div>
            <form action="${pageContext.request.contextPath}/backstage/admin/update-data" method="post">
                <div class="form-group">
                    <label for="exampleInput2">账号</label>
                    <input type="hidden"  value="${account.status}" name="status"></input>
                    <input type="text"  class="form-control" id="exampleInput2" value="${account.account}" aria-describedby="emailHelp" readonly="readonly" name="account">
                </div>
                <div class="form-group">
                    <label for="exampleInput3">姓名</label>
                    <input type="text"class="form-control" id="exampleInput3" aria-describedby="emailHelp" value="${account.ninkName}" placeholder="请输入昵称" name="ninkName">
                </div>
                <input type="submit" class="btn btn-primary"></input>
            </form>
        </div>
    </section>
</section>


<jsp:include page="bottom.jsp"/>