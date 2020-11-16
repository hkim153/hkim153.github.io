<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String method = request.getParameter("method");
		if(!method.equalsIgnoreCase("post")&&!method.equalsIgnoreCase("get")){
			//exception
	%>
	<h2>method는 post 또는 get만 된다.</h2>
	<% 
		}else{
	%>
	
	<form action="../postParam" method="<%=method %>" >
		요청 방식과 프로토콜 정보 표시 : <input type="radio" name="info" value="true"> yes 
								 <input type="radio" name="info" value="false"> no <br/>
		text: <input type="text" name="text"> <br/>
		checkbox: <input type="checkbox" name="checkbox" value="c1">c1
				  <input type="checkbox" name= "checkbox" value="c2">c2 <br/>
		textarea: <textarea cols ="30" rows ="10" name="textarea"></textarea> <br/>
		
		<input type="submit" value="완료">
		<input type="reset" value="다시작성">
	</form>
	<%
		}
	%>
</body>
</html>