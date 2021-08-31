<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/30
  Time: 4:56 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();

%>
<script>
    alert("로그이웃!");
    location.href = "01_login.jsp";
</script>
