<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/24
  Time: 5:42 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
  buffer="5kb"

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--OUT
  :jsp 페이지의 결과를 크라이언트에게 출력 스트림 객체
  :jsp  페이지 --> 클라이언트
  모든 정보들은 out 객체를 통해 전송
  :javax.servlet.jsp.JspWriter extends java.io.writer

  < out 내부 객체가 제공하는 JSP 관련 메소드 >
   boolean isAutoFlush()
   : 출력 버퍼가 다 채워져 자동으로 flush 했을 경우에는 true, 그렇지 않은 경우에는 false 반환
   int getBufferSize()
   : 출력 버퍼의 전체 크기를 바이트 단위로 반환
   int getRemaining()
   : 출력 버퍼의 남은 양을 바이트 단위로 반환
   void clearBuffer()
   : 현재 출력 버퍼에 저장된 내용을 취소
   String println(string)
   : string을 브라우저에 출력
   void flush()
   : 현재 출력 버퍼의 내용을 flush하여 클라이언트 전송
   void close()
   : 출력 버퍼의 내용을 flush하고 스트림을 닫음
--%>
<%
    int total = out.getBufferSize();
    int remain = out.getRemaining();
    int use = total - remain ;

%>

Total: <%=total%> byte<br>
Remain: <%=remain%> byte<br>
Use: <%=use%> byte<br>


</body>
</html>
