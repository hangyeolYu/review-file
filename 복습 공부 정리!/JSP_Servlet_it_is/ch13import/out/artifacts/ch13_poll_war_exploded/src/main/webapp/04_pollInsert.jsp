<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br />
		<h2>��ǥ���α׷�</h2>
		<hr width="600" />
		<b>�����ۼ�</b>
		<hr width="600" />
		<form method="post" action="05_pollInsertProc.jsp">
			<table border="1" width="500">
				<tr>
					<td><b>����</b></td>
					<td colspan="2"><input name="question" size="30"></td>
				</tr>
				<tr>
					<td rowspan="8"><b>�׸�</b></td>
				</tr>
					<%
						for (int i = 1; i <= 4; i++) {
							out.println("<tr>");
							out.println("<td>" + (i * 2 - 1)
									+ ": <input name='item'></td>");
							out.println("<td>" + (i * 2)
									+ ": <input name='item'></td>");
							out.println("</tr>");

						}//for end
					%>
				<tr>
					<td>������</td>
					<td colspan="2"><select name="sdateY">
							<option value="2021">2021
							<option value="2022">2022
					</select>�� <select name="sdateM">
							<%
								for (int i = 1; i <= 12; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
					</select>�� <select name="sdateD">
							<%
								for (int i = 1; i <= 31; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
					</select>��</td>
				</tr>
				<tr>
					<td>������</td>
					<td colspan=2><select name="edateY">
							<option value="2021">2021
							<option value="2022">2022
					</select>�� <select name="edateM">
							<%
								for (int i = 1; i <= 12; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
					</select>�� <select name="edateD">
							<%
								for (int i = 1; i <= 31; i++) {
									out.println("<option value='" + i + "'>" + i);
								}
							%>
					</select>��</td>
				</tr>
				<tr>
					<td>������ǥ</td>
					<td colspan=2>
						<input type="radio" name="type" value="1" checked>yes 
						<input type="radio" name="type" value="0">no
					</td>
				</tr>
				<tr>
					<td colspan=3>
						<input type="submit" value="�ۼ��ϱ�"> 
						<input type="reset" value="�ٽþ���"> 
						<input type="button" value="����Ʈ" onClick="javascript:location.href='01_pollList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>