<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--fn:split (문자열 -> 배열)--%>
<%--arr [] = {jsp,::,the,whole,new, world! }--%>

<%--fn:join (arr,"&&") (배열 -> 문자열)
    "jsp&&::&&the&&whole&&new&&world!"
--%>
<html>
<head>
    <title>JSTL</title>
</head>
<body>
<h2>Functions Tags</h2>
<c:set var="str" value="JSP :: the whole new world!"/>
<hr width="430" align="left" color="red"/>
str : <b>${str}</b><br/>
length : <b>${fn:length(str)}</b><br/>
substring : <b>${fn:substring(str,0,8)}</b><br/>
substringAfter : <b>${fn:substringAfter(str,"JSP")}</b><br/>
substringBefore : <b>${fn:substringBefore(str,"the")}</b><br/>
toUpperCase : <b>${fn:toUpperCase(str)}</b><br/>
toLowerCase  : <b>${fn:toLowerCase(str)}</b><br/>
replace  : <b>${fn:replace(str,"JSP","Android")}</b><br/>
indexOf  : <b>${fn:indexOf(str,"the")}</b><br/>
startsWith  : <b>${fn:startsWith(str,"JSP")}</b><br/>
<%--첫번째 글자가 JSP 가 맞니?--%>
endsWith  : <b>${fn:endsWith(str,"JSP")}</b><br/>
<%--마지막 글자가 JSP 가 맞니?--%>
contains  : <b>${fn:contains(str,"jsp")}</b><br/>
containsIgnoreCase  : <b>${fn:containsIgnoreCase(str,"jsp")}</b><br/>
<%--얘는 대소문자 상관없이 검색함 --%>
trim  : ***<b>${fn:trim("   Hello!!!! JSP!!!!!   ")}</b>***<br/>
<c:set var="arr" value="${fn:split(str,' ')}"/>
join : <b>${fn:join(arr,"&&")}</b><br/>
<hr width="430" align="left" color="blue"/>
</body>
</html>