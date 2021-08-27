<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/27
  Time: 10:34 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Cookie cookie = new Cookie("myCookie","1234");
    //myCoolie: 쿠키 이름
    //1234: 쿠키 값

    cookie.setMaxAge(60);//1분  쿠키를 얼마나 유지할건지 초단위
    cookie.setValue("2345");//쿠키값 변경

    response.addCookie(cookie);;
    //클라이언트한테 응답해줄때 쿠키를 보냄
    //애초에 처음에는 데이터가 없으므로 서버에서 클라이언트에게 데이터를줌!

%>
쿠키 내용 확인 <a href="02_tasteCookie.jsp">클릭!</a>
</body>
</html>
