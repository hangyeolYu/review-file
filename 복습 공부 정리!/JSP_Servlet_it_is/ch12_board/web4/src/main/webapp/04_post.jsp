<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
<br/><br/>
<table width="600" cellpadding="3">
	<tr>
		<td bgcolor="84F399" height="25" align="center">�۾���</td>
	</tr>
</table>
<br/>
<!-- ���� BoardPostServlet ���� ������ BoardPostServlet ȣ��   -->
<form name="postFrm" method="post" action="BoardPostServlet" enctype="multipart/form-data">
<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<tr>
				<td width="10%">�� ��</td>
				<td width="90%">
				<input name="name" size="10" maxlength="8"></td>
			</tr>
			<tr>
				<td>�� ��</td>
				<td>
				<input name="subject" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td>�� ��</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>��� ��ȣ</td>
				<td><input type="password" name="pass" size="15" maxlength="15"></td>
			</tr>
			<tr>
			 <tr>
     			<td>����ã��</td> 
     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
    		</tr>
 			<tr>
 				<td>����Ÿ��</td>
 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
  			 	</td>
 			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
					 <input type="submit" value="���">
					 <input type="reset" value="�ٽþ���">
					 <input type="button" value="����Ʈ" onClick="javascript:location.href='03_list.jsp'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<!-- �Խù��� ����� ������� IP �ּ� ������
	IP �ּҰ� 0:0:0:0:0:0:1�� �� run configuration (argument) -Djava.net.preferIPv4Stack=true
	IP �ּҰ� 0:0:0:0:0:0:1 => ipv6 �ּҸ� ������ �� 
	(ipv4���� ���� ���ͳ� �������� ����, �ּұ��� �þ (32bit -> 128bit))
 -->
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
</div>
</body>
</html>