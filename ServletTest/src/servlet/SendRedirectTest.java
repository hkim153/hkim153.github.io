package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SendRedirectTest extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<html><body>");
		
		String method = req.getParameter("method");
		String site = req.getParameter("site");
		if(method == null || site == null) {
			out.print("메서드, 사이트 둘 다 선택해주세요!<br/>");
			out.print("<a href=\"jsp/stateInfo.jsp?stateObject=HttpServletRequest\">뒤로가기</a>");
			out.print("</html></body>");
			out.close();
			return;
		}
		out.print("method : " + method + "<br/>");
		out.print("site : " + site + "<br/>");
		
		
		if(method.equals("sendRedirect")) {
			if(site.equals("naver")) {
				res.sendRedirect("http://www.naver.com");
			}else {
				res.sendRedirect("sendRedirectTestResult");
			}
		}else if(method.equals("encodeRedirectURL")) {
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(60 * 5);
			if(site.equals("naver")) {
				res.sendRedirect(res.encodeRedirectURL("http://www.naver.com"));
			}else {
				res.sendRedirect(res.encodeRedirectURL("sendRedirectTestResult"));
			}
		}
		
		out.print("</html></body>");
		out.close();
	}
}
