package com.smhrd.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	// HashMap 자료구조
	// 파이썬의 dict와 유사 : key-value를 짝지어서 저장, 키값을 이용해서 조회
	// HashMap<Key의 자료형, value의 자료형>
	private HashMap<String, Controller> handler;

	@Override
	public void init() throws ServletException {
		// Servlet이 메모리에 등록되었을 때 단 한번만 실행
		handler = new HashMap<String, Controller>();

		// HashMap에 데이터 넣기
		handler.put("/goMain.do", new GoMainCon());
		handler.put("/goMain2.do", new GoMain2Con());
		
		// join & login
		handler.put("/login.do", new LoginCon());
		handler.put("/join.do", new JoinCon());
		handler.put("/goJoin.do", new GoJoinCon());
		handler.put("/goLogin.do", new GoLoginCon());
		handler.put("/goCheckUsername.do", new GoCheckUsernameCon());
		handler.put("/goCheckNick.do", new  GoCheckUsernickCon());
		handler.put("/logout.do", new LogoutCon());
		
		// calendar
		handler.put("/goCalendar.do", new GoCalendarCon());
		handler.put("/goAddSchedule.do", new GoAddScheduleCon());
		handler.put("/goUpDelSchedule.do", new GoUpDelScheduleCon());
		handler.put("/calList.do", new CalListCon());
		handler.put("/calUpDelSession.do", new CalUpDelSessionCon());
		handler.put("/calAddSession.do", new CalAddSessionCon());
		handler.put("/calAddData.do", new CalAddDataCon());
		handler.put("/calDelData.do", new CalDelDataCon());
		handler.put("/calUpData.do", new CalUpDataCon());

		// todoList
		handler.put("/goTodo.do", new GoTodoCon());
		handler.put("/todoWrite.do", new TodoWriteCon());
		handler.put("/todoSearch.do", new TodoSearchCon());
		handler.put("/todoDelete.do", new TodoDeleteCon());
		handler.put("/todoDone.do", new TodoDoneCon());
		handler.put("/todoDoneCencel.do", new TodoDoneCencelCon());
		handler.put("/todoChange.do", new TodoChangeCon());
		handler.put("/todoModify.do", new TodoModifyCon());
		handler.put("/todoCmSelect.do", new TodoCmSelectCon());
		handler.put("/todoRrSelect.do", new TodoRrSelectCon());
		handler.put("/todoRandomModify.do", new TodoRandomModifyCon());
		
		// Chatting
		// HashMap에 데이터 넣음
		handler.put("goChat.do", new GoChatCon());
		handler.put("/roomList.do", new RoomListCon()); // 이미지 클릭 후 방 리스트 출력
		handler.put("/addRoom.do", new AddRoomCon()); // 방생성 클릭 시 
		handler.put("/addMember.do", new AddMemberCon()); // 방 참가하기 클릭 시
		handler.put("/invite.do", new InviteCon()); // 초대코드 클릭 시
		handler.put("/chatting.do", new ChattingCon()); //채팅방 입장시
		handler.put("/chatRec.do", new ChatRecCon());
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 요청을 구분하기 위해서, 어떤 요청인지 알아내기
		// /Ex04/main.do
		String uri = request.getRequestURI();
		// /Ex04
		String cpath = request.getContextPath();

		// 슬라이싱
		String mapping = uri.substring(cpath.length());

		// url매핑 콘솔창에 출력
		System.out.println(mapping);
		// ===============================================================================

		String url = null;
		Controller con = null;
		// 2. 요청을 구분해서 알맞는 코드를 실행
		// HasyMap에서 저장되어있는 POJO 하나 꺼내오기
		con = handler.get(mapping);

		if (con != null) {
			url = con.execute(request, response);
		}

		// ======================================================================
		// 3. ...
		if (url != null) {
			if (url.contains("redirect:/")) {
				response.sendRedirect(url.split(":/")[1]);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/" + url + ".jsp");
				rd.forward(request, response);
			}
		}

	}

}
