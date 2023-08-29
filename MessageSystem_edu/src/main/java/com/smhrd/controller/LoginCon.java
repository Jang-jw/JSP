package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.MemberDAO;
import com.smhrd.entity.Member;

public class LoginCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		Member member = new Member();
		member.setEmail(email);
		member.setPw(pw);
		
		MemberDAO dao = new MemberDAO();
		Member result = dao.login(member);
		
		if(result != null) {
			System.out.println("로그인 성공!");
			
			// 로그인 성공 => 회원의 정보 유지! => scope
			// session 활용! 
			HttpSession session = request.getSession();
			session.setAttribute("user", result);
		}else {
			System.out.println("로그인 실패 ㅠ");
		}
		
		// Controller 에서 Controller 로 이동시 redirect 사용
		return "redirect:/goMain.do";
	}

}
