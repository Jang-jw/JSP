<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>maketable</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	int floor = Integer.parseInt(request.getParameter("floor"));
	int room = Integer.parseInt(request.getParameter("room"));
	%>
	<h1><%=floor %>층</h1>
	<h1><%=room %>방</h1>
	<table border=1>
	<% for (int i=0; i<floor; i++){ %>
		<tr>
		<% for (int j=0; j<room; j++){ %>
			<td><%=j %></td>
		<% } %>
		</tr>
	<% } %>
	</table>
</body>
</html>