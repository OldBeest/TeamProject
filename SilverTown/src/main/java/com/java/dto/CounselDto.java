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
public class CounselDto {
	
	private String id;
	private String email;
	private String c_title;
	private String c_content;
	private String phone;
	private Timestamp c_date;
}
