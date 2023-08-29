<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.entity.Chat"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.entity.ChatRoom"%>
<%@page import="com.smhrd.entity.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dream Planner</title>
<link rel="stylesheet" href="assets/css/chat.css" type="text/css" />
<style>
aside {
	background-color: #3f4756;
	display: inline-block;
	font-size: 15px;
	vertical-align: top;
}
#asideHead, #cha_list{
	color: white;
	font-weight: bold;
}
.uid:hover{
	color: black;
}
#invitel{
	bottom: 100%;
	line-height: 100%;
	color: white;
}
#listfoot {
	height: 120px;
	overflow-y: scroll;
}
#chodaeTitle{
	font-size: 15px;
	font-weight: bold;
	line-height: 100%;
	text-decoration: underline;
}
.rN, .rC{
	
}
#ch {
	position: fixed;
	right: 10px;
	bottom: 0px;
	width: 80px;
	height: 80px;
}
#overlay {
	display: none;
}
input#invite {/*초대코드 버튼*/
	white-space: pre-line;
    position: absolute;
    bottom: 6%;
    width: 25%;
    right: 5%;
    height: 40px;
}
input#roomJoin {/*방참가 버튼*/
	white-space: pre-line;
	position: absolute;
	bottom: 6%;
	width: 25%;
	right: 37.5%;
	height: 40px;
}
input#roomCre {/*방생성버튼*/
	white-space: pre-line;
    position: absolute;
    bottom: 6%;
    width: 25%;
    right: 70%;
    height: 40px;
}
.footBtn{/*처음 버튼 3개*/
    background-color:#ffb400;
    color: #fff;
    border:none; 
    border-radius:10px; 
    min-height:30px; 
    min-width: 60px;
}
.footBtn:hover{
	background-color:#fff9e9;
	transition: 0.4s;
	color: black;
}
input[type=text]{
	font-size: 15px;
	border: 0;
  	border-radius: 15px;
  	outline: none;
  	padding-left: 10px;
  	background-color: rgb(233, 233, 233);
  	line-height: 100%;
}
#roomCrel{/*방생성 폼*/
	padding-top: 10px;
	padding-left: 10px;
	padding-bottom: 15px;
	line-height: 2em;
	color: white;
}
#roomJoinl{ /*방참가 폼*/
	padding-top: 27px;
	padding-left: 10px;
	padding-bottom: 15px;
	line-height: 2em;
	color: white;
}
#addRoomBtn{ /*방생성하기 버튼*/
	background-color:#a3acbd;
    color: #fff;
    border:none; 
    border-radius:10px; 
    min-height:20px; 
    min-width: 50px;
}
#addRoomBtn:hover{
	background-color: white;
	transition: 0.4s;
	color: black;
}
#joinRoom{ /*참가하기버튼*/
	background-color:#a3acbd;
    color: #fff;
    border:none; 
    border-radius:10px; 
    min-height:20px; 
    min-width: 50px;
}
#joinRoom:hover{
	background-color: white;
	transition: 0.4s;
	color: black;
}
#send{ /*보내기버튼*/
	background-color: white;
    color: #fff;
    border:1px; 
    border-radius:10px; 
    min-height:30px; 
    min-width: 85px;
}
#send:hover{
	background-color: #ffb400;
	transition: 0.2s;
	color: black;
}
</style>
</head>



