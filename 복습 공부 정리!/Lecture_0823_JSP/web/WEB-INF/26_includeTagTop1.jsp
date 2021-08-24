<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/24
  Time: 1:12 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<hr>
<%
  String adminEmail = request.getParameter("adminEmail");
%>
Include Action Tag 의 Bottom 부분 <br>
<b><%=adminEmail%></b>
</body>
</html>
