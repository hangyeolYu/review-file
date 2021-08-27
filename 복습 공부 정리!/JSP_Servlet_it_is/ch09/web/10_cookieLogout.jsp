<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/27
  Time: 2:42 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Cookie [] cookies = request.getCookies();
    if(cookies != null){
        for (int i =0;i< cookies.length;i++){
            if(cookies[i].getName().equals("idKey")){
                cookies[i].setMaxAge(0);
                //쿠키의 생명 주기를 0으로 만듬 (쿠키 만료 )
                response.addCookie(cookies[i]);
                //응답 객체에게 쿠키의 만료를 알려줌
            }
        }
    }
%>
<script>
    alert("로그아웃!");
    location.href="07_cookieLogin.jsp";//로그인 시도 페이지로 이동
</script>

</body>
</html>
