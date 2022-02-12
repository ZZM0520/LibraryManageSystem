<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: ZZM
  Date: 2021/6/9
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
    Date d = new Date();
    String pattern = "yyyy-MM-dd";
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

    String now = simpleDateFormat.format(d);
    String id ="test";
    String result="";
    result+="<td>";
    result+="<input class=\"btn btn-outline-success\" type=\"button\" value=\"还书\" onClick=\"javascript:window.open('test_commit.jsp?id=";
    result+=id;
    result+="&time=";
    result+=now;
    result+="')\"/>";
    result+= "</td>";
%>
<table class="table table-hover">
    <thead>
    <tr>
        <th scope="col">还书</th>
        <th scope="col">还书</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <%=result%>
    </tr>
    </tbody>
</table>
</body>
</html>
