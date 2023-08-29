<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex05showScope</title>
</head>
<body>
	<%
	// scope 에서 데이터 꺼내기 
	String p = (String)pageContext.getAttribute("page");
	String req = (String)request.getAttribute("req");
	String sess = (String)session.getAttribute("sess");
	String app = (String)application.getAttribute("app");
	%>
	<p><%=p %></p>
	<p><%=req %></p>
	<p><%=sess %></p>
	<p><%=app %></p>
</body>
</html>