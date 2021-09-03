<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/09/03
  Time: 11:53 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tag"
    uri="/WEB-INF/tlds/PageTag.tld" %>
<%
    int start =1;
    int end =10;
    int nowPage =1;
    if(request.getParameter("nowPage")!=null){
        nowPage=Integer.parseInt
                (request.getParameter("nowPage"));
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
현재 페이지 : <b><%=nowPage%></b>
<tag:page from ='<%=start%>' to="<%=end%>"/>
</body>
</html>
