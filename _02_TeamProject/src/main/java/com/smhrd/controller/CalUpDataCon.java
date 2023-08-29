package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.CalendarDAO;
import com.smhrd.entity.Calendar;

public class CalUpDataCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 수집
		request.setCharacterEncoding("utf-8");
		
		String seqstr = request.getParameter("cal_seq");
		String title = request.getParameter("cal_title");
		String start = request.getParameter("started_at");
		String end = request.getParameter("ended_at");
		String color = request.getParameter("cal_color");
		String content = request.getParameter("cal_content");
		
			int cal_seq = Integer.parseInt(seqstr);
			
			// 수집한 데이터 하나로 합치기
			Calendar cal = new Calendar();
			cal.setCal_color(color);
			cal.setCal_seq(cal_seq);
			cal.setCal_title(title);
			cal.setStarted_at(start);
			cal.setEnded_at(end);
			cal.setCal_content(content);
			
			
			// 기능
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			
			CalendarDAO dao = new CalendarDAO();
			int cnt = dao.calUp(cal);
			
			if(cnt > 0) {
				out.print(cnt);
				System.out.println("일정 수정 성공!");			
			}else {
				System.out.println("일정 수정 실패!");
			};
			

		return null;
	}

}
