<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
</head>
<body>
	<h1>회원가입</h1>

	<form action="join.do" method="post">
		ID : <input type="text" name="id"><br> PW : <input
			type="password" name="pw"><br> GENDER : 남<input
			type="radio" name="gender" value="남"> 여<input type="radio"
			name="gender" value="여"><br> NICK : <input type="text"
			name="nick"><br> TEL : <input type="tel" name="tel"><br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>