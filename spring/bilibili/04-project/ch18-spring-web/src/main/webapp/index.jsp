<%--
  Created by IntelliJ IDEA.
  User: live-forever
  Date: 2021/12/26
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> 添加学生</title>
</head>
<body>
    <div align="center">
        <p>添加学生</p>
        <form action="add" method="post">
            姓名：<input type="text" name="name"><br/>
            年龄：<input type="text" name="age"><br/>
            <input type="submit" value="注册学生">
        </form>
        <br/>
        <br/>
        <form action="queryId", method="get">
            学生ID：<input type="text" name="stuid"><br/>
            <input type="submit" value="查询学生">
        </form>

    </div>
</body>
</html>
