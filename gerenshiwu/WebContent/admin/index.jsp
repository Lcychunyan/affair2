<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
//        跳转到index servlet拿数据
        response.sendRedirect(request.getContextPath()+"/user?method=getUserList");
    %>
</body>
</html>
