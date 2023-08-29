package com.smhrd.dao;

import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SQLSessionManager;
import com.smhrd.entity.Member;

public class MemberDAO {

	private SqlSessionFactory factory = SQLSessionManager.getSqlSessionFactory(); // factory 먼저 임포트

	public int join(Member member) {

		SqlSession session = factory.openSession(true);

		int cnt = 0;
		try {
			cnt = session.insert("join", member);
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return cnt;
	}

	public Member login(Member member) {

		SqlSession session = factory.openSession(true);

		// select => (결과) 한 행 / 전체 행
		// selectOne() : 하나의 행을 결과값으로 보는것! => DTO
		// selectAll() : 전체 행을 결과값으로 보는것! => 리스트<DTO>

		Member result = null;
		try {
			result = session.selectOne("login", member);
		} catch (Exception e) {
			e.printStackTrace();
		}

		session.close();
		return result;
	}

	public int update(Member member) {

		SqlSession session = factory.openSession(true);

		int cnt = 0;
		try {
			cnt = session.update("update", member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		session.close();
		return cnt;

	}

	public Member check(String email) {

		SqlSession session = factory.openSession();
		Member list = session.selectOne("check", email);
		session.close();
		return list;
	}

}
