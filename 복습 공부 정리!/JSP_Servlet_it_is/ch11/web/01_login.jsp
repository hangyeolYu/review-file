<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/30
  Time: 4:44 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String id = (String)session.getAttribute("idKey");
%>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="script.js"></script>
</head>
<body>
<div align="center"><br/><br/>
    <%if (id != null) {%>
    <b><%=id%></b>님 환영 합니다.
    <a href="03_logout.jsp">로그아웃</a>
    <%} else {%>
    <form name="loginFrm" method="post" action="02_loginProc.jsp">
        <table>
            <tr>
                <td align="center" colspan="2"><h4>로그인</h4></td>
            </tr>
            <tr>
                <td>아 이 디</td>
                <td><input name="id"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pwd"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div align="right">
                        <input type="button" value="로그인" onclick="loginCheck()">&nbsp;
                        <input type="button" value="회원가입" onClick="javascript:location.href='04_member.jsp'">
                    </div>
                </td>
            </tr>
        </table>
    </form>
    <%}%>
</div>
</body>
</html>
