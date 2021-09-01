package ex01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ���� ó�� ����
@WebServlet("/BoardPostServlet")
// ���� Ŭ���� ��û�� ���� URL ������ ���� �ۼ��ϱ� ���� ������̼�
// (*������̼�: �����̳� ������ �߰����� ������ �����ϴ� ��)
// (*URL ����: ���� ������ ���� ���� �ڹ� Ŭ���� �� ��� ������ ��û�ϱ� ���� ���ڿ��� �����ϴ� ��)
public class BoardPostServlet extends HttpServlet { // HttpServlet: ���� ��� Ŭ����

	private static final long serialVersionUID = 1L;

	// 03_post.jsp���� ������ �Ķ���͸� ȣ���� �޼ҵ�
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		BoardMgr bMgr = new BoardMgr();
		bMgr.insertBoard(request); // ��û ��ü�� �Ű������� insertBoard ��û
		response.sendRedirect("03_list.jsp"); 
		// tblBoard ���̺� ������ �Ŀ� 03_list.jsp �������� ����
	}
}