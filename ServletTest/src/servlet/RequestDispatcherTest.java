package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RequestDispatcherTest extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print("<html><body>");
		
		String object = req.getParameter("object");
		String getMethod = req.getParameter("getMethod");
		String path = req.getParameter("path");
		String method = req.getParameter("method");
		
		if(method == null || object == null || getMethod == null || path == "") {
			out.print("다 선택해주세요!<br/>");
			out.print("<a href=\"jsp/stateInfo.jsp?stateObject=HttpServletRequest\">뒤로가기</a>");
			out.print("</html></body>");
			out.close();
			return;
		}
		out.print("<h2>설정 값</h2>");
		out.print("object : " + object + "<br/>");
		out.print("getMethod : " + getMethod + "<br/>");
		out.print("path : " + path + "<br/>");
		out.print("method : " + method + "<br/><hr>");
		
		RequestDispatcher rd = null;
		if(object.equals("servletContext")) {
			ServletContext sc = req.getServletContext();
			if(getMethod.equals("name")) {
				rd = sc.getNamedDispatcher(path);
			}else if(getMethod.equals("path")) {
				rd = sc.getRequestDispatcher(path);
			}
		}else if(object.equals("servletRequest")) {
			if(getMethod.equals("name")) {
				out.print("ServletReqeuest는 name으로 RequestDispatcher 객체를 가져올 수 없습니다.<br/>");
				out.print("<a href=\"jsp/stateInfo.jsp?stateObject=HttpServletRequest\">뒤로가기</a>");
				out.print("</html></body>");
				out.close();
				return;
			}else if(getMethod.equals("path")) {
				rd = req.getRequestDispatcher(path);
			}
		}
		SharedObject sharedObject = new SharedObject();
		sharedObject.setCount(1);
		sharedObject.setName("HttpServletRequest에 저장한 객체");
		req.setAttribute("HttpServletRequest", sharedObject);
		out.print("SharedObject를 HttpServletRequest에 저장함<br/><hr>");
		
		if(method.equals("include")) {
			out.flush();
			out.print("쓰레드 3초간 기다림! <br/>");
			for(int i = 1; i<=3; i++) {
				out.print(i + "<br/>");
				out.flush();
				try {
					Thread.sleep(1000);
				}catch(Exception e) {}
			}
			out.print("<hr>");
		}
		
		if(method.equals("include")) {
			rd.include(req, res);
		}else if(method.equals("forward")) {
			rd.forward(req, res);
		}
		
		out.print("</html></body>");
		out.close();
	}
}
