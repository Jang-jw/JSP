package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.Board;

public class GoViewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 페이지 이동시 상세히 보고자 하는 게시글 내용을 가지고 가야한다! 
		
		// 데이터 수집 => 선택된 게시글의 인덱스 번호!
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		// BoardDAO 접근
		BoardDAO dao = new BoardDAO();
		
		// 게시판 세부 내역 가져오기
		Board board = dao.view(idx);
		
		// 이동할 페이지에 전달
		request.setAttribute("board", board);
		
		return "viewBoard";
		
	}

}
