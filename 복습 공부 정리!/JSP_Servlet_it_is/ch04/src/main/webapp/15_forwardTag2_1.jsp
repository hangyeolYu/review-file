<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	// �������� �������� ���������� �Ѿ
	// �ܺ������� ����Ǵ� �������� 15.jsp

	// A, B, O, AB
	String bt 
	= request.getParameter("bt");

	String text = "���� ���� �׽�Ʈ";
	
%>

<jsp:forward page='<%=bt + ".jsp"%>'>
	<jsp:param name="text" value="<%=text%>" />
</jsp:forward>

<%-- forward ���� ��쿡�� url�� 15�� �������� ������ ä��
15���� ������� A,AB,B,O.jsp �������� �ѿ��ִ� �ű� ������
���� 15�� ���������� ���ڵ� ����� ��������� �� --%>

<%-- A/AB/B/O.jsp forward (+ "���� ���� �׽�Ʈ")

����� ������ ���� �߰� �Ķ���� ���� --%>

</body>
</html>