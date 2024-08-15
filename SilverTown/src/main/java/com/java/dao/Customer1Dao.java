package com.java.dao;


import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import com.java.dto.Customer1Dto;


@Mapper
public interface Customer1Dao {

	// 게시판 불러오기
	ArrayList<Customer1Dto> selectAll(int startRow, int endRow, String category, String sWord);

	// 게시글 개수
	int selectCount(String category, String sWord);

	// 게시글 가져오기(현재글,이전글,다음글)
	Customer1Dto selectOne(Customer1Dto c1dto);
	Customer1Dto selectOnePrev(Customer1Dto c1dto);
	Customer1Dto selectOneNext(Customer1Dto c1dto);

	// 조회수 증가
	void updateBhit(Customer1Dto c1dto);
	
	// 게시글 저장
	void insertBoard(Customer1Dto c1dto);

	// 게시글 삭제
	void deleteBoard(Customer1Dto c1dto);

	// 게시글 수정
	void updateBoard(Customer1Dto c1dto);

}
