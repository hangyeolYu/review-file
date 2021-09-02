<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/09/02
  Time: 3:38 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String str1[] = {"sally","philps","poli"};
    String str2 = "sally,philps;poli";
    //스크립 선언 변수 => Core tag 사용
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:set var ="arr" value="<%=str1%>" scope="page"/>
<%--    scope 태그는 변수 범위 지정 기본값 page --%>
<c:forEach var ="element" items="${arr}"
           begin="0" step="1" end="2">
    ${element}<br>
</c:forEach>

<hr/>

<c:set var="str" value="<%=str2%>" scope="page"/>
<c:forTokens var="sttoken" items="${str}" delims=",;">
    ${sttoken}<br>
</c:forTokens>

<hr/>
<%--include action tag 와 같이 결과 포함 --%>
<c:import url="http://localhost:8089/ch15_war_exploded/03_coreTags2.jsp">
    <c:param name="id" value="admin"/>

</c:import>

<hr/>

<c:url var="url" value="https://www.google.com/">
<c:param name="q" value="JSP"/>
</c:url>
<a href="${url}">구글에서 JSP 검색 </a>

<hr/>

<c:redirect url="http://www.oracle.com"/>
<%--response.sendRedirect()
    현재 페이지가 무시가 되고 페이지 전환
    (forward action tag (+사용자 request 정보 O))
    (redurect tag(+사용자 request 정보 X))
--%>
</body>
</html>
