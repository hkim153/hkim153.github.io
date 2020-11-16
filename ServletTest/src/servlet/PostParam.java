package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostParam extends HttpServlet {
	@Override
	public void init(ServletConfig config) throws ServletException{
		ServletContext ctx = config.getServletContext();
		System.out.println(ctx.getServerInfo());
		System.out.println(ctx.getMajorVersion()+ctx.getMinorVersion());
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<html><body>");
		
		String isInfoPrint = req.getParameter("info");
		if(isInfoPrint.equals("true")) {
			printInfo(out, req, res);	
		}
		printPostParam(out, req, res);
		out.print("</body></html>");
		out.close();
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<html><body>");
		
		String isInfoPrint = req.getParameter("info");
		if(isInfoPrint.equals("true")) {
			printInfo(out, req, res);	
		}
		printPostParam(out, req, res);

		out.print("</body></html>");
		out.close();
	}
	private void printPostParam(PrintWriter out, HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		out.print("<h3> Post Parameter </h3><br/>");
		String text = req.getParameter("text");
		String [] checkbox = req.getParameterValues("checkbox");
		String textarea = req.getParameter("textarea");
		out.print("text: " + text + "<br>");
		for(String checkvalue: checkbox) {
			out.print("checkbox: " + checkvalue + "<br>");
		}
		out.print("textarea: " + textarea + "<br>");
		if(req.getMethod().equalsIgnoreCase("post")) {
			ServletInputStream input = req.getInputStream();
			int len = req.getContentLength();
			byte [] buf = new byte[len];
			input.readLine(buf, 0, len);
			String s = new String(buf);
			out.print("post 전체 문자열 with ServletInputStream: " + s);
		}
	}
	private void printInfo(PrintWriter out, HttpServletRequest req, HttpServletResponse res) {
		out.print("<h3> 요청 방식과 프로토콜 정보</h3><br/>");
		
		out.print("req.getMethod() : " + req.getMethod() + "<br/>");
		out.print("req.getScheme() : " + req.getScheme() + "<br/>");
		out.print("req.getProtocol() : " + req.getProtocol() + "<br/>");
		out.print("req.getAuthType() : " + req.getAuthType() + "<br/><hr/>");
		
		out.print("req.getServerName() : " + req.getServerName() + "<br/>");
		out.print("req.getServerPort() : " + req.getServerPort() + "<br/><hr/>");
	
		out.print("req.getLocalName() : " + req.getLocalName() + "<br/>");
		out.print("req.getLocalAddr() : " + req.getLocalAddr() + "<br/>");
		out.print("req.getLocalPort() : " + req.getLocalPort() + "<br/>");
		out.print("req.getLocale() : " + req.getLocale() + "<br/><hr/>");
		
		out.print("req.getRemoteAddr() : " + req.getRemoteAddr() + "<br/>");
		out.print("req.getRemoteHost() : " + req.getRemoteHost() + "<br/>");
		out.print("req.getRemotePort() : " + req.getRemotePort() + "<br/>");
		out.print("req.getRemoteUser() : " + req.getRemoteUser() + "<br/><hr/>");
		
		out.print("req.getRequestURI() : " + req.getRequestURI() + "<br/>");
		out.print("req.getRequestURL() : " + req.getRequestURL() + "<br/><hr/>");
		
		out.print("req.getContextPath() : " + req.getContextPath() + "<br/>");
		out.print("req.getServletPath() : " + req.getServletPath() + "<br/>");
		out.print("req.getPathInfo() : " + req.getPathInfo() + "<br/>");
		out.print("req.getPathTranslated() : " + req.getPathTranslated() + "<br/>");
		out.print("req.getQueryString() : " + req.getQueryString() + "<br/><hr/>");
	
		out.print("req.getContentLength() : " + req.getContentLength() + "<br/>");
		out.print("req.getContentType() : " + req.getContentType() + "<br/>");
		out.print("req.getRequestedSessionId() : " + req.getRequestedSessionId() + "<br/>");
		out.print("req.getCharacterEncoding() : " + req.getCharacterEncoding() + "<br/><hr/>");
	}
}
