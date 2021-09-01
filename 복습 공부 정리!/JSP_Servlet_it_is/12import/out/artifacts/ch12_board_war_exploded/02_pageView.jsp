<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
      request.setCharacterEncoding("EUC-KR");

	   //01_pageView.html���� ���޹��� totalRecord
	  int totalRecord = Integer.parseInt(request.getParameter("totalRecord"));
	  int numPerPage = 10; // �������� ���ڵ� �� 
	  int pagePerBlock = 15;  // ���� �������� 
	  // �ϳ��� �������� ������ �� �ִ� ������  1 ~ 15
	  //                               16 ~ 30 ...
	  
	   int totalPage = 0; // ��ü ������ �� (��� ����)
	   int totalBlock = 0;  // ��ü ���� (��� ����)
	   int nowPage = 1; // ���� ������
	   int nowBlock = 1;  // ���� ��
	
	   int start = 0; // ����� select ���۹�ȣ
	   int end = 10; // ���۹�ȣ�κ��� ������ select ����
	
	   int listSize = 0; // ���� �о�� �Խù��� ��
	  
	   if (request.getParameter("nowPage") != null) {
		 nowPage = Integer.parseInt(request.getParameter("nowPage"));
	   }
	   /* �� �������� �ʿ��Ѹ�ŭ �Խù� ������ �� �� ���� (start ~ end) */
	   start = (nowPage * numPerPage) - numPerPage;
	   // (���� ������ * �� �������� ����) - �������� ���� 
	   end = numPerPage; 
	   // �������� �Խù� ����

	  /*
		��ü ������ ������ ����ϴ� �κ�
		���� 122���� ���ڵ尡 �ִٸ� 122/10 == 12.2�� �ø����Ѽ� 13���� �������� �������
		���� ������ ���������� 2���� ���ڵ� ����
	  */
	  totalPage = (int)Math.ceil((double)totalRecord / numPerPage); // ��ü ��������
	  // ��ü �Խù��� ���� / �� �������� �Խù��� �� == ��ü ������ ��
	  
	  // ���� ���� ����ϴ� �κ�
	  // ���� ���� ���� �������� �� �� ������ ���� ������ ���
	  nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock); // ���� �� ���
	  // ���� ������ / �� ���� ������ �� == ���� �� ��� (�� ��° ������)
	  /*
	  	1 2 3 4 5 6 7 8 9 ... 15 (ù ��°)
	  	16 .................. 30 (�� ��°)
	  	31 .................. 45 (�� ��°)
	  */
	  
	  // ��ü �� �� ����ϴ� �κ�
	  // ��ü �� ������ ��ü �������� ������ �� �� ������ ���� ������ ���
	  totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock); // ��ü �� ���
	  // ��ü ������ �� / �� ���� ������ �� = ��ü �� ���
	//���ڵ� ���� (��ù� ���� )==100��
	//�� ������ �� ==10��
	//1....10==1��(��ü �� ��)
	  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����¡ & �� ó�� �׽�Ʈ</title>
<script type="text/javascript">
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}

	function block(value){
		// pagePerBlock: ���� ������ (15)
	 	document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1; 
	 	// �� �����ϴ� ���� ���� (1, 6, .....)
	 	// ���� 1���� �����ϱ� ���ؼ� +1
	 	document.readFrm.submit();
	} 
</script>
</head>
<body>
<div align="center">
<br/>
<h2>����¡ & �� ó�� �׽�Ʈ</h2>
<br/>
	<table width="600">
			<tr align="center">
				<td><b>Total : <%=totalRecord%>Articles(<font color="red">
				<%=nowPage%>/<%=totalPage%>Pages</font>)</b></td>
			</tr>
	</table>
	<table>
	<tr>
		<td>�Խù� ��ȣ : &nbsp;</td>
		<%
			listSize = totalRecord - start;
			for(int i = 0;i < numPerPage; i++){
				if (i == listSize) break;
		%>
		
		<!-- �Խù� ��ȣ �ݴ�� ����ϴ� �κ� -->
		<td align="center">
			<%=totalRecord-((nowPage-1)*numPerPage)-i%>&nbsp;
		</td>
		<%}//for%>
		<td align="center">&nbsp;</td>
	</tr>
</table>
<!-- ����¡ �� �� -->
<table>
	<tr>
		<td>
		    <!-- https://cuteduck.tistory.com/108 -->
			<!-- ����¡ �� �� ó�� Start--> 
			<%
   				  int pageStart = (nowBlock - 1) * pagePerBlock + 1 ; // �ϴ� ������ ���۹�ȣ
   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  
   						  (pageStart + pagePerBlock): totalPage+1; 
   				  // �ϴ� ������ ����ȣ
   				  
   				  if(totalPage !=0){
    			  	if (nowBlock > 1) {%>
    			  		<a href="javascript:block('<%=nowBlock-1%>')">prev...</a><%
    			  		}%>&nbsp; 
							
					<%for ( ; pageStart < pageEnd; pageStart++){%>
   			     			<a href="javascript:pageing('<%=pageStart %>')"> 
   						<%if(pageStart == nowPage) {%><font color="blue"><%}%>
   						[<%=pageStart %>]</a> 
  						
  					<%}//for
  					%>&nbsp; 
    						
   					<%if (totalBlock > nowBlock ) {%>
   					<a href="javascript:block('<%=nowBlock+1%>')">.....next</a>
   				<%}%>&nbsp;  
   			<%}%>
 			<!-- ����¡ �� �� ó�� End-->
		</td>
	</tr>
</table>
<hr width="600"/>
<form name="readFrm">
	<input type="hidden" name="totalRecord" value="<%=totalRecord%>">
	<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
</form>
<b>
totalRecord : <%=totalRecord%>&nbsp;
numPerPage : <%=numPerPage%>&nbsp;
pagePerBlock : <%=pagePerBlock%>&nbsp;
totalPage : <%=totalPage%>&nbsp;<br/>
totalBlock : <%=totalBlock%>&nbsp;
nowPage : <%=nowPage%>&nbsp;
nowBlock : <%=nowBlock%>&nbsp;</b>
<p/>
<input type="button" value="TotalRecord �Է���" onClick="javascript:location.href='01_pageView.html'">
</div>
</body>
</html>