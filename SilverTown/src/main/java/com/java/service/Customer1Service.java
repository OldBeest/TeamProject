package com.java.service;

import java.util.ArrayList;
import java.util.Map;

import com.java.dto.Customer1Dto;

public interface Customer1Service {

	Map<String, Object> selectAll(int page, String category, String sWord);

	Map<String, Object> selectOne(Customer1Dto c1dto);

	void insertBoard(Customer1Dto c1dto);

	void deleteBoard(Customer1Dto c1dto);

	Customer1Dto updateBoard(Customer1Dto c1dto);

	void doUpdateBoard(Customer1Dto c1dto);


}
