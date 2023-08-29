package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.entity.Member;

public class LogoutCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member user = (Member) session.getAttribute("user");
		
		String nickname = (String) session.getAttribute("nickname");
		String email = (String) session.getAttribute("email");
		
		if(user!=null) {
			session.removeAttribute("user");
		}
		
		if(nickname!=null) {
			session.removeAttribute("email");
			session.removeAttribute("nickname");
		}
		
		
		// 4. 뷰 선택
		response.sendRedirect("goLogin.do");
		
		return null;
	}

}
