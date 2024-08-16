package com.java.service;

import java.util.ArrayList;

import com.java.dto.CounselDto;

public interface CounselService {
	
	void insertData(CounselDto cdto);
	
	ArrayList<CounselDto> select();
}
