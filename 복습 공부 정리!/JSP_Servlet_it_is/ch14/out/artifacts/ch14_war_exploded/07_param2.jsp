<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/09/02
  Time: 10:57 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8");%>
<%--사용자에게 받는 데이터의 인코딩을 설정!--%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    name : ${param.name}<br>
    name : ${param["name"]}<br>
//////////////////////////////////<br><br>
    hobby 파람 벨류를 안쓰면? ${param.hobby}<br>
    //////////////////////////////////<br><br>
    hobby 주소 보기! ${paramValues.hobby}<br><br>
    hobby : ${paramValues.hobby[0]}<br>
    hobby : ${paramValues["hobby"][1]}<br>
    hobby : ${paramValues.hobby[2]}<br>
    hobby : ${paramValues["hobby"][3]}<br>
    hobby : ${paramValues.hobby[4]}<br>

<%--데이터가 없는 경우에는 빈 문자열로 출력 --%>
</body>
</html>
