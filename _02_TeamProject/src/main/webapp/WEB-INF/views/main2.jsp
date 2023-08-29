<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Dream Planner</title>
<!-- 부트스트랩5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

	<style type="text/css">
	
		/* 큰 글씨용 광양감동체 */
		@font-face{
			font-family: 'Gwangyang Touching';
			font-style: normal;
			font-weight: normal;
			src: url("assets/font/Gwangyang Touching(TTF용).ttf");
		}
		
		/* 작은 글씨용 문화재돌봄체 */
		@font-face {
		    font-family: 'Dolbomche_R';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/Dolbomche_R.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		body, h1, h2, h3, h4, h5, h6, p, span, input, textarea, button {
			font-family: 'Gwangyang Touching';
		}
		
		div.fc-event-title.fc-sticky{
			font-family: 'Dolbomche_R';
		}
		
		#layout, body, html{
            width: 100%;
            height: 100%;
            /* position을 fixed로 주면 태그를 #layout만 줘도 됨 */
        }
		
		body{
			margin: 0;
		}
		
		#header{
			height: 10%;
			width: 100%;
			position: relative;
			padding-top: 5px;
			padding-left: 20px; 
			padding-right: 20px; 
		}
				
		#task-cheer {
		   display: inline;
		   font-family: 'Gwangyang Touching';
		   font-size: 22px;
		   color: #613f0e;
		   text-align: left;
		   font-style: bold;
		}
		
		#userinfo{
			float: right;
			position: absolute;
			margin-right: 12px; 
			right: 30px;
			top: 20%;
		}
		
		#username{
			color: #613f0e;
			font-family: 'Gwangyang Touching';
			font-size: 22px;
			font-style: bold;
			width : 20%;
			margin-right: 20px;
			top : 3px;
			left : 80px;
		}
			
		#logoutBtn{
			right : 50px;
			height: 50px;
			outline: none;
			border-radius: 20px;
			background: linear-gradient(to left, #aec6ff, #e2bf8a);
			color: rgb(255, 255, 255);
			font-size: 1.0em;
			letter-spacing: 2px;
	    	font-weight: bold;
	    	float : right;
		}
		
		#todoMain{
			width: 27%;
			height: 90%;
			float: left;
		}
		
		#calMain{
			width: 53%;
			height: 90%;
			float: left;
		}
		
		#chatMain{
			width: 20%;
			height: 90%;
			float: left;
		}
		
	</style>
</head>
<body style="background-color: #ffebce;">
	<%
	Member m = (Member) session.getAttribute("user");
	String email = (String) session.getAttribute("email");
	String nickname = (String) session.getAttribute("nickname");
	%>


	<div id="layout">
		<div id="header">
			<div id="task-cheer"></div>
			<div id="userinfo">
				<span id="username">
					<% if (nickname != null) { %>
						<%=nickname%>
					<% } else if (m != null) { %>
						<%=m.getMb_nick()%>
					<% }%>님
				</span> 
				<a href="logout.do" onclick="alert('로그인 페이지로 이동합니다.')">
					<input id="logoutBtn" type="button" value="LOGOUT" style="cursor: pointer"
	                onclick="alert('로그아웃 되었습니다!')">
	            </a>
			
			</div>
		</div>

		<div id="todoMain">
			<jsp:include page="todoList.jsp"></jsp:include>
		</div>
		<div id="calMain">
			<jsp:include page="calendar.jsp"></jsp:include>
		</div>
		<div id="chatMain">
			<jsp:include page="Chatting.jsp"></jsp:include>
		</div>
	</div>

	<script>
    // 카카오 로그인한 사용자 세션에서 이메일 및 닉네임 값 가져오기
    var email = '<%=session.getAttribute("email")%>';
    var nickname = '<%=session.getAttribute("nickname")%>';

		// Send the data to the servlet
		var xhr = new XMLHttpRequest();
		xhr.open('POST', 'StoreKakaoInfoServlet', true);
		xhr.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				// Handle the response if needed
			}
		};
		var data = 'email=' + encodeURIComponent(email) + '&nickname='
				+ encodeURIComponent(nickname);
		xhr.send(data);
		
		// 응원글 변수 선언
        let cheering;
        let taskCheering = document.getElementById("task-cheer");

        // 응원글 가져오기
        function getCheering() {
            $.ajax({
                url: "todoCmSelect.do",
                dataType: 'json',
                success: function (res) {
                    console.log("getCheering complete!");
                    cheering = res;
                    renderCheering();
                },
                error: function (e) {
                    console.log('getCheering faild!');
                }
            });

        };
        getCheering();

        // 응원글 랜덤 
        function renderCheering() {
            const random = Math.floor(Math.random() * cheering.length);
            console.log(random);
            let resultHTML = '';
            if (cheering[random] != "") {
                resultHTML += `
    			<div id="task-cheer">${cheering[random].todocm_content}</div>
    			`;
                taskCheering.innerHTML = resultHTML;
            };
        };
	</script>



</body>
</html>