<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/25
  Time: 4:52 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="regBean" class="ex02.MemberBean"/>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%--빈을 사용하겠다!(빈생성 )--%>
<jsp:setProperty name="regBean" property="*"/>
<%--member Beans 의 모든 필드를 (id,name,pwd..)
     를 set 하기위한 함수 호출

     자바 빈즈 값 == input 태그 name 값 --%>
<html>
<head>
    <title>회원가입 확인</title>
</head>
<body>
<table width="80%"align="center" cellspacing="0" cellpadding="5" >
    <tr>
        <td align="center" valign="middle" bgcolor="#FFFFCC">
            <table width="90%" border="1" cellspacing="0" cellpadding="2"  align="center">
                <form name="regForm" method="post" action="memberInsert.jsp">
                    <!-- memberInsert.jsp 나중에 DB 서버와 연결해서 회원가입 정보 넣을 부분 -->
                    <tr align="center">
                        <td colspan="3"><font color="#FFFFFF"><b>
                            <jsp:getProperty name="regBean" property="name" />
                            회원님이 작성하신 내용입니다. 확인해 주세요</b></font></td>
                    </tr>
                    <tr>
                        <td width="24%">아이디</td>
                        <td width="41%"><jsp:getProperty name="regBean" property="id" /></td>
                    </tr>
                    <tr>
                        <td>패스워드</td>
                        <td> <jsp:getProperty name="regBean" property="pwd" /></td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td> <jsp:getProperty name="regBean" property="name" /></td>
                    </tr>
                    <tr>
                        <td>생년월일</td>
                        <td> <jsp:getProperty name="regBean" property="birthday" /></td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td><jsp:getProperty name="regBean" property="email" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="button" value="확인완료"> &nbsp;
                            <input type="button" value="다시쓰기" onClick="history.back()">
                            <!-- history.back() : 잘못된 정보가 있으면 다시 02_member.jsp(이전 페이지)로 이동하여 회원정보를 다시 입력받음 -->
                        </td>
                    </tr>
                </form>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
