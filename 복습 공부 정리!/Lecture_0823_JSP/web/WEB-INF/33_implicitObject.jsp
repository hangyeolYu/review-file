<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
</head>
<body>
<!-- 내부 객체
(Implicit Object, 암시적인 객체, 내장/jsp 기본객체)

   : 프로그래밍을 단순화시키기 위해서
   별다른 선언 과정 없이 객체 사용할 수 있는 객체
   : JSP 컨테이너가 제공

   request
   : 사용자 요청 (request)에 대한 정보 처리하기 위한 객체

   exception
   : jsp 페이지가 에러 페이지로 지정될 때 만들어지는 객체
   : 일반적인 jsp 페이지 X

   내부 객체 종류
   1) 입출력 관련
   2) 정보 제공
   3) 서블릿 관련
   4) 예외 처리 관련

   1-1) request
   : 파라미터를 포함한 사용자 요청 담고 있는 객체
   : javax.servlet.http.HttpServletRequest

   ex) request.getParameter()
      request.setCharacterEncoding()
 -->
<h1>Request Example</h1>
<form method="post" action="33_implicitObject.jsp">
    Name: <input name="name"><br/>
    Student Number: <input name="stuNum"><br/>
    Gender: Male <input type="radio" name="gender" value="male" checked>
    Female <input type="radio" name="gender" value="female">
    <br/>
    Major: <select name="major">
    <option value="korean" selected>korean</option>
    <option value="english">english</option>
    <option value="math">math</option>
    <option value="politics">politics</option>
    <option value="physics">physics</option>
</select><br/>
    <input type="submit" value="sent">
</form>

</body>
</html>