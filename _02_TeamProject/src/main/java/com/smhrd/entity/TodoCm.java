package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TodoCm {

	private int todocm_seq;		// 응원글 순번 
	private String todocm_content;	// 응원글 내용 
}
