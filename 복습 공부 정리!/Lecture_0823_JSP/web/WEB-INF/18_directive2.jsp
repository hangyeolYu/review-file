<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/24
  Time: 11:37 ����
  To change this template use File | Settings | File Templates.
--%>
<%@page info="Copyright 2021 by hangyoul" %>

<%@ page contentType="text/html;charset=UTF-8"
    language="java"
    pageEncoding="EUC-KR"
    session="true"
    buffer="16kb"
    autoFlush="true"
    isThreadSafe="true"
    errorPage="19_error.jsp"


%>

<%--
        contentType charset:
         client �� �������� �޾ƺ� �������� ���ڵ� ���
        pageEncoding:
        jsp �������� ��ϵ� �ҽ��ڵ� ��ü�� ���ڵ� ���

--%>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Title</title>
</head>
<body>
    <h1> Directive Example</h1>
    <%=this.getServletInfo()%>
<%--������ info ���     --%>
<%--    �̺κ��� ��µ��� ����
one/zero �κп��� ���ܹ߻�
���ܸ� �ڵ鸵 ���ִ� 19_error .jsp ���������� ���� --%>

<%--  �Ϻη� error �߻� ��Ŵ
   ���� ���������� error handling X
   error �������� �̵�  --%>
<%
    int one =1;
    int zero =0;
    <%=one/zero%>
%>


</body>
</html>
