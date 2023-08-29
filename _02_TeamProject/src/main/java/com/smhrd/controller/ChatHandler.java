package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.smhrd.dao.ChatDAO;
import com.smhrd.entity.Chat;
import com.smhrd.entity.ChatRoom;

@ServerEndpoint("/{chatRoom}")
public class ChatHandler {
	
	// 접속된 클라이언트 WebSocket session 관련 리스트 / 채팅방이 하나인 경우
		// list 만큼은 사라지면 안된다 -> static
//		private static List<Session> sessionList = new ArrayList<>();
		
		// 채팅방이 여러개인 경우
		private static HashMap<String, List<Session>> users = new HashMap<String, List<Session>>();
		
		// WebSocket으로 브라우저가 접속하면 요청되는 함수
		// 연결 되면 뭐할지
		@OnOpen
		public void handleOpen(Session session, @PathParam("chatRoom") String chatRoom) {// 사용자 정보 들어있는 session
			// 매개변수에 String 변수를 추가 + @PathParam 어노테이션으로 지정 --> Path Variable을 받아올 수 있다.
			
			//System.out.println("채팅방 아이디: " + chatRoom);
			System.out.println("사용자 접속");
			
			List<Session> list = users.get(chatRoom);// HashMap 형태로 사용자 목록을 저장하고, 꺼내기
			
			if(list != null) {// 만약 누군가가 이미 채팅방에 연결이 된경우
				users.get(chatRoom).add(session); // 새로운 사용자들 추가
			}else { // 처음으로 채팅방에 연결한 경우
				users.put(chatRoom, new ArrayList<Session>()); // 새로운 List 생성
				users.get(chatRoom).add(session);
			}
		}

		// WebSocket으로 메시지가 오면 요청되는 함수
		@OnMessage
		public void handleMessage(String message, Session session, @PathParam("chatRoom") String chatRoom) {
			
			System.out.println(chatRoom + ":" + message);
			
			// 메세지 내역을 DB에 저장
			// JSON -> java object
			Gson gson = new Gson();
			Chat chat = gson.fromJson(message, Chat.class);
			chat.setRoom_id(chatRoom);
			
			
			// DB에 저장 하는 로직...
			ChatDAO dao = new ChatDAO();
			int cnt = dao.chatting(chat);
			System.out.println(cnt+"행 삽입 성공"); 
			
			List<Session> list = users.get(chatRoom);
			
			// 같은 채팅방 사람들 모두에게 메세지 전달
			for(Session ses : list) {
				if(!session.equals(ses)) {
					try {
						ses.getBasicRemote().sendText(message);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}

		// WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
		// 사용자 연결 종료
		@OnClose
		public void handleClose(Session session, @PathParam("chatRoom") String chatRoom) {
			
			int idx = 0;
			for(Session ses : users.get(chatRoom)) { // 접속 해제한 사용자와 session만 검색
				if(ses.equals(session)) {
					break;
				}
				idx++;
			}
			users.get(chatRoom).remove(idx); // 해당 사용자의 세션 삭제
		}

		// WebSocket과 브라우저 간에 통신 에러가 발생하면 요청되는 함수.
		@OnError
		public void handleError(Throwable t) {
			// 콘솔에 에러를 표시한다.
			t.printStackTrace();
		}
}
