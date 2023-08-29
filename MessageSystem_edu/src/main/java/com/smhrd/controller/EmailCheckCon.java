package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MemberDAO;
import com.smhrd.entity.Member;

public class EmailCheckCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 데이터 수집 => 어떤 이메일을 입력했는지?
		String email = request.getParameter("email");
		
		// DB 연결 해당 내용이 사용가능한지?
		MemberDAO dao = new MemberDAO();
		Member result = dao.check(email);
		
		// 사용여부에 대한 결과값을 전달 
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		if(result == null) {
			out.print("true");
		}else {
			out.print("false");
		}
		
		return null;
	}

}
