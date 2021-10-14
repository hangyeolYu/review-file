<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		session.invalidate();
		response.sendRedirect("01_login.jsp");

		//세션 끊어주고 1번 페이지로 이동
%>