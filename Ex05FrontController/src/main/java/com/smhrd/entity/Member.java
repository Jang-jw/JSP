package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// lombok 라이브러리 : Class 의 기본 메소드 (getter/setter, 생성자) 자동완성 라이브러리
//		- 유지보수가 좋아지고 코드 작성시에 편리하다. 
@Data // 기본메소드 자동완성(getter, setter, toString)
@AllArgsConstructor // 모든 필드를 초기화하는 생성자 자동완성 
@NoArgsConstructor // 기본 생성자 : 기본생성자는 반드시 있어야한다. 
public class Member {

	// 반드시 테이블의 컬럼명과 필드 변수명이 같아야한다. 
	private String id;
	private String pw;
	private String gender;
	private String nick;
	private String tel;
}
