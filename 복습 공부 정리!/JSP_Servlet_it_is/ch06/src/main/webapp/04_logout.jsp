<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate(); // ���� Ŭ���̾�Ʈ ���� ����
	response.sendRedirect("03_login.jsp");
	// �α��� �������� �Ѿ
%>
</body>
</html>