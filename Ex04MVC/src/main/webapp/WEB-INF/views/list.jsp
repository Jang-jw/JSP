<%@page import="com.smhrd.entity.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<h1>회원목록</h1>
	<%-- request 에게 맡겨둔 list 가져와서 안에 있는 데이터를 table 형태로 출력 --%>
<%
	// 1. request 에서 list 꺼내기
	// List<Member> list = (List<Member>)request.getAttribute("list"); // <c:forEach> 사용시 생략 가능 
%>
	<table border="1">
		<tr>
			<td>ID</td>
			<td>NICK</td>
			<td>GENDER</td>
			<td>TEL</td>
		</tr>
		<c:forEach var="i" items="${list }"> <%-- ${list} 로 바로 부르면 된다. --%>
		<tr>
			<td>${i.id }</td>
			<td>${i.nick }</td>
			<td>${i.gender }</td>
			<td>${i.tel }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>