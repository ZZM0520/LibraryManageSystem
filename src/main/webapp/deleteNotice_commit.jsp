<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%response.setHeader("refresh", "3;URL=main.jsp");%>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>删除一条公告</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<h1>删除一条公告</h1>
<br/>
<%
    int if_success=0;
    int notice_id = Integer.parseInt(new String(request.getParameter("notice_id").getBytes("ISO-8859-1"),"utf-8"));
    if_success=DataBaseOperator.getInstance().deleteNotice(notice_id);
    if(if_success==1)
    {%>
<div class="alert alert-success" role="alert">
    删除成功！3秒后自动返回主页,您也可以点击后面的链接直接返回<a href="main.jsp" class="alert-link">返回主页</a>
</div>
<%}
else{%>
<div class="alert alert-danger" role="alert">
    删除失败，可能未找到该公告编号,3秒后自动返回主页</a>
</div>
<%}%>
</body>
</html>