<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="servlet.SharedObject"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String stateObject = request.getParameter("stateObject");
	if(stateObject == null){
		out.print("하나를 선택해 주세요! <br/>");
		out.print("<a href=../html/stateInfo.html>뒤로가기</a>");
	}
	else if(stateObject.equals("ServletContext")){
		SharedObject sharedObject = new SharedObject();
		sharedObject.setCount(1);
		sharedObject.setName("ServletContext에 저장한 객체");
		ServletContext sc = request.getServletContext();
		sc.setAttribute("ServletContext", sharedObject);
		pageContext.setAttribute("PageContext", sharedObject);
		//서블릿에서는 pageContext 참조 불가능
%>
	<ol>
		<li>Context Param</li>
		<li>application info</li>
		<li>Attribute</li>
	</ol>
	<hr>
	<h3>Shared Object 객체 생성 후 ServletContext에 객체 저장</h3>
	ServletContext sc = request.getServletContext(); <br/>
		sc.setAttribute("ServletContext", sharedObject); <br/><hr>
	<a href="../servletContextTest">ServletContext Test Start...</a>
<%
	}else if(stateObject.equals("Cookie")){
%>
	<h2>Cookie 란?</h2>
	서버가 클라이언트에 저장하는 정보, 저장할 데이터의 타입은 String이고 데이터 크기에 제한이 있다.
	name=value의 형태이고 필요에 따라 쿠키의 유지 시간, 유효 디렉토리, 유효 도메인 등 지정 가능
	<hr>
	<h2>Cookie Method</h2>
	<ol>
		<li>Constructor: <b>Cookie(String name, String value)  </b></li>
		<li>getter와 setter
			<ul>
				<li>Comment: 쿠키 설명</li>
				<li>Domain: 쿠키가 전달되는 유효 서버 </li>
				<li>MaxAge: 유지 시간 in seconds</li>
				<li>Name</li>
				<li>Value</li>
				<li>Path: 쿠키가 전달되는 유효 경로 지정 </li>
				<li>Secure: HTTPS나 SSL일 경우에만 쿠키가 보내짐</li>
				<li>Version</li>
				<li>HttpOnly</li>
			</ul>
		</li>
	</ol>
	<hr>
	<h2>쿠키 전송과 추출</h2>
	<ol>
		<li>쿠키 전송: HttpServletResponse객체의 <b>void addCookie(Cookie cookie)</b> 메소드를 이용해서 클라이언트에 보낸다.</li>
		<li>쿠키 추출: HttpServletRequest객체의 <b>Cookies[] getCookies()</b> 메소드를 이용해서 가져온다.</li>
	</ol>
	<hr>
	<h2>TEST</h2>
	쿠키 생성해서 다음 페이지로 넘긴다.<br/>
	Cookie c1 = new Cookie("id", "hyunsoo");<br/>
	c1.setPath("/");<br/>
	c1.setComment("name");<br/>
	response.addCookie(c1);<br/><br/>
	
	Cookie c2 = new Cookie("subject", "servlet");<br/>
	c2.setMaxAge(60*5);<br/>
	c2.setHttpOnly(true);<br/>
	c2.setComment("works in charge");<br/>
	response.addCookie(c2);<br/><br/>
<% 
	Cookie c1 = new Cookie("id", "hyunsoo");
	c1.setPath("/");
	c1.setComment("name");
	response.addCookie(c1);
	
	Cookie c2 = new Cookie("subject", "servlet");
	c2.setMaxAge(60*5);
	c2.setHttpOnly(true);
	c2.setPath("/");
	c2.setComment("works in charge");
	response.addCookie(c2);
%>
	<a href="../cookieTest">Cookie Test Start...</a>
<% 
	}else if(stateObject.equals("Session")){
%>
	<h2>Session이란?</h2>
	클라이언트가 서버에 정보를 요청할 때 생성되는 상태정보<br/>
	생성된 Session id 는 쿠키 기술로 클라이언트에 저장(JSessionId)<br/>
	클라이언트마다 상태정보를 일정 시간 동안 개별적으로 유지하여 사용하는 기술을 세션 트래킹이라고 함 <br/>
	
	<hr>
	<h2>HttpSession 생성</h2>
	HttpServletRequest의 메소드로 생성
	<ol>
		<li><b>HttpSession getSession()</b> : <br/>클라이언트가 가지고 있는 Session ID와 동일한 세션 객체를 찾아서 반환 없으면 새로 생성하여 반환</li>
		<li><b>HttpSession getSession(boolean create)</b> : <br/>getSession()와 같지만 새로 생성할 때 create값이 true일 때 생성하고 false이면 null 반환</li>
	</ol>
	<hr>
	<h2>HttpSession 메소드</h2>
	<ol>
		<li><b>Object getAttribute(String name)</b> : <br/></li>
		<li><b>Enumberation< String > getAttributeNames()</b> : <br/></li>
		<li><b>void removeAttribute(String name)</b> : <br/></li>
		<li><b>void setAttribute(String name, Object value)</b> : <br/></li>
		<li><b>long getCreationTime()</b> : <br/></li>
		<li><b>String getId()</b> : <br/>Session id 반환</li>
		<li><b>long getLastAccessedTime()</b> : <br/></li>
		<li><b>void setMaxInactiveInterval(int interval)</b> : <br/>
		HttpSession 객체의 유지 시간을 설정 in seconds
		</li>
		<li><b>int getMaxInactiveInterval()</b> : <br/></li>
		<li><b>ServletContext getServletContext()</b> : <br/></li>
		<li><b>void invalidate()</b> : <br/>현재 session 삭제</li>
		<li><b>boolean isNew()</b> : <br/>
		서버 측에서 새로운 HttpSession을 생성했으면 true 기존 세션이 유지되고 있으면 false</li>
	</ol>
	<hr>
	<h2>HttpSession Test</h2>
	<a href="../httpSessionCreate">HttpSession Test Start...</a>
	
<% 
	}else if(stateObject.equals("HttpServletRequest")){
%>
	<h2>HttpServletRequest의 상태 정보 유지 기술</h2>
	HttpServletRequest는 하나의 요청에서 생성되고 소멸되는 객체지만, 하나의 요청이 여러 페이지로 이루어 질 때
	여러 페이지 간에 정보를 공유하는 역할을 한다.<br/>
	이 때, 요청 재지정 된 페이지로 넘어 갈 때 HttpServletRequest와 HttpServletResponse 객체를 넘겨주기 때문에,
	요청 재지정 하기 전에 HttpServletRequest에 상태 정보를 저장한 후에 넘긴다.
	<img src="../img/requestDispatcherFlow.png" alt="requestDispatcher Flow">
	<hr>
	<h2>요청 재지정 기능을 제공하는 객체</h2>
	2개의 객체가 있다.
	<ol>
		<li><b>HttpServletResponse</b> : 현재 서버가 아닌 다른 서버의 자원으로도 이동 가능, HttpServletReqeust HttpServletResponse 재생성 <br/>
			<img src="../img/sendRedirect.png" alt="sendRedirect.png"><br/>
			<ul>
				<li>void sendRedirect(String location) : location 설정된 자원으로 요청을 재지정한다</li>
				<li>String encodeRedirectURL(String url) : url에 설정된 URL 문자열에 '쿠키를 사용할 수 없을 때 그리고 다른 서버가 아닐 때' session id정보를 추가하여 반환한다. sendRedirect의 parameter로 사용되어 요청을 재지정한다</li>
			</ul>
		</li>
		<li><b>RequestDispatcher</b> : 현재 자원과 동일한 웹 애플리케이션 내에서만 이동 가능, HttpServletReqeust HttpServletResponse 재사용 <br/>
			<img src="../img/requestDispatcher.png" alt="requestDispatcher.png"><br/>
			<ul>
				<li>void include(ServletRequest request, ServletResponse response) : 다른 자원의 처리 결과를 현재 페이지에 포함한다.</li>
				<li>void forward(ServletRequest request, ServletResponse response) : 요청을 다른 자원으로 넘긴다.
			</ul>
			<b>RequestDispatcher 객체 생성</b><br/>
			<ul>
				<li>ServletContext 객체에서 제공하는 메서드 <br/>
					<ul>
						<li>RequestDispatcher getNamedDispatcher(String name) : 자원의 이름으로 요청을 재지정 할 RequestDispatcher 반환 
						<li>RequestDispatcher getRequestDispatcher(String path) : 자원의 위치(절대 경로만 가능 무조건 "/"로 시작)로 요청을 재지정 할 RequestDispatcher 반환 
					</ul>
				</li>
				<li>ServletRequest 객체에서 제공하는 메서드
					<ul>
						<li>RequestDispatcher getRequestDispatcher(String path) : 자원의 위치(절대 + 상대 경로 가능)로 요청을 재지정 할 RequestDispatcher 반환 
					</ul>
				</li>
			</ul>
		</li>
	</ol>	
	
	<b>주의할 점!!!</b>
	sendRedirect와 forward는 response가 commited 되기 전에 불려야 한다!
	
	<hr>
	<h2>HttpServletRequest의 상태 정보 저장</h2>
	<ul>
		<li>Object getAttribute(String name)</li>
		<li>Enumeration  String  getAttributeNames()</li>
		<li>void removeAttribute(String name)</li>
		<li>void setAttribute(Stirng name, Object value)</li>
	</ul>

	<hr>
	<h2>HttpServletResponse Test</h2>
	<form action="../sendRedirectTest" method="post">
		메서드 : 
		<input type="radio" name="method" value="sendRedirect">sendRedirect
		<input type="radio" name="method" value="encodeRedirectURL">encodeRedirectURL <br/>
		사이트 :
		<input type="radio" name="site" value="naver">네이버
		<input type="radio" name="site" value="attribute">encodeRedirectURL 확인하기 위한 서버 내 자원<br/>
		<pre>       <input type="submit" value="이동" style="width:250px"></pre>
	</form>
	
	<hr>
	<h2>RequestDispatcher Test</h2>
	<form action="../requestDispatcherTest" method="post">
		RequestDispatcher 가져 올 객체 : 
		<input type="radio" name="object" value="servletContext">ServletContext
		<input type="radio" name="object" value="servletRequest">ServletRequest <br/>
		가져 올 방식 : 
		<input type="radio" name="getMethod" value="name">name
		<input type="radio" name="getMethod" value="path">path <br/>
		name 또는 path (/requestDispatcherTestResult) : 
		<input type="text" name="path"><br/>
		방식 : 
		<input type="radio" name="method" value="include">include
		<input type="radio" name="method" value="forward">forward<br/>
		<pre>       <input type="submit" value="이동" style="width:250px"></pre>
	</form>
	
<% 
	}
%>
</body>
</html>