<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/25
  Time: 4:11 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--   page charset= UTF-8 == 헤드의 meta charset 이랑 같은뜻!  어떻게 보여줄꺼냐 임 --%>

<html>
<head>
    <title>회원가입</title>
    <script src="script.js" charset="UTF-8"></script>
</head>
<body>
<table width="500" align="center" cellspacing="0" cellpadding="5" >
    <tr>
        <td align="center" valign="middle" bgcolor="#FFFFCC">
            <table  border="1" cellspacing="0" cellpadding="2"  align="center">
                <form name="regForm" method="post" action="03_memberProc.jsp">
                    <tr align="center">
                        <td colspan="3"><font color="#FFFFFF"><b>회원 가입</b></font></td>
                    </tr>
                    <tr>
                        <td width="100">아이디</td>
                        <td width="200"><input name="id" size="15"></td>
                        <td width="200">아이디를 적어 주세요.</td>
                    </tr>
                    <tr>
                        <td>패스워드</td>
                        <td><input type="password" name="pwd" size="15"></td>
                        <td>패스워드를 적어주세요.</td>
                    </tr>
                    <tr>
                        <td>패스워드 확인</td>
                        <td><input type="password" name="repwd" size="15"></td>
                        <td>패스워드를 확인합니다.</td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td><input name="name" size="15"></td>
                        <td>고객실명을 적어주세요.</td>
                    </tr>
                    <tr>
                        <td>생년월일</td>
                        <td><input name="birthday" size="27"></td>
                        <td>생년월일을 적어주세요.</td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td><input name="email" size="20"></td>
                        <td>이메일을 적어주세요.</td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <input type="button" value="회원가입" onclick="inputCheck()"> &nbsp;
                            <!-- 회원가입 버튼을 누르면 자바스크립트 함수 inputCheck() 호출해서 모든 내용이 정상적으로 들어왔는지 확인 -->
                            <input type="reset" value="다시쓰기">
                        </td>
                    </tr>
                </form>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
