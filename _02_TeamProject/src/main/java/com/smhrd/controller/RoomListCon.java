package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.dao.ChatRoomDAO;
import com.smhrd.entity.ChatRoom;
import com.smhrd.entity.Member;

public class RoomListCon implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 채팅방리스트 보여주기 기능
		System.out.println("방 리스트 출력 요청들어옴");
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member user = (Member)session.getAttribute("user");
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		ChatRoomDAO dao = new ChatRoomDAO();
		
		List<ChatRoom> roomList = dao.roomList(user);
//		System.out.println(roomList);
		
//		request.setAttribute("roomList", roomList);
		
		
		// list 데이터의 형태를 JSON으로 변환!(Gson활용)
		Gson gson = new Gson();
		String json = gson.toJson(roomList);
				
		System.out.println("json : " + json);
				
		// 응답되는 데이터
		out.print(json);
		
		return null;
	}

}