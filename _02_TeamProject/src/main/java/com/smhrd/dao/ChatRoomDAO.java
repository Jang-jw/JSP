package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;
import com.smhrd.entity.ChatRoom;
import com.smhrd.entity.Member;

public class ChatRoomDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 생성된 방을 db에 저장하는 기능
	public int addRoom(ChatRoom chatRoom) {
		SqlSession session = factory.openSession(true);
		
		int cnt = session.insert("addRoom", chatRoom);
		
		session.close();
		
		return cnt;
	}
	
	// 채팅방 리스트를 db에서 불러와 출력하는 기능
	public List<ChatRoom> roomList(Member user) {
		SqlSession session = factory.openSession(true);
		
		List<ChatRoom> result = session.selectList("roomList", user);
		System.out.println(result);
		
		session.close();
		
		return result;
	}
	
	// 초대하기를 위해 방 아이디 불러오는 기능
	public List<ChatRoom> roomInfo(Member user) {
		SqlSession session = factory.openSession(true);
		
		List<ChatRoom> roomInfo = session.selectList("roomInfo", user);
		
		session.close();
		
		return roomInfo;
	}
	
	// 초대된 사람 채팅방 테이블에 넣어주는 기능
	public int addMember(ChatRoom chatRoom) {
		SqlSession session = factory.openSession(true);
		
		int cnt = session.insert("addMember", chatRoom);
		
		session.close();
		
		return cnt;
	}
}
