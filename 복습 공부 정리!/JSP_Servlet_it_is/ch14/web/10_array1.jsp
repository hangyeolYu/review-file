<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/09/02
  Time: 11:44 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList" %>
<%
    String arr [] = {"JAVA","JSP","Servlet"};
    pageContext.setAttribute("arr",arr);

    ArrayList<String> list
            = new ArrayList<>();
    for (int i = 0;i < arr.length;i++){
        list.add(arr[i]);
    }
    pageContext.setAttribute("list",list);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
${pageScope.arr[0]}<br>
<%--pageScope 은 전역 변수랑 생력가능! (같은 페이지에선)--%>
${arr[1]}<br>
${arr[2]}<br>


${pageScope.list[0]}<br>
<%--pageScope 은 전역 변수랑 생력가능! (같은 페이지에선)--%>
${list[1]}<br>
${list[2]}<br>

</body>
</html>
