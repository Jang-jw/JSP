package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/storeUserData.do")
public class StoreUserDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글 인코딩 설정
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");

		HttpSession session = request.getSession();
		session.setAttribute("email", email);
		session.setAttribute("nickname", nickname);


		System.out.println("Email in session: " + email);
		System.out.println("Nickname in session: " + nickname);

		response.sendRedirect("goMain2.do");
		
	}
}