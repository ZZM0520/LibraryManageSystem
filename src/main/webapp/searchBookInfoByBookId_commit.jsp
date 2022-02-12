<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page import="LibraryManagementSystem_admin.Book_Info"%>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>通过book_id查找书目</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<h1>通过图书编号查找书目</h1>
<br/>
<%
    int book_id =Integer.parseInt(new String(request.getParameter("book_id").getBytes("ISO-8859-1"),"utf-8"));
    Book_Info book_info=null;
    book_info=DataBaseOperator.getInstance().getBookInfo(book_id);
    if(book_info==null)
    {%>
<div class="alert alert-danger" role="alert">
    <p>未查找到指定书</p>
    <p><a style="text-decoration: none" href="main.jsp">返回主界面</a></p>
</div>
<%}
else
{
    String result = "查询结果:<br>";
        result += "<tr>";
        result += "<td>";
        result += book_info.getBook_id();
        result += "</td>";
        result += "<td>";
        result += book_info.getIsbn();
        result += "</td>";
        result += "<td>";
        result += book_info.getBook_name();
        result += "</td>";
        result += "<td>";
        result += book_info.getPublisher();
        result += "</td>";
        result += "<td>";
        result += book_info.getAuthor();
        result += "</td>";
        result += "<td>";
        result += DataBaseOperator.getInstance().getBookCategory_name(book_info.getCategory_id());
        result += "</td>";
        result += "<td>";
        result += book_info.getPrice();
        result += "</td>";
        result += "<td>";
        result += book_info.getTotal_number();
        result += "</td>";
        result += "<td>";
        result += book_info.getAvailable_number();
        result += "</td>";
        result += "</tr>";
%>
<div class="alert alert-success" role="alert">
    <p>查找成功！</p>
    <p><a style="text-decoration: none" href="main.jsp">返回主界面</a></p>
</div>
<div>
    <table class="table table-hover" id="表格">
        <thead>
        <tr>
            <th scope="col">书id</th>
            <th scope="col">ISBN</th>
            <th scope="col">书名</th>
            <th scope="col">出版社</th>
            <th scope="col">作者</th>
            <th scope="col">种类</th>
            <th scope="col">价格</th>
            <th scope="col">该书总数</th>
            <th scope="col">该书可借总数</th>
        </tr>
        </thead>
        <tbody>
        <%=result%>
        </tbody>
    </table>
</div>

<%}
%>
<a href="main.jsp">返回主界面</a>
</body>
</html>