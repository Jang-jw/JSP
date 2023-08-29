package com.smhrd.entity;

import lombok.Data;

@Data
public class Board {

	private int idx;
	private String title;
	private String writer;
	private String content;
	private String img;
	private String indate;
	private int count;
}
