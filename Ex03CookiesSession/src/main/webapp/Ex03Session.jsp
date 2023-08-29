<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex03Session</title>
</head>
<body>
	<%
	// 세션에 데이터 저장하기
	// 1. 세션 만들기(세션 가져오기)
	// HttpSession session = request.getSession();
	// session 은 내장객체
	
	// session 에 String data 저장하기
	// .setAttribute("name", (obj)value);
	session.setAttribute("name", "안현진");
	
	// ArrayList
	ArrayList<String> list = new ArrayList<String>();
	list.add("이우석");
	list.add("김동영");
	list.add("김유성");
	
	session.setAttribute("list", list);
	%>
	<a href="Ex04Session.jsp">세션 확인</a>
</body>
</html>