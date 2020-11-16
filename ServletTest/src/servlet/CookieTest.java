package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieTest extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<html><body>");
		
		Cookie[] cookies = req.getCookies();
		out.print("<h2>추출된 cookie 정보</h2>");
		for(Cookie cookie : cookies) {
			if(cookie != null) {
				out.print("name: " + cookie.getName() + ", value: " + cookie.getValue() + "<br/>");
			}
		}
		
		out.print("</body></html>");
		out.close();
	}

}
