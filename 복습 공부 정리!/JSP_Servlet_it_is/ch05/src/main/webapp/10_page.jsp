<%@ page 
info = "Copyright"
language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- page
	: ������ �� ��ü ��Ÿ���� ��ü
	: this Ű���� �̿�
 -->
<%
	String pageInfo = this.getServletInfo();
	out.println(pageInfo);
%>
</body>
</html>