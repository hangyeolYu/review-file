<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/23
  Time: 5:03 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Title</title>
</head>
<body>

<%--스크립트립   (*******) (jspService() 함수 내부 )--%>
    <%
        double round = Math.round(Math.PI);

//        Date date = new Date();
//        SimpleDateFormat simple
//        = new SimpleDateFormat("YYYY-MM-DD");
//        String strdate = simple.format(date);

        Date date = new Date();
    %>


<%-- 함수는 선언부에만 넣을수 있다! 필드 이기때문 ㅋ 그냥 % 는 함수 그자체여서 변수만 들어가는것! --%>
    <%!


        public  int better(int a, int b) {
            return a> b ? a:b;
    }
    %>
<%--  PI 반올림 Math.round(Math.PI)
        현재 날짜와 시간은? 2021-08-23 5:03
        매개 변수 값 중에서 더 큰값을 반환 하는 메소드 --%>

얘는 파이값 반올림 :<%=round%> <br>
<%--  오늘 날짜 :   <%=strdate%> <br>--%>
    오늘 날짜 : <%=date.toString()%>
   두수중 더 큰수를 반환 : <%=better(1,2)%> <br>

</body>
</html>
