<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page import="LibraryManagementSystem_admin.Book_Info"%>
<%@ page import="LibraryManagementSystem_admin.Query_Terms" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>多条件查找书目</title>
</head>
<body>

<%
    String book_name = new String(request.getParameter("book_name").getBytes("ISO-8859-1"),"utf-8");//转换为中文编码
    String author_name = new String(request.getParameter("author_name").getBytes("ISO-8859-1"),"utf-8");
    String publisher_name = new String(request.getParameter("publisher_name").getBytes("ISO-8859-1"),"utf-8");
    String category_id_s = request.getParameter("category_id");

    int category_id = -1;
    try {
        category_id = Integer.parseInt(category_id_s);
    }catch(Exception e){
        category_id = -1;
    }

    String isbn = new String(request.getParameter("ISBN").getBytes("ISO-8859-1"),"utf-8");
    String available = new String(request.getParameter("available").getBytes("ISO-8859-1"),"utf-8");
    String order = new String(request.getParameter("order").getBytes("ISO-8859-1"),"utf-8");
    String desc = new String(request.getParameter("desc").getBytes("ISO-8859-1"),"utf-8");

    boolean desc1 = false;
    boolean available1 = false;
    if(desc.equals("是")) desc1 = true;
    if(available.equals("是")) available1 = true;

    Query_Terms query = new Query_Terms();
    query.setBook_name(book_name);
    query.setAuthor(author_name);
    query.setPublisher(publisher_name);
    query.setCategory_id(category_id);
    query.setIsbn(isbn);
    query.setAvailable(available1);
    query.setDesc(desc1);
    query.setOrder(order);

    ArrayList<Book_Info> book_infos = DataBaseOperator.getInstance().searchBookInfo(query);
    String book_info_str = "查询结果：<br>";
    for(Book_Info c:book_infos) {
        int book_id = c.getBook_id();
        book_info_str +="<tr>";
        book_info_str +="<td>";
        book_info_str += c.getBook_id();
        book_info_str +="</td>";
        book_info_str +="<td>";
        book_info_str += c.getBook_name();
        book_info_str +="</td>";
        book_info_str +="<td>";
        book_info_str += c.getAuthor();
        book_info_str +="</td>";
        book_info_str +="<td>";
        book_info_str += c.getIsbn();
        book_info_str +="</td>";
        book_info_str +="<td>";
        book_info_str += c.getPublisher();
        book_info_str +="</td>";
        book_info_str +="<td>";
        book_info_str += c.getAvailable_number();
        book_info_str +="</td>";
        book_info_str +="<td>";
        book_info_str += "<a href=\"getSingle_Book_Set_commit.jsp?id=";
        book_info_str+=book_id;
        book_info_str +="\">子书信息</a>";
        book_info_str +="</td>";
        book_info_str +="</tr>";
    }
%>

<table class="table table-hover" id="表格">
    <thead>
    <tr>
        <th scope="col">图书ID</th>
        <th scope="col">图书名称</th>
        <th scope="col">图书作者</th>
        <th scope="col">ISBN</th>
        <th scope="col">出版社</th>
        <th scope="col">馆藏数量</th>
        <th scope="col">详细信息</th>
        <th scope="col">所有子书信息</th>
    </tr>
    </thead>
    <tbody>
    <%=book_info_str%>
    </tbody>
</table>
<a style="text-decoration: none" href="main.jsp">返回主页</a>

</body>
</html>