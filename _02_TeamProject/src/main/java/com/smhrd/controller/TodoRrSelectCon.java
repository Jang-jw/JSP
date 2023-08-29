package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.dao.TodoRrDAO;
import com.smhrd.entity.TodoRr;

public class TodoRrSelectCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		TodoRrDAO dao = new TodoRrDAO();
		List<TodoRr> list = dao.todoRrGet();

		if (list != null) {
			System.out.println("todoRrGet Complete!");
		} else {
			System.out.println("todoRrGet Faild!");
		}

		response.setContentType("text/heml;charset=utf-8");
		PrintWriter out = response.getWriter();

		Gson gson = new Gson();
		String json = gson.toJson(list);

		out.print(json);
		
		return null;
	}

}
