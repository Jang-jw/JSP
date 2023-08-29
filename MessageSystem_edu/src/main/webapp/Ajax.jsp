<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax</title>
</head>
<body>

	<!-- 
		form => 페이지 이동도 같이 요청!
			- button 을 사용하여 페이지 이동 없이 데이터만 전달!
	 -->
	<input type="text" name="data">
	<button id="btn" type="button">전송</button>

	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript">
		// Ajax 기술 활용! => Jquery 라이브러리도 필요하다!
		
		// Jquery 방식으로 사용하고자 하는 버튼 선택! 
		var btn = $("#btn");
		var input = $("input[name=data]"); // [] => 태그의 속성을 찾기위한 기능 
		
		// button 이벤트 연결하기 
		btn.on("click", request);
		
		// 연결될 function 생성 
		function request(){
			console.log("클릭!");
			
			$.ajax({
				url : "ajax.do", // 어디로 요청을 보낼건지
				type : "post", // get, post ? 
				data : {
					// {"key" : value}
					// "data" : "채수민"
					"data" : input.val()
					
				},
				dataType : "json",
				success : function(res){ // res => renponse 
					// 요청이 성공적이라면 실행할 내용 
					console.log(res[0].idx);
					console.log(res[0].title);
				},
				error : function(e){
					// 요청이 실패라면 실행할 내용 
					alert("요청 실패");
				}
			});
		}
	</script>
</body>
</html>