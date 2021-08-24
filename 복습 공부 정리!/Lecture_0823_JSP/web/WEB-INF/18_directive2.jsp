<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/24
  Time: 11:37 오전
  To change this template use File | Settings | File Templates.
--%>
<%@page info="Copyright 2021 by hangyoul" %>

<%@ page contentType="text/html;charset=UTF-8"
    language="java"
    pageEncoding="EUC-KR"
    session="true"
    buffer="16kb"
    autoFlush="true"
    isThreadSafe="true"
    errorPage="19_error.jsp"


%>

<%--
        contentType charset:
         client 웹 브라우저가 받아볼 페이지의 인코딩 방식
        pageEncoding:
        jsp 페이지에 기록된 소스코드 자체의 인코딩 방식

--%>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Title</title>
</head>
<body>
    <h1> Directive Example</h1>
    <%=this.getServletInfo()%>
<%--페이지 info 출력     --%>
<%--    이부분이 출력되지 않음
one/zero 부분에서 예외발생
예외를 핸들링 해주는 19_error .jsp 내부적으로 실행 --%>

<%--  일부러 error 발생 시킴
   현재 페이지에서 error handling X
   error 페이지로 이동  --%>
<%
    int one =1;
    int zero =0;
    <%=one/zero%>
%>


</body>
</html>
