package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletConfigTest extends HttpServlet{
	String name = "servletConfigTest";
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<html><body>");
		out.print("<h3>ServletConfig를 this.getServletConfig(); 로 가져오거나 또는 HttpServlet내에 ServletConfig의 메서드를 바로 사용할 수 있다." + "<h3/><br/><hr>");
		out.print("getServletConfig(); : " + getServletConfig() + "<br/>");
		out.print("getInitParameter(\"initParam\") : " + this.getInitParameter("initParam") + "<br/>");
		out.print("getServletContext() : " + getServletContext() + "<br/>");
 		out.print("getServletName() : " + getServletName() + "<br/>");

 		out.print("</body></html>");
		out.close();
	}
	@Override
	public String getServletName() {
		return name;
	}
}
