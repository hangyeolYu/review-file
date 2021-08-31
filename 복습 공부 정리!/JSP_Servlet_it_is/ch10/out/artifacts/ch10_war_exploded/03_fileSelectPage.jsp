<!-- ���� ������ ���ε� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%!
    // �����
    // ������ ��ü���� ���� ����/�޼ҵ� ����

    // request, paramName�� ���ڷ� ���޹޾� getParam() ȣ��
    // ���� �� ��ҵ� �� paramName���� ������ �κп� �Էµ� ���� �����ϱ� ���� �޼ҵ� (���� �� ������ ����)
    // ���� �������� �ٽ� ���� �������� �����ϸ� ������ �Է��ߴ� ���� ����� (������ �Է��� ������ �����ϱ� ���� ���� �޼ҵ�)
    public String getParam(HttpServletRequest request, String paramName){

        // �������� ó�� ����� ���� �޾ƿ��� ���� ���� ������ null�� Ȯ��
        // null�� �ƴϸ� (�������� ������ ���) �̸��� ���� ������ �̷���� �Ķ���� (�� ���) ������ �� ����
        // �Ķ���� �̸����� ������ ���� ��������� ��ȯ
        if(request.getParameter(paramName) != null){
            return request.getParameter(paramName);
        }else{ // �ش� �������� ������ ����� ���� �ƴϰ� ó�� ����Ǿ��� ������ �Ķ���� (�� ���)�� ����
            return "";
        }
    }
