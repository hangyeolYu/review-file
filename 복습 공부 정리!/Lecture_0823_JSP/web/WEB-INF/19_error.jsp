<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/24
  Time: 11:48 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="EUC-KR"
    isErrorPage="true" %>
<%--에러 페이지 지정 --%>
<html>
<head>
  <meta charset="EUC-KR">
    <title>Title</title>
</head>
<body>
<h1> Error Page</h1>
다음과 같은 예외 발생 ! <br>
<%=exception.getMessage()%>
<%--에외가 발생한 페이지의 예외 메세지 출력
    exception : isErrorPage = "true"
    (현재 내 페이지가 error Page 일때
    만들어지는 내부 객체 )--%>

</body>
</html>
