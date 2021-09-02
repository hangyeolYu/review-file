<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/09/02
  Time: 2:51 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--        prefix="이건 접두어 선언!"--%>
<%
  String str1 = "JSTL";
  String str2 = null;
//  스크립트에서 선언한 변수는 일반 표현식으로만 작성해야함!
    //저장소로부터 올떄만 EL 문법 사용가능!
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="str3" value="JSP" scope="page"/>
<%--자바 스크립트 처럼 var ! 변수 형지정 필요 x--%>

  <c:out value="<%=str1%>" default="default"/><br>
  <c:out value="<%=str2%>" default="default"/><br>
   <c:out value="${str3}" default="default"/><br>
<%--  저장소 지정 변수라 EL 태그 사용가능! --%>

<c:remove var="str3"/>

${str3} ...!
<%--변수에 데이터가 없을때 (null) 빈  문자열로 출력이됨! ...! 이것만 보임 ! --%>
</body>
</html>
