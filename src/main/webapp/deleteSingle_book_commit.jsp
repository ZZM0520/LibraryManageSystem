<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="LibraryManagementSystem_admin.Single_book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%response.setHeader("refresh", "3;URL=main.jsp");%>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>删除一本图书单本</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>
<br/>
<%
    int if_success=0;
    int serial = Integer.parseInt(new String(request.getParameter("serial").getBytes("ISO-8859-1"),"utf-8"));
    if_success=DataBaseOperator.getInstance().deleteSingle_book(serial);
    if(if_success==1)
    {%>
<div class="alert alert-success" role="alert">
    删除成功！3秒后自动返回主页,您也可以点击后面的链接直接返回<a href="main.jsp" class="alert-link">返回主页</a>
</div>
<%}
else{%>
<div class="alert alert-danger" role="alert">
    删除失败!可能未找到该单个图书编号
</div>
<%}%>
</body>
</html>