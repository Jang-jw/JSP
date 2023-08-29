package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.Board;

public class WriteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 파일전송을 위해서 필요한 라이브러리가 있다! => COS 
		// 파일을 저장하기 위한 경로가 필요하다! => 프로젝트 내 -> webapp -> save 
		
		// 1. 데이터 수집 => request 객체 => MultipartRequest 객체 사용 
		// 		- MultipartRequest 객체 : 파일 전송을 위하여 필요한 객체! 
		// 		- request : MultipartRequest 와 연결을 위한 request 
		//		- savePath : 파일 저장을 위한 경로 
		//		- maxSize : 파일의 최대 크기 지정 
		//		- encoding : 파일명에 대한 인코딩 작업 ex) dog.png 
		//		- DefaultFileRenamePolicy : 업로드되는 파일들이 중복되지 않도록 관리! 
		
		// getServletContex() :서블릿을 실행하는 정보를 가져다 주는 메소드 
		String savePath = request.getServletContext().getRealPath("save");
		System.out.println(savePath);
		
		// 1mb 1024 * 1024 
		int maxSize = 1024 * 1024 * 5; // 5mb 
				
		String encoding = "utf-8";
		
		MultipartRequest multi = new MultipartRequest(
				request,
				savePath,
				maxSize,
				encoding,
				new DefaultFileRenamePolicy());
		
		// 데이터 수집 
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String content = multi.getParameter("content");
		String img = multi.getFilesystemName("file");
		
		// 2. 기능실행 
		// 수집된 데이터를 하나의 묶음으로 만들어주기! => Board 
		Board board = new Board();
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		board.setImg(img);
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.write(board);
		
		// 3. 페이지 이동 
		String nextView = "redirect:/goWrite.do";
		if(cnt>0) { // 성공 => goBoard 
			System.out.println("게시물 등록 성공!");
			nextView = "redirect:/goBoard.do";
		}else { // tlfvo => goWrite 
			System.out.println("게시물 등록 실패 ㅠ");
		}
		
		return nextView;
		
	}

}
