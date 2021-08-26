package ex01;

import java.io.*; // ������ ���

import javax.servlet.ServletConfig;
//import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* Servlet
 * : SUN�� ����
 * : ���� ������ ������ ���� ����
 * : �ڹ� ��� �� ������ ���� ���
 * 
 * ����: �о�ȭ (���� (�����̳�)/���� (������))
 * 
 * => JSP
 * */

/* ���� �ֿ� Ŭ����
 * (1) HttpServlet
 * : ������ ����� ���� �ݵ�� ����ؾ��ϴ� �ʼ� Ŭ����
 * : ���� ����� ���� �����Ǵ� Ŭ����
 * Servlet (�������̽�) - GenericServlet (�߻� Ŭ����) - HttpServlet
 * 
 * * �޼ҵ�
 * void init(): ���� ��ü ������ ȣ��Ǵ� �޼ҵ�
 * void destroy(): ���� ��ü �޸𸮿��� ��ü�� �� ȣ��Ǵ� �޼ҵ�
 * void service(request, response)
 * : ������ ��û�� ���� �� ȣ��Ǵ� �޼ҵ� 
 * void doGet(request, response)
 * : html���� form�� �޼ҵ尡 get�� �� ȣ��Ǵ� �޼ҵ�
 * void doPost(request, response)
 * : html���� form�� �޼ҵ尡 post�� �� ȣ��Ǵ� �޼ҵ�
 * https://tomcat.apache.org/tomcat-8.5-doc/servletapi/
 * 
 * 
 * (2) HttpServletRequest
 * : Ŭ���̾�Ʈ�� �����͸� �Է��ϰų� �Ǵ� Ŭ���̾�Ʈ ������ ���� ��û ���� ������ �ִ� Ŭ����
 * 
 * * �޼ҵ�
 * String getParameter(name): name�� �Ҵ�� ���� ��ȯ�ϸ� ������ �Ķ���� ���� ������ null ��ȯ
 * String[] getParameterValues(name): name�� ��� ���� String �迭�� ��ȯ
 * Enumeration getParameterNames(): ��û�� ���� ��� �Ķ���� �̸��� java.util.Enumeration Ÿ������ ��ȯ
 * void setCharacterEncoding(env): post ������� ��û�� ���ڿ��� character encoding ����
 
 * 
 * (3) HttpServletResponse
 * : Ŭ���̾�Ʈ�� ��û�� ������ ó���ϰ� �ٽ� �����ϱ� ���� ������ ��� �ִ� Ŭ����
 * 
 * * �޼ҵ�
 * void setHeader(name, value): ���信 ���Ե� Header ����
 * void setContentType(type): ��µǴ� �������� content type ����
 * String getCharacterEncoding(): ���� �������� ���� ���ڵ� type ��ȯ
 * void sendRedirect(url): ������ url�� ��û ������
 * 
 * (4) HttpSession
 * : Ŭ���̾�Ʈ�� ������ ������ �����ϰ� ���� ����� �����ϱ� ���ؼ� �����Ǵ� Ŭ����
 * 
 * * �޼ҵ�
 * String getId(): �ش� ������ ���� ID ��ȯ
 * long getCreationTime(): ������ ������ �ð� ��ȯ
 * long getLastAccessedTime(): Ŭ���̾�Ʈ ��û�� ���������� �õ��� �ð� ��ȯ
 * void setMaxInactiveInterval(time): ���� ������ �ð��� �� ������ ����
 * int getMaxInactiveInterval(): setMaxInactiveInterval(time)���� ������ �� ��ȯ (�⺻�� 30��)
 * boolean isNew(): Ŭ���̾�Ʈ ���� ID�� �Ҵ����� ���� ��� true�� ��ȯ
 * void invalidate(): �ش� ���� ����
 * 
 * */


/**
 * Servlet implementation class ExampleServlet01
 */
@WebServlet("/ex01/ExampleServlet")
// ���� ȣ�� �̸� ����
// ������ ���ε� URL ����

// URL ���� (mapping)
// : ���������� url ǥ�õǴ� ���� �̸� ����
// why? Ŭ���� �̸� �����ϰ� ���� ���� �� (���Ȼ�)
//      Ŭ���� �̸��� �ʹ� �� ��

public class ExampleServlet extends HttpServlet {
	// HttpServlet: �������� ����� ���� ���!
	
	
	double pi = 3.14;
	float pi2 = 3.14F;
	
	private static final long serialVersionUID = 1L; // 8 byte
	// ��ü ����ȭ ���̵�
	// ���� �������� �ʾƵ� JVM ����Ʈ ������ ����
	// => �����ϴ� ���� ����!
	
	/* ��ü ����ȭ (serialization)
	 * 
	 * ��ü ->(+serialVersionUID) ����Ʈ �迭 
	 * -> ����, �޸�, DB ������ ����
	 * 
	 * ---------------------------
	 * ��ü ������ȭ (deserialization)
	 * 
	 * ����Ʈ �迭 -> ��ü
	 * serialVersionUID Ȯ�� (�ٸ��� exception �߻�)
	 * 
	 * */

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	// ���� ȣ��� ������ �ݺ��Ǿ ȣ��Ǵ� �޼ҵ�
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType
		("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		// out ��ü (��� ��Ʈ��)
		
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>���� ����</h1>");
		out.println("</body>");
		out.println("</html>");
		
	}
	
	// ���� ��ü ���� �ѹ��� ȣ��Ǵ� �޼ҵ�
	// (�ʱ�ȭ ����)
	// ex) ������� ����
	@Override
	public void init(ServletConfig config) 
			throws ServletException{
		System.out.println("init ȣ��");
	}
	
	// ���� ���� ����� ��/�ڵ� ���� ����� ȣ��
	// ����Ǳ� ���� ���ʿ��� �ڿ� ����
	// ������ ����� ���� ���� ����!
	@Override
	public void destroy() {
		System.out.println("destroy ȣ��");
	}

}
