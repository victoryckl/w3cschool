<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>转账</title>
</head>
<body>
    <h1>转账</h1>
    <form name="transferForm" method="post" action="${pageContext.request.contextPath}/account/transfer">
        从<input type="text" name="from">转<input type="text" name="amount">给<input type="text" name="to"><input type="submit" value="确定">
    </form>
</body>
</html>
