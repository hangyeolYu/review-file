<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/23
  Time: 4:46 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Title</title>
</head>
<body>
<%--스크립트릿 (scriptlet)
    :가장 많이 사용되는 JSP 스크립트 요소
    :.jsp -> (파싱)서블릿 ,Servlet (.java)) 변환되고 요청될 때
    _jspService()안에 선언되느 요소

    :지역변수는 초기화 자동 X => 컴파일 에러
    :선언된 메소드 내에서만 사용이 가능

    --%>

 <%!
     int one;
     String msgOne;

 %>

<%
    int two =31;
    String msgTwo = "Scriptlet Example";

%>

<%=two + ":"+ msgTwo%><br>
<%=application.getRealPath("/")%>
<%--현재 프로젝트의 절대 경로 출력 --%>

</body>
</html>
