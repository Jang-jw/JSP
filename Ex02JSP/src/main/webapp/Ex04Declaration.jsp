<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Declaration</title>
</head>
<body>
	<%!
		// 선언문 : 필드(전역변수) 선언 또는 메소드를 선언할 때 사용 
		//		스크립트릿 --> service 메소드 안으로 들어감 
		//		- 메소드를 선언할 수 없음 
		int num;
		
		public int sum(int a, int b){
		return a+b;
	}
	%>
	
	<%
		Random ran = new Random();
	%>
	
	<!-- 3, 5 의 합을 h1 태그 사이에 출력 -->
	<h1><%=sum(2,3) %></h1>
</body>
</html>