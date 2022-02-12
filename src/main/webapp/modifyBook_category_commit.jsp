<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page import="LibraryManagementSystem_admin.Book_Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>修改category</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
    String result = "修改category失败";
    int category_id =Integer.parseInt(new String(request.getParameter("id").getBytes("ISO-8859-1"),"utf-8"));
    String category_name =new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
    if(DataBaseOperator.getInstance().modifyBook_category(category_id,category_name)==1){
        result = "修改category成功";
    }
    %>
<div class="alert alert-primary" role="alert">
    <p><%=result%></p>
    <p><a style="text-decoration: none" href="main.jsp">返回主界面</a></p>
</div>
</body>
</html>
