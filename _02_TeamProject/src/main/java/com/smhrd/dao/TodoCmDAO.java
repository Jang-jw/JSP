package com.smhrd.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;
import com.smhrd.entity.TodoCm;

public class TodoCmDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	public List<TodoCm> todoCmGet() {

		List<TodoCm> list = new ArrayList<>();
		SqlSession session = factory.openSession(true);
		
		try {
			list = session.selectList("todoCmSelect");
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return list;
	}

	
}
