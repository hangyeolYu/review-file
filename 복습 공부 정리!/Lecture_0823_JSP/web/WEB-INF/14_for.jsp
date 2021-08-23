<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/23
  Time: 6:18 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--1+2+3+$.....10= 55--%>

<%
    int sum = 0;
    for(int i =0;i <10;i++ ) {
    sum+= i ;  %>
  <%=i%>+
    }
= <%=sum%>


</body>
</html>
