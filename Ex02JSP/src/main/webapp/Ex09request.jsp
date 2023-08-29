<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex09request</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String numJava = request.getParameter("numJava");
	int numJ = Integer.parseInt(numJava);
	String numWeb = request.getParameter("numWeb");
	int numW = Integer.parseInt(numWeb);
	String numIot = request.getParameter("numIot");
	int numI = Integer.parseInt(numIot);
	String numAnd = request.getParameter("numAnd");
	int numA = Integer.parseInt(numAnd);
	
	// 풀이
	int java = Integer.parseInt(request.getParameter("numJava"));
	int web = Integer.parseInt(request.getParameter("numWeb"));
	int iot = Integer.parseInt(request.getParameter("numIot"));
	int and = Integer.parseInt(request.getParameter("numAnd"));
	%>

	<%
	int mean = (numJ+numW+numI+numA)/4;
	String grade = "";
	if (mean>=95){
		grade="A+";
	}else if (mean>=90){
		grade="A";
	}else if (mean>=85){
		grade="B+";
	}else if (mean>=80){
		grade="B";
	}else if (mean<80){
		grade="F";
	}else{
		grade="검토";
	}
	%>

	<table border="1">
		<th>성적확인프로그램</th>
		<tr>
			<td>
			이름 <%=name %><br> 
			JAVA점수 <%=numJ %><br> 
			WEB점수 <%=numW %><br> 
			IOT점수 <%=numI %><br> 
			ANDROID점수 <%=numA %><br>
			<br>
			학점	<strong><%=grade %></strong>
			</td>
		</tr>
	</table>
</body>
</html>