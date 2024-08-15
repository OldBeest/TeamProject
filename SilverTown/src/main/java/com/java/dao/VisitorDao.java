package com.java.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.java.dto.VisitorDto;

@Mapper
public interface VisitorDao {

	VisitorDto select(@Param("today") String today);
	void countOne(@Param("today") String today);
	void countMinus(@Param("today") String today);
	void insertToday(@Param("today") String today);
	Integer checkTodayExists(@Param("today") String today);
	List<VisitorDto> getMonthlyData(int month);
	
}