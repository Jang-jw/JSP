package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.MemberDAO;
import com.smhrd.entity.Member;

public class GoListCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 3. 기능 실행 
		MemberDAO dao = new MemberDAO();
		List<Member> list = dao.list();
		
		// Request 에게 list 맡기기 
		request.setAttribute("list", list); // M V C 를 맞추기 위해 model 기능은 사용치 않는다. (request 를 이용하는 방법이 가장 많이 사용됨) 
		
		// 4. View 선택 
		return "list";
	}

}
