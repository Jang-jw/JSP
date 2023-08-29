package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Chat {
	private String chatter; //닉네임
	private String chat; // 채팅내용
	private String chat_file; //파일
	private String created_at; //채팅 시간
	private String room_id; //방아이디
	private String mb_id; //사용자 아이디
}
