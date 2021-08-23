<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/23
  Time: 5:48 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--표현식 (expression)
    :동적인 jsp 페이지를 브라우저에 표현하기 위한 요소
        (변수 출력,메소드 결과값)
        : ;(세미콜론 X ) ==> Servlet 변환될때 알아서 세미콜론 븉여짐

        : OUT 내장 객체 브라우저 출력 가능
        *OUt 내장 객체 jsp 페이지의 결과를 출력해주는 객체
        --%>

<%
    String [] name = {"java","JSP","Servlet"};
    for(int i =0; i< name.length;i++){%>
    <%=i %> = <%=name[i]%> <br>
   <% }
%>

</body>
</html>
