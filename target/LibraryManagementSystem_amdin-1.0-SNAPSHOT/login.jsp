<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>

<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
    int admin_id = Integer.parseInt(request.getParameter("id"));
    String password = request.getParameter("password");
    if(DataBaseOperator.getInstance().canLogin(admin_id,password)){
        admin.setAdmin_id(admin_id);
        admin.setAdmin_pwd(password);
%>
<jsp:forward page="main.jsp"></jsp:forward>
<%} else {
%>
<jsp:forward page="loginerror.jsp"></jsp:forward>
<%}
%>
</body>
</html>

