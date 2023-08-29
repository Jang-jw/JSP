package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.dao.CalendarDAO;
import com.smhrd.entity.Calendar;

public class CalAddSessionCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String start = request.getParameter("start");
		//start = start + " 00:00:00.0";
		
		Calendar cal = new Calendar();
		cal.setStarted_at(start);
		
		HttpSession session = request.getSession();
		session.setAttribute("addStart", cal);
		
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		Gson gson = new Gson();
		String json = gson.toJson(cal);
		
		out.print(json);
		
		System.out.println("addcal data : " + cal);
		
		return null;
	}

}
