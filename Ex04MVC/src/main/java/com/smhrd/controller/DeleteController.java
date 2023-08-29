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
 * Servlet implementation class DeleteController
 */
@WebServlet("/delete")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 2. 데이터 수집
		request.setCharacterEncoding("utf-8");
		String pw = request.getParameter("pw");
		
		HttpSession session = request.getSession();
		Member user = (Member)session.getAttribute("user");
		String id = user.getId();
		
		Member member = new Member();
		member.setId(id);
		member.setPw(pw);

		// 3. 기능실행 
		MemberDAO dao = new MemberDAO();
		int cnt = dao.delete(member);
		
		String url = "goMain";
		if(cnt>0) {
			System.out.println("회원정보 삭제 성공!");
			session.removeAttribute("user");
		}else {
			System.out.println("회원정보 삭제 실패 ㅠ");
			url = "goDelete";
		}
		
		// 4. View 선택 
		response.sendRedirect(url);
	}

}
