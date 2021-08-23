<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/23
  Time: 5:57 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    String name = request.getParameter("name");
    String color = request.getParameter("color");
    String msg;

    if(color.equals("blue")) {
        msg = "파란색";
    }
    else if(color.equals("red")) {
        msg = "빨간색";
    }
    else if(color.equals("orange")) {
        msg = "주황색";
    }
    else if(color.equals("yellow")) {
        msg = "노란색";
    }
    else {
        color = "beige";
        msg = "기타색";
    }
%>
<body bgcolor="<%=color%>">
<b> <%=name%> </b>님이 좋아하는 색깔은 <b><%=msg%>입니다</b>


</body>
</html>
