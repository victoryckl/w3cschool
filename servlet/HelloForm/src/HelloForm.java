import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloForm extends HttpServlet {
	private static final long serialVersionUID = 359772734340241198L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html; charset=gbk");
		resp.setCharacterEncoding("UTF-8");

		PrintWriter out = resp.getWriter();
		String title = "使用 GET 方法读取表单数据";
		String docType = 
				"<!doctype html public \"-//w3c//dtd html 4.0 transitional//en\">\n";
		out.println(docType +
				"<html>\n" +
				"<head><title>"+title+"</title></head>\n"+
				"<body bgcolor='#f0f0f0'>\n"+
				"<h1 align='center'>"+title+"</h1>\n"+
				"<ul>\n"+
				"	<li><b>名字</b>："+req.getParameter("first_name")+"\n"+
				"	<li><b>姓氏</b>："+req.getParameter("last_name")+"\n"+
				"</ul>\n"+
				"</body></html>");
	}
}
