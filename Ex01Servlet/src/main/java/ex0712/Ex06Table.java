package ex0712;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex06Table
 */
@WebServlet("/ex06")
public class Ex06Table extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String num = request.getParameter("num");
		int n = Integer.parseInt(num);
		response.setContentType("text/html ; charset=utf-8");
		PrintWriter out = response.getWriter();
		

		out.print("<html>");
		out.print("<head></head>");
		out.print("<body>");
		
		out.print("<table border='1' align='center'>");
		out.print("<tr>");
		for(int i=0; i<n; i++) {
			out.print("<td>" + (i+1) + "</td>");
		}
		out.print("</tr>");
		out.print("</table>");
		
	    out.print("</body>");
	    out.print("</html>");
	}

}
