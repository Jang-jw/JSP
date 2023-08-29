<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>
	<h1>회원탈퇴</h1>
	<p>만약 탈퇴하기를 희망하신다면 비밀번호를 입력해주세요.</p>
	<form action="delete" method="post">
		<input type="password" name="pw"> <input type="submit"
			value="삭제하기">
	</form>
</body>
</html>