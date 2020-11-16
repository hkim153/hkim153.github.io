<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Listener 이란?</h2>
	Listener란 어떠한 event가 발생하기를 기다리다가 실제 그 일이 발생하였을 때 수행되는 메소드를 가지고 있는 자바
	객체이다.
	<hr>

	<h2>Listener 객체들</h2>
	<ol>
		<li><b>Event Source</b><br />
			<table>
				<thead>
					<tr>
						<th>구분</th>
						<th>생성 시점</th>
						<th>삭제 시점</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>ServletContext</td>
						<td>서버 시작 시</td>
						<td>서버 종료 시</td>
					</tr>
					<tr>
						<td>HttpServletRequest</td>
						<td>서비스 요청 시</td>
						<td>서비스 응답 시</td>
					</tr>
					<tr>
						<td>HttpSession</td>
						<td>클라이언트 접속 시</td>
						<td>클라이언트 접속 종료 시</td>
					</tr>
				</tbody>
			</table>
		</li>
		<li><b>Event Source 생성 및 삭제 관련 Listener and Event 객체</b>
			<ul>
				<li>ServletContext:<br/>
					<ol>
						<li><b>ServletContextEvent</b><br/>
							<ul>
								<li>ServletContext getServletContext()
							</ul>
						<li><b>ServletContextListener</b><br/>
							<ul>
								<li>void contextDestroyed(ServletContextEvent sce)
								<li>void contextInitialized(ServletContextEvent sce)
							</ul>
					</ol>
				<li>HttpServletRequest:<br/>
					<ol>
						<li><b>ServletRequestEvent</b><br/>
							<ul>
								<li>ServletContext getServletContext()
								<li>ServletRequest getServldtRequest()
							</ul>
						<li><b>ServletRequestListener</b><br/>
							<ul>
								<li>void requestDestroyed(ServletRequestEvent sre)
								<li>void requestInitialized(ServletRequestEvent sre)
							</ul>
					</ol>
				<li>HttpSession:<br/>
					<ol>
						<li><b>HttpSessionEvent</b><br/>
							<ul>
								<li>HttpSession getSession()
							</ul>
						<li><b>HttpSessionListener</b><br/>
							<ul>
								<li>void sessionDestroyed(HttpSessionEvent se)
								<li>void sessionCreated(HttpSessionEvent se)
							</ul>
						<li><b>HttpSessionActivationListener</b><br/>
							<ul>
								<li>void sessionDidActivate(HttpSessionEvent se)
								<li>void sessionWillPassivate(HttpSessionEvent se)
							</ul>
						<li><b>HttpSessionIdListener</b><br/>
							<ul>
								<li>sessionIdChanged(HttpSessionEvent)
							</ul>
					</ol>
			</ul>
		</li>
		<li><b>Event Source의 attribute 관련 Listener and Event 객체</b>
			<ul>
				<li>ServletContext:<br/>
					<ol>
						<li><b>ServletContextAttributeEvent</b><br/>
							<ul>
								<li>String getName()
								<li>Object getValue()
							</ul>
						<li><b>ServletContextAttributeListener</b><br/>
							<ul>
								<li>void attributeAdded(ServletContextAttributeEvent )
								<li>void attributeRemoved(ServletContextAttributeEvent )
								<li>void attributeReplaced(ServletContextAttributeEvent )
							</ul>
					</ol>
				<li>HttpServletRequest:<br/>
					<ol>
						<li><b>ServletRequestAttributeEvent</b><br/>
							<ul>
								<li>String getName()
								<li>Object getValue()
							</ul>
						<li><b>ServletRequestAttributeListener</b><br/>
							<ul>
								<li>void attributeAdded(ServletRequestAttributeEvent )
								<li>void attributeRemoved(ServletRequestAttributeEvent )
								<li>void attributeReplaced(ServletRequestAttributeEvent )
							</ul>
					</ol>
				<li>HttpSession:<br/>
					<ol>
						<li><b>HttpSessionBindingEvent</b><br/>
							<ul>
								<li>String getName()
								<li>Object getValue()
								<li>HttpSession getSession()
							</ul>
						<li><b>HttpSessionAttributeListener</b><br/>
							<ul>
								<li>void attributeAdded(HttpSessionBindingEvent )
								<li>void attributeRemoved(HttpSessionBindingEvent )
								<li>void attributeReplaced(HttpSessionBindingEvent )
							</ul>
						<li><b>HttpSessionBindingListener</b><br/>
							<ul>
								<li>void valueBound(HttpSessionBindingEvent )
								<li>void valueUnbound(HttpSessionBindingEvent )
							</ul>
					</ol>
			</ul>
		</li>
		<li><b>그 외 Listener and Event 객체</b>
			<ul>
				<li>AsyncListener</li>
				<li>ReadListener</li>
				<li>WriteListener</li>
				<li>AsycEvent</li>
			</ul>
	</ol>

	<hr>
	<h2>리스너 등록</h2>
	<pre>
web.xml에서 등록해준다.
	&lt;listener&gt;
		&lt;listener-class&gt;&lt;/listener-class&gt;
	&lt;/listener&gt;
	</pre>
	서버 시작시 리스너 객체가 생성되어 준비되고 서버 중지될 때 삭제된다. 서비스되고 있는 동안 메모리에 상주하여 이벤트 발생시 자동으로 메소드가 실행된다.

</body>
</html>