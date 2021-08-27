<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/27
  Time: 10:57 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  Enumeration en =session.getAttributeNames();
  //Collection 프레임 워크가 만들어지기 전에 만들어진 인터페이스

  while(en.hasMoreElements()){//다음에 반복할 요소 (데이터)가 있니? true면 반복해줭
    String name = (String)en.nextElement();
    //요소를 하나씩 추출! :  반환값이 object임 지정해줘야함!
    String value = (String) session.getAttribute(name);
    //주어진 이름을 통해 세션에 할당된 값 추출
    //(admin,1234)

    out.println(name+"<br>");
    out.println(value+"<br>");
  }
%>


</body>
</html>
