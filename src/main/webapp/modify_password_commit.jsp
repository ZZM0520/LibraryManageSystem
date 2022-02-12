<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
    <%
        String result = "修改密码失败";
        String old_password = request.getParameter("old_password");
        String password = request.getParameter("password");
        String password2=request.getParameter("password2");
        if(!password.equals(password2))
        {
            result="新密码前后输入不一致";
        }
        else if(DataBaseOperator.getInstance().modifyPassword(admin.getAdmin_id(), old_password, password)){
            result = "修改密码成功";
        }
    %>
    <div class="alert alert-primary" role="alert">
        <p><%=result%></p>
        <p><a style="text-decoration: none" href="main.jsp">返回主界面</a></p>
        <p><a style="text-decoration: none" href="modify_password.jsp">返回重新修改密码</a></p>
    </div>
</body>
</html>
