<%@page import="com.smhrd.entity.Member"%>
<%@page import="com.smhrd.entity.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 추가</title>
<!-- Fullcalendar core CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>

	<style type="text/css">
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
		   color: black;
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
		
		.addCal {
		   width: 50%;
		   height: 680px;
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
		
		.cal_title {
		   margin-top: 20px;
		   width: 80%;
		}
		
		.cal_title input {
		   width: 100%;
		   height: 30px;
		   border-radius: 30px;
		   margin-top: 10px;
		   padding: 0px 20px;
		   border: 1px solid lightgray;
		   outline: none;
		}
		
		.cal_start {
		   margin-top: 20px;
		   width: 80%;
		}
		
		.cal_start input {
		   width: 100%;
		   height: 30px;
		   border-radius: 30px;
		   margin-top: 10px;
		   padding: 0px 20px;
		   border: 1px solid lightgray;
		   outline: none;
		}
		
		.cal_end {
		   margin-top: 20px;
		   width: 80%;
		}
		
		.cal_end input {
		   width: 100%;
		   height: 30px;
		   border-radius: 30px;
		   margin-top: 10px;
		   padding: 0px 20px;
		   border: 1px solid lightgray;
		   outline: none;
		}
		
		.cal_color {
		   margin-top: 20px;
		   width: 80%;
		}
		
		.cal_color input {
		   width: 100%;
		   height: 30px;
		   border-radius: 30px;
		   margin-top: 10px;
		   padding: 0px 20px;
		   border: 1px solid lightgray;
		   outline: none;
		}
		
		.cal_content {
		   margin-top: 20px;
		   width: 80%;
		}
		
		.cal_content textarea {
		   /* height: 30px;*/
		   width: 100%;
		   border-radius: 30px;
		   margin-top: 10px;
		   padding: 10px 20px;
		   border: 1px solid lightgray;
		   outline: none;
		   resize: none;
		}
		
		.btn {
		   margin-top: 30px;
		   width: 80%;
		}
		
		.btn button {
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

</head>
<body>

	<%
	Calendar calStart = (Calendar)session.getAttribute("addStart");
	
	%>
	
	

	<div class="wrap">
		<div class="addCal">
			<h2>일정 추가</h2>
			
			<div class="cal_title">
				<h4>일정 제목</h4>
				<input type="text" name="cal_title">
			</div>
			
			<div class="cal_start">
				<h4>시작 날짜</h4>
				<input type="date" name="cal_start" value="<%= calStart.getStarted_at() %>"  >
			</div>
			
			<div class="cal_end">
				<h4>종료 날짜</h4>
				<input type="date" name="cal_end">
			</div>			
			
			<div class="cal_color">
				<h4>표시 색깔</h4>
				<input type="color" name="cal_color">
			</div>
			
			<div class="cal_content">
				<h4>상세 내용</h4>
				<!-- <input type="text" name="cal_content"> -->
				<textarea rows="5" name="cal_content"></textarea>
			</div>
			
			<div class="btn">
				<button id="addBtn" type="button">추가</button>
			</div>
		</div>
	</div>
	

	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

	<script type="text/javascript">
		<% 
		Member m = (Member)session.getAttribute("user");
		String email = (String) session.getAttribute("email");
		String nickname = (String) session.getAttribute("nickname");
		%>
		
		<% if (m != null){ %>
			userId = "<%=m.getMb_id() %>";
		<% } else if (email != null) { %>
			userId = "<%=email %>";
		<% } %>
	
		// Ajax 기술 활용! -> Jquery 라이브러리도 필요하다

		// jquery 방식으로 사용하고자 하는 버튼 선택
		var addbtn = $('#addBtn');
		var title = $('input[name=cal_title]');
		var start = $('input[name=cal_start]');
		var end = $('input[name=cal_end]');
		var color = $('input[name=cal_color]');
		var content = $('textarea[name=cal_content]');
		
		// button 이벤트 연결하기
		addbtn.on('click', request);
		
		// 연결될 function 생성
		function request() {
			var answer = confirm("일정을 추가하시겠습니까?");
			
			if(answer == true){
				$.ajax({	
					url : 'calAddData.do', // 어디로 요청을 보낼건지
					type : 'post' , 
					data : {
						mb_id : userId , 
						title : title.val(), 
						start : start.val(), 
						end : end.val(), 
						color : color.val() , 
						content: content.val()
					},
					success : function(res) { // res : response
						// 요청이 성공이면 실행할 내용
						console.log(typeof(res));
						alert("추가가 완료되었습니다!");
						window.close();									
					},
					error : function(e) {
						// 요청이 실패라면 실행할 내용
						alert('addCalData 요청 실패', e);
					}
				});
			}else{
				alert("취소하였습니다!");
			};
			
		};
	</script>


</body>
</html>