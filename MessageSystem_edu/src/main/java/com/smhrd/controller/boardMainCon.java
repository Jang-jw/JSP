package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.Board;
import com.smhrd.entity.Member;

public class boardMainCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Member user = (Member) session.getAttribute("user");
		String writer = user.getEmail();
		Board board = new Board();
		board.setWriter(writer);

		BoardDAO dao = new BoardDAO();
		List<Board> list = dao.list(board);
		System.out.println(list);

		request.setAttribute("list", list);

		String url = "redirect:/goMain.do";
		if (list != null) {
			System.out.println("리스트 확인 완료!");
			url = "boardMain";
		} else {
			System.out.println("리스트 확인 불가 ㅠ");
		}
		return url;

	}

}
