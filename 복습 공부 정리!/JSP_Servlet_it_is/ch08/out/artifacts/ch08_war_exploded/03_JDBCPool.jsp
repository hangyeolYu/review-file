<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/26
  Time: 3:58 오후
  To change this template use File | Settings | File Templates.
--%>

<%--
        Connection Pool
        :응답속도 빨라야함
        :DB 연결 , 질의 던지기 , 길과 받은 과정 느림
        (서버 Tomcat <-> Oracle)

        :DB 연동 시간 짧게 해서 사용자 응답 속도 빠르게 해야함
        : DB 는 결국 다수의 사용자 요쳥 결과 반환 (응답)

        => Connection Pool!
        DB 서버에 연결한 객체 메모리에서 해제하지 말고 재활용!



--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.* , ex03.* , ex02.*"%>
<jsp:useBean id="regMgr" class="ex03.RegisterMgrPool"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    ArrayList<RegisterBean > list  = regMgr.getRegisterList();
    for (int i=0;i < list.size();i++){
        RegisterBean bean = list.get(i);

        out.println(bean.getId()+"<br>");
        out.println(bean.getPwd()+"<br>");
        out.println(bean.getName()+"<br>");
        out.println(bean.getNum1()+"<br>");
        out.println(bean.getNum2()+"<br>");
        out.println(bean.getEmail()+"<br>");
        out.println(bean.getPhone()+"<br>");
    }

    out.println("레코드 수는용? : "+list.size());
%>
</body>
</html>
