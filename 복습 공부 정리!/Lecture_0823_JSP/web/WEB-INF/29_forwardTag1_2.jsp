<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/24
  Time: 2:53 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("EUC-KR");

    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
%>

<h1>Forward Tag Example</h1>
입력한 아이디는 <%=id%>이고 <br>
패스워드는 <%=pwd%> 입니다 ~

</body>
</html>
