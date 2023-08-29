package ex0712;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex07Join
 */
@WebServlet("/ex07")
public class Ex07Post extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ido = request.getParameter("idO");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
//		String dataNum = request.getParameter("dataNum");
//		int n = Integer.parseInt(dataNum);
		String gender = request.getParameter("gender");
		String song = request.getParameter("song");
		String edu = request.getParameter("edu");
		response.setContentType("text/html ; charset=utf-8");
		PrintWriter out = response.getWriter();
		

		out.print("<html>");
		out.print("<head></head>");
		out.print("<body>");
		
		out.print("<p>");
		out.print(ido+id+pw+gender+song+edu);
		out.print("</p>");
		
	    out.print("</body>");
	    out.print("</html>");
	}

}
