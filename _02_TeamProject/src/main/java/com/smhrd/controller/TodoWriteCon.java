package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.TodoListDAO;
import com.smhrd.entity.Member;
import com.smhrd.entity.Todo;

public class TodoWriteCon implements Controller {

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
		String todo_content = request.getParameter("taskInput");

		Todo todo = new Todo();
		todo.setTodo_id(id);
		todo.setTodo_content(todo_content);

		TodoListDAO dao = new TodoListDAO();
		int cnt = dao.todoInsert(todo);

		if (cnt > 0) {
			System.out.println("Insert Complete!");
		} else {
			System.out.println("Insert Faild!");
		}

		return null;

	}

}
