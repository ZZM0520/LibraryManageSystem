<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>还书</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<h1>还书</h1>
<br/>
<%

    int if_success=0;
    int borrow_id = Integer.parseInt(new String(request.getParameter("id").getBytes("ISO-8859-1"),"utf-8"));
    String actual_time =new String(request.getParameter("time").getBytes("ISO-8859-1"),"utf-8");
    if_success=DataBaseOperator.getInstance().return_singleBook(borrow_id,actual_time);
    if(if_success==1)
    {%>
<div class="alert alert-success" role="alert">
    <p>还书成功！</p>
    <p><a style="text-decoration: none" href="main.jsp">返回主界面</a></p>
</div>
<p></p>
<%}
else
{%>
<div class="alert alert-danger" role="alert">
    <p>还书失败！</p>
    <p><a style="text-decoration: none" href="main.jsp">返回主界面</a></p>
</div>
<p></p>
<%}%>

</body>
</html>