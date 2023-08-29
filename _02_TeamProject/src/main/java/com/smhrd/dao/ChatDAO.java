package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;
import com.smhrd.entity.Chat;
import com.smhrd.entity.Member;

public class ChatDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 채팅내용 DB에 저장하는 기능
	public int chatting(Chat chat) {
		SqlSession session = factory.openSession(true);
		
		int cnt = session.insert("chatting", chat);
		
		session.close();
		
		return cnt;
	}
	
	// 채팅기록 보여주는 기능
	public List<Chat> chatRec() { //String chat - 매개변수 후보
		SqlSession session = factory.openSession(true);
		
		List<Chat> result =  session.selectList("chatRec");
		
		session.close();
		
		return result;
	}
	
	// 방 아이디빼기위한 dao
	public List<Chat> roomId(String chat) {
		SqlSession session = factory.openSession(true);
		
		List<Chat> result = session.selectList("roomId", chat);
		
		session.close();
		
		return result;
	}
	
}
