<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/09/02
  Time: 4:13 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--예외처리 기능 (var 속성은 예외 객체를 참조)=> 오류 메세지 출력 --%>
<c:catch var="ex">
<%
  int arr[]={1,2,3};
  int element = arr[3];

%>
</c:catch>
${ex}
<%--예외 내용 출력 (발생되지않으면 출력 안함 )--%>
</body>
</html>
