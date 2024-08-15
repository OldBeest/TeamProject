package com.java.service;

import java.util.ArrayList;
import java.util.Map;
import com.java.dto.Customer2Dto;

public interface Customer2Service {
	
	// 게시판 불러오기
	Map<String, Object> selectAll(int page, String category, String sWord);

	// 게시글 불러오기
	Map<String, Object> selectOne(Customer2Dto c2dto);

	
	void insertPost(Customer2Dto c2dto);

	// 게시글 삭제
	void delete2Post(Customer2Dto c2dto);

	// 게시글 수정
	Customer2Dto update2Post(Customer2Dto c2dto);

	// 게시글 수정저장
	void doUpdate2Post(Customer2Dto c2dto);

	// 게시글 답글 저장
	void insertReply(Customer2Dto c2dto);

	//관리자페이지에서 모든 게시글 가져오기
	ArrayList<Customer2Dto> selectAll1();



}
