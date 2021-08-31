
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>File Upload</title>
</head>
<body>
<form name="frmName" method="post"
<%--            method == 데이터 이동시 암호화? 같은거 --%>
      enctype="multipart/form-data"
      action="02_viewPage.jsp">
    user : <br>
    <input name="user"><br>
    title : <br>
    <input name="title"> <br>
    file : <br>
    <input type="file" name="upLoadFile"><br>
    <input type = "submit" value="UPLOAD"><br>






</form>

</body>
</html>
