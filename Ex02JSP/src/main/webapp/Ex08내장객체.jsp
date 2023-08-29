<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체</title>
</head>
<body>
	<%--
		내장객체 : JSP 가 Servlet 으로 변환되는 과정에서 자동으로 선언되는 객체 
			- JSP 내에서 선언하지 않고 바로 사용할 수 있다. 
			
		1. out 객체 ( PrintWriter 와 비슷 ) 
			: 응답 내용 작성하는데 사용 
	 --%>
	 
	 <%-- out 객체를 이용해서 h1 태그와 그 안에 '환영합니다~' 글자 출력 --%>
	 <%out.print("<h1>환영합니다.</h1>"); %>
	 
	 <%--
	 	2. request : service 메소드의 매개변수로 선언 
	  --%>
	  
	  <%
	  // 0 순위 : 인코딩
	  request.setCharacterEncoding("UTF-8");
	  // 파라미터 수집
	  String data = request.getParameter("data");
	  %>
	  
	  <h1>입력받은 데이터 : <%=data %></h1>
</body>
</html>