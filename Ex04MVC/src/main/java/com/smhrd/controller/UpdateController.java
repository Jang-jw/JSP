package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.MemberDAO;
import com.smhrd.entity.Member;

/**
 * Servlet implementation class updateController
 */
@WebServlet("/update")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String gender = request.getParameter("gender");
		String nick = request.getParameter("nick");
		String tel = request.getParameter("tel");
		Member member = new Member(id,pw,gender,nick,tel);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(member);
		
		String url = "goMain";		
		if(cnt>0) {
			System.out.println("수정 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("user", member);
		}else {
			System.out.println("수정 실패 ㅠ");
			url = "goUpdate";
		}
		response.sendRedirect(url);
	}

}
