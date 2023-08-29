package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.Board;

public class GoBoardCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 사용자로 검색하지 않고 전체 검색할 경우 생략

//		HttpSession session = request.getSession();
//		Member user = (Member) session.getAttribute("user");
//		String writer = user.getEmail();
//		Board board = new Board();
//		board.setWriter(writer);

		BoardDAO dao = new BoardDAO();
		List<Board> list = dao.list();

		// 페이지 이동시 list 에 대한 내용을 공유할 수 있도록 연결작업!
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
