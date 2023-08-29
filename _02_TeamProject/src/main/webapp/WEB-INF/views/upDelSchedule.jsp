<%@page import="com.smhrd.entity.Member"%>
<%@page import="com.smhrd.entity.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 수정 / 삭제</title>
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
		
		.upDelCal {
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
		   font-size: 1.8em;
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
		   display: flex;
		   justify-content: center;
		   align-items: center;
		}
		
		.btn button {
		   width: 40%;
		   height: 50px;
		   border: 0;
		   outline: none;
		   border-radius: 40px;
		   /*margin-left: 10px;*/
		   background: linear-gradient(to left, #aec6ff, #e2bf8a);
		   color: white;
		   font-size: 1.2em;
		   letter-spacing: 2px;
		}
		
		#delBtn{
			margin-left: 10px;
		}
	</style>

</head>
<body>

	<% 
	Calendar calData = (Calendar)session.getAttribute("calData"); 
	
	System.out.println("넘어온 세션의 일정제목 : " + calData.getCal_title());
	%>
	
	
	<div class="wrap">
		<div class="upDelCal">
			<h2>일정 수정 / 삭제</h2>
			
			<div class="cal_title">
				<h4>일정 제목</h4>
				<input type="text" value="<%=calData.getCal_title()%>" name="cal_title">
			</div>
			
			<div class="cal_start">
				<h4>시작 날짜</h4>
				<input type="date" value=<%= calData.getStarted_at() %> name="cal_start">
			</div>
			
			<div class="cal_end">
				<h4>종료 날짜</h4>
				<input type="date" value=<%= calData.getEnded_at() %> name="cal_end">
			</div>			
			
			<div class="cal_color">
				<h4>표시 색깔</h4>
				<input type="color" value=<%= calData.getCal_color()%> name="cal_color">
			</div>
			
			<div class="cal_content">
				<h4>상세 내용</h4>
				<%-- <input type="text" value=<%= calData.getCal_content()%> name="cal_content"> --%>
				<textarea rows="5" name="cal_content"><%= calData.getCal_content()%></textarea>
			</div>
			
			<div class="btn">
				<button id="upBtn" type="button">수정</button>
				<button id="delBtn" type="button">삭제</button>
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
	
		var upbtn = $('#upBtn');
		var delbtn = $('#delBtn');
		var title = $('input[name=cal_title]');
		var start = $('input[name=cal_start]');
		var end = $('input[name=cal_end]');
		var color = $('input[name=cal_color]');
		var content = $('textarea[name=cal_content]');
		var cal_id = '<%= calData.getMb_id() %>';
		var userId = null;
		
		<% if (m != null){ %>
			userId = "<%=m.getMb_id() %>";
		<% } else if (email != null) { %>
			userId = "<%=email %>";
		<% } %>
		
		console.log('일정 아이디:', cal_id, '로그인한 아이디:', userId);
		
		upbtn.on('click', update);
		function update(){
			if(cal_id != userId){
				alert('수정할 수 없는 일정입니다.');
			}else{
				var answer = confirm("일정을 수정하시겠습니까?");
				
				if(answer == true){
					$.ajax({
						url: 'calUpData.do', 
						type: 'post',
						data: {
							"cal_seq" : <%= calData.getCal_seq() %>, 
							"cal_title" : title.val(), 
							"started_at" : start.val(), 
							"ended_at" : end.val(), 
							"cal_color" : color.val(), 
							"cal_content" : content.val()
						} , 
						success: function(res){
							console.log(res);
							alert("수정이 완료되었습니다!");
							window.close();
						} , 
						error: function(e){
							alert("upCalData error")
						}
					});
				}else{
					alert("취소하였습니다!");
				};
			};
		};
				
		delbtn.on('click', del);
		function del(){
			if(cal_id != userId){
				alert('삭제할 수 없는 일정입니다.');
			}else{
				var answer = confirm("일정을 삭제하시겠습니까?");		
				
				if(answer == true){
					$.ajax({
						url: 'calDelData.do', 
						type: 'post',
						data: {"cal_seq" : <%= calData.getCal_seq() %>} , 
						success: function(res){
							console.log(res);
							alert("삭제가 완료되었습니다!");
							window.close();
						} , 
						error: function(e){
							alert("delCalData error")
						}
					});
				}else{
					alert("취소하였습니다!");
				};
			};
		};
	</script>
	
	
</body>
</html>