<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/24
  Time: 11:58 ����
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding="EUC-KR" %>

<%--include ������
  : ���� jsp ���������� ����������
  ���� ������  ������ ���� ���� ���� (outside .jsp )

    *why??

    :�ߺ� �ۼ� ����
    :������ ���� ���� (�и��� �������� �ۼ� ����)

    *when?
    :�޴� (navigation),
    ������ header
    , ǲ�� (footer) (���۱� ȸ�� �̸���/�ּ� ...)

    :include �����ڸ� ���� jsp ������ ������ �ϸ�
    jsp �������� �ҽ� ������ �״�� �����ؼ� ������
    (������ ������ �ϳ� ���Ϸ� ���� �� ����
      => ���� ���� �ߺ� ���� �Ұ� )

    --%>

<%--include ������ vs include action tag-

    include ������ : ���Խ�ų ���� ������ �״�� ����
    (21,22 �� page ���� ������ 20�� page ��� ���� )

    include action tag :
    �ڵ� ��ü ���� X
    �������� ����  O


--%>

<html>
<head>
  <meta charset="EUC-KR">
    <title>Title</title>
</head>
<body>

<h1>Directive Example (include)</h1>
<%@include file="21_directiveTop.jsp"%>
include �������� body �κ�

<%@include file="22_directiveBottom.jsp"%>

</body>
</html>
