<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page import="LibraryManagementSystem_admin.Notice_Info" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>获得一条公告</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
    String result = "";
    int notice_id = Integer.parseInt(new String(request.getParameter("notice_id").getBytes("ISO-8859-1"),"utf-8"));
    Notice_Info notice_info=DataBaseOperator.getInstance().getNotice_Info(notice_id);
%>
<h1>公告具体信息</h1>
<h5 style="align-self: center">公告ID:<%=notice_info.getNotice_id()%></h5>
<h5 style="align-self: center">公告标题:<%=notice_info.getNotice_title()%></h5>
<h5 style="align-self: center">公告作者:<%=notice_info.getNotice_author()%></h5>
<h5 style="align-self: center">公告内容:<%=notice_info.getNotice_content()%></h5>
<a style="text-decoration:none" href="main.jsp">返回主界面</a>
</body>
</html>