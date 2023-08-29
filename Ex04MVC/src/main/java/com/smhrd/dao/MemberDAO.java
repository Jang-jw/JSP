package com.smhrd.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SQLSessionManager;
import com.smhrd.entity.Member;

public class MemberDAO {
	
	// 1. SQLSessionManager 의 sqlSessionFactory 받아오기
	private SqlSessionFactory factory = SQLSessionManager.getSqlSessionFactory();
	
	// 2. SQL 문 실행 메소드
	public int join(Member member) {
		// 1) 연결을 빌려오기 : true == auto commit 
		SqlSession session = factory.openSession(true);
		
		// 2) Mapper 에 정의된 sql 문을 실행 
		// 메소드 이름 == SQL 문의 키워드 (단, select 만 빼고)
		// 매개변수는 
		//	- 필수 1개 : id 값
		//	- 선택 1개 : parameterType 에 지정해준 데이터 
		//		- parameterType == DAO 메소드의 매개변수
		// i, d, u >> 결과가 몇 행 변경이 일어났는가 동일하게 나온다. 
		int cnt = session.insert("join",member);
		
		// 3) 빌려온 연결을 반납
		session.close();
		
		// 4) DAO ==> SQL 문을 실행하고 실행 결과를 리턴하는 메소드 
		return cnt;
	}
	
	// 로그인 메소드
	public Member login(Member member) {
		// 1. 연결 빌려오기 
		SqlSession session = factory.openSession(true);
		// 2. SQL 문 실행 
		// selectOne : 결과가 한개만 나올 때 
		//		- resultType 에 적은 DTO 로 리턴 
		// selectList : 결과가 여러개 나올 때 
		//		- List<DTO> 로 리턴 
		Member result = session.selectOne("login",member);
		// 3. 연결 반납
		session.close();
		// 4. 실행 결과 리턴 
		return result;
	}

	// 회원정보 수정 메소드 
	public int update(Member member) {
		SqlSession session = factory.openSession(true);
		int cnt = session.update("update",member);
		session.close();
		return cnt;
	}

	// 회원정보 삭제 메소드
	public int delete(Member member) {
		SqlSession session = factory.openSession(true); // true 를 해야 자동 commit 이 된다. 
		int cnt = session.delete("delete",member);
		session.close();
		return cnt;
	}

	// 회원목록 조회 메소드
	public List<Member> list() {
		SqlSession session = factory.openSession(true);
		List<Member> list = session.selectList("list");
		session.close();
		return list;
	}
}
