<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>插入一条新的借书记录</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
    Date d = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
    String now = df.format(d);
%>
<h1>插入一条新的借书记录</h1>
<br/>
<form action="insertBorrow_record_commit.jsp" method="post">
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id">用户手机号</label>
        </div>
        <input id="id" type="text" class="form-control" name="phone_number" required>
    </div>
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id01">子书编号</label>
        </div>
        <input id="id01" type="text" class="form-control" name="serial" required>
    </div>
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id02">借出时间</label>
        </div>
        <input id="id02" type="text" class="form-control" name="borrow_out_time" value=<%=now%> required>
    </div>
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id03">预计归还时间</label>
        </div>
        <input id="id03" type="text" class="form-control" name="predict_return_time" required>
    </div>
    <div>时间格式例子:20201013</div>
    <input class="btn btn-outline-success" type="submit" value="插入">
</form>
<a href="main.jsp">返回主界面</a>
</body>
</html>