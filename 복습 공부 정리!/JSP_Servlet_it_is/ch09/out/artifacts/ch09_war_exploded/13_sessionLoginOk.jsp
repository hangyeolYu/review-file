<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/27
  Time: 1:15 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--7번,8번 페이지에서 9번으로 올떄
쿠키 정보가 만료가 될수도 있으니 한번더 확인
    루트 1) 7 -> 9 (쿠키에 id 저장되있음 ,자동 로그인)
    루트 2) 7->8->9 (새롭게 로그인을 시도 ,데이터베이스로 넘어가 같은 아이디가 있는지확인 )--%>
<%
    String id = (String)session.getAttribute("idKey");
    if(id ==null){ // 페이지 이동중 세션이 만료 될수도 있우니 한번 더 체크%>
<script>
    alert("로그인 실패!");
    location.href="11_sessionLogin.jsp";
</script>
    <%}


    %>


<h2 align="center">Cookie 로그인</h2>
<table width="300" border="1" align="center">
    <tr>
        <td colspan="2" align="center"><b>Log On Page</b></td>
    </tr>
    <tr>
        <td align="center"><b><%=id%></b>님이 로그인 하셨습니다.</td>
        <td align="center"><a href="14_sessionLogout.jsp">로그아웃</a></td>
    </tr>
</table>

</body>
</html>
