package ex0720;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Ex05Session
 */
@WebServlet("/ex05")
public class Ex05Session extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 1. 세션 수정 
		HttpSession session = request.getSession();

		// 수정 == 덮어쓰기 
		// 같은 이름으로 다시 저장하면 됨 
		session.setAttribute("name", "안현진(수정)");
		
		// 삭제 
		// .removeAttribute("list");
		// session.removeAttribute("list");
		ArrayList<String> list = new ArrayList<String>();
		list.add("이우석(수정)");
		list.add("김동영(수정)");
		list.add("김유성(수정)");
		session.setAttribute("list",list);
		
		// session.invalidate(); : 세션 닫기
		
		// Ex04Session.jsp 로 이동
		response.sendRedirect("Ex04Session.jsp");
		
	}

}
