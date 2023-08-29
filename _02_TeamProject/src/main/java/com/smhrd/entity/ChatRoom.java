package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatRoom {
	private int room_seq; // 방 시퀀스
	private String room_id; // 방아이디
	private String room_title; // 방제복
	private String created_at; // 개설일자
	private int room_limit; // 방 인원수
	private String mb_id; // 개설자
	
	// 방인원수도 웹소켓 세션에서 세션개수 새서 추가해야함
}
