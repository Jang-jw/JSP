<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex14Login</title>
</head>
<body>
	<%
	String idP = request.getParameter("id");
	String idS = (String)session.getAttribute("idS");
	String idC = "";
	Cookie[] cookies = request.getCookies();
	for(int i=0; i<cookies.length; i++){
		Cookie c = cookies[i];
		if(c.getValue().equals(idS)){
			idC = c.getValue();
		}
	}
	%>
	<h1><%=idP %>님 환영합니다!</h1>
	<h1><%=idS %>님 환영합니다!</h1>
	<h1><%=idC %>님 환영합니다!</h1>
	<!-- session에 저장된 id를 가져와서 ~~~ 자리에 출력해봅시다. -->
	<a href="#">로그아웃</a>
</body>
</html>