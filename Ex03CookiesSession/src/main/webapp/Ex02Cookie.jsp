<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex02Cookie</title>
</head>
<body>
	<%
	// 1. 쿠키 값 꺼내기
	// .getCookies(); : request 에 들어있는 모든 쿠키를 반환 
	Cookie[] cookies = request.getCookies();
	%>
	<%-- Cookie 의 내용물을 꺼내서 확인하기 --%>
	<% for(int i=0; i<cookies.length; i++){
	// 쿠키 배열에서 i번째 빼오기
	Cookie c = cookies[i];
	// 쿠키 이름 가져오기
	String name = c.getName();
	// 쿠키 값 가져오기
	String value = c.getValue();
	%>
	<p><%=name %> => <%=value %></p>
	<% } %>
</body>
</html>