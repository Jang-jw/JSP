package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Room {
	
	private int room_seq;		// 방 순번
	private String room_info;	// 방 제목
	private String mb_id;		// 회원 아이디
	private String created_at;	// 방 개설일자
	private int room_limit;		// 방 제한인원
	private String room_status;	// 방 상태
	

}
