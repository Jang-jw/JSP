<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex12response</title>
</head>
<body>
	<%
	// response 로 응답하기
	// 1. url 준비
	String url = "http://www.naver.com/";
	// 2. 응답
	// .sendRedirect( "URL" );
	// 해당 url 로 다시 요청을 보내겠다. 
	response.sendRedirect(url);
	
	// 페이지 이동 방식 
	// 주의 : 하나의 파일에서 페이지 이동은 단 한번만 일어나야한다. 
	
	// 1. Redirect 
	// - sendRedirect 실행시 302 상태코드를 즉시 응답 
	// - 응답받은 브라우저가 자동으로 URL 로 "다시" 요청을 보내고 그 결과를 응답 받음 
	// - 요청과 응답이 2번씩 일어나는 페이지 이동 
	// - 첫 요청에 생성된 req, res 와 두번째 생성된 req, res 는 서로 다른 객체 
	// - 다시 "요청"하는 방식이기 때문에, 주소창에 적힌 url 이 변동된다. 
	
	// 2. Forward 
	%>
</body>
</html>