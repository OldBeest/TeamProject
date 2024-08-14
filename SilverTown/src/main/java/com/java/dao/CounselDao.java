package com.java.dao;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.CounselDto;

@Mapper
public interface CounselDao {
	
	void insertData(CounselDto cdto);
}
