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

		// 2. 데이터 수집
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		Member member = new Member();
		member.setId(id);
		member.setPw(pw);

		// 3. 기능 실행
		// id 와 pw 가 일치하는지 MEMBER 테이블을 조회하는 기능
		MemberDAO dao = new MemberDAO();
		Member result = dao.login(member);

		if (result != null) {
			System.out.println("로그인 성공!");

			// 사용자의 정보를 유지할 수 있게끔 저장 >> session 에 정보저장
			HttpSession session = request.getSession();
			session.setAttribute("user", result);

		} else {
			System.out.println("로그인 실패 ㅠ");
		}

		// 4. View 선택
		// redirect 를 하는 경우 url 앞에 접두사를 붙이기로 약속
		// "redirect:/"
		return "redirect:/goMain.do";
	}

}
