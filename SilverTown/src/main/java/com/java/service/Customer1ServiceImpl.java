package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.Customer1Dao;
import com.java.dto.Customer1Dto;

@Service
public class Customer1ServiceImpl implements Customer1Service {

	@Autowired Customer1Dao customer1Dao;
	
	@Override
	public Map<String, Object> selectAll(int page, String category, String sWord) {
		// --------------하단넘버링-----------------------------
		int countPerPage = 10; // 1페이지당 게시글 수
		int bottomPerNum = 10; // 하단넘버링 개수
		int countAll = customer1Dao.selectCount(category,sWord); // 게시글 총 개수
		
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
		ArrayList<Customer1Dto> list = customer1Dao.selectAll(startRow,endRow,category,sWord);
		
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
	}

	@Override
	public Map<String, Object> selectOne(Customer1Dto c1dto) {
		customer1Dao.updateBhit(c1dto); // 조회수 증가
		Customer1Dto customer1Dto = customer1Dao.selectOne(c1dto);
		Customer1Dto prevDto = customer1Dao.selectOnePrev(c1dto);
		Customer1Dto nextDto = customer1Dao.selectOneNext(c1dto);
		
		Map<String, Object> map = new HashMap<>();
		map.put("customer1Dto", customer1Dto);
		map.put("prevDto", prevDto);
		map.put("nextDto", nextDto);
		return map;
	}

	@Override	// 게시글 저장
	public void insertBoard(Customer1Dto c1dto) {
		customer1Dao.insertBoard(c1dto);
	}// insertBoard

	@Override	// 게시글 삭제
	public void deleteBoard(Customer1Dto c1dto) {
		customer1Dao.deleteBoard(c1dto);
	}// deleteBoard

	@Override	// 게시글 수정
	public Customer1Dto updateBoard(Customer1Dto c1dto) {
		Customer1Dto customer1Dto = customer1Dao.selectOne(c1dto);
		return customer1Dto;
	}// updateBoard

	@Override	// 게시글 수정 저장
	public void doUpdateBoard(Customer1Dto c1dto) {
		customer1Dao.updateBoard(c1dto);
	}// doUpdateBoard

}// class
