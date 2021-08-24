<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/24
  Time: 2:48 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  request.setCharacterEncoding("EUC-KR");
%>
<%--포워딩 전의 내용 출력 X --%>
<h1>Foward Tag Example</h1>
Forward Tag 포워딩 전의 페이지

<jsp:forward page="29_forwardTag1_2.jsp"/>
<%--forward action tag를 통해 13번으로 넘어감
27.html 에서 입력한 데이터 값을28으로 보냈다가 28번의 forward action tag 를 통해
29으로 입력된 데이터 값을 같이 보냄

27 로 입력받은 데이터를 28으로 통해 출력하되 그 데이터는 29번으로 보내져 계산되 출력됨 즉
  28번 출력인데 jsp 는 29번 코드가 사용되는 중임

--%>

<%--<jsp:param/>
    클라이언트 전달한 데이터와는 별도로
    추가적인 값을 생성하는 태그
--%>


</body>
</html>
