<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.Lost_record"%>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>通过lost_id来获取一条丢书记录</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<h1>丢书记录</h1>
<br/>
<%
    Date d = new Date();
    SimpleDateFormat df = new SimpleDateFormat();
    String now = df.format(d);
    String result="";
    int theLost_record_id = Integer.parseInt(new String(request.getParameter("id").getBytes("ISO-8859-1"),"utf-8"));
    Lost_record lost_records = DataBaseOperator.getInstance().getLost_record(theLost_record_id);
    result += "<tr>";
    result += "<td>";
    result += lost_records.getLost_id();
    result += "</td>";
    result += "<td>";
    result += lost_records.getBorrow_record_id();
    result += "</td>";
    result += "<td>";
    result += lost_records.getPrice();
    result += "</td>";
    String if_compensate = "否";
    if (lost_records.getIf_compensate() == true)
        if_compensate = "是";
    result += "<td>";
    result += if_compensate;
    result += "</td>";
    String compensation_way = "书";
    if (lost_records.getCompensation_way() == 1)
        compensation_way = "现金";
    result += "<td>";
    result += compensation_way;
    result += "</td>";
    result += "<td>";
    result += lost_records.getSerial();
    result += "</td>";
    result += "</tr>";
%>
<div>
    <table class="table table-hover" id="表格">
        <thead>
        <tr>
            <th scope="col">丢失记录id</th>
            <th scope="col">借书记录id</th>
            <th scope="col">价格</th>
            <th scope="col">是否赔偿</th>
            <th scope="col">赔偿方式</th>
            <th scope="col">子书序号</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <%=result%>
        </tbody>
    </table>
</div>
</body>
</html>