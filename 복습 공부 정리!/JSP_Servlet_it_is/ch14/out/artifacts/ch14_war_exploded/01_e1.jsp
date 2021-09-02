<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/09/02
  Time: 10:02 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="true" %>
<%--EL 문법을 사용하지않겠다!(문법이 무시되고 텍스트 처리됨 ) -true--%>
<%
    request.setAttribute("msg","This is EL");
%>
<!DOCTYPE html>
<html>
<head>

    <title>EL Test</title>
</head>
<body>
  ${msg}
</body>
</html>
