<%--
  Created by IntelliJ IDEA.
  User: yuhangyeol
  Date: 2021/09/13
  Time: 6:04 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<fieldset>
    <legend>파일 업로드</legend>
    <table>
        <form action="UploadService" method="post" enctype="multipart/form-data">
            <tr>
                <td>글쓴이 : </td>
                <td><input type="text" name="author"/></td>
            </tr>
            <tr>
                <td>제목 : </td>
                <td><input type="text" name="title"/></td>
            </tr>
            <tr>
                <td>글쓴이 : </td>
                <td><input type="file" value="파일 선택" name="file"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="업로드"/></td>
            </tr>
        </form>
    </table>
</fieldset>

</body>
</html>
