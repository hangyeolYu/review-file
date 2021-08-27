<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/27
  Time: 2:42 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  session.invalidate();

  //쿠키는 내가 유지하는게 아니라 사용자한테 있으니 계속 request 로 응답을 가지고 와야하나
    //session 은 내가 가지고 있으니 그냥 세션 닫아주면됨
%>
<script>
    alert("로그아웃!");
    location.href="11_sessionLogin.jsp";//로그인 시도 페이지로 이동
</script>

</body>
</html>
