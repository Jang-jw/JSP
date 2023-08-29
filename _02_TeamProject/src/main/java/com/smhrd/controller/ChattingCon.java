package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.dao.ChatDAO;
import com.smhrd.entity.Chat;
import com.smhrd.entity.Member;

public class ChattingCon implements Controller {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 채팅 기록 보여주기
		System.out.println("방 아이디 요청 들어옴");
		
//		HttpSession session = request.getSession();
//		Member user = (Member)session.getAttribute("user");
		
		request.setCharacterEncoding("UTF-8");
		
		
		response.setCharacterEncoding("UTF-8");
		
		
		PrintWriter out = response.getWriter();
		
		
		ChatDAO dao = new ChatDAO();
		List<Chat> chatRec =  dao.chatRec();
		
		System.out.println(chatRec);
		
		Gson gson = new Gson();
		String json = gson.toJson(chatRec);
		
		System.out.println("json : " + json);
		
		// 응답되는 데이터
		out.print(json);
		
		return null;
	}

}
