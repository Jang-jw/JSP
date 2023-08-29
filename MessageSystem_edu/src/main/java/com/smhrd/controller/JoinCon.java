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
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		Member member = new Member(email, pw, tel, address);

		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(member);

		String url = "redirect:/goMain.do";
		if (cnt > 0) {
			System.out.println("회원가입 성공!");
			url = "join_success";
		}else {
			System.out.println("회원가입 실패 ㅠ");
		}

		return url;
	}

}
