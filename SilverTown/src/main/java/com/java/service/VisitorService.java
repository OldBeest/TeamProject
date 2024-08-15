package com.java.service;

import java.util.List;

import com.java.dto.VisitorDto;

public interface VisitorService {

	VisitorDto select();
	void countOne();
	void countMinus();
	void checkAndInsertToday(String today); // 오늘 날짜가 없으면 추가
	String getCurrentDate(); // 현재 날짜 변환
	List<VisitorDto> getMonthlyData(int month);

}
