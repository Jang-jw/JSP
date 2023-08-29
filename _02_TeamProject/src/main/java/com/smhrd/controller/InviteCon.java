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

public class InviteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 채팅방 아이디 전달
		HttpSession session = request.getSession();
		Member user = (Member)session.getAttribute("user");
		
		request.setCharacterEncoding("UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		ChatRoomDAO dao = new ChatRoomDAO();
		
		List<ChatRoom> roomInfo = dao.roomInfo(user);
		
		Gson gson = new Gson();
		String json = gson.toJson(roomInfo);
		
		System.out.println("json : " + json);
		
		// 응답되는 데이터
		out.print(json);
		
		return null;
	}

}
