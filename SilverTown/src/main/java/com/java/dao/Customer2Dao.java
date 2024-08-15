package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Customer2Dto;

@Mapper
public interface Customer2Dao {

	// 게시판 불러오기
	ArrayList<Customer2Dto> selectAll(int startRow, int endRow, String category, String sWord);

	// 게시글 개수
	int selectCount(String category, String sWord);
	
	// 게시글 가져오기(현재글,이전글,다음글)
	Customer2Dto selectOne(Customer2Dto c2dto);
	Customer2Dto selectOnePrev(Customer2Dto c2dto);
	Customer2Dto selectOneNext(Customer2Dto c2dto);

	// 조회수 증가
	void updateBhit(Customer2Dto c2dto);
	
	// 게시글 저장
	void insertBoard(Customer2Dto c2dto);

	// 게시글 삭제
	void deleteBoard(Customer2Dto c2dto);
	
	// 게시글 수정
	void updateBoard(Customer2Dto c2dto);
	void updatePost_hit(Customer2Dto c2dto);
	
	// 게시글 저장
	void insertPost(Customer2Dto c2dto);

	// 게시글 삭제
	void delete2Post(Customer2Dto c2dto);
	
	// 게시글 수정
	void update2Post(Customer2Dto c2dto);

	// step 1씩 증가
	void updatePost_step(Customer2Dto c2dto);

	// 답글페이지 저장
	void insertReply(Customer2Dto c2dto);
	
	//관리자에서 모든 게시글 가져오기
	ArrayList<Customer2Dto> selectAll1();






}
