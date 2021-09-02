<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/09/02
  Time: 10:50 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
id : ${param.id}<br>
id : ${param["id"]}<br>

pw : ${param.pwd}<br>
pw : ${param["pwd"]}<br>
<%--대괄호 용법은 속성이름에 특수 문자가 있을 경우 사용!--%>
</body>
</html>
