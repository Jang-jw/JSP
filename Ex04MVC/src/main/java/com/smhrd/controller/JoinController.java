package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.smhrd.entity.Member;
import com.smhrd.dao.MemberDAO;

/**
 * Servlet implementation class JoinController
 */
@WebServlet("/join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 1. 데이터 수집
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String gender = request.getParameter("gender");
		String nick = request.getParameter("nick");
		String tel = request.getParameter("tel");
		
		// id ~ tel 까지 Member 로 묶기
		Member member = new Member(id,pw,gender,nick,tel);
		
		// 2. 기능 실행
		// 입력받은 정보를 DB-MEMBER 테이블에 저장 >> DAO 
		// DAO 의 기능을 실행 
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(member);
		
		// 3. View 선택
		// 만약 회원가입이 성공했다면, main.jsp, 실패했다면 join.jsp
		String url ="";
		if(cnt>0) {
			// 이미 이동하는 Controller 가 있는 jsp 의 경우 해당 Controller 로 이동 
			url="goMain";
		}else {
			url="goJoin";
		}
		
		// servlet 에서 servlet 로 이동하는 경우 비교적 간단한 sendRedirect 를 사용함 
		response.sendRedirect(url);
	}

}
