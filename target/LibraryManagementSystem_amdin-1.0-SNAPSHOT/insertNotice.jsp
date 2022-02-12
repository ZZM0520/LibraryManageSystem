<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>插入一条新公告</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<h1>插入一条新公告</h1>
<br/>
<form action="insertNotice_commit.jsp" method="post">
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id">公告标题</label>
        </div>
        <input id="id" type="text" class="form-control" name="title" required>
    </div>
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id01">作者</label>
        </div>
        <input id="id01" type="text" class="form-control" name="author" required>
    </div>
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id02">发布时间</label>
        </div>
        <input id="id02" type="text" class="form-control" name="time" required>
    </div>
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id02">内容</label>
        </div>
        <input id="id03" type="text" class="form-control" name="content" required>
    </div>
    <input class="btn btn-outline-success" type="submit" value="插入"><br>
</form>
<a href="main.jsp">返回主界面</a>
</body>
</html>