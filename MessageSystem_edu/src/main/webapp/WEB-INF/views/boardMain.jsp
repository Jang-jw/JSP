<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/board.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

</head>
<body>
	<div id="board">
		<h1>게시판 메인 페이지</h1>
		<table id="list">
			<thead>
				<tr>
					<td colspan="3"><input id="search" type="text"></td>
					<td>
						<button id="searchBtn" type="button">검색</button>
					</td>
				</tr>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>시간</td>
				</tr>
			</thead>
			<tbody id="tbd">
				<%--Ex10.게시글 목록을 출력해봅시다. --%>
				<%--예시) --%>
				<c:forEach var="i" items="${list }">
					<tr>
						<td>${i.idx }</td>
						<!-- QueryString 문법을 사용하여 사용자가 선택한 게시글 전달하기! -->
						<td><a href="goView.do?idx=${i.idx }">${i.title }</a></td>
						<td>${i.writer }</td>
						<td>${i.indate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<a href="goWrite.do"><button id="writer">작성하러가기</button></a>
	</div>


	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#searchBtn").on("click", boardSearch)
		})
		function boardSearch(){
			let search = $("#search").val();
			$.ajax({
				url : "search.do",
				type : "get",
				data : {
					"search" : search
				},
				dataType : "json",
				success : function(res){
					console.log(res[0].indate)
					let tbody = $("#tbd");
					tbody.html("");
					for(let i = 0; i < res.length; i++){
						tr = "<tr>";
						tr += "<td>"+res[i].idx+"</td>";
						tr += "<td>"+res[i].title+"</td>";
						tr += "<td>"+res[i].writer+"</td>";
						tr += "<td>"+res[i].indate+"</td>";
						tr += "<tr>";
						
						// html('code') : 덮어쓰기 
						// after('code') : 닫는 태그 바로 뒤에 추가 
						// before('code') : 여는 태그 바로 앞에 추가 
						// append('code') : 자식 요소로 추가 
						tbody.append(tr);
					}
				},
				error : function(e){
					console.log("요청실패 ㅠ")
				}
			});
		}
	</script>
</body>
</html>