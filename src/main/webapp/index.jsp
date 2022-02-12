<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>管理员登录</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<h1>管理员登录</h1>
<br/>
<form class="form-inline" action="login.jsp" method="post">
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="id">id</label>
        </div>
        <input id="id" type="text" class="form-control" name="id" required>
    </div>
    <div class="input-group mb-3" class="form-group">
        <div class="input-group-prepend">
            <label class="input-group-text" for="password">密码</label>
        </div>
        <input id="password" type="password" class="form-control" name="password" required>
    </div>
    <button type="submit" class="btn btn-outline-success">Sign in</button>
    <button type="button" class="btn btn-outline-dark"  id="reset">重置</button>
</form>
<script>
    var resetbut = document.getElementById("reset");
    resetbut.addEventListener('click',reset);
    function reset()
    {
        $("#id").val("");
        $("#password").val("");
    }
</script>
</body>
</html>