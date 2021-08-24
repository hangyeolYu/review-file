<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/24
  Time: 12:36 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String name = request.getParamer("name");
    //24 번 html name ="name"을 가져온거임!

%>
Include Action Tag의 Top 부분 <br>
<b><%=name%> Fighting!</b>
<hr>


</body>
</html>
