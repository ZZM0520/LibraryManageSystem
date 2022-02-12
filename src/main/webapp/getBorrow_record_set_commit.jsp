<%@ page import="LibraryManagementSystem_admin.Admin_Info" %>
<%@ page import="LibraryManagementSystem_admin.Borrow_record"%>
<%@ page import="LibraryManagementSystem_admin.DataBaseOperator" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="LibraryManagementSystem_admin.Admin_Info" scope="session"></jsp:useBean>
<html>
<head>
    <title>通过用户手机号查所有借书记录</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<h1>通过用户手机号查所有借书记录</h1>
<br/>
<%
    Date d = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
    String now = df.format(d);
    String phone_number = new String(request.getParameter("id").getBytes("ISO-8859-1"),"utf-8");
    int user_id = DataBaseOperator.getInstance().getUser_ID(phone_number);
    ArrayList<Borrow_record> Borrow_records=DataBaseOperator.getInstance().getBorrow_record_set(user_id);
    String pattern = "yyyy-MM-dd";
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
    if(Borrow_records!=null)
    {
        String result = "查询结果:<br>";
        int num=Borrow_records.size();
        for(int i=0;i<num;i++) {
            result += "<tr>";
            result += "<td>";
            result += Borrow_records.get(i).getBorrow_id();
            String id = String.valueOf(Borrow_records.get(i).getBorrow_id());
            result += "</td>";
            result += "<td>";
            result += Borrow_records.get(i).getUser_id();
            result += "</td>";
            result += "<td>";
            result += Borrow_records.get(i).getBook_id();
            result += "</td>";
            result += "<td>";
            result += simpleDateFormat.format(Borrow_records.get(i).getBorrowOutTime());
            result += "</td>";
            result += "<td>";
            result += simpleDateFormat.format(Borrow_records.get(i).getPredictReturnTime());
            result += "</td>";
            String ActualReturnTime="暂无";
            if(Borrow_records.get(i).getActualReturnTime()!=null)
                ActualReturnTime=simpleDateFormat.format(Borrow_records.get(i).getActualReturnTime());
            result += "<td>";
            result += ActualReturnTime;
            result += "</td>";
            String if_return="否";
            if(Borrow_records.get(i).isIf_Return()==true)
                if_return="是";
            result += "<td>";
            result += if_return;
            result += "</td>";
            result += "<td>";
            result += Borrow_records.get(i).getPrice();
            result += "</td>";
            if(if_return.equals("否"))
            {
                result+="<td>";
                result+="<input class=\"btn btn-outline-success\" type=\"button\" value=\"还书\" onClick=\"javascript:window.open('return_singleBook_commit.jsp?id=";
                result+=id;
                result+="&time=";
                result+=now;
                result+="')\"/>";
                result+= "</td>";
            }
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
            <th scope="col">Borrow_id</th>
            <th scope="col">User_id</th>
            <th scope="col">Book_id</th>
            <th scope="col">借出时间</th>
            <th scope="col">预计归还时间</th>
            <th scope="col">实际归还时间</th>
            <th scope="col">是否归还</th>
            <th scope="col">价格</th>
            <th scope="col">还书</th>
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