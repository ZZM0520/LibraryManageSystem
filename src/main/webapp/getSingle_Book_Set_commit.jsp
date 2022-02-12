<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.Single_book"%>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>通过book_id来查所有的子书</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<h1>通过book_id来查所有的子书</h1>
<br/>
<%
    Date d = new Date();
    SimpleDateFormat df = new SimpleDateFormat();
    String now = df.format(d);
    int book_id = Integer.parseInt(new String(request.getParameter("id").getBytes("ISO-8859-1"),"utf-8"));
    ArrayList<Single_book> Single_books=DataBaseOperator.getInstance().getSingle_Book_Set(book_id);
    if(Single_books!=null)
    {
        String result = "查询结果";
        int num=Single_books.size();
        for(int i=0;i<num;i++) {
            result += "<tr>";
            result += "<td>";
            result += (i + 1);
            result += "</td>";
            result += "<td>";
            result += Single_books.get(i).getSerial();
            result += "</td>";
            result += "<td>";
            result += Single_books.get(i).getBook_id();
            result += "</td>";
            String if_index = "否";
            if (Single_books.get(i).getIf_borrow() == true)
                if_index = "是";
            result += "<td>";
            result += if_index;
            result += "</td>";
            if_index = "否";
            if (Single_books.get(i).getIf_lost() == true)
                if_index = "是";
            result += "<td>";
            result += if_index;
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
            <th scope="col">序号</th>
            <th scope="col">子书编号</th>
            <th scope="col">图书ID</th>
            <th scope="col">是否借出</th>
            <th scope="col">是否丢失</th>
        </tr>
        </thead>
        <tbody>
        <%=result%>
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
</body>
</html>