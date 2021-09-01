package ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// ���� ó�� ����
@WebServlet("/BoardUpdateServlet")
//���� Ŭ���� ��û�� ���� URL ������ ���� �ۼ��ϱ� ���� ������̼�
//(*������̼�: �����̳� ������ �߰����� ������ �����ϴ� ��)
//(*URL ����: ���� ������ ���� ���� �ڹ� Ŭ���� �� ��� ������ ��û�ϱ� ���� ���ڿ��� �����ϴ� ��)
public class BoardUpdateServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");

		// ��û ��ü (request)���� ���� ��ü ����
		HttpSession session = request.getSession();
		// ������ ����� ���� ��� ��ü�� ���� ��ü���� ����
		PrintWriter out = response.getWriter(); 
		
		BoardMgr bMgr = new BoardMgr();
		// 05_read.jsp���� ���� ���� �Խù��� ���ǿ� �����ߴ� �Խù� ��ȯ
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		// 08_update.jsp���� �ѱ� ���� nowPage ���ڿ� ������ ����
		String nowPage = request.getParameter("nowPage");
		
		BoardBean upBean = new BoardBean();
		upBean.setNum(Integer.parseInt(request.getParameter("num")));
		// ������ Ÿ���̹Ƿ� ������ ��ȯ�ؼ� ���� ����
		
		upBean.setName(request.getParameter("name"));
		upBean.setSubject(request.getParameter("subject"));
		upBean.setContent(request.getParameter("content"));
		upBean.setPass(request.getParameter("pass"));
		upBean.setIp(request.getParameter("ip"));

		String upPass = upBean.getPass(); // 08_update.jsp���� �Է��� ��й�ȣ
		String inPass = bean.getPass(); // ���ǿ� ����Ǿ��ִ� ��й�ȣ

		if (upPass.equals(inPass)) { // ��й�ȣ ������ ���� ����
			bMgr.updateBoard(upBean);
			String url = "05_read.jsp?nowPage=" + nowPage + "&num=" + upBean.getNum();
			response.sendRedirect(url);
		} else { // ��й�ȣ �ٸ��� ���� �Ұ�
			out.println("<script>");
			out.println("alert('�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}