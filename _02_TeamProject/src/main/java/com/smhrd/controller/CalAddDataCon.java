package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.CalendarDAO;
import com.smhrd.entity.Calendar;

public class CalAddDataCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// ajax.do의 요청이 넘어오는 controller
		System.out.println("캘린더 일정 추가 요청이 들어왔습니다.");
		
		// 수집
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String startstr = request.getParameter("start");
		String endstr = request.getParameter("end");
		String color = request.getParameter("color");
		String mb_id = request.getParameter("mb_id");
		String content = request.getParameter("content");
		String check = "admin";
		
		// 수집된 데이터들을 하나로 묶어줌
		Calendar cal = new Calendar();
		cal.setCal_title(title);
		cal.setStarted_at(startstr);
		cal.setEnded_at(endstr);
		cal.setCal_color(color);
		cal.setMb_id(mb_id);
		cal.setCal_content(content);
		cal.setCal_check(check);
		
		// 기능
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		CalendarDAO dao = new CalendarDAO();
		int cnt = dao.calAdd(cal);
		
		// 결과에 따른 처리
		if(cnt > 0) {
			out.print(cnt);
			System.out.println("일정 추가 성공!");
		}		
		
		return null;		
	}

}
