<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/23
  Time: 4:34 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="EUC-KR">
    <title>Title</title>
</head>
<body>
<%--스크립트릿

    :선언부에서 선언한 text 를 쓰고 있음!
    :선언부 보다 위에 있어도 선언부가 먼저 읽힘
--%>
<%
    String jsp = text+"JSP";
%>


<%--선언부!
    :다른 jsp 페이지로 이동 x
    :다른 jsp 페이지로 이동할 경우에는
    자바 파일로 만들어서
    모든 jsp 페이지에서 참조하는것이 좋음

    *페이지 간의 이동을 하게 되면 전역 변수/함수 끊김
    *선언부에를 작성하는 경우는 거의없음..!
--%>

<%!
    String text = "Hello!";
    public int add(int a ,int b){
        return a+b;
    }
%>

<%--표현식(; 붙지안흥ㅁ!)--%>
 <%=jsp%>
<%=add(1,2)%>

</body>
</html>
