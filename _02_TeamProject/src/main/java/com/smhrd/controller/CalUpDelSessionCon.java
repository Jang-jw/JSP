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

public class CalUpDelSessionCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String cal_seqstr = request.getParameter("cal_seq");

		int cal_seq = Integer.parseInt(cal_seqstr);
		
		CalendarDAO dao = new CalendarDAO();
		Calendar cal = dao.calSession(cal_seq);
		
		HttpSession session = request.getSession();
		session.setAttribute("calData", cal);
		
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		Gson gson = new Gson();
		String json = gson.toJson(cal);
		
		out.print(json);
		
		System.out.println("updelcal data : " + cal);
		
		return null;
	}

}
