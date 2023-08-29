package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MemberDAO;
import com.smhrd.entity.Member;

public class JoinCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String mb_id = request.getParameter("join_id");
		String mb_pw = request.getParameter("join_pw");
		String mb_phone = request.getParameter("join_phone");
		String mb_nick = request.getParameter("join_nick");

		// id ~ tel까지 Member로 묶기
		Member member = new Member(mb_id, mb_pw, mb_phone, mb_nick);

		// 2. 기능 실행
		// 입력받은 정보를 DB-MEMBER 테이블에 저장 >> DAO
		// DAO의 기능을 실행
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(member);

		// 3. View 선택
		// 만약 회원가입이 성공했다면, main.jsp로, 실패했다면 join.jsp에 남기로
		if (cnt > 0) {
			// 이미 이동하는 Controller가 있는 jsp의 경우 해당 Controller로 이동
			System.out.println("성공~");
			response.sendRedirect("goLogin.do");
		} else {
			System.out.println("실패");
		}

		// response.sendRedirect(url);
		// servlet(C) --> jsp(V) : forward
		// servlet(C) --> servlet(C) : redirect

		return null;
	}

}
