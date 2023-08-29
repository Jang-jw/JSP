package ex0711;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// URLMapping은 중복이 되어서는 안된다.
@WebServlet("/ex02")
public class Ex02Request extends HttpServlet {
   private static final long serialVersionUID = 1L;
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      // request : HttpServletRequest
      //          Client가 보낸 요청에 대한 정보를 저장하는 객체
      //          Client의 요청이 들어오면, 생성되고 service 메소드의 매개변수로 들어옴
      //          Client가 응답받는 순간 메모리에서 소멸된다.
      
      // 요청을 보낸 Client의 ip주소를 가져오는 메소드
	  String ip = request.getRemoteAddr();
      
      // http://172.30.1.86:8081/Ex01Servlet/ex02
      // 0:0:0:0:0:0:0:1 - IPv6 localhost
      // 127.0.0.1 - IPv4 localhost
      System.out.println(ip);
      
      // Client의 요청 URI 가져오기
      // Client가 요청안 uri도 가져올 수 있음
      String uri = request.getRequestURI();
      System.out.println(uri);
      
      response.setContentType("text/html ; charset=utf-8");
      PrintWriter out = response.getWriter();
      
         out.print("<html>");
         out.print("<head></head>");
         out.print("<body>");
         if(ip.equals("172.30.1.18")) {
            out.print("<h1>선생님 반가워요.</h1>");
            out.print("<img src='http://photo.jtbc.joins.com/news/2020/03/25/20200325161812804.jpg' />");
         }
         else {
            out.print("<h1>어서와.</h1>");
            out.print("<img src='https://i.namu.wiki/i/fxjjtaygQ0A0s0H_b9C7bm1ZAp2fPgLP3yhexhM88LoacQnA4KwNVpkaI3GZCLP6FULTfgfG1QHil3so4RuXTQ.webp'>");
         }
         out.print("</body>");
         out.print("</html>");
      
      
   }

}