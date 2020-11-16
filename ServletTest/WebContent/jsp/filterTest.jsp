<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>Filter 란?</h2>
	필터는 여러 서블릿과 맵핑되어 서블릿이 수행되기 전과 후에 작업들을 처리해주는 역할을 한다.<br/>
	<img src="../img/filter.png" alt="Filter">
	<hr>
	
	<h2>Filter 관련 interface</h2>
	<ol>
		<li><b>Filter</b>
			<ul>
				<li>Filter를 생성하기 위해서는 Filter interface를 구현해야한다.
				<li>메소드 : 
					<ul>
						<li><b>void init(FilterConfig filterConfig)</b> : 필터 객체가 생성 될 때 한번 호출된다.</li>
						<li><b>void destroy()</b> : Filter 객체가 소멸될 때 한번 호출된다.</li>
						<li><b>void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException</b> : <br/>
						 설정한 서블릿이 호출될 때마다 실행된다.</li>
					</ul>
				</li>
				
			</ul>
		</li>
		<li><b>FilterConfig</b>
			<ul>
				<li>&lt;filter&gt; 에 대한 정보를 가지고 있는 객체이다</li>
				<li>Method : 
					<ul>
						<li><b>String getFilterName()</b> : &lt;filter-name&gt; 반환</li>
						<li><b>String getInitParameter(String name)</b> : </li>
						<li><b>Enumeration&lt;String&gt; getInitParameterNames()</b> : </li>
						<li><b>ServletContext getServletContext()</b> : 실행되고 있는 Context 반환한다.</li>
					</ul>
				</li>
			</ul>
		</li>
		<li><b>FilterChain</b>
			<ul>
				<li>Filter interface의 doFilter 메소드의 argument로 다음 Filter나 다음 Filter가 없으면 resource(Servlet, JSP)을 호출할 때 사용된다.
				<li>Method :
					<ul>
						<li><b>void doFilter(ServletRequest request, ServletResponse response) throws ServletException, IOException</b> : <br/>
							다음 Filter나 다음 Filter가 없으면 resource(Servlet, JSP)을 호출한다.
						</li>
					</ul>
				</li>
			</ul>
		</li>
	</ol>	
	<hr>
	
	<h2>Filter 등록</h2>
	web.xml에 Filter 조작 순서대로 filter 관련 태그들을 적는다.
	Filter 관련 태그들은 2개 있다.
	<ol>
		<li> &lt;filter&gt;
			<pre>  &lt;filter-name&gt;</pre>
			<pre>  &lt;filter-class&gt;</pre>
			<pre>  &lt;init-param&gt;</pre>
			<pre>    &lt;param-name&gt;</pre>
			<pre>    &lt;param-value&gt;</pre>
		</li>
		<li> &lt;filter-mapping&gt;
			<pre>  &lt;filter-name&gt;</pre>
			<pre>  &lt;url-pattern&gt; or &lt;servlet-name&gt;</pre>
		</li>
	</ol>
	filter-mapping 태그 순서에 따라 filter 실행 순서도 바뀐다.
	<hr>
	
	<h2>Filter Test</h2>
	<a href="../filterServletOne">Filter One 과 Filter Two 반영된 Servlet 실행</a><br/>
	<a href="../filterServletTwo">]Filter Two만 반영된 Servlet 실행</a>
	
</body>
</html>