%>
<%
    request.setCharacterEncoding("EUC-KR");
    // ������� ��û�� ���޵� �����Ϳ� ���� ���ڵ��� ����
    // �ѱ� ó��

    int filecounter = 0; // ��ũ��Ʈ������ ������ ������ ������ �ʱ�ȭ �ʿ�

   /*
      input �±׿� ���� ���� �Է��� �� [Ȯ��] ��ư�� ������ ���� �������� ����
      [Ȯ��] ��ư�� ���� �����ϴ� ���� �ٽ� ���� �������� �����ϰ� �Ǵµ�
      �̶� addcnt�� �Էµ� ���� ���� ����

      �� �������� ó�� ����Ǿ����� �� �������� ��
      (FileSelectPage.jsp���� ���� �� ���� (freName1))�� ��� �����Ͱ� ���� ������
      null�� �Ǿ if�� ���θ� �������� ����

      [Ȯ��] ��ư�� Ŭ���ؼ� �� ���� �����Ͽ��� ���� addcnt�� ��� ���� �ֱ� ������
      �� addcnt�� ��� ���� filtercounter��� ������ ������ ����
      �̶� request.getParameter() �޼ҵ�� �� ��ȯ���� String �����̹Ƿ�
      ������ ������ ��� ���ؼ� interger.parseInt() �޼ҵ带 ���ؼ� ���������� �ٲپ� ����
   */
    if(request.getParameter("addcnt") != null){
        filecounter = Integer.parseInt(request.getParameter("addcnt"));
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>File Select Page</title>
    <script src="script.js"></script>
</head>
<body topmargin="100">
<div align="center"><font color="#0000ff" size="2">
    ���� ���� ������ ���ε带 ���Ͽ� ���� ������ �Է��� ��<br/>
    Ȯ�� ��ư�� �����ּ���!!!<br/>
    �Է��� �Ϸ�Ǹ� DONE ��ư�� �����ּ���</font></div><br/>

<!-- ���鳢���� ��ø �Ұ��� -->
<!-- �ܼ��� ������� �Է��� �ޱ� ���� �ʵ带 ���� �ִ� �� -->
<form name="frmName1" method="post">
    <table width="75%" border="1" align="center" cellpadding="1" cellspacing="1">

        <tr>
            <!-- frmName1�� 0�� �ε��� user -->
            <!-- Ű���� �Է��� �Ϸ�Ǵ� ���� �̺�Ʈ �߻��Ͽ� inputValue()��� �Լ� ȣ��
            ���� ������ ���� ���� �ٸ� ���� �ִ� ��ҿ� �Է��ϴ� �Լ� -->
            <!-- ������ �Է��ߴ� ���� �޾ƿͼ� �ؽ�Ʈ �ڽ��� ǥ���ϱ� ���� getParam() ȣ�� -->
            <td width="10%"><div align="right">user</div></td>
            <td><input  name="user" onkeyup="inputValue(this.form,user,frmName2,0)"
                        value="<%=getParam(request, "user")%>"></td>

            <!-- Ű�Է��� ���� �Է�â�� Ű���尡 �������ٰ� �ٽ� �ö���� ���� �̺�Ʈ �߻� -->
            <td width="10%"><div align="right">title</div></td>

            <!-- frmName1�� 1�� �ε��� title -->
            <!-- Ű���� �Է��� �Ϸ�Ǵ� ���� �̺�Ʈ �߻��Ͽ� inputValue()��� �Լ� ȣ��
            ���� ������ ���� ���� �ٸ� ���� �ִ� ��ҿ� �Է��ϴ� �Լ� -->
            <!-- ������ �Է��ߴ� ���� �޾ƿͼ� �ؽ�Ʈ �ڽ��� ǥ���ϱ� ���� getParam() ȣ�� -->
            <td><input name="title" onkeyup="inputValue(this.form,title,frmName2,1)"
                       value="<%=getParam(request, "title")%>"></td>

        </tr>
        <tr>
            <td width="15%"><div align="right">content</div></td>
            <td width="50%" colspan="3">

                <!-- frmName1�� 2�� �ε��� content -->
                <!-- Ű���� �Է��� �Ϸ�Ǵ� ���� �̺�Ʈ �߻��Ͽ� inputValue()��� �Լ� ȣ��
                 ���� ������ ���� ���� �ٸ� ���� �ִ� ��ҿ� �Է��ϴ� �Լ� -->
                <!-- ������ �Է��ߴ� ���� �޾ƿͼ� �ؽ�Ʈ �ڽ��� ǥ���ϱ� ���� getParam() ȣ�� -->

                <textarea name="content" cols="40"
                          onkeyup="inputValue(this.form,content, frmName2,2)">
   <%=getParam(request,"content")%>
   </textarea>
            </td>
        </tr>
        <tr>
            <td colspan="4"><div align="center">
                <font size="-2">�߰��� ���� �� �Է�</font>
                <input name="addcnt">
                <!-- �ƹ��� �� �Է� (���� ���� �Է�)�� ���ٸ� �޽��� ����� ���� ���� �Է��� -->
                <input type="button" value=" Ȯ�� " onclick="addFile(this.form)">
            </div>
            </td>
        </tr>
    </table>
</form>

<!-- ���� ���ε带 ���� ���� ���� �޴� �� -->
<!-- ���� ���ε带 ���� ���Ǵ� ���� enctype�� multipart/form-data�� �����Ǿ� �־
request ��ü�� ���ؼ� �� �����͸� ó���� �� ���� ������
�������� ���ϼ��� â�� �����ϱ� ���ؼ��� ���� ���� ������ �� -->
<form name="frmName2" method="post" enctype="multipart/form-data">
    <table width="75%" border="1" align="center" cellpadding="1" cellspacing="1">
        <tr>
            <td width="40%">

                <!-- hidden �Ӽ����� �ο��� �� ��� -->
                <!-- ���������� ������ ������ �ʿ��� ���� ��� ���� hidden �Ӽ����� ���� -->
                <input type="hidden" name="user" value="<%=getParam(request, "user")%>">
                <input type="hidden" name="title" value="<%=getParam(request, "title")%>">
                <input type="hidden" name="content" value="<%=getParam(request,"content")%>">
                <!-- �ش� �������� frmName1�� ���ؼ� ������ �Ǹ� �ٽ� ���� �������� �ε�Ǵµ�
                �� �� ������ ����� ���� �����ϱ� ���� getParam �޼ҵ带 ����ؼ� ���� ���� ���� �� -->

                <!-- �������� ���ϼ��� â�� �����Ͽ�
                ���� ���� ������ �Է¹޴� ���� file �Ӽ��� ���� ��Ҹ� ������ ���� ���� �����
                �� �� �ȿ� hidden �Ӽ����� �ʿ��� �κ��� �����Ͽ� �ٸ� ������ ���� ������ ���� �� �ְ� �� -->
                <%   for(int i=0; i < filecounter; i++){%>
                <input type="File" size="50" name="selectFile<%=i%>"><br/>
                <%   }%>
            </td>
            <td><input type="button" value="DONE" onclick="elementCheck(this.form)"></td>
            <!-- ��ư�� ������ �̺�Ʈ �߻� -->
            <!-- ��� �� ��ҵ��� �ʵ尪�� ������ �κ��� ������ (���� ������ ������ �κ��� ������) -->
        </tr>
    </table>
</form>
</body>
</html>