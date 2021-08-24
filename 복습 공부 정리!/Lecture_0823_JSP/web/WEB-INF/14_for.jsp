<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/08/23
  Time: 6:18 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--1+2+3+$.....10= 55--%>

<%
    int sum = 0;
    for(int i =0;i <=10;i++ ) { //식떄문에 <= 해야함
    sum+= i ;  %>
  <%=i%>
 <% if (i ==10){break;}%>

+
    <%}%>
= <%=sum%>

<%--out 객체 printIn()함수--%>
<%  int sum2 = 0;
    for(int j =1;j <=10;j++){
        if(j<10){
            System.out.println(j+"+");}
        else{
            System.out.println(j+"=");
        }
        sum2 +=j;

    }

    System.out.println(sum2);


%>


</body>
</html>
