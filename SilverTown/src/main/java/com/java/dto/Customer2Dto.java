package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Customer2Dto {
	
	private int bno;
	private String id;
	private String btitle;
	private String bcontent;
	private Timestamp bdate;
	private int bgroup;
	private int bstep;
	private int bindent;
	private int bhit;
	private String bfile;
	
	private int post_no;
	private String user_id;
	private String post_title;
	private String post_content;
	private int post_group;
	private int post_step;
	private int post_indent;
	private int post_hit;
	private Timestamp post_reg_date;
	private String post_file;
}
