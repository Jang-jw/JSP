<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex01Scriptlet</title>
</head>
<body>
	<!-- 
		JSP : Java Server Page
			Servlet 으로 화면을 구현하기에는 코드가 복잡해져
			Style 적용과 유지보수 힘듦 
			HTML 내에서 Java 코드를 사용하는 JSP 파일을 이용해서 화면구현 
	 -->
	 
	 <!-- 
	 	1. 스크립트릿 (Scriptlet)
	 		: Java 코드를 사용하기 위한 공간 
	  -->
	  <%
	  	// java code 를 쓰는 공간
	  	// java 만 쓸 수 있음! 
	  	int a = 10;
	  	int b = 5;
	  	int sum = a + b;
	  %>
	  
	  <!-- 
	  	2. 표현식 (Expression)
	  		: java 코드를 실행한 결과 값을 HTML 요소 사이에 출력하기 위해 사용
	  		: 결과가 값으로 나오는 식만 들어갈 수 있다. 
	   -->
	   <h1 class="class">a 와 b 의 합은 <%=sum%></h1>
</body>
</html>