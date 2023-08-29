package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import entity.Chat;

@ServerEndpoint("/chat/{chatId}") // path variable : url 자체에 데이터를 포함시키는 방법
public class ChatHandler {
	
	// list만큼은 사라지면 안된다 --> static
	// private static List<Session> list = new ArrayList<Session>();
	
	// 채팅방이 여러개인 경우
	private static HashMap<String, List<Session>> users = new HashMap<String, List<Session>>();
	
	// 1. 연결 되면 뭐할지
	@OnOpen
	public void isOpen(Session session, @PathParam("chatId") String chatId) { // 사용자 정보 들어있는 session
		// 매개변수에 String 변수를 추가 + @PathParam 어노테이션으로 지정 --> Path Variable을 받아올 수 있다.
		
		System.out.println(chatId);
		
		System.out.println("사용자 접속함");
		
		List<Session> list = users.get(chatId); // HashMap 형태로 사용자 목록을 저장하고, 꺼내기
		
		if(list != null) { // 만약 누군가가 이미 채팅방에 연결이 된경우
			users.get(chatId).add(session); // 새로운 사용자들을 추가
			
			
			
		}else { // 처음으로 채팅방에 연결한경우
			users.put(chatId, new ArrayList<Session>() ); // 새로운 List 생성
			users.get(chatId).add(session);
		}
		
	}
	
	// 2. 사용자 연결 종료
	@OnClose
	public void isClose(Session session, @PathParam("chatId") String chatId) {
		
		int idx = 0;
		for(Session s : users.get(chatId)) { // 접속 해제한 사용자의 session만 검색
			
			if(s.equals(session)) {
				break;
			}
			idx++;
			
		}
		
		users.get(chatId).remove(idx); // 해당 사용자의 세션 삭제
	}
	
	
	@OnMessage
	public void isMessage(String msg, Session session,  @PathParam("chatId") String chatId) {
		
		System.out.println(chatId + " : " + msg);
		
		// 메세지 내역을 DB에 저장
		// JSON -> java object
		Gson gson = new Gson();
		Chat chat = gson.fromJson(msg, Chat.class);
		// ....		
		
		List<Session> list = users.get(chatId);
		
		// 같은 채팅방 사람들 모두에게 메세지 전달
		for(Session s : list) {
			if(!session.equals(s)) {
				try {
				s.getBasicRemote().sendText(msg);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}

	
	}
	
	
	

}
