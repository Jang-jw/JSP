package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.dao.TodoCmDAO;
import com.smhrd.entity.TodoCm;

public class TodoCmSelectCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		TodoCmDAO dao = new TodoCmDAO();
		List<TodoCm> list = dao.todoCmGet();

		if (list != null) {
			System.out.println("todoCmGet Complete!");
		} else {
			System.out.println("todoCmGet Faild!");
		}

		response.setContentType("text/heml;charset=utf-8");
		PrintWriter out = response.getWriter();

		Gson gson = new Gson();
		String json = gson.toJson(list);

		out.print(json);
		
		return null;
	}

}
