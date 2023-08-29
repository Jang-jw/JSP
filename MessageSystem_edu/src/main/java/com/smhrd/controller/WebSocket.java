package com.smhrd.controller;

import java.io.IOException;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat") // url 끝이 chat 으로 끝나는 요청을 받겠다. 
public class WebSocket {

	// 1. 웹소켓에 사용자가 연결 되었을 때 무슨일이 일어날지 
	@OnOpen
	public void onOpen(Session session) { // 접속한 사용자 정보를 매개변수로 받음 
		System.out.println("환영합니다~~");
		
		// 특정한 사용자에게 메세지 보내기 
		try {
			session.getBasicRemote().sendText("반갑습니다~");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 2. 웹소켓으로 메세지가 도착했을 때 
	// OnMessage
	@OnMessage
	public void onmessage(String message) {
		// 자동으로 메개변수에 사용자들이 보낸 메세지가 담김 
		System.out.println(message);
	}
	
	// 3. 웹소켓과 연결이 끊어졌을 때 
	
	// 4. 에러가 발생했을 때 
}
