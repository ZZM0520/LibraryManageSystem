<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="LibraryManagementSystem_admin.DataBaseOperator" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>删除一本book</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>

<form action="deleteBook_Info_commit.jsp" method="post">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text" for="inputGroupInput">图书编号</label>
        </div>
        <input id="inputGroupInput" type="text" class="form-control" name="book_id"></p>
    </div>
    <button type="submit" class="btn btn-outline-success" value="删除">删除</button>
</form>
<a  style="text-decoration:none"  href=main.jsp">返回主界面</a>

</body>
</html>