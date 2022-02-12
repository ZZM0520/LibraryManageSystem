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
    ArrayList<Lost_record> lost_records = DataBaseOperator.getInstance().getAllLost_record();
    int num = lost_records.size();
    for (int i = 0; i < num; i++) {
        result += "<tr>";
        result += "<td>";
        result += lost_records.get(i).getLost_id();
        result += "</td>";
        result += "<td>";
        result += lost_records.get(i).getBorrow_record_id();
        result += "</td>";
        result += "<td>";
        result += lost_records.get(i).getPrice();
        result += "</td>";
        String if_compensate = "否";
        if (lost_records.get(i).getIf_compensate() == true)
            if_compensate = "是";
        result += "<td>";
        result += if_compensate;
        result += "</td>";
        String compensation_way = "书";
        if (lost_records.get(i).getCompensation_way() == 1)
            compensation_way = "现金";
        result += "<td>";
        result += compensation_way;
        result += "</td>";
        result += "<td>";
        result += lost_records.get(i).getSerial();
        result += "</td>";
        result += "<td>";
        result += "";
        result += "</td>";
        result += "</tr>";
    }
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