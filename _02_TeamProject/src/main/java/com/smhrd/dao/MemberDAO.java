package com.smhrd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;
import com.smhrd.entity.Member;

public class MemberDAO {

	// 1. SqlSessionManager의 sqlSessionFactory 받아오기
	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	public int join(Member member) {
		SqlSession session = factory.openSession(true);

		int cnt = 0;

		cnt = session.insert("join", member);
		session.close();

		return cnt;
	}

	public Member login(Member member) {

		SqlSession session = factory.openSession(true);

		Member result = session.selectOne("login", member);

		session.close();

		return result;

	}

	public int insert(Member member) {
		SqlSession session = factory.openSession(true);
		int cnt = 0;
			cnt = session.insert("insert", member);
			session.close();
		return cnt;
	}

	public Member getMemberByEmail(String MB_ID) {
		SqlSession session = factory.openSession(true);
		Member result = session.selectOne("getMemberByEmail", MB_ID);
		session.close();
		return result;
	}
}