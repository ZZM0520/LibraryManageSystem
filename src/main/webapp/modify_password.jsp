<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form action="modify_password_commit.jsp" method="post">
        <div class="input-group mb-3" class="form-group">
            <div class="input-group-prepend">
                <label class="input-group-text" for="id">当前密码</label>
            </div>
            <input id="id" type="password" class="form-control" name="old_password" required>
        </div>
        <div class="input-group mb-3" class="form-group">
            <div class="input-group-prepend">
                <label class="input-group-text" for="id01">新密码</label>
            </div>
            <input id="id01" type="password" class="form-control" name="password" required>
        </div>
        <div class="input-group mb-3" class="form-group">
            <div class="input-group-prepend">
                <label class="input-group-text" for="id02">再次输入新密码</label>
            </div>
            <input id="id02" type="password" class="form-control" name="password2" required>
        </div>
        <input type="submit" class="btn btn-outline-success" value="修改">
    </form>
    <a style="text-decoration: none" href="main.jsp">返回主界面</a>
</body>
</html>
