<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/27
  Time: 10:42 오전
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
        //클라이언트 브라우저에서 (**)모든 쿠키 반환
        //처음 생성된 쿠키를 브라우저로 보내서 브라우저에서 다시 보이게 출력을 해줌 !
        if(cookies != null){
            for (int i =0;i < cookies.length;i++){
                //if(cookies[i].getName().equals("myCookie")){
                    out.println(cookies[i].getName() + "<br>");
                    out.println(cookies[i].getValue() + "<br>");
               // }
            }
        }

    %>

</body>
</html>
