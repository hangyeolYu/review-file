<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- ��ũ��Ʈ�� (scriptlet)
	: ���� ���� ���Ǵ� JSP ��ũ��Ʈ ���
	: .jsp ->(�Ľ�) ���� (.java) ��ȯ�ǰ� ��û�� ��
	_jspService() �ȿ� ����Ǵ� ���
	
	: ���������� �ʱ�ȭ �ڵ� X => ������ ����
	: ����� �޼ҵ� �������� ����� ����

 -->
 <%! 
 	int one; // 0���� �ʱ�ȭ
 	String msgOne; // null�� �ʱ�ȭ
 %>
 
 <% 
 	// �ʱ�ȭ���� ������ ����
 	int two = 31;
 	String msgTwo = "Scriptlet Example";
 %>
 <%= two + " : " + msgTwo%><br/>
 <%= application.getRealPath("/") %>
 <!-- ���� ������Ʈ�� ���� ��� ��� -->
 
</body>
</html>