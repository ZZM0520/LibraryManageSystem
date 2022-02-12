<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setHeader("refresh", "3;URL=index.jsp");%>
<html>
<head>
    <title>登录失败</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="alert alert-danger" role="alert">
    <p>用户名或密码错误！3秒后自动返回主页</p>
</div>
</body>
</html>
