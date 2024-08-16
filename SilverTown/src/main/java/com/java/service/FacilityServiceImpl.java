package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.FacilityDao;
import com.java.dto.FacilityDto;

@Service
public class FacilityServiceImpl implements FacilityService {
	
	@Autowired
	FacilityDao facilityDao;
	
	@Override
	public ArrayList<FacilityDto> selectAll() {
		
		ArrayList<FacilityDto> list = facilityDao.selectAll(); 
		return list;
	}
	
	@Override
	public ArrayList<FacilityDto> selectAD() {
		ArrayList<FacilityDto> listAD = facilityDao.selectAD();
		return listAD;
	}
	
}
