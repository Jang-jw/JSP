<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex02hap</title>
</head>
<body>
	<!-- 
		JSP 파일의 동작원리 
		
		.jap >> .java (Servlet) >(컴파일)> >(실행)> .Class >> HTML 문서
		
		jsp 에 작성한 내용은 Servlet 의 service 메소드 안으로 들어감 
		
		HTML 코드 >> out.writh() 메소드 안으로 들어갔고 
		
		스크립트릿 안 java 코드 >> 형태 그대로~ 들어갔다
		
		표현식 >> out.print(값); 로 변환이 되었다.
	 -->
	<%
	// 1 ~ 100 합 구하기 
	int sum = 0;
	for(int i=0; i<100; i++){
		sum+=(i+1);
	}
	%>
	<h1>1 부터 100 까지의 합은 : <%=sum %></h1>
</body>
</html>