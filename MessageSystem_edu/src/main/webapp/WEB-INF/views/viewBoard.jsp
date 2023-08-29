<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<%--Ex11. 게시글 상세보기 기능 만들기 : 하나의 게시글의 내용을 출력하는 기능을 만들어 봅시다. --%>
	<div id="board">
		<table id="list">
			<tr>
				<td>제목</td>
				<td>
					<%--게시글 제목 출력 --%> ${board.title }
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<%--작성자 출력 --%> ${board.writer }
				</td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
			</tr>
			<tr>
				<td colspan="2">
					<%--게시글 내용 출력 --%> ${board.content } <img src="save/${board.img }">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<%-- 클릭시 boardMain으로 돌아갈 수 있게 수정해봅시다. --%> <a href="goBoard.do"><button>뒤로가기</button></a>
					<a href="goMain.do"><button>홈으로</button></a>
				</td>
			</tr>
		</table>
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
</body>
</html>