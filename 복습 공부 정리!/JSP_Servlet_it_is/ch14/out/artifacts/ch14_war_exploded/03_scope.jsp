<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/09/02
  Time: 10:13 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("msg","Fighting!");
    // 페이지 영역에 셋하기! (jsp 내장 객체 )
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--JSP 표현식
    값이 없을때는 null 출력--%>
<%=request.getAttribute("sum")%>
<%--// 응답 페이지의 내장객체에 sum 이란걸 들고온다!--%>
<%=pageContext.getAttribute("msg")%>
<%=session.getAttribute("id")%>
<%=application.getAttribute("name")%>
<br>

<%--EL 표현식
    값이 없을때는 빈문자열 ("출력")
--%>
${requestScope.sum}<br>
${pageScope.msg}<br>
${sessionScope.id}<br>
${applicationScope.name}<br>

<%--    pageScope : el 내장 객체 --%>

</body>
</html>
