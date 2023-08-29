package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Chatting {

	private int chat_seq;		// 대화 순번
	private String chatter;		// 발신자
	private String chat;		// 채팅내용
	private String emoticon;	// 이모티콘
	private String chat_file;	// 첨부파일
	private String created_at;	// 발신일자
	private int room_seq;		// 방 순번
	
}
