<%--
  Created by IntelliJ IDEA.
  User: ZZM
  Date: 2021/6/10
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String time = request.getParameter("time");
%>
<h1>id=<%=id%></h1>
<h2>id=<%=time%></h2>
</body>
</html>
