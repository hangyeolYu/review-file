<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/23
  Time: 3:58 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Title</title>
</head>
<body>
<%-- JSP 스크립트 (script)
    : JSP 문법

    1) 선언문 (declaration):필드  ,맴버 변수 선언
        (클래스 안에 선언)
        (초기화 하지않으면 JVM 가본형 0(false),참조형 NULL 초기화 )

    2)스크립트립 (scriptlet) :지역변수 선언
    (함수 안에 선언)

    3)표현식 (expression) : 변수 사용해서 결과를 브라우저 출력

    4) 주석 (commant)

    *JSP 는 대소문자를 구분!
    --%>


<%--선언문(클래스 내에 전역 변수)--%>
<%!
    String str = "declaration!";

    public String getStr() {
        return str;
    }

    // 이건
    /*  여기서도 가능!*/

    %>
<%--스크립트립 (함수 내에 지역 변수 )--%>
<%
    String str2 = "scriptlet";
    //스크립트립은 초기화 되지않으면 오류!


    // 이건
    /*  여기서도 가능!*/
    %>

<%--표현삭(브라우저에 출력)--%>

선언문 변수 출력 :<%=str%><br>
선언문 함수 출력 :<%=getStr()%><br>
스크립트릿 변수 출력 :  <%=str2%><br>



</body>
</html>
