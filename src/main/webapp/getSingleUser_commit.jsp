<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.User_Info"%>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>查看用户信息</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<h1>查看用户信息</h1>
<br/>
<%
    int user_id = Integer.parseInt(new String(request.getParameter("id").getBytes("ISO-8859-1"),"utf-8"));
    User_Info user1=null;
    user1=DataBaseOperator.getInstance().getUserInfo(user_id);
    String pattern = "yyyy-MM-dd";
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
    if(user1!=null)
    {%>
<div class="alert alert-success" role="alert">
    <p>查询成功</p>
    <p><a style="text-decoration: none" href="main.jsp">返回主界面</a></p>
</div>
<div>
    <table class="table table-hover" id="表格">
        <thead>
        <tr>
            <th scope="col">用户id</th>
            <th scope="col">手机号</th>
            <th scope="col">姓名</th>
            <th scope="col">生日</th>
            <th scope="col">身份</th>
            <th scope="col">邮箱</th>
            <th scope="col">QQ</th>
            <th scope="col">信用</th>
            <th scope="col">注册时间</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><%=user1.getUser_id()%></td>
            <td><%=user1.getPhone_number()%></td>
            <td><%=user1.getName()%></td>
            <td><%=simpleDateFormat.format(user1.getBirthday())%></td>
            <td>普通用户</td>
            <td><%=user1.getEmail()%></td>
            <td><%=user1.getQq()%></td>
            <td><%=user1.getCredit()%></td>
            <td><%=simpleDateFormat.format(user1.getRegister_time())%></td>
        </tbody>
    </table>
</div>
    <%}
    else
    {%>
<div class="alert alert-danger" role="alert">
    <p>查询失败</p>
    <p><a style="text-decoration: none" href="main.jsp">返回主界面</a></p>
</div>
    <%}
%>

<a href="main.jsp">返回主界面</a>
</body>
</html>