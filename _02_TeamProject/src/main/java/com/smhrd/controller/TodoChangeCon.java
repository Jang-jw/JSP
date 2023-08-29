package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.TodoListDAO;
import com.smhrd.entity.Member;
import com.smhrd.entity.Todo;

public class TodoChangeCon implements Controller {

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
		int todo_seq = Integer.parseInt(request.getParameter("todo_seq"));
		int todo_seq_1 = Integer.parseInt(request.getParameter("todo_seq_1"));
		
		Todo todo = new Todo();
		todo.setTodo_id(id);
		todo.setTodo_seq(todo_seq);
		todo.setTodo_seq_1(todo_seq_1);
		
		TodoListDAO dao = new TodoListDAO();
		int cnt = dao.todoChange(todo);

		if (cnt > 0) {
			System.out.println("Change Complete!");
		} else {
			System.out.println("Change Faild!");
		}
		
		return null;
	}

}
