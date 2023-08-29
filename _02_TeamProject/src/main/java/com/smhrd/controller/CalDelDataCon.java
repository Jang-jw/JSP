package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.CalendarDAO;

public class CalDelDataCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 수집
		request.setCharacterEncoding("utf-8");
		
		String seqstr = request.getParameter("cal_seq");

			System.out.println("admin이라 수정 불가!");
			int cal_seq = Integer.parseInt(seqstr);
		
			// 기능
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			
			CalendarDAO dao = new CalendarDAO();
			int cnt = dao.calDel(cal_seq);
			
			if(cnt > 0) {
				out.print(cnt);
				System.out.println("일정 삭제 성공!");			
			}else {
				System.out.println("일정 삭제 실패!");
			}
		
		
		
		return null;
	}

}
