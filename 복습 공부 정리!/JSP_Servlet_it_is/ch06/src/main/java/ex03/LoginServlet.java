package ex03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/ex03/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		// out ��� ��Ʈ���� ����� ���� charset ���� !
		
		
		if(id != null && pwd != null) {
			// ���������� �����Ͱ� ���� ���
			
			HttpSession session = request.getSession();
			// ����� ��û (.jsp) ���� ����
			
			session.setAttribute("idKey", id);
			// ���� idKey ���� id ����
			
			out.println(id + "�� �ݰ����ϴ�! <br/>");
			out.println("<a href=\"../04_logout.jsp\">�α׾ƿ�</a>");

			
			
		}
	}

}
