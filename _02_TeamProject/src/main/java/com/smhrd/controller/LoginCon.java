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
		request.setCharacterEncoding("UTF-8");

		String mb_id = request.getParameter("login_id");
		String mb_pw = request.getParameter("login_pw");

		Member member = new Member();
		member.setMb_id(mb_id);
		member.setMb_pw(mb_pw);

		// 3. 기능 실행
		// id와 pw가 일치하는지 MEMBER 테이블을 조회하는 기능

		MemberDAO dao = new MemberDAO();
		Member result = dao.login(member);
		HttpSession session = request.getSession();

		if (result != null) {
			System.out.println("로그인 성공");

			// 사용자의 정보를 유지할 수 있게끔 저장 >> session에 정보저장

			session.setAttribute("user", result);
			response.sendRedirect("goMain2.do");

		} else {
			System.out.println("로그인 실패");
			response.sendRedirect("goLogin.do");
		}
		return null;
	}

}
