package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoMainCon implements Controller{

	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// Next view (다음 페이지)
		// url 을 리턴 
		return "main";
	}
}
