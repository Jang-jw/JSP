package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MemberDAO;
import com.smhrd.entity.Member;

/**
 * Servlet implementation class goList
 */
@WebServlet("/goList")
public class GoListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 2. 수집 
		
		// 3. 기능 실행 
		MemberDAO dao = new MemberDAO();
		List<Member> list = dao.list();
		
		// Request 에게 list 맡기기 
		request.setAttribute("list", list); // M V C 를 맞추기 위해 model 기능은 사용치 않는다. 가장 많이 사용됨. 
		
		// 4. View 선택 
		String url = "WEB-INF/views/list.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
