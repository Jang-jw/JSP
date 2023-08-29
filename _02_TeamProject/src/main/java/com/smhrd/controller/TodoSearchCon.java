package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.dao.TodoListDAO;
import com.smhrd.entity.Member;
import com.smhrd.entity.Todo;

public class TodoSearchCon implements Controller {

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

		Todo todo = new Todo();
		todo.setTodo_id(id);

		TodoListDAO dao = new TodoListDAO();
		List<Todo> list = dao.todoSelect(todo);

		if (list != null) {
			System.out.println("Search Complete!");
		} else {
			System.out.println("Search Faild!");
		}

		response.setContentType("text/heml;charset=utf-8");
		PrintWriter out = response.getWriter();

		Gson gson = new Gson();
		String json = gson.toJson(list);

		out.print(json);

		return null;
	}

}
