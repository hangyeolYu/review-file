<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/26
  Time: 1:17 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="ex02.*,java.util.*"%>
<jsp:useBean id="regList" class="ex02.RegisterMgr"/>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    ArrayList<RegisterBean> list = regList.getRegisterList();
    //DB 질의 결과 ArrayList 로 저장 (RegisterMgrt 클래스)
    for(int i =0;i< list.size();i++){
        RegisterBean bean = list.get(i);
        out.println(bean.getId()+"<br>");
        out.println(bean.getPwd()+"<br>");
        out.println(bean.getName()+"<br>");
        out.println(bean.getNum1()+"<br>");
        out.println(bean.getNum2()+"<br>");
        out.println(bean.getEmail()+"<br>");
        out.println(bean.getPhone()+"<br>");
    }
    out.println("레코드 수는? : "+list.size());
%>

</body>
</html>
