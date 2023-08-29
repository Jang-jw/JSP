package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Todo {

	private String todo_id;			// todo 아이디 
	private int todo_seq;			// 할일 순번
	private String todo_content;	// 할일 내용
	private String todo_status;		// 할일 상태
	private String todo_date;		// 할일 입력 시간 
	private int todo_seq_1;			// 컬럼 없는 임시 필드 
	
}
