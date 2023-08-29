package com.smhrd.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Calendar {

	private int cal_seq; 		// 일정순서
	private String cal_title;	// 일정제목
	private String started_at;	// 시작날짜
	private String ended_at;	// 종료날짜
	private String mb_id;		// 회원아이디
	private String cal_color;	// 할일 색깔
	private String cal_check;	// 체크용도 
	private String cal_content;	// 할일 내용
	
	
}
