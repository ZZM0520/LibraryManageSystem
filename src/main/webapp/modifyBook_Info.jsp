<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>修改一本book的信息</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<h1>修改一本book的信息</h1>
<br/>
<form action="modifyBook_Info_commit.jsp" method="post">
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id01">book_id</label>
        </div>
        <input id="id01" type="text" class="form-control" name="book_id" required>
    </div>
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id02">ISBN</label>
        </div>
        <input id="id02" type="text" class="form-control" name="isbn" required>
    </div>
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id03">书名</label>
        </div>
        <input id="id03" type="text" class="form-control" name="book_name" required>
    </div>
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id04">出版社</label>
        </div>
        <input id="id04" type="text" class="form-control" name="publisher" required>
    </div>
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id05">作者</label>
        </div>
        <input id="id05" type="text" class="form-control" name="author" required>
    </div>
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id06">图书种类编号</label>
        </div>
        <input id="id06" type="text" class="form-control" name="category_id" required>
    </div>
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id07">价格</label>
        </div>
        <input id="id07" type="text" class="form-control" name="price" required>
    </div>
    <input class="btn btn-outline-success" type="submit" value="修改"><br>
</form>
<a style="text-decoration: none" href="main.jsp">返回主界面</a>
</body>
</html>