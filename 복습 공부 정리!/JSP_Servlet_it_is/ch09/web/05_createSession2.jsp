<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/27
  Time: 10:49 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = "admin";
    String pwd = "1234";

    session.setAttribute("idKey",id);
                    //속성 이름 ,벨류 지정
    session.setAttribute("pwdKey",pwd);
%>

세션 생성 완료 !
<a href="06_viewCookieSessionInfo.jsp">쿠키 및 세션 정보 확인</a>

</body>
</html>
