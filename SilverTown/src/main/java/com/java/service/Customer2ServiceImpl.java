package com.java.service;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.Customer2Dao;
import com.java.dto.Customer2Dto;

@Service
public class Customer2ServiceImpl implements Customer2Service {


	@Autowired Customer2Dao customer2Dao;
	
	@Override	// 게시판 불러오기
	public Map<String, Object> selectAll(int page, String category, String sWord) {

		// --------------하단넘버링-----------------------------
		int countPerPage = 10; // 1페이지당 게시글 수
		int bottomPerNum = 10; // 하단넘버링 개수
		int countAll = customer2Dao.selectCount(category,sWord); // 게시글 총 개수
		
		// 최대페이지
		int maxPage = (int) Math.ceil((double)countAll/countPerPage);
		int startPage = ((page-1)/bottomPerNum)*bottomPerNum+1;
		int endPage = (startPage+bottomPerNum)-1;
		
		// 마지막 넘버링이 최대페이지 숫자보다 크면
		if(endPage>maxPage) endPage = maxPage;
		
		// 게시글 페이지에서 가져올 게시글 번호
		int startRow = (page-1)*countPerPage+1;
		int endRow = startRow+countPerPage+1;
		// --------------하단넘버링-----------------------------
		
		//mybatis연결해서 list 가져오기 - 게시글, 검색 포함
		ArrayList<Customer2Dto> list = customer2Dao.selectAll(startRow,endRow,category,sWord);
	
		Map<String, Object> map = new HashMap<>();
		map.put("list",list);
		map.put("countAll",countAll);
		map.put("startPage",startPage);
		map.put("endPage",endPage);
		map.put("maxPage",maxPage);
		map.put("page",page);
		map.put("category",category);
		map.put("sWord",sWord);

		return map;
		
	}// selectAll
	
	@Override	// 게시글 불러오기
	public Map<String, Object> selectOne(Customer2Dto c2dto) {
		customer2Dao.updatePost_hit(c2dto); // 조회수 증가
		Customer2Dto customer2Dto = customer2Dao.selectOne(c2dto);
		Customer2Dto prevDto = customer2Dao.selectOnePrev(c2dto);
		Customer2Dto nextDto = customer2Dao.selectOneNext(c2dto);
		
		Map<String, Object> map = new HashMap<>();
		map.put("customer2Dto", customer2Dto);
		map.put("prevDto", prevDto);
		map.put("nextDto", nextDto);
		return map;
		
	}// selectOne

	@Override	// 게시글 저장
	public void insertPost(Customer2Dto c2dto) {
		customer2Dao.insertPost(c2dto);
	}// insertPost

	@Override	// 게시글 삭제
	public void delete2Post(Customer2Dto c2dto) {
		customer2Dao.delete2Post(c2dto);
	}// delete2Post

	@Override	// 게시글 수정
	public Customer2Dto update2Post(Customer2Dto c2dto) {
		Customer2Dto customer2Dto = customer2Dao.selectOne(c2dto);
		return customer2Dto;
	}// update2Post

	@Override	// 게시글 수정 저장
	public void doUpdate2Post(Customer2Dto c2dto) {
		customer2Dao.update2Post(c2dto);
	}// doUpdate2Post

	@Override // 답글 페이지 저장
	public void insertReply(Customer2Dto c2dto) {
		customer2Dao.updatePost_step(c2dto);
		customer2Dao.insertReply(c2dto);
	}//insertReply
	
	@Override
	public ArrayList<Customer2Dto> selectAll1() {
		ArrayList<Customer2Dto> c2dto = customer2Dao.selectAll1();

		return c2dto;
	}



}// class

