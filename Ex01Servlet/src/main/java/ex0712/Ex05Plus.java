package ex0712;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex05Plus
 */
@WebServlet("/ex05")
public class Ex05Plus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 1. 파라미터(데이터) 수집 
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		
		// 2. String => int 
		int n1 = Integer.parseInt(num1);
		int n2 = Integer.parseInt(num2);
		
		// 3. 응답하기 
		// 3.1. 응답 형식 지정 
		response.setContentType("text/html ; charset=utf-8");
		
		// 3.2. out 객체 생성 
	    PrintWriter out = response.getWriter();

	    // 3.3. 응답 내용 작성 
		out.print("<html>");
		out.print("<head></head>");
		out.print("<body>");
		
		out.print("<h1>");
    	out.print(n1+" + "+n2+" = "+(n1+n2));
		out.print("</h1>");
		
	    out.print("</body>");
	    out.print("</html>");
		
	    // 상태 코드
	    // 1. 404 Not Found : 요청을 처리할 Servlet 이나 페이지가 없다. 
	    // 					- action 속성의 url 이 제대로 적혀있는가 
	    //					- 요청을 처리할 Servlet 의 UrlMapping 확인 
	    
	    // 2. 500 Interval Server Error
	    //					: 서버 프로그램 실행 중 Error => Java code Error
	    //					- Eclipse 의 console 창에 적힌 에러를 확인 
		
		
	}

}
