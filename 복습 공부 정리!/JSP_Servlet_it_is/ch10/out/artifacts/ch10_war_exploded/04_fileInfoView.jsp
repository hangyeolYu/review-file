<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%@page import="com.oreilly.servlet.MultipartRequest,
                com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                java.util.*,
                java.io.*,
                java.net.*"
%>
<%--
   com.oreilly.servlet.MultipartRequest
   : ���� ���ε� ��û ���� Ŭ����
   com.oreilly.servlet.multipart.DefaultFileRenamePolicy
   : �ߺ��� ���ϸ��� ���� �� ���ϸ��� ��� �ٲ��� ������ ��Ģ�� �����ִ� Ŭ����
   : ���⼭�� ���ϸ� �ڿ� ���ڰ� ����

   java.util.*: Enumeration ����ϱ� ���� ����Ʈ
   java.io.*: IOException ���ܹޱ� ���� ����Ʈ --%>
<%
    String saveFolder = request.getRealPath("files"); // ���� ����� ����
    String encType = "EUC-KR"; // ���ڵ� Ÿ��
    int maxSize = 10 * 1024 * 1024; // 10 * 1K * 1K = 10M
    // ���ε�� ���� �ִ� ũ��

    ServletContext context = getServletContext();
    // getServletContext() �޼ҵ带 ���� ServletContext ��ü ����


    // ����ڰ� ������ �����̸��� �����ϱ� ���� ��ü
    ArrayList saveFiles = new ArrayList();
    ArrayList origFiles = new ArrayList();

    // ���� ����
    String user = "";
    String title= "";
    String content = "";

    try{
        MultipartRequest multi = new MultipartRequest
                (request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
        // request: �����ڿ� ����� ��û
        // saveFolder: ������ ����
        // maxSize: ���� �ִ� ũ��
        // encType: ���ڵ� Ÿ��
        // new DefaultFileRenamePolicy(): ���ϸ� ���漳�� ��ü


        // �� �±׸� ���� ����ڰ� �Է��� �����͸� �Ķ���͸� ���� ����
        // getParameter() �޼ҵ带 ����ؼ� �Ķ���� �̸��� ���� ���� ���� ���� �� ����
        // (�� ���������� �ԷµǾ��� ���� �������� �κ�)
        user = multi.getParameter("user");
        title = multi.getParameter("title");
        content = multi.getParameter("content");

        // �Ķ������ �̸��� �� ��� ��� �̸��� ���ͼ� ����
        Enumeration files = multi.getFileNames(); // file �Ӽ����� ������ �±� �̸� �ҷ���

        // file �Ӽ����� ������ �±� �̸��� ���Ϲ޾Ƽ�
        // ���ε� ���� �̸�, ���� ���� �̸��� ArrayList�� �ϳ��� ����
        while(files.hasMoreElements()){
            String name = (String)files.nextElement();
            name = URLEncoder.encode(name); // URL ���ڵ��� �� �ѱ��� �ν��� ����
            saveFiles.add(multi.getFilesystemName(name)); // ���ε� ���� �̸�
            origFiles.add(multi.getOriginalFileName(name)); // ���� ���� �̸�
        }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>File Info Page</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="75%" border="1" align="center" cellpadding="1" cellspacing="1">
    <tr>
        <td width="10%"><div align="right"><strong>user</strong></div></td>
        <td width="30%"><%=user%></td>
        <td width="10%"><div align="right"><strong>title</strong></div></td>
        <td width="30%"><%=title%></td>
    </tr>
    <tr>
        <td width="10%"><div align="right"><strong>content</strong></div></td>
        <td width="50%" colspan="3">
            <textarea cols="50" rows="5" disabled><%=content%></textarea>
        </td>
    </tr>
    <tr><td colspan="4">&nbsp;</td></tr>
    <tr>
        <td colspan="4"><strong>���ε�� ���ϵ��Դϴ�.</strong></td>
    </tr>


    <%for(int i=0; i < saveFiles.size();i++){%>
    <!-- ArrayList�� �ִ� �޼ҵ�� ArrayList�� ũ�� (����� ����� ����)��ŭ �ݺ����� ���鼭 -->
    <tr bgcolor="#FFCC00">
        <td colspan="4">
            <!-- ���� ���ϸ� �ɸ� ��ũ�� ������ ������ ����� ���Ϸ� ��ũ�� �ɷ� ���� -->
            <a href="<%="./files/"+saveFiles.get(i)%>"><strong><%=origFiles.get(i)%></strong></a>
            <!-- get(i) �޼ҵ�� �ε����� ���ؼ� �� ��ġ�� �ִ� ���� �������� �޼ҵ� (��ȯ�� ��ü��)
            add(): ��ü���� ������ �� ����, get(): ����� ��ü�� ���� ���� ��ü�� ��ȯ

            �� ������ �������� ���� ����ڰ� ������ ���� �̸��� ǥ�õǰ�
            �� �̸��� �ɷ��ִ� ��ũ�� ���� ���ε� ���Ϸ� ��ũ��

            ���� ����ڰ� a.*** ������ �����ؼ� ���ε� �ߴٰ� ����
            ������ a.***��� ���ϰ� ������ ���ε� ������ ����� ������ ���� �̸��� ���ٸ� a.*** �״�� ����
            ���� ������ ���� ��� a1.*** ���·� �ٲ�� ��
            -->
        </td>
    </tr>
    <%}%>
</table>
</body>
</html>
<%
        // ���� ó�� �κ�
    }catch(IOException ioe){ // MultipartRequest �����ڿ��� ������ ����
        System.out.println(ioe);
    }catch(Exception ex){ // ��� ����ó�� ����
        System.out.println(ex);
    }
%>