<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/24
  Time: 10:54 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="EUC-KR">
</head>
<body>
<%
     request.setCharacterEncoding("EUC-KR");
//     사용자에게 입력받은 데이터를 한국어로 인코딩을 해주겠다!

    String msg = request.getParameter("msg");
    int number
            = Integer.parseInt
            (request.getParameter("number"));
    int count =0;
    while (number >count){%>
       <!-- System.out.println(msg); 이러케 해도되고-->
        <b><%=msg%></b><br>

<%

        ccount++;
    }
%>

</body>
</html>
