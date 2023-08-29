<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex01Cookie</title>
</head>
<body>
	<%
	// 1. 쿠키 생성하기
	// new Cookie("name","value");
	// 쿠키 값 : String => cookie 는 문자열(text)만 저장 가능하다. 
	//		공백, ?, ! 와 같은 특수문자는 허용 안 됨. 
	Cookie cookie = new Cookie("cookieName","첫번째쿠키값");
	
	// 쿠키 유효기간 설정
	// .setMaxAge( int(단위 : 초) );
	// 지정을 안하면 Session 으로 설정됨 
	// cookie.setMaxAge(1*60*60*24*365);
	
	// 2. 쿠키를 응답에 추가
	// .addCookie(cookie);
	response.addCookie(cookie);
	%>
	
	<a href="Ex02Cookie.jsp">쿠키확인</a>
</body>
</html>