package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SendRedirectTestResult extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<html><body>");
		
		out.print("sendRedirect는 doGet으로 간다<hr> ");
		out.print("쿠키 없고 다른 서버가 아닐 때 url에 jsessionid 붙는지 확인!");
		
		out.print("</body></html>");
		out.close();
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<html><body>");
		
		out.print("sendRedirect는 doPost으로 간다<hr> ");
		out.print("쿠키 없고 다른 서버가 아닐 때 url에 jsessionid 붙는지 확인!");
		
		out.print("</body></html>");
		out.close();
	}

}