<body>
	<%
	// 사용자 세션
	String id = "";
	String nick_name = "";
	Member user = (Member) session.getAttribute("user");
	String email = (String) session.getAttribute("email");
	String nickname = (String) session.getAttribute("nickname");

	if (user != null) {
		id = user.getMb_id();
		nick_name = user.getMb_nick();
		System.out.println(id);
	} else if (email != null) {
		id = email.split("@")[0];
		nick_name = nickname;
	} ;

	// 개설일자 포맷팅
	Date today = new Date();
	SimpleDateFormat fDay = new SimpleDateFormat("yyyy년 MM월 dd일");
	String sfDay = fDay.format(today);
	System.out.println(sfDay);

	// 채팅방별 랜덤 코드작성
	int leftLimit = 48; // numeral '0'
	int rightLimit = 122; // letter 'z'
	int targetStringLength = 10;
	Random random = new Random();
	String generatedString = random.ints(leftLimit, rightLimit + 1)
			.filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97)).limit(targetStringLength)
			.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();
	System.out.println(generatedString);
	%>
	<div id="overlay">
		<aside>

			<header id="asideHead">
				<h2>채팅방 리스트</h2>
				<input type="button" id="lclos">
			</header>
			<ul id="cha_list">

			</ul>

			<%--하단부 버튼 --%>
			<div>
				<input type="button" id="listback" value="뒤로">
				<div id="listfoot">
					<input type="button" id="invite" class="footBtn" value="초대코드">
					<input type="button" id="roomJoin" class="footBtn" value="방 참가">
					<input type="button" id="roomCre" class="footBtn" value="방 생성">
					
					<div id="invitel">
					
					</div>
					<%--방생성 --%>
					<div id="roomCrel">
						방 제목 : <input name="title" type="text"><br> 방 아이디 : <input
							name="roomId" type="text" value="<%=generatedString%>" readonly><br>
						개설자 : <input name="maker" type="text" value="<%=id%>" readonly><br>
						개설일자 : <input name="createDate" type="text" value="<%=sfDay%>"
							readonly><br>
						<button id="addRoomBtn">방 생성하기</button>
					</div>
	
					<div id="invitel">
						<!-- 여기 부분 수정함 -->
						<h4 id="chodaeTitle" style="position: fixed;">초대 코드</h4>
					</div>
	
					<div id="roomJoinl">
						<form action="addMember.do" method="post">
							<div>
								방 이름 입력 : <input name="roomName" type="text"><br>
							</div>
							<div>
								방 코드 입력 : <input name="roomCode" type="text"><br>
							</div>
							<input id="joinRoom" type="button" value="참가하기">
						</form>
					</div>
				</div>
			</div>
		</aside>
		<main>
			<header>
				<input type="button" id="back"> <input type="button"
					id="cclos">
				<div>
					<h2 id="rName"></h2>
				</div>

			</header>

			<%--채팅 내역 --%>
			<ul id="chat">
			</ul>

			<%--메시지 쓰기, 보내기 --%>
			<footer>
				<textarea id="content" placeholder="Type your message"></textarea>
				<div>
					<input id="send" class="f_btn_r" type="button" value="보내기"> 

				</div>
			</footer>
		</main>
	</div>

	<%-- 맨처음 시작 아이콘 --%>
	<img id="ch" src="assets/img/chat-1873536_1280-removebg-preview.png" alt="">

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript">	
	
    $(document).ready(function() {
    	
    	
    	// websocket 객체 생성(자동으로 접속 시작 - onopen 함수 호출)
    	const websocket = new WebSocket("ws://localhost:8082/DP/");//${param.sess} // socket url
    	
    	// websocket 서버와 접속이 되면 호출되는 함수
    	websocket.onopen = function(message) {
    		// 콘솔 텍스트에 메시지를 출력
    		console.log("연결성공");
    	};

    	// websocket 서버와 접속이 끊기면 호출되는 함수
    	websocket.onclose = function(message) {
    		console.log("연결 끊김");
    	};

    	// websocket 서버와 통신 중 에러가 발생하면 요청되는 함수
    	websocket.onerror = function(message) {
    		console.log("error");
    	};

    	// websocket 서버로부터 메시지가 오면 호출되는 함수(메세지를 받았을 때)
    	websocket.onmessage = function(message) {
    		console.log(message.data);
    		
    		chatJson = JSON.parse(message.data); // JSON 문자열 --> javascript object
    		
    		// 채팅 가시화
    		let html = `
    			<li class="you" >
    				<div>
    					\${chatJson.chatter}
					</div>
    				<div class="message">
    					\${chatJson.chat}
    				</div>
    				<div>
    					\${chatJson.created_at}
    				</div>
    			</li>
    		`;
    		$("#chat").append(html);
    	};
    	
    	const ex = "//00-01-01~23-12-31:오늘할일";
        const previewText = document.createElement("div");
        previewText.id = "preview-text";
        previewText.style.border = "1px solid black";
        previewText.style.padding = "5px";
        previewText.style.border= "0px";
        previewText.style.top = "-26px";
        previewText.style.position = "absolute";
        previewText.style.fontStyle = "italic";
        previewText.style.color = "red";
        const taskInput = document.getElementById("content");

        $('#content').on('input', function() { 
            let inputValue = $('#content').val();
            if (inputValue.startsWith("//")) {
            	console.log("점검");
            	
                previewText.textContent = ex;
                taskInput.before(previewText);
                previewText.style.display="block";
            } else {
                previewText.remove();
            }
        });
    	
    // 메시지 보내기 함수
	    function sendMessage(){
	    	let today = new Date();

	    	messageJs = {
	    		'chatter' : '<%=nick_name%>',
	    		'chat': $("#content").val(),
	    		'chat_file' : '',
	    		'created_at': today.toLocaleDateString() + ' ' + today.toLocaleTimeString(),
	    		'mb_id' : '<%=id%>'
	    	}
	    	
	    	html = `
	    		<li class="me">
	    			<div>
						\${messageJs.chatter}
					</div>
	               <div class="message">
	                  \${messageJs.chat}
	               </div>
	               <div>
	    				\${messageJs.created_at}
	    			</div>
	            </li>
	            `;

	    	$("#chat").append(html);
	    	websocket.send(JSON.stringify(messageJs));
	    	
	    	chatElement.scrollTop = chatElement.scrollHeight;
	    	// 송신 메시지를 작성한 텍스트 박스를 초기화한다
	    	$("#content").val('');
	
	    	// 사용자가 누군지 확인
	    	console.log('<%=nick_name%>');
	    	
    }
	    // 버튼 누르기
	      $('#send').click(function () {
	    	  console.log("왜지?")
	          let inputValue = $('#content').val();
	          let shop = inputValue.split("//");
	          console.log(shop)
	          if (shop.length !== 2) {
	                 console.log("// 오류");
	             } else {
	                 let sh = shop[0].trim();
	                 let part = shop[1].trim();

	                 let parts = part.split(":");
	                 if (parts.length !== 2) {
	                     console.log(": 미입력");
	                 } else {
	                     let dateRange = parts[0].trim();
	                     let content = parts[1].trim();

	                     let dateRangeParts = dateRange.split("~");
	                     let start = dateRangeParts[0].trim();
	                     let end = dateRangeParts[1].trim();

	                     if (start.length !== 8 || end.length !== 8) {
	                         console.log("날짜 형식 오류");
	                     } else {
	                         let stt = "20" + start;
	                         let edd = "20" + end;
	                         let title = content;
	                         
	                        $.ajax({
	                        type: 'post',
	                        url: "calAddData.do",
	                        data: { 
	                            title: title,
	                            start: stt,
	                            end: edd, 
	                            mb_id: '<%=id%>', 
	                            color: '#000000', 
	                            content: null
	                        },
	                        success: function (response) {
	                            console.log('전송 성공:', response);
	                            alert("일정 추가 완료!");
	                        },
	                        error: function (error) {
	                            console.error('전송 실패:', error);
	                        }
	                    });
	                        			console.log("여기인가?");

	                        
	                         sendMessage();
	                         let existingPreviewText = document.querySelector("#preview-text");
	                if (existingPreviewText) {
	                    existingPreviewText.remove();
	                }
	                     }
	                 }
	             }
	          chatElement.scrollTop = chatElement.scrollHeight;
	              sendMessage();
	            let existingPreviewText = document.querySelector("#preview-text");
	                if (existingPreviewText) {
	                    existingPreviewText.remove();
	                }
	        });
	 

	    	
	      $('#content').keypress(function (e) {
	            if(e.keyCode === 13){
	                console.log("enter");
		          let inputValue = $('#content').val();
		          let shop = inputValue.split("//");
		          if (shop.length !== 2) {
		                 console.log("// 오류");
		             } else {
		                 let sh = shop[0].trim();
		                 let part = shop[1].trim();

		                 let parts = part.split(":");
		                 if (parts.length !== 2) {
		                     console.log(": 미입력");
		                 } else {
		                     let dateRange = parts[0].trim();
		                     let content = parts[1].trim();

		                     let dateRangeParts = dateRange.split("~");
		                     let start = dateRangeParts[0].trim();
		                     let end = dateRangeParts[1].trim();

		                     if (start.length !== 8 || end.length !== 8) {
		                         console.log("날짜 형식 오류");
		                     } else {
		                         let stt = "20" + start;
		                         let edd = "20" + end;
		                         let title = content;
		                         

		                         $.ajax({
		                        type: 'post',
		                        url: "calAddData.do",
		                        data: { 
		                            title: title,
		                            start: stt,
		                            end: edd, 
		                            mb_id: '<%=id%>',
		                            color: '#000000', 
		                            content: null
		                        },
		                        success: function (response) {
		                            console.log('전송 성공:', response);
		                            alert("일정 추가 완료!");
		                        },
		                        error: function (error) {
		                            console.error('전송 실패:', error);
		                        }
		                    });

		                            
		                         let existingPreviewText = document.querySelector("#preview-text");
		                if (existingPreviewText) {
		                    existingPreviewText.remove();
		                }
		                     }
		                 }
		             }
		              sendMessage();
		              e.preventDefault();
		       		
	                }

	                
		        });

    })
	
   

    // Disconnect 버튼을 누르면 호출되는 함수
    function disconnect() {
    	// websocket 접속해제
    	websocket.close();
    }
    
    ///////////////  css용    //////////////////////////
    let chchch = document.getElementById("ch"); // 이미지
   let overlay = document.getElementById("overlay"); // 전체틀
   let asideElement = document.querySelector('aside'); // 친구목록
   let mainElement = overlay.querySelector('main'); // 메인
   let chatElement = document.querySelector('#chat'); // 채팅창
   let footElement = overlay.querySelector('footer'); // 채팅입력창
   //let uidElement = document.querySelector('.uid'); // 테스트용 사용자
   let uidElement = document.querySelectorAll('.uid'); // 테스트용 사용자
   let addRoomBtn = document.getElementById('addRoomBtn'); //방생성하기 버튼
   let chodaeTitleElement = document.getElementById('chodaeTitle');
   
   //let uidElement = document.getElementByClassName('uid1'); // 테스트용 사용자
   let backElement = document.getElementById('back'); // 뒤로가기
   let lclosElement = document.getElementById('lclos'); // 친구목록창 닫기
   let cclosElement = document.getElementById('cclos'); // 채팅창 닫기
   let inviteElement = document.getElementById('invite'); // 초대코드 버튼
   let roomJoinElement = document.getElementById('roomJoin'); // 방 참여 버튼
   let roomCreElement = document.getElementById('roomCre'); // 방 생성 버튼
   let listbackElement = document.getElementById('listback'); // 목록 뒤로가기
   let roomCreLElement = document.getElementById('roomCrel'); // 방생성폼
   let roomJoinLElement = document.getElementById('roomJoinl'); // 방참여폼
   let inviteLElement = document.getElementById('invitel'); // 초대링크폼
   let asideHeadElement = document.getElementById('asideHead'); // 사이드 헤드
   let chaListElement = document.getElementById('cha_list'); // 친구목록
   let listfootElement = document.getElementById('listfoot'); // 친구목록
    
   ////////////////////////////////////////////////////////////////////////
     // 이미지 클릭할 경우
   	  let roomList = [];
      chchch.addEventListener("click", function () {
    	  
    	  let resultHTML = '';
    	  console.log('이미지 클릭');
    	  
    	  $.ajax({
    		  url : 'roomList.do',
    		  type : 'post',
    		  dataType : 'json',
    		  success : function(res){
    			  
    			  console.log('이미지 클릭 성공')
    			  roomList = res;
    			  //console.log(roomList);
    			  //console.log(roomList[0]);
    			  $('#cha_list').html('');
    			  for(let i = 0; i < roomList.length; i++){
    				  //console.log(roomList[i].room_title);
    				  resultHTML += `
    				  <div class="uid" onclick="goChat()">
	    				  <li>
	    					  \${roomList[i].room_title}
	    				  </li>
    				  </div>
    				  `;
    			  };
    			  $('#cha_list').append(resultHTML);
    		  },
    		  error : function(e){
    			  console.log('이미지클릭 요청 실패')
    		  }
    	  });
    	  
         // 전체틀 보이게 하기
        $('#overlay').fadeTo(400, 1, function(){
         });
           overlay.style.display = 'block';
         
           chchch.style.display = 'none';
           listbackElement.style.display = "none";
           inviteLElement.style.display = "none";

           // 친구목록 사이즈 조절
           asideElement.style.width = '350px';
           asideElement.style.height = '800px';
           asideHeadElement.style.display = 'block';
           chaListElement.style.display = 'block';
           listfootElement.style.display = 'block';

           // 나머지 부분 사이즈 조절
          mainElement.style.width = '0px';
          mainElement.style.height = '0px';
          mainElement.style.display = 'none';
          footElement.style.display = 'block';
          chodaeTitleElement.style.display = 'none';
          roomCreLElement.style.display = 'none';
          roomJoinLElement.style.display = 'none';
          inviteElement.style.display = 'block';
          roomJoinElement.style.display = 'block';
          roomCreElement.style.display = 'block';
         
           
       })
   
   
   ////////////////////////////////////////////////////////////////////////
   // 방생성
   roomCreElement.addEventListener("click", function () {
	   console.log('방생성 클릭');
	   
	   
      // 전체틀 보이게 하기
        overlay.style.display = 'block';

      	inviteElement.style.display = 'none';
        roomJoinElement.style.display = 'none';
        roomCreElement.style.display = 'none';
        
        
        roomCreLElement.style.display = "block";
        roomJoinLElement.style.display = "none";
        inviteLElement.style.display = "none";
        
        roomCreLElement.style.bottom = "0%";
   
  		listbackElement.style.display = "block";
  		chodaeTitleElement.style.display = 'none';
   
    })
    
    
    ////////////////////////////////////////////////////////////////////////
    // 방생성하기 버튼 클릭
    var title = $('input[name=title]');
   	var roomId = $('input[name=roomId]');
   	var createDate = $('input[name=createDate]');
   	var maker = $('input[name=maker]');
   	
    addRoomBtn.addEventListener("click", function(){
    	
    	console.log("방생성하기 클릭");
    	
  		// 전체틀 보이게 하기
  	    overlay.style.display = 'block';
  	         
  	    chchch.style.display = 'none';
  	    listbackElement.style.display = "block";

  	    // 친구목록 사이즈 조절
  	    asideElement.style.width = '350px';
  	    asideElement.style.height = '800px';
  	    asideHeadElement.style.display = 'block';
  	    chaListElement.style.display = 'block';
  	    listfootElement.style.display = 'block';

  	    // 나머지 부분 사이즈 조절
  	    mainElement.style.width = '0px';
  	    mainElement.style.height = '0px';
  	    mainElement.style.display = 'none';
  	    footElement.style.display = 'none';
  	  chodaeTitleElement.style.display = 'none';
    	
    	$.ajax({
 		   url : 'addRoom.do',
 		   type : 'post',
 		   data : {
 			   title : title.val(),
 			   roomId : roomId.val(),
 			   createDate : createDate.val(),
 			   maker : maker.val()
 		   },
 		   success : function(res){
  			  console.log('방생성 성공');
  			  alert('방생성 완료!');
  			  //console.log(res);
  			  listUp();
  		  },
  		  error : function(e){
  			  console.log('방생성 실패');
  		  }
 	   });
    	
    	title.val('');
    	
    })
    
    
    
    ////////////////////////////////////////////////////////////////////////
    // 방참가
    roomJoinElement.addEventListener("click", function () {
      // 전체틀 보이게 하기
        overlay.style.display = 'block';

      inviteElement.style.display = 'none';
      roomJoinElement.style.display = 'none';
        roomCreElement.style.display = 'none';
        
        
        roomCreLElement.style.display = "none";
        roomJoinLElement.style.display = "block";
        inviteLElement.style.display = "none";
        
        roomJoinLElement.style.bottom = "0%";
           
           
       listbackElement.style.display = "block";
       chodaeTitleElement.style.display = 'none';


    })
    
    // 참가하기 버튼
    var roomName = $('input[name=roomName]');
    var roomCode = $('input[name=roomCode]');
    joinRoom.addEventListener("click", function(){
    	
    	console.log('참가하기 버튼 클릭');
    	
    	// 전체틀 보이게 하기
  	    overlay.style.display = 'block';
  	         
  	    chchch.style.display = 'none';
  	    listbackElement.style.display = "block";

  	    // 친구목록 사이즈 조절
  	    asideElement.style.width = '350px';
  	    asideElement.style.height = '800px';
  	    asideHeadElement.style.display = 'block';
  	    chaListElement.style.display = 'block';
  	    listfootElement.style.display = 'block';

  	    // 나머지 부분 사이즈 조절
  	    mainElement.style.width = '0px';
  	    mainElement.style.height = '0px';
  	    mainElement.style.display = 'none';
  	    footElement.style.display = 'none';
  	  chodaeTitleElement.style.display = 'none';
  	    
  	    $.ajax({
  	    	url : 'addMember.do',
  	    	type : 'post',
  	    	data : {
  	    		roomName : roomName.val(),
  	    		roomCode : roomCode.val(),
  	    	},
  	    	success : function(res){
  	    		console.log('방 참가 완료');
  	    		alert('방 참가가 완료 되었습니다.');
  	    		listUp();
  	    		
  	    	},
  	    	error : function(e){
  	    		console.log('방 참가 실패');
  	    	}
  	    });
  	    roomName.val('');
  	    roomCode.val('');
    })
    
    let roomListUp = [];
    const listUp = function(){
	  
	  $('#cha_list').empty();
	  let resultHTML = '';
	  $.ajax({
		  url : 'roomList.do',
		  type : 'post',
		  dataType : 'json',
		  success : function(res){
			  console.log('참가하기 성공')
			  roomListUp = res;
			  //console.log(roomList);
			  //console.log(roomList[0]);
			  for(let i = 0; i < roomListUp.length; i++){
				  //console.log(roomList[i].room_title);
				  resultHTML += `
				  <li class="uid">
					  <div>\${roomListUp[i].room_title}</div>
				  </li>
				  `;
			  };
			  $('#cha_list').append(resultHTML);
		  },
		  error : function(e){
			  console.log('리스트업 요청 실패')
		  }
    	});
    }
    
    
    ////////////////////////////////////////////////////////////////////////
    // 초대 코드 생성
    let codeList = [];
    inviteElement.addEventListener("click", function () {
    	
    	let resultHTML = '';
    	console.log('초대코드 버튼 클릭');
      // 전체틀 보이게 하기
        overlay.style.display = 'block';
        
      inviteElement.style.display = 'none';
      roomJoinElement.style.display = 'none';
        roomCreElement.style.display = 'none';
   
        roomCreLElement.style.display = "none";
        roomJoinLElement.style.display = "none";
        inviteLElement.style.display = "block";
        chodaeTitleElement.style.display = 'block';
        
        inviteLElement.style.bottom = "0%";
           
        listbackElement.style.display = "block";
        
        $.ajax({
        	url : 'invite.do',
        	type : 'post',
        	dataType : 'json',
        	success : function(res){
        		$('#invitel').html('');
        		console.log('방 코드 출력 성공');
        		codeList = res;
        		console.log(codeList);
        		resultHTML += `<div id="chodaeTitle">초대 코드</div><hr>`;
        		for(let i = 0; i < codeList.length; i++){
        			resultHTML += `
        			<div class="rN">
        				방 이름 : \${codeList[i].room_title}
        			</div>
        			<div class="rC">
        				방 코드 : \${codeList[i].room_id}
        			</div>
        			<hr>
        			`;
        		};
        		// 여기 부분 수정함
        		$('#invitel').append(resultHTML);
        	},
        	error : function(e){
        		console.log('초대코드 요청 실패');
        	}
        	
        })
    })
    
    
    
    ////////////////////////////////////////////////////////////////////////
    // 방생성, 방참가, 초대링 뒤로가기
    listbackElement.addEventListener("click", function () {
           overlay.style.display = 'block';
           
           
           inviteElement.style.display = 'block';
           roomJoinElement.style.display = 'block';
           roomCreElement.style.display = 'block';
           
           roomCreLElement.style.display = "none";
           roomJoinLElement.style.display = "none";
           inviteLElement.style.display = "none";
           
           listbackElement.style.display = 'none';
           chodaeTitleElement.style.display = 'none';
       })
    
  
    
       
    ////////////////////////////////////////////////////////////////////////
    // 채팅창 뒤로가기 버튼
     backElement.addEventListener("click", function () {
      // 전체틀 유지
        overlay.style.display = 'block';

      // 친구목록창 조절
        asideElement.style.width = '350px';
        asideElement.style.height = '800px';
        asideElement.style.display = 'block';

      // 나머지 부분 조절
        mainElement.style.width = '0px';
        mainElement.style.height = '0px';
        mainElement.style.display = 'none';
        footElement.style.display = 'block';
        chchch.style.display = 'none';
        chodaeTitleElement.style.display = 'none';

    })
    
    
    ////////////////////////////////////////////////////////////////////////
    // 채팅창들어가는 함수
    let chatList = [];
    const goChat = function(){
    	
    	let resultHTML = '';
    	//console.log("채팅창 눌림");
    	
       	// 목록창 크기를 0으로해서 안보이게함
        asideElement.style.width = '0px';
        asideElement.style.height = '0px';
        asideElement.style.display = 'none';
      	// 채팅창 전체틀 열기
        mainElement.style.width = '350px';
        mainElement.style.height = '800px';
        mainElement.style.display = 'block';
      	// 채팅창 열기
        chatElement.style.width = '350px'; 
        chatElement.style.height = '400px'; 
        chatElement.style.display = 'block';

        // 이미지 숨기기
        chchch.style.display = 'none';
        
        console.log(roomId);
        
        		$.ajax({
                	url : 'chatting.do',
                	type : 'post',
                	dataType : 'json',
                	success : function(res1){
                		$('#chat').html('');
                		console.log('채팅 내용 불러오기 성공');
                		chatList = res1;
                		console.log(chatList);
                		for(let i= 0; i < chatList.length; i++){
                			if(chatList[i].chatter == '<%=nick_name%>'){
	                			resultHTML += `
	                				<li class="me">
		                				<div>
		                					\${chatList[i].chatter}
		                				</div>
										<div class="message">
											\${chatList[i].chat}
										</div>
										<div>
											\${chatList[i].created_at}
										</div>
	                				</li>
	                			`;
                			}else{
	                			resultHTML += `
	                				<li class="you">
										<div>
											\${chatList[i].chatter}
										</div>
										<div class="message">
											\${chatList[i].chat}
										</div>
										<div>
											\${chatList[i].created_at}
										</div>
									</li>
								`;
                			}
                		};
                			$('#chat').append(resultHTML);
                			<%--$('#rName').innerHTML += chatList[0].;--%>
                		
                		
                	},
                	error : function(e){
                		console.log('채팅 내용 불러오기 실패...');
                	}
                })
                
    }
    
    // 메시지 보내기 버튼 눌렀을때
    
    ////////////////////////////////////////////////////////////////////////
    // 친구목록창 닫기버튼
    lclosElement.addEventListener("click", function () {
    	$('#overlay').fadeOut(400, function(){
        });
       	overlay.style.display = 'none';
		//console.log("시발");

        chchch.style.display = 'block';

    })
    
    
    ////////////////////////////////////////////////////////////////////////
    /* 채팅창 닫기버튼 
    따로 만든 이유 : 위치가 달라서 따로 만듬 */
       cclosElement.addEventListener("click", function () {
    	   $('#overlay').fadeOut(400, function(){
           });
	       overlay.style.display = 'none';
	       asideElement.style.display = 'block';
	       console.log("닫기 화긴");
	       
			chchch.style.display = 'block';

    })
    

    </script>

</body>

</html>