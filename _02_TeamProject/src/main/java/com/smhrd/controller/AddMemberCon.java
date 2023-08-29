package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.dao.ChatRoomDAO;
import com.smhrd.entity.ChatRoom;
import com.smhrd.entity.Member;

public class AddMemberCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 초대링크 입력하면 본인 채팅방 리스트에 방 추가하고 
		// 방으로 입장하는 기능
		
		HttpSession session = request.getSession();
		Member user = (Member)session.getAttribute("user");
		
		String mb_id = user.getMb_id();
		
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String room_id = request.getParameter("roomCode"); // 채팅방 링크
		String room_title = request.getParameter("roomName"); // 채팅방 이름
		
		System.out.println("방아이디: "+room_id);
		
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.setRoom_title(room_title);
		chatRoom.setRoom_id(room_id);
		chatRoom.setMb_id(mb_id);
		
		try {
			if(room_id != null && room_title != null) {
				ChatRoomDAO dao = new ChatRoomDAO();
				int result = dao.addMember(chatRoom);
				
				Gson gson = new Gson();
				String json = gson.toJson(result);
				
				System.out.println("json : " + json);
				
				// 응답되는 데이터
				out.print(json);
				
				System.out.println(result + "행 삽입성공");
				
			}else {
				System.out.println("행 삽입 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
