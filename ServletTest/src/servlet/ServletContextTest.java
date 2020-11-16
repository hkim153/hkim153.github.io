package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

public class ServletContextTest extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<html><body>");
		
		ServletContext sc = getServletContext();
		String contextParam = sc.getInitParameter("contextConfig");
		
		if(contextParam != null) {
			out.println("web.xml에 <context-param>태그에서 init param 가져옴" + "<br/>");
			out.println("context-param : " + contextParam + "<br/>");
		}
		out.println("<hr/>"+ "<br/>");
		out.println("서버 또는 서블릿 정보" + "<br/>");
		out.println("sc.getMajorVersion : " + sc.getMajorVersion()+ "<br/>");
		out.println("sc.getMinorVersion() : " + sc.getMinorVersion()+ "<br/>");
		out.println("sc.getContextPath() : " + sc.getContextPath()+ "<br/>");
		out.println("sc.getServletContextName() : " + sc.getServletContextName()+ "<br/>");
		out.println("sc.getRealPath(\"/stateInfo.html\") : " + sc.getRealPath("/stateInfo.html")+ "<br/>");
		sc.log("ServletContext의 로그 기록");
		
		out.println("<hr/>"+ "<br/>");
		
		SharedObject so = (SharedObject)sc.getAttribute("ServletContext");
		if(so != null) {
			out.print("ServletContext의 Attribute : " + so.getCount() + ", " + so.getName()+ "<br/>");
		}
		out.close();
	}
}
