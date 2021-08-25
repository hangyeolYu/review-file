<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/25
  Time: 3:00 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.invalidate();//현재 클라우드 세션 제거
    response.sendRedirect("03_login.jsp");
%>

</body>
</html>
