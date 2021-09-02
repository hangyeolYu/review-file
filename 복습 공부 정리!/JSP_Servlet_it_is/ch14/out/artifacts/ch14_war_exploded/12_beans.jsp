<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/09/02
  Time: 11:56 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="bean" class="example.ex01.ELBean"/>
<jsp:setProperty name="bean" property="siteName"/>
<%--  property ="*" 모든 셋값을 설정함!--%>
<%--11번의 sitname 값이 setProperty 를 통해 빈즈의 setSite 네임을 전달되고 set됨!--%>
<%--SetSiteName(request.getAttribute("siteName")) 호출--%>
<html>
<head>
    <title>Title</title>
</head>
<body>
JSP 의 action tag 를 이용<br>
<jsp:getProperty name="bean" property="siteName"/><br>
    ////////////////////<br><br>
EL 문법 이용 <br>
${pageScope.bean.siteName}<br>
${bean.siteName}<br>

<%--이건 혁명 ㄹㅇ ㅋㅋ--%>

<%--useBean 액션 태그를 통해서 객체 생성
    => pageContext 저장소에 저장됨
    => EL 호출할때 pageContext 생략가능 --%>
</body>
</html>
