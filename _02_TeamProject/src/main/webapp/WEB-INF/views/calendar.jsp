<%@page import="com.smhrd.entity.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.entity.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dream Planner</title>

<!-- 제이쿼리 스크립트 -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<!-- Fullcalendar CSS -->
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<!-- Fullcalendar core CDN -->
<script	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>

<!-- 풀캘린더 언어 설정관련 CDN -->
<script	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
	
	<style type="text/css">
		
		#calBack{
			width: 1000px;
			height: 770px;
			background-image: url('assets/img/notepad-6648710_1920.png');
			background-size: 100%;
			border-radius: 30px;
			
			padding-top: 100px;
			padding-left: 25px;
		}
		
		#calendar {
			width: 950px;
			height: 620px;			
		}	
		
		#calendar button{
			font-family: 'Dolbomche_R';
		}	
		
		#calendar a{
			font-family: 'Dolbomche_R' !important;
			color: #000000;
			text-decoration: none;
		}
				
	</style>

</head>
<body style="background-color: #ffebce;">

	<!-- 캘린더가 출력되는 div -->
	<div id="calBack">
		<div id="calendar"></div>
	</div>
	
	
	<script type="text/javascript">
		// calendar를 전역변수로 선언
		var calendar = null;
		var userId = null;
		
		// 컨트롤러에서 만든 JSON데이터들
		<%
			String calList = (String)session.getAttribute("calList");
			String calSession = (String)session.getAttribute("calSession");
			
			Member user = (Member) session.getAttribute("user");
			String email = (String) session.getAttribute("email");
			String nickname = (String) session.getAttribute("nickname");
			%>
		
		<% if (user != null){ %>
			userId = "<%=user.getMb_id() %>";
		<% } else if (email != null) { %>
			userId = "<%=email %>";
		<% } %>
		console.log("멤버세션값 : ", userId);
		
		// 캘린더 출력하기 위한 코드
		document.addEventListener('DOMContentLoaded', function() {
			var Calendar = FullCalendar.Calendar;
			
			var calendarEl = document.getElementById('calendar');
			
			calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
				customButtons:{
					reloadBtn:{
						text: '캘린더 동기화' , 
						// 새로고침 버튼을 누르면 동작하는 캘린더 동기화 기능
						click: function(event){
							// 기존 이벤트 제거
						    calendar.getEvents().forEach(function(event) {
						        event.remove();
						    });
						
						    // db에 저장된 데이터를 캘린더에 다시 표시
						    if(userId != 'admin'){
						    	$.ajax({
							        url: 'calList.do',
							        type: 'post',
							        data: { "mb_id" : userId },
							        dataType: "json",
							        success: function(res){
										// select로 받아온 데이터를 모두 추가하기 위해 for문 사용
										for(var i = 0 ; i < res.length ; i++){
											// 날짜에서 시간부분을 지우기위해 substr 사용
											var start = res[i].started_at.substr(0, 10);
											var end = res[i].ended_at.substr(0, 10);
											// 풀캘린더가 종료날짜를 하루 빼고 적용하길래 임의로 1 더해주기
											var end2 = end.substr(0, 8);
											var day = end.substr(8, 2) * 1 + 1;
											// 일자가 10일 미만인 경우에는 09가 아니라 9로 표시되서
											// 풀캘린더에 표시가 안 되므로 임의로 일자 앞에 0 붙여주기
											if(day < 10){
												day = "0" + day;
											}
											end = end2 + day;
											
											console.log(end);
											
											// 캘린더에 일정을 추가하는 풀캘린더 내부 기능
											calendar.addEvent({
												id: res[i].cal_seq, 
												title: res[i].cal_title ,
												start: start, 
												end: end, 
												color: res[i].cal_color 
											});
										}
									} ,
							        error: function(e) {
							            alert('calList 요청 실패');
							        }
							    });
						    	
						    	$.ajax({
							        url: 'calList.do',
							        type: 'post',
							        data: { "mb_id" : 'admin' },
							        dataType: "json",
							        success: function(res){
										// select로 받아온 데이터를 모두 추가하기 위해 for문 사용
										for(var i = 0 ; i < res.length ; i++){
											// 날짜에서 시간부분을 지우기위해 substr 사용
											var start = res[i].started_at.substr(0, 10);
											var end = res[i].ended_at.substr(0, 10);
											// 풀캘린더가 종료날짜를 하루 빼고 적용하길래 임의로 1 더해주기
											var end2 = end.substr(0, 8);
											var day = end.substr(8, 2) * 1 + 1;
											// 일자가 10일 미만인 경우에는 09가 아니라 9로 표시되서
											// 풀캘린더에 표시가 안 되므로 임의로 일자 앞에 0 붙여주기
											if(day < 10){
												day = "0" + day;
											}
											end = end2 + day;
											
											console.log(end);
											
											// 캘린더에 일정을 추가하는 풀캘린더 내부 기능
											calendar.addEvent({
												id: res[i].cal_seq, 
												title: res[i].cal_title ,
												start: start, 
												end: end, 
												color: res[i].cal_color 
											});
										}
									} ,
							        error: function(e) {
							            alert('calList 요청 실패');
							        }
							    });
						    	
						    }else{
						    	$.ajax({
							        url: 'calList.do',
							        type: 'post',
							        data: { "mb_id" : userId },
							        dataType: "json",
							        success: function(res){
										// select로 받아온 데이터를 모두 추가하기 위해 for문 사용
										for(var i = 0 ; i < res.length ; i++){
											// 날짜에서 시간부분을 지우기위해 substr 사용
											var start = res[i].started_at.substr(0, 10);
											var end = res[i].ended_at.substr(0, 10);
											// 풀캘린더가 종료날짜를 하루 빼고 적용하길래 임의로 1 더해주기
											var end2 = end.substr(0, 8);
											var day = end.substr(8, 2) * 1 + 1;
											// 일자가 10일 미만인 경우에는 09가 아니라 9로 표시되서
											// 풀캘린더에 표시가 안 되므로 임의로 일자 앞에 0 붙여주기
											if(day < 10){
												day = "0" + day;
											}
											end = end2 + day;
											
											console.log(end);
											
											// 캘린더에 일정을 추가하는 풀캘린더 내부 기능
											calendar.addEvent({
												id: res[i].cal_seq, 
												title: res[i].cal_title ,
												start: start, 
												end: end, 
												color: res[i].cal_color 
											});
										}
									} ,
							        error: function(e) {
							            alert('calList 요청 실패');
							        }
							    });
						    };
						    
						    
						    
						}
					}
				} , 
				views: {
					listMonth:{buttonText: '월간 일정'} , 
					listWeek:{buttonText: '주간 일정'} , 
					dayGridMonth:{buttonText: '달력'}
				} , 
				headerToolbar : { // 헤더에 표시할 툴 바
					left : 'prev,next today reloadBtn',
					center : 'title',
					right : 'dayGridMonth listMonth listWeek'
				},
				//editable : true, // 일정 수정 가능 여부
				//navLinks : true, // 달력에 날짜 클릭시 해달 날짜의 일별달력으로 이동
				nowIndicator : true, // 현재 시간 마크
				selectable : true,  // 달력 일자 드래그 설정가능
				locale : 'ko',  // 한국어 설정
				dateClick: function(info){ // 날짜 클릭시 일정 추가 화면 팝업
					$.ajax({
						url: 'calAddSession.do' , 
						type: 'post' , 
						data: {
							"start" : info.dateStr
						} , 
						dataType: 'json' , 
						success: function(res){
							console.log("calSession2로그 : ", typeof(res));
							
							var url = "goAddSchedule.do";
							var name = "addSchedule";
							var option = "left=710, top=100, width=500, height=700, scrollbars=no, status=no, toolbars=no, location=no"
							window.open(url, name, option);
						} , 
						error: function(e){
							alert("goAddSchedule.do 요청실패 : ", e);
						}
					});
				},  
				eventClick: function(info){ // 일정 클릭시 수정/삭제화면 팝업
						$.ajax({
							url: 'calUpDelSession.do' ,
							type: 'post' , 
							data: {
								"cal_seq" : info.event.id
							} , 
							dataType: 'json' , 
							success: function(res){
								console.log("calSession로그 : ", res.started_at);
								
								var url = "goUpDelSchedule.do";
								var name = "upDelSchedule";
								var option = "left=710, top=100, width=500, height=700, scrollbars=no, status=no, toolbars=no, location=no"
								window.open(url, name, option);
							} , 
							error: function(e){
								alert('goUpDelSchedule 요청 실패');
							}						
						});	
						console.log(typeof(info.event));
				} ,				 
				timeZone: 'UTC'
			});	
			
			// db에 저장된 데이터를 캘린더에 표시하기 위한 비동기 통신
			$.ajax({ 
				url: 'calList.do' ,
				type: 'post' , 
				data: { "mb_id" : userId } , 
				dataType: "json" , 
				success: function(res){
					// select로 받아온 데이터를 모두 추가하기 위해 for문 사용
					for(var i = 0 ; i < res.length ; i++){
						// 날짜에서 시간부분을 지우기위해 substr 사용
						var start = res[i].started_at.substr(0, 10);
						var end = res[i].ended_at.substr(0, 10);
						// 풀캘린더가 종료날짜를 하루 빼고 적용하길래 임의로 1 더해주기
						var end2 = end.substr(0, 8);
						var day = end.substr(8, 2) * 1 + 1;
						// 일자가 10일 미만인 경우에는 09가 아니라 9로 표시되서
						// 풀캘린더에 표시가 안 되므로 임의로 일자 앞에 0 붙여주기
						if(day < 10){
							day = "0" + day;
						}
						end = end2 + day;
						
						console.log(end);
						
						// 캘린더에 일정을 추가하는 풀캘린더 내부 기능
						calendar.addEvent({
							id: res[i].cal_seq, 
							title: res[i].cal_title ,
							start: start, 
							end: end, 
							color: res[i].cal_color 
						});
					}
				} , 
				error: function(e){
					alert('calList 요청 실패');
				}
			});
			
			if(userId != 'admin'){
				$.ajax({ 
					url: 'calList.do' ,
					type: 'post' , 
					data: { "mb_id" : 'admin' } , 
					dataType: "json" , 
					success: function(res){
						// select로 받아온 데이터를 모두 추가하기 위해 for문 사용
						for(var i = 0 ; i < res.length ; i++){
							// 날짜에서 시간부분을 지우기위해 substr 사용
							var start = res[i].started_at.substr(0, 10);
							var end = res[i].ended_at.substr(0, 10);
							// 풀캘린더가 종료날짜를 하루 빼고 적용하길래 임의로 1 더해주기
							var end2 = end.substr(0, 8);
							var day = end.substr(8, 2) * 1 + 1;
							// 일자가 10일 미만인 경우에는 09가 아니라 9로 표시되서
							// 풀캘린더에 표시가 안 되므로 임의로 일자 앞에 0 붙여주기
							if(day < 10){
								day = "0" + day;
							}
							end = end2 + day;
							
							console.log(end);
							
							// 캘린더에 일정을 추가하는 풀캘린더 내부 기능
							calendar.addEvent({
								id: res[i].cal_seq, 
								title: res[i].cal_title ,
								start: start, 
								end: end, 
								color: res[i].cal_color 
							});
						}
					} , 
					error: function(e){
						alert('calList 요청 실패');
					}
				});
				
			};
			
			
			
			
			// 캘린더 렌더링
			calendar.render();	
			console.log("첫렌더링", calendar);
		});
		// 캘린더 출력하기 위한 코드
		// ===============================================
		
		
		// admin 일정을 모두에게 배포하기 위한 ajax
									/*if(username != 'admin'){
										$.ajax({
									        url: 'calList.do',
									        type: 'post',
									        data: { "mb_id" : 'admin' },
									        dataType: "json",
									        success: function(res){
												for(var i = 0 ; i < res.length ; i++){
													var start = res[i].started_at.substr(0, 10);
													var end = res[i].ended_at.substr(0, 10);
													
													var end2 = end.substr(0, 8);
													var day = end.substr(8, 2) * 1 + 1;
													
													if(day < 10){
														day = "0" + day;
													}
													end = end2 + day;
													
													console.log(end);
													
													$.ajax({
														url: 'calAddData.do' , 
														type: 'post' , 
														data: {
															title : res[i].cal_title , 
															start : res[i].started_at , 
															end : res[i].ended_at , 
															mb_id: username, 
															color: res[i].cal_color, 
															content: res[i].cal_content, 
															check: res[i].cal_check
														} , 
														success: function(res){
															console.log("admin cal add data : ", res);

														} , 
														error: function(e){
															alert("admin cal add data.do 요청실패 : ", e);
														}
													});
												}
											} ,
									        error: function(e) {
									            alert('admin calList 요청 실패');
									        }
									    });*/
		
			
			
	</script>

</body>
</html>