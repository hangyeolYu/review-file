<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- application
	: ����/�ۿ� ���� ���� ������ �ִ� ��ü
	: �� ����ǰ� �ִ� ���� ����, �̺�Ʈ �α� ���� ���
	
	String getServerInfo(): ���� �����̳� �̸�/���� ��ȯ
	String getMimeType(filename): �ش� ������ MIME Ÿ�� ��ȯ
	(text/html, text/gif, text/xml, text/plain)
	String getRealPath(url): url�� ���� ���� �ý��� ��ȯ�Ͽ� ��ȯ
	void log(message): �α� ���Ͽ� message ���
 -->
 <%
 	String serverInfo = application.getServerInfo();
 	String mimeType 
 	= application.getMimeType("06_session1.html");
 	
 	String realPath = application.getRealPath("/");
 	
 	out.println(serverInfo + "<br/>");
 	out.println(mimeType + "<br/>");
 	out.println(realPath + "<br/>");
 
 %>
</body>
</html>