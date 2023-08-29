<%@page import="com.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt"> <a href="index.html"
			class="logo"><strong>Forty</strong> <span>by HTML5 UP</span></a> <nav>
		<%--Ex07. 로그인 한 상태라면 '게시판'버튼과 '개인정보수정', '로그아웃' 버튼을 출력하시오. --%> <c:if
			test="${empty user }">
			<a href="#menu">로그인</a>
		</c:if> <c:if test="${!empty user }">
			<a href="goBoard.do">게시판</a>
			<a href="goUpdate.do">개인정보수정</a>
			<a href="">로그아웃</a>
		</c:if> </nav> </header>

		<!-- Menu -->
		<nav id="menu">
		<ul class="links">
			<%--Ex07. 로그인 기능 만들기 : 사용자에게 정보를 입력받아 회원인지 아닌지 조회하는 기능을 만들어 봅시다. --%>
			<li><h5>로그인</h5></li>
			<form action="login.do" method="post">
				<li><input name="email" type="text" placeholder="Email을 입력하세요"></li>
				<li><input name="pw" type="password" placeholder="PW를 입력하세요"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</form>
		</ul>
		<ul class="actions vertical">
			<%--Ex06. 회원가입 기능 만들기 : 사용자에게 정보를 입력받아 저장하는 기능을 만들어 봅시다. --%>
			<li><h5>회원가입</h5></li>
			<form action="join.do" method="post">
				<li><input id="checkInput" name="email" type="text"
					placeholder="Email을 입력하세요"></li>
				<!-- 아이디 중복체크 여부를 알려주는 결과 -->
				<span id="checkResult"></span>
				<li><input name="pw" type="password" placeholder="PW를 입력하세요"></li>
				<li><input name="tel" type="text" placeholder="전화번호를 입력하세요"></li>
				<li><input name="address" type="text" placeholder="집주소를 입력하세요"></li>
				<li><input type="submit" value="JoinUs" class="button fit"></li>
			</form>
		</ul>
		</nav>
		<!-- Banner -->
		<section id="banner" class="major">
		<div class="inner">
			<header class="major"> <%--Ex07. 로그인 후 로그인 한 사용자의 세션아이디로 바꾸시오. ex)smart님 환영합니다 --%>
			<!-- 
									session => "user" 로그인의 정보 기억! 
									empty : 객체가 내용을 가지고 있지 않은 경우!
									!empty : 객체가 내용을 가지고 있는 경우!
								--> <!-- 로그인이 되지 않았을 경우 --> <c:if test="${empty user }">
				<h1>로그인을 해주세요~</h1>
			</c:if> <c:if test="${!empty user }">
				<h1>${user.email }님환영합니다!</h1>
			</c:if> </header>
			<div class="content">
				<p>
					아래는 지금까지 배운 웹 기술들입니다.<br>
				</p>
				<ul class="actions">
					<li><a href="#one" class="button next scrolly">확인하기</a></li>
				</ul>
			</div>
		</div>
		</section>

		<!-- Main -->
		<div id="main">

			<!-- One -->
			<section id="one" class="tiles"> <article> <span
				class="image"> <img src="images/pic01.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">HTML</a>
			</h3>
			<p>홈페이지를 만드는 기초 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic02.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">CSS</a>
			</h3>
			<p>HTML을 디자인해주는 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic03.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">Servlet/JSP</a>
			</h3>
			<p>Java를 기본으로 한 웹 프로그래밍 언어/스크립트 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic04.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">JavaScript</a>
			</h3>
			<p>HTML에 기본적인 로직을 정의할 수 있는 언어</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic05.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">MVC</a>
			</h3>
			<p>웹 프로젝트 중 가장 많이 사용하는 디자인패턴</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic06.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">Web Project</a>
			</h3>
			<p>여러분의 최종프로젝트에 웹 기술을 활용하세요!</p>
			</header> </article> </section>
			<!-- Two -->
			<section id="two">
			<div class="inner">
				<header class="major">
				<h2>메세지 확인하기</h2>
				</header>
				<%-- chatting 기능을 만들어 봅시다! --%>
				<div class="container chat">

					<div class="other">
						<p>보낸사람 이름 :</p>
						<p>다른사람에게서 온 메세지</p>
					</div>

					<div class="mychat">
						<p>내가보낸 채팅</p>
					</div>

					<div class="other">
						<p>보낸사람 이름2 :</p>
						<p>다른사람에게서 온 메세지2</p>
					</div>


				</div>
				<%-- 채팅창 끝! --%>
			</div>
			</section>

		</div>

		<!-- Contact -->
		<section id="contact">
		<div class="inner">
			<section>
			<form>
				<div class="field">
					<label for="message">Message</label>
					<textarea id="message" rows="6"></textarea>
				</div>
				<ul class="actions">
					<li><input id="sendMsg" type="button" value="Send Message"
						class="special" /></li>
					<li><input type="reset" value="Clear" /></li>
				</ul>
			</form>
			</section>

			<%--Ex07. 로그인 한 사용자의 정보로 변경해 봅시다. --%>
			<section class="split"> <section>
			<div class="contact-method">
				<span class="icon alt fa-envelope"></span>
				<h3>Email</h3>
				<!-- 로그인 한 사용자의 이메일을 출력하시오 -->
				<c:if test="${empty user }">
					<a href="#">로그인 한 사람의 이메일을 출력<a>
				</c:if>
				<c:if test="${!empty user }">
					<a href="#">${user.email }</a>
				</c:if>
			</div>
			</section> <section>
			<div class="contact-method">
				<span class="icon alt fa-phone"></span>
				<h3>Phone</h3>
				<!-- 로그인 한 사용자의 전화번호를 출력하시오 -->
				<c:if test="${empty user }">
					<span>로그인 한 사람의 전화번호를 출력</span>
				</c:if>
				<c:if test="${!empty user }">
					<span>${user.tel }</span>
				</c:if>
			</div>
			</section> <section>
			<div class="contact-method">
				<span class="icon alt fa-home"></span>
				<h3>Address</h3>
				<!-- 로그인 한 사용자의 집주소를 출력하시오 -->
				<c:if test="${empty user }">
					<span>로그인 한 사람의 집주소를 출력</span>
				</c:if>
				<c:if test="${!empty user }">
					<span>${user.address }</span>
				</c:if>
			</div>
			</section> </section>
		</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
		<div class="inner">
			<ul class="icons">
				<li><a href="#" class="icon alt fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon alt fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon alt fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon alt fa-github"><span
						class="label">GitHub</span></a></li>
				<li><a href="#" class="icon alt fa-linkedin"><span
						class="label">LinkedIn</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled</li>
				<li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
		</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

	<!-- 비동기 통신 -->
	<script type="text/javascript">
		// 이메일에 대하여 중복여부 체크 기능!
		// => input 태그에 내용이 입력되자 마자 판단! (실행)
		// 페이지 실행과 동시에 해당 기능이 실행되도록 연결!
		$(document).ready(function(){
			var input = $("#checkInput")
			input.on("input", emailCheck);
		});
		// emailCheck 기능 만들기!
		function emailCheck(){
			// 입력된 값이 DB에 존재하는지 확인 필요! 
			// input에 입력되는 값을 가져오는 명령! 
			var value = $(this).val();
			$.ajax({
				url : "emailCheck.do",
				type : "post",
				data : {
					"email" : value 
				},
				success : function(res){
					// 사용여부 알려주기 
					var span = $("#checkResult");
					if(res == "true"){
						span.html("사용이 가능한 이메일 입니다!").css("color", "white");
					}else{
						span.html("사용이 불가능한 이메일 입니다 ㅠ").css("color", "red");
					}
				},
				error : function(e){
					alert("실패");
				}
			});
		}
	</script>

	<script type="text/javascript">
		$(document).ready(function(){
			// 1. 웹 소켓과 연결
			const websocket = new WebSocket("ws://localhost:8081/MessageSystem/chat");
			
			// 2. 소켓과 연결되었을 때 실행되는 함수 
			websocket.onopen = function(message){
				console.log(message);
			}
			
			// 3. 메세지 보내기 
			$("#sendMsg").on("click", function(){
				websocket.send("안녕하세요 웹소켓은 처음이에요.");
			});
		});
	</script>
</body>
</html>

