<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
	<!-- 기본 url 로 서버에 요청이 들어왔을 때, 자동으로 열리는 페이지 -->
	<!-- 조건 : webapp 에 만들것, 이름이 index.jsp 일 것 -->
	<h1>Welcome Page!!</h1>

	<!-- jsp 액션태그 : jsp 에서 자주 쓰는 코드를 태그화 -->
	<jsp:forward page="goMain.do"></jsp:forward>
</body>
</html>