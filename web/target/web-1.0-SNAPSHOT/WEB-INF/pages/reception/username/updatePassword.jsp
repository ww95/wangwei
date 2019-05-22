<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 修改密码</h2>
            </div>
            <form action="${pageContext.request.contextPath}/username/updatePwd" method="post">
                <div class="form-group">
                    <label for="exampleInput2">账号</label>
                    <input type="hidden"  value="${username.status}" name="status"></input>
                    <input type="text"  class="form-control" id="exampleInput2" value="${username.account}" aria-describedby="emailHelp" readonly="readonly" name="account">
                </div>
                <div class="form-group">
                    <label for="exampleInput3">原密码</label>
                    <input type="password"class="form-control" id="exampleInput3" aria-describedby="emailHelp"  placeholder="请输入密码" name="password">
                </div>
                <div class="form-group">
                    <label for="exampleInput1">新密码</label>
                    <input type="password"class="form-control" id="exampleInput1" aria-describedby="emailHelp"  placeholder="请输入新密码" name="newPassword">
                </div>
                <div class="form-group">
                    <label for="exampleInput4">确认密码</label>
                    <input type="password"class="form-control" id="exampleInput4" aria-describedby="emailHelp"  placeholder="请输入确定密码" name="checkedPassword">
                </div>
                <input type="submit" class="btn btn-primary" id="submit" onclick="return dataSubmit()"></input>
                <script>
                    var msg = "${msg}";
                    if(msg!=""){
                        alert(msg);
                    }
                    function dataSubmit() {
                        var flag = true;
                        var checkpassword = document.getElementById("exampleInput4").value;
                        var newPassword = document.getElementById("exampleInput1").value;
                        var accountRegex = /[a-zA-Z0-9!@#$%^&*()]{5,12}/;
                        if(!accountRegex.test(checkpassword)||!accountRegex.test(newPassword)){
                            alert("用户名或密码格式输入错误，请重新输入")
                            flag = false;
                        }
                        if(password!=newPassword){
                            alert("两次密码输入不一样");
                            flag = false;
                        }
                        return flag;
                    }
                </script>
            </form>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%--            <form action="<%=request.getContextPath()%>/username/toForgetPwd" method="post">--%>
<%--                <input type="hidden" name="flag" value="1">--%>
<%--                <input type="submit" class="btn btn-primary" value="忘记密码">--%>
<%--            </form>--%>
        </div>
    </section>
</section>
<jsp:include page="bottom.jsp"/>
