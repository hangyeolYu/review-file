<jsp:directive.page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"/>
<!-- page �տ� ������ (xml ��� ����) -->    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<!-- script ��� (����, ��ũ��Ʈ��, ǥ����, �ּ�) ��ü�ϴ� �׼� �±�
   ��ũ��Ʈ ��ҿ� jsp �����ڸ� ������ ���� �׼� �±׷� ����� �� ����
   (���� ����� ����, ���ϰų� ū ���� ����)
   
   <%--<jsp:declaration></jsp:declaration>--%>
   <%--<jsp:scriptlet></jsp:scriptlet>--%>
   <%--<jsp:expression></jsp:expression>--%>
   <%--<jsp:directive.page contentType="text/html; 
   charset=EUC-KR"/>--%>
   <%--<jsp:directive.include file="xxx.jsp/>--%>
 
 -->
 
 
<body>
<h1>Script Tag Example</h1>
<!-- xml ��� ���� <%--<%!...%>--%>-->
 <jsp:declaration>
    public int max(int i, int j){
       return (i>j)? i : j;
    }
 </jsp:declaration>
 
 <!-- xml ��� ��ũ��Ʈ�� <%--<%...%>--%>-->
 <jsp:scriptlet> 
    int i = 22; 
    int j = 23;
 </jsp:scriptlet>
 
 <!-- xml ��� ǥ���� <%--<%=...%>--%>(������ ���) -->
 i = <jsp:expression>i</jsp:expression>�� 
 j = <jsp:expression>j</jsp:expression> �߿� �� ū ���ڴ�?
<b><jsp:expression>max(i,j)</jsp:expression></b>
</body>
</html>
