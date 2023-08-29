package com.smhrd.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;
import com.smhrd.entity.Todo;

public class TodoListDAO {

	private SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	public List<Todo> todoSelect(Todo todo) {

		List<Todo> list = new ArrayList<>();
		SqlSession session = factory.openSession(true);
		
		try {
			list = session.selectList("todoSelect", todo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return list;
	}

	public int todoInsert(Todo todo) {

		int cnt = 0;
		SqlSession session = factory.openSession(true);
		try {
			cnt = session.insert("todoInsert", todo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return cnt;
	}

	public int todoDelete(Todo todo) {

		SqlSession session = factory.openSession(true);
		int cnt = 0;
		try {
			cnt = session.delete("todoDelete", todo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return cnt;
	}

	public int todoDone(Todo todo) {

		SqlSession session = factory.openSession(true);
		int cnt = 0;
		try {
			session.update("todoDone", todo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return cnt;
	}

	public int todoDoneCencel(Todo todo) {

		SqlSession session = factory.openSession(true);
		int cnt = 0;
		try {
			session.update("todoDoneCencel", todo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return cnt;
	}

	public int todoChange(Todo todo) {

		SqlSession session = factory.openSession(true);
		int cnt = 0;
		try {
			session.update("todoChange_0", todo);
			session.update("todoChange_1", todo);
			session.update("todoChange_2", todo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return cnt;
	}

	public int todoModify(Todo todo) {

		SqlSession session = factory.openSession(true);
		int cnt = 0;
		try {
			cnt = session.update("todoModify", todo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return cnt;
	}

}
