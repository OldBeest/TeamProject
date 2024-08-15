package com.java.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDto {
	private String id;
	private String pw;
	private String email;
	private String name;
	private String phone;
	private Date birth_date;
	private String autoLoginToken;
	private String tempPw;
	private String gender;
	private Timestamp join_date;
	private String disease;
	private String[] diseases;
	private String feature;
	private String[] features;
	private String address;
	
}