<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page import="LibraryManagementSystem_admin.Book_Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>

<html>
<head>
    <style>
        a{
            text-decoration: none;
        }
    </style>
    <title>欢迎</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>
<%
    ArrayList<Book_Category> list = DataBaseOperator.getInstance().getBookCategory();
    String book_category_str = "已有图书类别：<br>";
    for(Book_Category c:list) {
        book_category_str +="<tr>";
        book_category_str +="<td>";
        book_category_str += c.getCategory_id();
        book_category_str +="</td>";
        book_category_str +="<td>";
        book_category_str += c.getCategory_name();
        book_category_str +="</td>";
        book_category_str +="</tr>";
    }
    char doubledot = '"';
    String book_category_str01="";
    for(Book_Category c:list)
    {
        book_category_str01+="<option value=";
        book_category_str01+=doubledot;
        book_category_str01+=c.getCategory_id();
        book_category_str01+=doubledot;
        book_category_str01+=">";
        book_category_str01+=c.getCategory_name();
        book_category_str01+="</option>";
    }
%>
<%-------------------------------------------------导航栏----------------------------------------------%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="main.jsp">管理员版图书馆管理系统</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    公告管理 <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a  style="color: black" style="text-decoration: none" href="getAll_Notice_Info_commit.jsp">获得所有公告信息</a></li>
                    <li><a  style="color: black" style="text-decoration: none" href="insertNotice.jsp">插入一条公告</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    图书信息管理 <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a  style="color: black" style="text-decoration: none" href="modifyBook_category.jsp">修改图书类别名称</a></li>
                    <li><a  style="color: black" style="text-decoration: none" href="insertBook_category.jsp">添加新的图书种类</a></li>
                    <li><a  style="color: black" style="text-decoration: none" href="modifyBook_Info.jsp">修改图书信息</a></li>
                    <li><a  style="color: black" style="text-decoration: none" href="insertBook_Info.jsp">添加图书</a></li>
                    <li><a  style="color: black" style="text-decoration: none" href="deleteBook_Info.jsp">删除图书</a></li>
                    <li><a  style="color: black" style="text-decoration: none" href="insertSingleBook.jsp">插入子书</a></li>
                    <li><a  style="color: black" style="text-decoration: none" href="deleteSingle_book.jsp">删除子书</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    借还书管理 <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a  style="color: black" style="text-decoration: none" href="getAll_Borrow_record_commit.jsp">获得所有借书记录</a></li>
                    <li><a  style="color: black" style="text-decoration: none" href="getAll_Lost_record_commit.jsp">获得所有丢书记录</a></li>
                    <div class="dropdown-divider"></div>
                    <li><a  style="color: black" style="text-decoration: none" href="insertBorrow_record.jsp">添加一条借书记录</a></li>
                    <li><a  style="color: black" style="text-decoration: none" href="insertLost_record.jsp">添加一条丢书记录</a></li>
                    <li><a  style="color: black" style="text-decoration: none" href="getLost_record.jsp">查找一条丢书记录</a></li>
                    <div class="dropdown-divider"></div>
                    <li><a  style="color: black" style="text-decoration: none" href="getSingle_Book_Set.jsp">通过图书ID查找所有的子书</a></li>
                    <li><a  style="color: black" style="text-decoration: none" href="getBorrow_record_set.jsp">通过用户手机号查找所有借书记录</a></li>
                    <div class="dropdown-divider"></div>
                    <li><a  style="color: black" style="text-decoration: none" href="return_singleBook.jsp">还书</a></li>
                </ul>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    查找 <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a style="color: #000000" style="text-decoration: none" href="getBookCategory.jsp">查看所有书类</a></li>
                    <li><a  style="color: black" style="text-decoration: none" href="searchBookInfoByBookId.jsp">通过图书ID查找图书信息</a></li>
                </ul>
            </li>
        </ul>
        <div class="form-inline my-2 my-lg-0">
            <a class="nav-link" href="modify_password.jsp" style="color: black" style="text-decoration:none">修改密码</a>
            <a class="nav-link" href="index.jsp" style="color: black" style="text-decoration:none">注销登录</a>
        </div>
    </div>
</nav>
<%-------------------------------------------------导航栏----------------------------------------------%>
<form class="form-inline" action="Advanced_Search_Commit.jsp" method="post">
    <ul class="list-group">
        <li class="list-group-item">
            <div class="input-group mb-3" class="form-group">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="id">书名</label>
                </div>
                <input id="id" type="text" class="form-control" name="book_name" >
            </div>
        </li>
        <li class="list-group-item"> <div class="input-group mb-3" class="form-group">
            <div class="input-group-prepend">
                <label class="input-group-text" for="id01">作者</label>
            </div>
            <input id="id01" type="text" class="form-control" name="author_name" >
        </div></li>

        <li class="list-group-item">  <div class="input-group mb-3" class="form-group">
            <div class="input-group-prepend">
                <label class="input-group-text" for="id02">出版社</label>
            </div>
            <input id="id02" type="text" class="form-control" name="publisher_name" >
        </div></li>
        <li class="list-group-item">
            <div class="input-group mb-3" class="form-group">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="id03">ISBN</label>
                </div>
                <input id="id03" type="text" class="form-control" name="ISBN" >
            </div></li>
        <li class="list-group-item">
            图书种类编号
            <select name="category_id" class="form-select" aria-label="Default select example">
                <option value="">选择种类</option>
                <%=book_category_str01%>
            </select>
        </li>
        <li class="list-group-item">  <div class="input-group mb-3" class="form-group">
            <div class="btn-group btn-group-toggle" data-toggle="buttons">
                是否可用
                <label class="btn btn-secondary">
                    <input type="radio" name="available" id="option3" value="是"> 是
                </label>
                <label class="btn btn-secondary">
                    <input type="radio" name="available"  id="option4" value="否" checked> 否
                </label>
            </div>
        </div></li>
        <li class="list-group-item">排序方式</li>
        <li class="list-group-item">
            按照属性排序
            <select name="order" class="form-select" aria-label="Default select example">
                <option value="">选择属性</option>
                <option value="book_name">书名</option>
                <option value="author">作者</option>
                <option value="publisher">出版社</option>
            </select>
        </li>
        <li class="list-group-item">
            <div class="btn-group btn-group-toggle" data-toggle="buttons">
                是否倒序（是/否）
                <label class="btn btn-secondary">
                    <input type="radio" name="desc" id="option1" value="是"> 是
                </label>
                <label class="btn btn-secondary">
                    <input type="radio" name="desc"  id="option2" value="否" checked> 否
                </label>
            </div>
        </li>
        <div style="align-self: center">
            <button type="submit" class="btn btn-outline-success">查找</button>
        </div>
    </ul>

</form>

</body>
</html>
