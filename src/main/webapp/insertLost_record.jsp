<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>插入一条新的丢书记录</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<h1>插入一条新的丢书记录</h1>
<br/>
<form action="insertLost_record_commit.jsp" method="post">
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id01">借书记录id</label>
        </div>
        <input id="id01" type="text" class="form-control" name="borrow_id" required>
    </div>
    <div class="input-group mb-3" class="form-group">
        <div class="btn-group btn-group-toggle" data-toggle="buttons">
            还书方式
            <label class="btn btn-secondary">
                <input type="radio" name="way" id="option1" value="0"> 书
            </label>
            <label class="btn btn-secondary">
                <input type="radio" name="way"  id="option2" value="1"> 现金
            </label>
        </div>
    </div>
    <input class="btn btn-outline-success" type="submit" value="插入"><br>
</form>
<a class="btn btn-outline-success" href="main.jsp">返回主界面</a>
</body>
</html>