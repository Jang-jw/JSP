package com.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TodoRr {

	private String todorr_id;		// 아이디
	private int todorr_seq;			// 루린 순번
	private String todorr_content;	// 루린 내용
}
