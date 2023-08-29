<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include</title>
</head>
<body>
	<h1>Main 페이지 입니다.</h1>
	
	<a herf="#">이동하기~~~</a>
	
	<!-- footer -->
	<!-- 
		include 지시자를 이용해서 다른 jsp 파일 내용을 가져오기
			- 삽입을 원하는 위치에서 사용하면된다. 
			- file 속성을 통해 jsp 를 선택해서 집어넣을 수 있다. 
	-->
<%@ include file="footer.jsp" %>
	
</body>
</html>