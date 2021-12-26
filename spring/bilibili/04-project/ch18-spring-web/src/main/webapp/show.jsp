<%--
  Created by IntelliJ IDEA.
  User: live-forever
  Date: 2021/12/26
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    /show.jsp 注册成功

    <br/>
    <%
        System.out.println("jsp request="+request);//这里打印出页面request对象
        //forward后，servlet和jsp中的request不一样？？？
    %>
    <p>查询结果：${stu}</p>
</body>
</html>
