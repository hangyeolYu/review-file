<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/24
  Time: 11:48 ����
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="EUC-KR"
    isErrorPage="true" %>
<%--���� ������ ���� --%>
<html>
<head>
  <meta charset="EUC-KR">
    <title>Title</title>
</head>
<body>
<h1> Error Page</h1>
������ ���� ���� �߻� ! <br>
<%=exception.getMessage()%>
<%--���ܰ� �߻��� �������� ���� �޼��� ���
    exception : isErrorPage = "true"
    (���� �� �������� error Page �϶�
    ��������� ���� ��ü )--%>

</body>
</html>
