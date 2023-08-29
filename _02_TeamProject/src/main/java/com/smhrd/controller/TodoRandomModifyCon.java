package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.TodoRrDAO;
import com.smhrd.entity.Member;
import com.smhrd.entity.TodoRr;

public class TodoRandomModifyCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Member user = (Member) session.getAttribute("user");
		String email = (String) session.getAttribute("email");
		
		String id = "";
		if (user != null) {
			id = user.getMb_id();
		}else if(email != null) {
			id = email;
		}

		request.setCharacterEncoding("UTF-8");
		int  todorr_seq = Integer.parseInt(request.getParameter("todorr_seq"));
		String  todorr_content = request.getParameter("todorr_content");
		
		TodoRr todorr = new TodoRr();
		todorr.setTodorr_id(id);
		todorr.setTodorr_seq(todorr_seq);
		todorr.setTodorr_content(todorr_content);
		
		TodoRrDAO dao = new TodoRrDAO();
		int cnt = dao.todoRandomModify(todorr);

		if (cnt > 0) {
			System.out.println("todoRandomModify Complete!");
		} else {
			System.out.println("todoRandomModify Faild!");
		}
		
		return null;
	}

}
