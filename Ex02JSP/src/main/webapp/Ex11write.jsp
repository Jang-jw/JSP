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
	int num = Integer.parseInt(request.getParameter("num"));
	%>
	<form action="Ex11result.jsp">
	<table>
		<caption>랜덤당첨 작성</caption>
		<tr><td>주제 : <input type="text" name="title"></td>
		<% for (int i=0; i<num; i++){ %>
			<tr><td>아이템<%=i+1 %> : <input type="text" name="menu"></td></tr>
		<% } %>
		<tr><td><input type="submit" value="시작"></td></tr>
	</table>
	</form>
</body>
</html>