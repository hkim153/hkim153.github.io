package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HttpSessionCreate extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<html><body>");
		out.print("<h2>HttpSessionCreate</h2><br/><hr>");
		
		out.print("<ol>");
		out.print("<li>HttpSession 생성하거나 가져옴<br/>결과 : ");
		HttpSession session = null;
		session = req.getSession(true);
		if(session.isNew()) {
			out.print("새로운 Session 생성함");
		}else {
			out.print("이미 있는 Session 가져옴");
		}
		out.print("(session id : " + session.getId() + ")");
		out.print("</li>");
		
		out.print("<li>SharedObject 생성 후 Attribute로 저장<br/>결과 : ");
		SharedObject sharedObject = new SharedObject();
		sharedObject.setCount(1);
		sharedObject.setName("HttpSession에 저장한 객체");
		session.setAttribute("HttpSession", sharedObject);
		out.print("SharedObject 저장함");
		out.print("</li>");
		
		out.print("<li>Session의 유지 시간 설정 (5분)<br/>결과 : ");
		session.setMaxInactiveInterval(60 * 5);
		out.print("유지 시간 설정함");
		out.print("</li>");
		
		out.print("</ol>");
	
		out.print("<a href=\"httpSessionRecreate\">Session 지우고 다시 생성하기</a>");
		
		out.print("</html></body>");
		out.close();
	}
	
}
