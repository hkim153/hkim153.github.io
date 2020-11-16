<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h2>오류 처리 방법</h2>
 <ol>
 	<li>실행 코드를 try-catch블록으로 구성
 	<li>메소드 선언부에 throws 절을 선언해서 메소드를 콜하는 곳에서 처리
 	<li>web.xml에 오류 처리 설정
 	<li>jsp는 ...
 </ol>
	<hr>
	<h2>Servlet에서 오류 처리</h2>
	<ul>
		<li>
			web.xml에서 정의한 오류처리보다 try-catch가 우선순위가 더 높다.<br/>
			web.xml에서 오류 처리하면 대상이 웹 어플리케이션 전체이다.<br/>
		</li>
		<li>
			web.xml에서 오류 태그는 아래와 같다<br/>
			&lt;error-page&gt;<br/>
			&emsp;&lt;error-code&gt;405<br/>
			&emsp;&lt;location&gt;<br/>
			또는 <br/>
			&lt;error-page&gt;<br/>
			&emsp;&lt;exception-type&gt;java.lang.NullPointerException<br/>
			&emsp;&lt;location&gt;<br/>
		</li>
		<li>
			에러 코드나 type에 지정한 오류가 웹어플리케이션 실행 중에 발생하면 location에 지정한 오류 페이지 실행된다.
		</li>
		<li>
			실행 흐름:<br/>
			<ol>
				<li>오류가 발생하면 서버에서 request객체에 attribute로 다음의 key와 정보를 저장한다<br/>
					<ul>
						<li>javax.servlet.error.status_code
						<li>javax.servlet.error.exception_type
						<li>javax.servlet.error.message
						<li>javax.servlet.error.exception
						<li>javax.servlet.error.request_uri
					</ul>
				</li>
				<li>
					web.xml에 지정한 오류가 발생하면 해당 오류 처리 페이지로 이동하는데 기존의 HttpServletRequest,HttpServletResponse를 넘긴다.
				</li>
				<li>
					HttpServletRequest에서 해당 오류 정보를 추출하고 오류 처리한다.
				</li>
			</ol>
		</li>
	</ul>
	<hr>
	<h2>JSP에서 오류 처리</h2>
	
	<hr>
	<h2>Test</h2>
	<a href="../errorCauseServlet">Servlet으로 처리하기</a><br/>
	<a href="../errorCauseServlet">JSP로 처리하기</a>
</body>
</html>