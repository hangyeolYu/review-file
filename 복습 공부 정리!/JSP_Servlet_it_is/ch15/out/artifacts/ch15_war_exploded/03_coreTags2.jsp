<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/09/02
  Time: 3:09 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${param.id != null}">
    ${param.id} <br>
</c:if>
<c:if test="${empty(param.id)}">
<%--    test="${empty(param.id)}" 같은뜻임 --%>
<%--    빈 문자열은 반환값이 false 임! 그래서 !(param.id )근데이건 여기선 안되는듯 ㅋ --%>
<%--    test="${param.id ==''}" 정석 그 자체 ㅋ--%>

    Guest <br>
</c:if>
<c:choose>
    <c:when test="${param.color=='yellow'}">
        노란색입디다  <br>
    </c:when><c:when test="${param.color=='blue'}">
    파랑색입디다  <br>
</c:when><c:when test="${param.color=='orange'}">
    주황색입디다  <br>
</c:when><c:when test="${param.color=='pink'}">
    핑크색입디다  <br>
</c:when>
    <c:otherwise>
        선택하지않았읍니다 <br>
    </c:otherwise>
</c:choose>

</body>
</html>
