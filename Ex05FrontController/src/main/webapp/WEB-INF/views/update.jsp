<%@page import="com.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body>
	<%
Member user = (Member)session.getAttribute("user");
%>

	<h1>회원정보수정</h1>

	<form action="update" method="post">
		ID : <input readonly type="text" name="id" value="<%=user.getId()%>"><br>
		PW : <input type="password" name="pw" value="<%=user.getPw()%>"><br>
		GENDER : 남<input type="radio" name="gender" value="남"> 여<input
			type="radio" name="gender" value="여"><br> NICK : <input
			readonly type="text" name="nick" value="<%=user.getNick()%>"><br>
		TEL : <input type="tel" name="tel" value="<%=user.getTel()%>"><br>
		<input type="submit" value="회원정보수정">
	</form>
</body>
</html>