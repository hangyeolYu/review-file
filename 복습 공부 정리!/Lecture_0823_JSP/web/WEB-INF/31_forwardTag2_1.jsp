<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/24
  Time: 3:11 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<%
  //A,B,O,AB
  String bt = request.getParameter("bt");

    request.setCharacterEncoding("EUC-KR");
//   요청할떄 인코딩 방식 지정
  String text="성격 유형 테스트";
%>
<jsp:forward page='<%=bt+".jsp"%>'>
<jsp:param name="text" value="<%=text%>"/>
</jsp:forward>

<%--사용자 데이터 외의 추가 파라미터 전달 --%>
<%--데이터 값이 아닌 매개 변수를 받을수 있음!--%>



</body>
</html>
