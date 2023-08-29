<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
String username = request.getParameter("username");
boolean isUsernameTaken = false;
PreparedStatement pstmt = null;
ResultSet rs = null;
Connection conn = null;

try {
	// 데이터베이스 연결
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin://@project-db-cgi.smhrd.com:1524/xe"; // 데이터베이스 URL 수정
	String user = "cgi_22K_BIG8_hacksim_2";
	String password = "smhrd2";
	conn = DriverManager.getConnection(url, user, password);

	// 중복 확인 쿼리 실행
	pstmt = conn.prepareStatement("SELECT * FROM TB_MEMBER WHERE mb_id = ?");
	pstmt.setString(1, username);
	rs = pstmt.executeQuery();

	isUsernameTaken = rs.next(); // 사용자명이 이미 존재하면 true

	if (isUsernameTaken) {
		out.print("true");
	} else {
		out.print("false");
	}

} catch (Exception e) {
	e.printStackTrace();
} finally {
	if (rs != null) {
        rs.close();
    }
    if (pstmt != null) {
        pstmt.close();
    }
    if (conn != null) {
        conn.close();
    }
}
%>
