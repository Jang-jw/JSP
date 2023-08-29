<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>errorPage</title>
</head>
<body>
	<!--  
		에러 발생시 사용자가 에러 내용이 적힌 페이지를 보게된다.
		- 사용자의 불편 초래 
		- 코드 노출 
		
		page 지시자 - errorPage 속성 : 에러 발생시 대신 다른 jsp 파일을 실행 
	 -->
		<h1><%=4/0 %></h1>
</body>
</html>