<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/23
  Time: 2:37 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*,java.text.*" %>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Title</title>
</head>
<body>
<% Date date = new Date();
        SimpleDateFormat simpleDate
        =new SimpleDateFormat("YYYY-MM-DD");
        String strdate = simpleDate.format(date);
        %>
     일반적인 MTML 동적 페이지 형태 <br>
     오늘날짜 <%= strdate%>....!
<!--
    JSP 가장 기본적인 형태
     <%--        <%@...%>,<%....%>, <%=...%>       --%>
        Web Server -> WAS 에게 넘겨저
        적절한 결과를 생성한 뒤에 Web Server 반환
        동적 컨텐츠 부분이 페이지에 포함되서 Client 에게 보여짐

        Clinet 가 볼떄는 정적/동적 페이지 결과 동일


-->


</body>
</html>
