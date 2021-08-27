<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/27
  Time: 11:17 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*"%>
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
    String id = session.getId();

    out.println(name+"<br>");
    out.println(value+"<br>");
    out.println(id + "<br>");
  }
%>
///////////////////////////////<br>
<%
  Cookie [] cookies = request.getCookies();
  //클라이언트 브라우저에서 (**)모든 쿠키 반환
  //처음 생성된 쿠키를 브라우저로 보내서 브라우저에서 다시 보이게 출력을 해줌 !
  if(cookies != null){
    for (int i =0;i < cookies.length;i++){
      //if(cookies[i].getName().equals("myCookie")){
      out.println(cookies[i].getName() + "<br>");
      //JSESSIONID
      //세션 유지할수 있도록 발급하는 키
      out.println(cookies[i].getValue() + "<br>");
      // 세션 아이디와 동일

      // => 세션 상태 유지를 위해서
      //톰캣에서 JSESSIONID 쿠키를 클라이언트 발급해주고
      //이값을 통해 세션 유지
      // => 이전 연결된 클라이언트 인지 알 수 있음
    }
  }

%>
</body>
</html>
