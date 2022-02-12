<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
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
<%
    int if_success=0;
    int borrow_id = Integer.parseInt(new String(request.getParameter("borrow_id").getBytes("ISO-8859-1"),"utf-8"));
    int compensation_way = Integer.parseInt(new String(request.getParameter("way").getBytes("ISO-8859-1"),"utf-8"));

    if_success=DataBaseOperator.getInstance().insertLost_record(borrow_id,compensation_way);
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

</body>
</html>