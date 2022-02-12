<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.Notice_Info"%>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>

<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>获得一条公告</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<h1>获得一条公告</h1>
<br/>
<%

    String result = "";
    ArrayList<Notice_Info> notice_infos_info=DataBaseOperator.getInstance().getAllNotice_Info();
    String pattern = "yyyy-MM-dd";
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
    int num = notice_infos_info.size();
    for (int i = 0; i < num; i++) {
        result += "<tr>";
        result += "<td>";
        result += notice_infos_info.get(i).getNotice_title();
        result += "</td>";
        result += "<td>";
        result += notice_infos_info.get(i).getNotice_author();
        result += "</td>";
        result += "<td>";
        Date time = notice_infos_info.get(i).getNotice_release_time();
        String now = simpleDateFormat.format(time);
        result+=now;
        result += "</td>";
        result += "<td>";
        result+="<a href=\"getNotice_Info.jsp?notice_id=";
        result += notice_infos_info.get(i).getNotice_id();
        result += "\">查看详细信息</a>";
        result += "</td>";
        result += "<td>";
        result+="<a href=\"deleteNotice_commit.jsp?notice_id=";
        result += notice_infos_info.get(i).getNotice_id();
        result += "\">删除这条公告</a>";
        result += "</td>";
    }
%>
<div>
    <table class="table table-hover" id="表格">
        <thead>
        <tr>
            <th scope="col">公告标题</th>
            <th scope="col">公告作者</th>
            <th scope="col">公告发布时间</th>
            <th scope="col">文本公告内容</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <%=result%>
        </tr>
        </tbody>
    </table>
</div>
<a href="main.jsp">返回主页</a>

</body>
</html>