package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RequestDispatcherTestResult extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<html><body>");
		
		out.print("<h2>결과</h2>");
		SharedObject sharedObject = (SharedObject)req.getAttribute("HttpServletRequest");
		out.print("count : " + sharedObject.getCount() + "<br/>");
		out.print("name : " + sharedObject.getName() + "<br/>");
	
		out.print("</html></body>");
		out.close();
	}
}