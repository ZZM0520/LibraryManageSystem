<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>通过用户手机号查所有借书记录</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<h1>通过用户手机号查所有借书记录</h1>
<br/>
<form action="getBorrow_record_set_commit.jsp" method="post">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupInput">手机号</label>
        </div>
        <input id="inputGroupInput" type="text" class="form-control" name="id"></p>
    </div>
    <button type="submit" class="btn btn-outline-success">查找</button>
</form>
<a style="text-decoration:none" href="main.jsp">返回主界面</a>
</body>
</html>