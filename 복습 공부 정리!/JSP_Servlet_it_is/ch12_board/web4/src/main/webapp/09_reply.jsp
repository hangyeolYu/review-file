<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="bean" class="ex01.BoardBean" scope="session"/>
<%-- 05_read.jsp ���ǿ��� ������ �Խù� ��ü�� ���ǿ��� �ٽ� ������ (�ݵ�� �����ߴ� id ���� bean���� ����) --%>
<%
		  String nowPage = request.getParameter("nowPage");
		  String subject = bean.getSubject();
		  String content = bean.getContent(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
<br><br>
 <table width="600" cellpadding="3">
  <tr>
   <td bgcolor="#CCCC00" height="21" align="center">�亯�ϱ�</td>
  </tr>
</table>

<!-- ���� BoardReplyServlet�� �������� ������ BoardReplyServlet ȣ�� -->
<form method="post" action="BoardReplyServlet" >
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td width="20%">�� ��</td>
     <td width="80%">
	  <input name="name" size="30" maxlength="20"></td>
    </tr>
    <tr>
     <td>�� ��</td>
     <td>
     <!-- �亯�ϰ��� �ϴ� �Խù��� ������ ������ -->
	  <input name="subject" size="50" value="�亯 : <%=subject%>" maxlength="50"></td> 
    </tr>
	<tr>
     <td>�� ��</td>
     <td>
     
     <!-- �亯�ϰ��� �ϴ� �Խù��� �亯�� ������ -->
	  <textarea name="content" rows="12" cols="50">
      	<%=content %>
      	========�亯 ���� ������.=======
      	</textarea>
      </td>
    </tr>
    <tr>
     <td>��� ��ȣ</td> 
     <td>
	  <input type="password" name="pass" size="15" maxlength="15"></td> 
    </tr>
    <tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr> 
     <td colspan="2">
	  <input type="submit" value="�亯���" >
      <input type="reset" value="�ٽþ���">
      <input type="button" value="�ڷ�" onClick="history.back()"></td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>" >
 <input type="hidden" name="nowPage" value="<%=nowPage%>">
 <input type="hidden" name="ref" value="<%=bean.getRef()%>">
 <input type="hidden" name="pos" value="<%=bean.getPos()%>">
 <input type="hidden" name="depth" value="<%=bean.getDepth()%>">
</form> 
</div>
</body>
</html>