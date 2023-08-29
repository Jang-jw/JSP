package com.smhrd.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;
import com.smhrd.entity.TodoRr;

public class TodoRrDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	public List<TodoRr> todoRrGet() {

		List<TodoRr> list = new ArrayList<>();
		SqlSession session = factory.openSession(true);
		
		try {
			list = session.selectList("todoRrSelect");
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return list;
	}

	public int todoRandomModify(TodoRr todorr) {
		SqlSession session = factory.openSession(true);
		int cnt = 0;
		try {
			cnt = session.update("todoRandomModify", todorr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return cnt;
	}

}
