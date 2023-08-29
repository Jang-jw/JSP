package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.dao.ChatRoomDAO;
import com.smhrd.entity.ChatRoom;

public class AddRoomCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 수집
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String maker = request.getParameter("maker");
		String createDate = request.getParameter("createDate");
		String roomId = request.getParameter("roomId");
		
		// 나중에 멤버테이블에서 아이디도 연결해야함
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.setRoom_id(roomId);
		chatRoom.setRoom_title(title);
		chatRoom.setCreated_at(createDate);
		chatRoom.setMb_id(maker);
		
		PrintWriter out = response.getWriter();
		
		try {
			// 테이블에 추가
			ChatRoomDAO dao = new ChatRoomDAO();
			int result = dao.addRoom(chatRoom);
			
			System.out.println(result + "행 삽입성공");
			
			Gson gson = new Gson();
			String json = gson.toJson(result);
			
			System.out.println("json : " + json);
			
			// 응답되는 데이터
			out.print(json);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("방 생성 실패");
		}
		
		return null;
		
	}

}
