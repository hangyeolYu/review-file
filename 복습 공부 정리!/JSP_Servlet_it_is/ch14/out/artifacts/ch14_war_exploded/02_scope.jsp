<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/09/02
  Time: 10:09 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  session.setAttribute("id","admin");
  //session 생명주기 (기본값 30분)만큼 유지
  application.setAttribute("name","goott");
  //웹사이트 실행되는동안 유지
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  int sum = 0;
  for (int i=0;i<=10;i++){
    sum +=i;
  }
  request.setAttribute("sum",sum);
//  request 라는 저장소에 sum 이라는 값을 저장

%>
<jsp:forward page="03_scope.jsp"></jsp:forward>
<%--3번으로 제어권이 넘어감 (+요청 객체 정보가 전달이됨! )--%>


</body>
</html>
