package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.CounselDao;
import com.java.dto.CounselDto;

@Service
public class CounselServiceImpl implements CounselService {
	
	@Autowired CounselDao counselDao;
	
	@Override
	public void insertData(CounselDto cdto) {
		counselDao.insertData(cdto);
	}
	

	
}
