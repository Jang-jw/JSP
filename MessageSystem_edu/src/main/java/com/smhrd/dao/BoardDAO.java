package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SQLSessionManager;
import com.smhrd.entity.Board;

public class BoardDAO {

	private SqlSessionFactory factory = SQLSessionManager.getSqlSessionFactory(); // factory 먼저 임포트

	public List<Board> list() {
		
		SqlSession session = factory.openSession(true);
		List<Board> list = null;
		try {
			// 넘겨줄 데이터가 없으므로 "맵퍼아이디" 만 사용
			// selectList() => 반환 List<Object>
			list = session.selectList("list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return list;

	}

	public List<Board> list(Board board) {
		
		SqlSession session = factory.openSession(true);
		List<Board> list = null;
		try {
			// 넘겨줄 데이터가 없으므로 "맵퍼아이디" 만 사용
			// selectList() => 반환 List<Object>
			list = session.selectList("list");
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return list;

	}

	// 게시판의 상세 내용보기 기능 
	public Board view(int idx) {

		SqlSession session = factory.openSession(true);
		
		Board board = session.selectOne("view", idx);
		
		session.close();
		
		return board;
		
	}

	// 게시판의 게시글을 추가하는 기능 
	public int write(Board board) {

		SqlSession session = factory.openSession(true);
		
		int cnt = session.insert("write", board);
		
		session.close();
		
		return cnt;
		
	}

	public List<Board> search(String search) {
		
		SqlSession session = factory.openSession(true);
		List<Board> list = session.selectList("search", search);
		session.close();
		return list;
	}
	
	

}
