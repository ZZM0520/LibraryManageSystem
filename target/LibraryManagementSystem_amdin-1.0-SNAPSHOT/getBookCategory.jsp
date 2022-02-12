<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.Book_Info"%>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="LibraryManagementSystem_admin.Book_Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>返回所有书类</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<h1>返回所有书类</h1>
<%
    ArrayList<Book_Category> book_categories=null;
    book_categories=DataBaseOperator.getInstance().getBookCategory();
    if(book_categories!=null)
    {
        String result="查询结果:<br>";
        int numOfBook_categories=book_categories.size();
        for(int i=0;i<numOfBook_categories;i++)
        {
            result += "<tr>";
            result+="<td>";
            result+=book_categories.get(i).getCategory_id();
            result+="</td>";
            result += "<td>";
            result += book_categories.get(i).getCategory_name();
            result += "</td>";
            result += "</tr>";
        }%>
<div class="alert alert-success" role="alert">
    <p>查找成功</p>
    <p><a style="text-decoration: none" href="main.jsp">返回主界面</a></p>
</div>
<div>
    <table class="table table-hover" id="表格">
        <thead>
        <tr>
            <th scope="col">图书种类编号</th>
            <th scope="col">图书种类名称</th>
        </tr>
        </thead>
        <tbody>
        <%=result%>
        </tbody>
    </table>
</div>
    <%} else {%>
<div class="alert alert-danger" role="alert">
    <br>查询错误<br><a href="main.jsp">返回主界面</a>
</div>
    <%}
%>
</body>
</html>