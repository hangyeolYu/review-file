<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/30
  Time: 4:50 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="mMgr" class="ex01.MemberMgr"/>
<%
  request.setCharacterEncoding("UTF-8");
  String id = request.getParameter("id");
  String pwd = request.getParameter("pwd");
  String msg ="로그인 실패!";

  boolean result = mMgr.loginMember(id,pwd);
  if(result){
    session.setAttribute("idKey",id);
    msg="로그인 성공!";
  }
%>
<script>
  alert("<%=msg%>");
  location.href = "01_login.jsp";
</script>