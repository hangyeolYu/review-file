<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ex01.*,java.util.Vector"%>
<jsp:useBean id="pMgr" class="ex01.PollMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br/>

		<h2>��ǥ���α׷�</h2>
		<hr width="600"/>
		<b>������</b>
		<!--�� ����Ʈ �� �ڸ�-->
		<jsp:include page="02_pollForm.jsp" />
		<hr width="600"/>
		<b>��������Ʈ</b>
		<!--�� ����Ʈ ���̺� �ڸ�-->
		<table>
			<tr>
				<td> 
					<table width="500" border="1">
						<tr>
							<td align="center"><b>��ȣ</b></td>
							<td><b>����</b></td>
							<td><b>������~������</b></td>
						</tr>
						<%
							  Vector<PollListBean> vlist = pMgr.getAllList();

							  int count = vlist.size();
							  for (int i = 0; i < vlist.size(); i++) {
								PollListBean plBean = vlist.get(i);
								int num = plBean.getNum();
								String question = plBean.getQuestion();
								String sdate = plBean.getSdate();
								String edate = plBean.getEdate();

								out.println("	<tr><td align='center'>" + count + "</td>");
								out.println("<td><a href='01_pollList.jsp?num=" + num + "'>"
										+ question + "</a></td>");
								out.println("<td>" + sdate +" ~ "+ edate + "</td></tr>");
								count = count - 1;
							}
						%>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><a href="04_pollInsert.jsp">���� �ۼ��ϱ�</a></td>
			</tr>
		</table>
	</div>
</body>
</html>