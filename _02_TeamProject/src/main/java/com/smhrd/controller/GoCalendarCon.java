package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.dao.CalendarDAO;
import com.smhrd.entity.Calendar;


public class GoCalendarCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 수집
		request.setCharacterEncoding("utf-8");		
		String mb_id = "test";
		
		// 기능
		
		CalendarDAO dao = new CalendarDAO();
		List<Calendar> list = dao.calList(mb_id);		
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		request.setAttribute("calList", json);
		
		System.out.println("goCalendarCon실행결과 : " + json.getClass().getName());
		
		return "calendar";
	}

}
