<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex13MoveURL</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String url = request.getParameter("select");
	response.sendRedirect(url);
	
	// 풀이
	// 만약 사용자가 네이버를 선택 했으면? >> naver url 로 이동
	//			 다음을 선택 했으면 >> daum url 로 이동 
//	if(select.equals("네이버")){
//		url="http://www.naver.com/";
//	}else if (select.equals("다음")){
//		url="http://www.daum.net/";
//	}else{
//		url="http://www.google.co.kr/";
//	}
	%>
</body>
</html>