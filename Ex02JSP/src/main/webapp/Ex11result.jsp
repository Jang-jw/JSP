<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex11</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String[] menus = request.getParameterValues("menu");
	%>
	<%
	Random ran = new Random();
	int numRan = ran.nextInt(menus.length);
	String result = menus[numRan];
	%>
	<h1>랜덤당첨결과</h1>
	<p><%=title%></p>
	<p><%=result%></p>
</body>
</html>