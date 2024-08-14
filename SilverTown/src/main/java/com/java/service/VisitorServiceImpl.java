package com.java.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.VisitorDao;
import com.java.dto.VisitorDto;

@Service
public class VisitorServiceImpl implements VisitorService {
	
	@Autowired VisitorDao visitorDao;
	
	@Override
	public VisitorDto select() {
		
		String today = getCurrentDate(); // 오늘 날짜 가져옴
		return visitorDao.select(today); // 오늘 날짜 방문자 수 조회
	}
	
	//방문자수 증가
	@Override
	public void countOne() {
		
		String today = getCurrentDate();
		checkAndInsertToday(today); // 오늘 날짜가 없으면 추가
		visitorDao.countOne(today); // 오늘 날짜 방문자수 1 증가
		
	}
	// 방문자수 감소
	@Override
	public void countMinus() {
		
		String today = getCurrentDate();
		checkAndInsertToday(today);
		visitorDao.countMinus(today); // 1 감소
		
	}
	
	// 실시간 방문자 수 증가
	@Override
	public void checkAndInsertToday(String today) {
		Integer count = visitorDao.checkTodayExists(today);
		if(count == 0) {
			visitorDao.insertToday(today);
		}
	}
	
	// 오늘 날짜 가져오기
	@Override
	public String getCurrentDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		return sdf.format(new Date());
	}
	
	@Override
	public 	List<VisitorDto> getMonthlyData(int month){
		return visitorDao.getMonthlyData(month);
	};

	
	
}
