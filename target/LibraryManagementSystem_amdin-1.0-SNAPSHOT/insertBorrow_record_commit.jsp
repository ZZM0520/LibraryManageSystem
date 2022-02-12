<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page import="LibraryManagementSystem_admin.Borrow_record" %>
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

<h1>插入一条新的借书记录</h1>
<br/>
<%
    int if_success=0;
    String phone_number = new String(request.getParameter("phone_number").getBytes("ISO-8859-1"),"utf-8");
    int serial = Integer.parseInt(new String(request.getParameter("serial").getBytes("ISO-8859-1"),"utf-8"));
    String BorrowTime =new String(request.getParameter("borrow_out_time").getBytes("ISO-8859-1"),"utf-8");
    String PredictTime =new String(request.getParameter("predict_return_time").getBytes("ISO-8859-1"),"utf-8");

    int user_id = -1;
    user_id = DataBaseOperator.getInstance().getUser_ID(phone_number);
    if(user_id != -1) {
        if_success = DataBaseOperator.getInstance().insertBorrow_record(user_id,
                serial, BorrowTime, PredictTime);
    }
    if(if_success==1)
    {%>
<div class="alert alert-success" role="alert">
    <p>插入成功!</p>
    <p><a style="text-decoration: none" href="main.jsp">返回主界面</a></p>
</div>
<%}
else
{%>
<div class="alert alert-danger" role="alert">
    <p>插入失败!</p>
    <p><a style="text-decoration: none" href="main.jsp">返回主界面</a></p>
</div>
<%}%>
<a href="main.jsp">返回主界面</a>
</body>
</html>