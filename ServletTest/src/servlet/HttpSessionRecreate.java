package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HttpSessionRecreate extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<html><body>");
		out.print("<h2>HttpSessionRecreate</h2><hr>");
		
		out.print("<ol>");
		out.print("<li><b>기존의 Session 가져오기</b><br/>결과 : ");
		HttpSession session = req.getSession(false);
		boolean goBack = false;
	
		if(session != null){
			if(session.isNew()) {
				out.print("Session을 새로 만듬"+ "<br>");
				goBack = true;
			}else {
				out.print("기존 Session ID : " + session.getId() + "<br>");
				SharedObject sharedObject = (SharedObject)session.getAttribute("HttpSession");
				if(sharedObject != null) {
					out.print("Attribute 정보 : " + sharedObject.getCount() + ", " + sharedObject.getName()+ "<br>");
				}else {
					out.print("Attribute 없음"+ "<br>");
					goBack = true;
				}
				out.print("Creation Time : " + session.getCreationTime() + "<br>");
				out.print("Last Accessed Time : " + session.getLastAccessedTime()+ "<br>");
				out.print("Max Inactive Interval : " + session.getMaxInactiveInterval()+ "<br>");
				out.print("ServletContext : " + session.getServletContext()+ "<br>");
				session.invalidate();
				out.print("세션 삭제 완료" + "<br>");
			}
		}else{
			out.print("삭제할 세션 없음!"+ "<br>");
			goBack = true;
		}
		out.print("</li>");
		if(goBack) {
			out.print("</ol><hr>");
			out.print("<b>뒤로 가서 다시 Session 생성하세요</b></br>");
			out.print("<a href=\"httpSessionCreate\">뒤로가기</a>");
		}else {
			out.print("<li><b>Session 다시 생성하기</b><br/>결과 : ");
			session = req.getSession(true);
			out.print("Session 재생성함" + "<br>");
			out.print("현재 Session ID: " + session.getId() + "<br>");
			SharedObject sharedObject = (SharedObject)session.getAttribute("HttpSession");
			if(sharedObject != null) {
				out.print("Attribute 정보 : " + sharedObject.getCount() + ", " + sharedObject.getName()+ "<br>");
			}else {
				out.print("Attribute 없음"+ "<br>");
			}
			out.print("Creation Time : " + session.getCreationTime() + "<br>");
			out.print("Last Accessed Time : " + session.getLastAccessedTime()+ "<br>");
			out.print("Max Inactive Interval : " + session.getMaxInactiveInterval()+ "<br>");
			out.print("ServletContext : " + session.getServletContext()+ "<br>");
			out.print("</li></ol>");
		}
	
		out.print("</html></body>");
		out.close();
	}
	
}