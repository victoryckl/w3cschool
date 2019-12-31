import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class HelloWorld extends HttpServlet {
	private static final long serialVersionUID = 6415795886286511351L;
	
	private String message;
	
	@Override
	public void init() throws ServletException {
		super.init();
		message = "Hello World";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//������Ӧ����
		resp.setContentType("text/html");
		//ʵ�ʵ��߼�������
		PrintWriter out = resp.getWriter();
		out.println("<h1>"+message+"</h1>");
	}
	
	@Override
	public void destroy() {
		//do nothing
	}
}
