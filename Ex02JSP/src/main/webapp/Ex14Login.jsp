<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex14Login</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String idP = request.getParameter("id");
	String pw = request.getParameter("pw");
	String url = "";
	

	
	// 만약 로그인에 성공했다면, session에 id를 저장해봅시다.

	if (idP.equals(idP)&&(pw.equals(pw))) {
		session.setAttribute("idS", idP);
		Cookie cookie = new Cookie("idC",idP);
		response.addCookie(cookie);
		url="Ex14LoginTrue.jsp";
	} else {
		url="Ex14LoginFalse.jsp";
	}
	response.sendRedirect(url);
	%>
</body>
</html>