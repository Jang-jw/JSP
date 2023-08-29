package com.smhrd.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.dao.MemberDAO;
import com.smhrd.entity.Member;

@WebServlet("/StoreKakaoInfoServlet")
public class StoreKakaoInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	 System.out.println("StoreKakaoInfoServlet가 불러와졌나?");
    	
    	request.setCharacterEncoding("UTF-8");
        String nickname = request.getParameter("nickname");
        String email = request.getParameter("email");
        String phone = "phone"; 
        String pw = "pw"; 
        
        
        
        HttpSession session = request.getSession();
        session.setAttribute("kakaoNickname", nickname);
        session.setAttribute("kakaoEmail", email);
        
        MemberDAO dao = new MemberDAO();
        
        Member existingUser = dao.getMemberByEmail(email);
        
        System.out.println(email+"과"+nickname);
        System.out.println(existingUser);
        if (existingUser != null) {
        	
        	System.out.println("email이 이미 존재");
        }else {
        	
        	 String kakaoEmail = email;
             String[] kakaoList = kakaoEmail.split("@");

             if (kakaoList.length > 0) {
                 email = kakaoList[0];
                 System.out.println(email);
             }
        	
        	System.out.println("카카오 로그인 사용자 정보 DB에 없음 -- insert");
            Member member = new Member();
            member.setMb_id(email); // Use email as the ID
            member.setMb_pw(pw); // You can generate a random password or leave it empty
            member.setMb_phone(phone); // Set phone number as needed
            member.setMb_nick(nickname); // Set nickname as needed
            dao.insert(member); // Insert the new member into the database using the 'join' method
        }

        // Respond to the AJAX request (optional)
        response.getWriter().write("Data inserted successfully");
        System.out.println("StoreKakaoInfoServlet 작동되었나?");
        // Redirect to the main page
        response.sendRedirect("goMain2.do");
    }
}
