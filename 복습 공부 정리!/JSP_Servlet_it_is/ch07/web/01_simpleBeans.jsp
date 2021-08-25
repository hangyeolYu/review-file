<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/25
  Time: 3:58 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="any" class="ex01.SimpleBean"></jsp:useBean>
<jsp:setProperty name="any" property="info" value="Java Beans"></jsp:setProperty>
<%--setInfo (""java Bens) 호출
    setter 주는거랑 똑같음!

--%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:getProperty name="any" property="info"/>

</body>
</html>
