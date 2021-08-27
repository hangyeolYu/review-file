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
    Cookie [] cookies = request.getCookies();
    String name="";
    String id="";
    if(cookies !=null){
        for (int i =0;i < cookies.length;i++){
            if(cookies [i].getName().equals("idKey")){
                name = cookies[i].getName(); //idKey
                id = cookies[i].getValue();
                //id (admin) 이거 벨류임 속시마셈

            }
        }

    if(!id.equals("")){ %>
        <script>
            //자동 로그인
        alert("로그인 성공!");
        location.href = "09_cookieLoginOk.jsp";
        </script>
    <%}
    }

%>
<h2 align="center">Cookie 로그인</h2>
<form name="login" method="post">
    <table width="300" border="1" align="center">
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
                <input type="submit" value="login" onclick='loginCheck("08_cookieLoginProc.jsp")'>
                <input type="reset" value="reset">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
