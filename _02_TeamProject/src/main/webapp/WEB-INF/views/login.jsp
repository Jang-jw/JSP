<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dream Planner</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/53a8c415f1.js"
	crossorigin="anonymous"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>



<script>
	Kakao.init('8a7d49787221c777a1bdccddbcb51ff7');

	function sendUserDataToServer(email, nickname) {
						console.log(email, nickname);
		var xhr = new XMLHttpRequest();
		xhr.open('POST', 'storeUserData.do', true);
		xhr.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
			}
		};
		var data = 'email=' + encodeURIComponent(email) + '&nickname='
				+ encodeURIComponent(nickname);
		xhr.send(data);
		window.location.href = 'goMain2.do'; // goMain2 자리 
	}

	function kakaoLogin() {
		Kakao.Auth.login({
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						var email = response.kakao_account.email;
						var nickname = response.properties.nickname;
						sendUserDataToServer(email, nickname); // Send user data to the server
						console.log(email, nickname);
					},
					fail : function(error) {
						console.log(error);
					},
				});
			},
			fail : function(error) {
				console.log(error);
			},
		});
	}

	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url : '/v1/user/unlink',
				success : function(response) {
					console.log(response);
				},
				fail : function(error) {
					console.log(error);
				},
			});
			Kakao.Auth.setAccessToken(undefined);
		}
	}
</script>




<!-- <link rel="stylesheet" href="./login.css"> -->
</head>

<style>
/* 큰 글씨용 광양감동체 */
@font-face{
	font-family: 'Gwangyang Touching';
	font-style: normal;
	font-weight: normal;
	src: url("assets/font/Gwangyang Touching(TTF용).ttf");
}

body, h1, h2, h3, h4, h5, h6, p, span, input, textarea, button {
	font-family: 'Gwangyang Touching'!important;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
}

a {
	text-decoration: none;
	color: #a98a57;
}

li {
	list-style: none;
}

.wrap {
	width: 100%;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #d6c1a1;
}

.login {
	width: 30%;
	height: 840px;
	background: white;
	border-radius: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	color: #7c653f;
}

h2 {
	color: #3f4756;
	font-size: 2em;
}

.login_sns {
	padding: 20px;
	display: flex;
}

.login_sns li {
	padding: 0px 15px;
}

.login_sns a {
	width: 50px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 10px;
	border-radius: 50px;
	background: white;
	font-size: 20px;
	box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.4), -3px -3px 5px
		rgba(0, 0, 0, 0.1);
}

.login_id {
	margin-top: 20px;
	width: 80%;
}

.login_id input {
	width: 100%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.login_pw {
	margin-top: 20px;
	width: 80%;
}

.login_pw input {
	width: 100%;
	height: 50px;
	border-radius: 30px;
	margin-top: 10px;
	padding: 0px 20px;
	border: 1px solid lightgray;
	outline: none;
}

.login_etc {
	align-content: center;
	padding: 10px;
	width: 80%;
	font-size: 14px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-weight: bold;
}

.submit {
	margin-top: 50px;
	width: 80%;
}

.submit input {
	width: 100%;
	height: 50px;
	border: 0;
	outline: none;
	border-radius: 40px;
	background: linear-gradient(to left, #aec6ff, #e2bf8a);
	color: white;
	font-size: 1.2em;
	letter-spacing: 2px;
}

.button_login {
	margin-top: 50px;
	width: 80%;
}

#button_login input {
	width: 100%;
	height: 50px;
	border: 0;
	outline: none;
	border-radius: 40px;
	background: linear-gradient(to left, #aec6ff, #e2bf8a);
	color: white;
	font-size: 1.2em;
	letter-spacing: 2px;
}


</style>


<body>
	<form action="login.do" method="post">
		<div class="wrap">
			<div class="login">
				
				<img id="dpLogo" style="width:300px; height:180px; margin: 30px;" src="assets/image/DPlogo.png">
				<h2>로그인</h2>
				
				<div class="login_id">
					<h4>아이디</h4>
					<input type="text" name="login_id" id="" placeholder="ID">
				</div>
				<div class="login_pw">
					<h4>비밀번호</h4>
					<input type="password" name="login_pw" id="" placeholder="Password">
				</div>

				
				<div class="submit">
					<input type="submit" value="LOGIN" style="cursor: pointer">
				</div>

				<div class="submit">
					<a href="goJoin.do"><input type="button" value="회원가입"
						style="cursor: pointer"></a>
				</div>

				<div class="button_login" align="center"></div>

				<ul>
					<li onclick="kakaoLogin();"><img
						src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png"
						id="button_login_input" style="cursor: pointer"><a
						href="javascript:void(0)"> </a></li>

					
				</ul>

			</div>
		</div>
	</form>
</body>

</html>

