<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.other{
		color : blue;
	}
	
	.me{
		color : green;	
	}


</style>
</head>
<body>

	<h1>채팅방</h1>
	<input type="text" id="user"> <br>
	<input type="text" id="chat"> <button>보내기</button> <br>

	<div id="chatDiv">
	
	
	
	
	</div>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		
		// 0. 비동기 통신 방식으로 DB에 저장된 내용 가져오기
		
		// 1. WebSocket 객체 생성
		const websocket = new WebSocket("ws://localhost:8082/Chat2/chat/${param.sess}"); // socket url
		
		// 2.1. 연결이 완료 되었을 떄, 무슨일을??
		websocket.onopen = function(message){ // message --> 주고 받는 데이터가 들어있는 객체
			console.log("연결 성공");
		}
		
		// 2.2. 연결 끊겼을 때
		websocket.onclose = function(message){
			console.log('연결 끊김')
		}
		
		// 2.3. 메세지를 받았을 때
		websocket.onmessage = function(message){
			console.log(message.data)
			
			chatJson = JSON.parse(message.data); // JSON 문자열 --> javascript object
			// { 'id' : 'asdf', 'msg' : '123'}
			// 채팅이 가시화
			let c = `
				<p class="other">	
					\${chatJson.id} : \${chatJson.msg}
				</p>
			`;
			
			$('#chatDiv').append(c);
		}
		
		$('button').click(function(){
			
			// 사용자의 이름과, 채팅 등 여러 정보를 한번에??
			msg = {
					'id' : $('#user').val(),
					'msg' : $('#chat').val()
			}
			
			let c = `
				<p class="me">	
					\${msg.id} : \${msg.msg}
				</p>
			`;
			
			$('#chatDiv').append(c);			
			
			websocket.send( JSON.stringify(msg) )						
		});
		
	})
		
	
	
	
	</script>
	
</body>
</html>