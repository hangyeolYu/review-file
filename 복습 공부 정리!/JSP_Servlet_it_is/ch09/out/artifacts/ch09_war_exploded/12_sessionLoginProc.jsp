<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/27
  Time: 12:02 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="regMgr" class="ex01.RegisterMgrPool"/>
<%--loginRegister (id,pwd)
    :테이블에 아이디와 ㅡ패스워드가 존재하는지 체크
    :true/false 반환 --%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id ="";
    String pwd = "";
    if(request.getParameter("id")!=null) {
        id = request.getParameter("id");}
    if(request.getParameter("pwd")!=null){
        pwd = request.getParameter("pwd");}
    if(regMgr.loginRegister(id,pwd)){
       session.setAttribute("idKey",id);
       //아이디를 세션으로 가지는 새로운 세션 부여


%>
<%--조건 이 true ,false 에따라 스크립트 코드도 작성이 된다! 개쩌넹 --%>
<script>
    alert("로그인 성공!");
    location.href = "13_sessionLoginOk.jsp";
</script>
<%
    }else{%>
    <script>
    alert("로그인 실패!");
    location.href = "11_sessionLogin.jsp";
    </script>
   <% }
%>

</body>
</html>
