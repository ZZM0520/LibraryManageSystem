<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="LibraryManagementSystem_admin.Single_book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% response.setHeader("refresh", "10;URL=main.jsp");%>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>删除一本图书</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<%
    int if_success=0;
    int book_id = Integer.parseInt(new String(request.getParameter("book_id").getBytes("ISO-8859-1"),"utf-8"));
    if_success=DataBaseOperator.getInstance().deleteBook_Info(book_id);
    if(if_success==1)
    {%>
<div class="alert alert-success" role="alert">
   删除成功！10秒后自动返回主页,您也可以点击后面的链接直接返回<a href="main.jsp" class="alert-link">返回主页</a>
</div>
<%} else if(if_success==2) {
    ArrayList<Single_book> single_books=DataBaseOperator.getInstance().getSingle_Book_Set(book_id);
int single_book_num=single_books.size();
%>
<div class="alert alert-danger" role="alert">
    <p>删除失败！10秒后自动返回主页</p>
    <p>还有<%=single_book_num%>本该图书编号的书未被删除，<strong>请先将该图书编号的本数归零再删除该书</strong></p>
    <p>未被删除的子书的序号为:</p>
    <%for(int i=0;i<single_book_num;i++){%>
    <p><%=single_books.get(i).getSerial()%></p>
</div>
    <%}
} else{%>
<div class="alert alert-danger" role="alert">
    <p>删除失败,可能未找到该图书编号,10秒后自动返回主页</p>
</div>
<%}%>
<a href="main.jsp">返回主界面</a>
</body>
</html>