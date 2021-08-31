<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/30
  Time: 5:00 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mgr" class="ex01.MemberMgr"/>
<jsp:useBean id="bean" class="ex01.MemberBean"/>
<jsp:setProperty name="bean" property="*"/>
<%--4번 페이지에서 전달한 파라미터들로 bean set 하겠다!
    setId(id(4번 페이지에서 전달된 파라미터 )),
    setPwd(pwd(4번 페이지에서 전달된 파라미터)),...
--%>
<%
    boolean result = mgr.insertMember(bean);
    String msg = "화원가입 실패!";
    String location = "04_member.jsp";
    if(result){
    msg = "회원가입 성공!";
    location = "01_login.jsp";
    }


%>
<script>
    alert(<%=msg%>);
    location.href = "<%=location%>";

</script>