package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {

	private String mb_id;		// 회원 아이디
	private String mb_pw;		// 회원 비번
	private String mb_phone;	// 회원 전화번호
	private String mb_nick;		// 회원 닉네임
	
}
