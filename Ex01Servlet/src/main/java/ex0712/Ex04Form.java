package ex0712;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex04Form
 */
@WebServlet("/ex04")
public class Ex04Form extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/**
		 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
		 *      response)
		 */

		// Post 방식 인코딩 -> 데이터 꺼내기 직전에 진행 
		request.setCharacterEncoding("UTF-8");
		
		// 데이터 수집(파라미터 수집), 사용
		// 데이터가 요청에 담겨있어, request 객체로부터 꺼낸다.
		// 파라미터 수집 : 요청 담긴 파라미터(데이터)를 꺼내서 변수에 담는 과정
		String data = request.getParameter("data");

		// request.getParameter 의 리턴이 String 이기 때문에,
		// 숫자로 변환해서 사용하고 싶다면 추가 작업 필요
		String number = request.getParameter("number");

		int num = Integer.parseInt(number);

		// 응답해주기

		// 1. 응답 형식 지정
		response.setContentType("text/html ; charset=utf-8");

		// 2. out 객체 생성
		PrintWriter out = response.getWriter();

		// 3. 응답 내용 작성
		out.print("<html>");
		out.print("<head></head>");
		out.print("<body>");

		// 입력받은 데이터 : ~~~~~
		// 입력받은 숫자 : ~~~~~
		out.print("<p>입력받은 데이터 : " + data + "</p>");
		out.print("<p>입력받은 숫자 : " + num + "</p>");

		out.print("</body>");
		out.print("</html>");

	}
}
