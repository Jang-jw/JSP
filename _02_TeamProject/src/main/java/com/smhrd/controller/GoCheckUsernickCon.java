package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoCheckUsernickCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String usernick = request.getParameter("usernick");
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
			pstmt = conn.prepareStatement("SELECT * FROM TB_MEMBER WHERE mb_nick = ?");
			pstmt.setString(1, usernick);
			rs = pstmt.executeQuery();

			isUsernameTaken = rs.next(); // 사용자명이 이미 존재하면 true
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();

			if (isUsernameTaken) {
				out.print("true");
			} else {
				out.print("false");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			{
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
		return null;
	}

}
