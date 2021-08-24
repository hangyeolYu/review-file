<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/24
  Time: 12:35 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("euc-kr");
//    받을때 한국어가 있을수도 있으므로 한국어 설정!


    String name = "Sally"; //의미 없는 부분 ㅋ
    //사용을 안하고 잇음!

%>
<h1>Include Action Tag</h1>
<jsp:include page="25_includeTagTop1.jsp"/>
include Action Tag의 Body 부분

<jsp:include page="26_includeTagTop1.jsp"/>
<%--액션 태그는 나홀로 태그  시작 태그만 있고 종료 태그는 없음! <jsp:.../>--%>
<%--        23 실행 하면서 25번 불러서
            25번 처리결과 (스크립트 부분 제외 )를
            23번에 포함함

--%>

</body>
</html>
