<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/27
  Time: 11:43 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="script.js">

    </script>
</head>
<body>
<%
    String id = (String)session.getAttribute("idKey");
    if(id !=null){ //이미 로그인 한적이 있는 사용자 라면
        %>
        <script>
                alert("로그인 성공!");
                location.href = "13_sessionLoginOk.jsp";
        </script>
<%--    보통은 서버 정보를 session 을 넣고 사용자 정보는 Cookie 에 넣음!--%>
    <% }
%>
<h2 align="center">Session 로그인</h2>
<form name="login" method="post">
    <table width="300" border="1" align="center" >
        <tr>
            <td colspan="2" align="center"><b>Log in</b></td>
        </tr>
        <tr>
            <td width="47%" align="center">ID</td>
            <td width="53%" align="center"><input name="id"></td>
        </tr>
        <tr>
            <td align="center">PWD</td>
            <td align="center"><input name="pwd"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="login" onclick='loginCheck("12_sessionLoginProc.jsp")'>
                <input type="reset" value="reset">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
