<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex04table</title>
</head>
<body>
	<table border="1">
		<tr>
		
		<!-- 나중 jstml 사용을 위해 지향해야할 방법  --> 
		<% for(int i=0; i<10; i++){
		// 홀수일때만 열이 생성되게 해보기 
		if(i%2==1){ %>
		<td><%=i %></td>
		<% }
		} %>
		
		</tr>
	</table>
	
	<hr>
	
	<table border="1">
		<tr>
		
			<%
			// 내장객체 
			for (int i=0; i<10; i++){
				out.write("<td>"+ (i+1) +"</td>");
			}
			 %>
			 
		</tr>
	</table>
	
</body>
</html>