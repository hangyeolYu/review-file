<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    session="true"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- session
	: ������� ��û�� ���� ���� ����
	
	���� ����
	: ������ Ŭ���̾�Ʈ�� ���� ������ ���������� �����ϴ� ����
	
	< session ���� ��ü �޼ҵ� >
	String getId(): �ش� ������ ���� ID ��ȯ
	long getCreationTime(): ������ ������ �ð� ��ȯ
	long getLastAccessedTime(): Ŭ���̾�Ʈ ��û�� ���������� �õ��� �ð� ��ȯ
	void setMaxInactiveInterval(time): ������ ������ �ð��� �ʴ����� ����
	int getMaxInactiveInterval(): string�� �������� ���
	boolean isNew(): Ŭ���̾�Ʈ ���� ID�� �Ҵ����� ���� ��� true ��ȯ
	void invalidate(): �ش� ���� ����
	
 -->
 
 <%
	 request.setCharacterEncoding("EUC-KR");
	
	 String id = request.getParameter("id");
	 String pwd = request.getParameter("pwd");
 
 	session.setAttribute("idKey", id);
 	// Goott�� idKey�� ���� session ��ü ���� ����
 	
 	session.setMaxInactiveInterval(60*5);
 	// session ��ü�� ���� �ð��� 5�� (5 * 60) ����
 	// 5�� ��� �Ŀ��� �ڵ� ���� ����
 
 %>
<h1>��������</h1>
<form method="post" action="08_session1_1.jsp">
    1.���� �����ϴ� ������?<br/>
	<input type="radio" name="season" value="��">��
	<input type="radio" name="season" value="����">����
	<input type="radio" name="season" value="����">����
	<input type="radio" name="season" value="�ܿ�">�ܿ�<p/>

	2.���� �����ϴ� ������?<br/>
	<input type="radio" name="fruit" value="watermelon">����
	<input type="radio" name="fruit" value="melon">���
	<input type="radio" name="fruit" value="apple">���
	<input type="radio" name="fruit" value="orange">������<p/>
	<input type="submit" value="result">
</form>

</body>
</html>