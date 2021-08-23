<%--
 JSP 특징
 : 동적인 페이지를 만드는 사용하는 웹 어플리케이션 중에 하나
 : 효율적으로 게발 업무의 분업화
 :재활용 가능한 코드 작성 (자바 빈즈 (Java Beans))를 통해 제공

 JSP page (브라우저 화면 전환 )
                -> Servlet 으로 뱐한 (.java) (내부적으로 처리할 부분에 좋음)
               -> 컴파일
               ->실행
        Servlet : html 이미지 (디자이너 )등이 자바 코드에 있기때문에
        자바 지식이 부족한 디자이너와 개발자 사이에 분업화가 힘듬..

        (정적 부분/ 동적 부분 분리 어려움 )

        사실! JSP == Servlet

        JSP 동작 방법?
        1) 정적인 부분(HTML ,이미지,택스트) = 웹서버에서 해결
        2) 동적인 부분 - (JSP 페이지 )웹 서버에서 WAS로 전달되어서 실행
        3)01_testPage.jsp ---(파싱)--> 01_testPage.java(Servlet )
        --> 01_testPAge.class (중간코드 , byte code )
         -> 컴파일 -> 실행
        4)  실행 결과는 다시 웹 서버에게 넘겨져 웹 서버는 html 코드로 사용자에게 응답

        *JSP 페이지는 서블릿으로 변환되고 클래스 파일 컴파일이 되면서
        초기화 (inin()), : 메모리 로드
        요청 처리단계 (service()), : 요구되는 자웬에 대해 연결,초기화
        소멸단계 (destroy()) : 메모리 해제
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="EUC-KR">
    <title>Title</title>
</head>
<body>

</body>
</html>
