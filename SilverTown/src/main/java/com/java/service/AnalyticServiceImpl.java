package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.MemberDao;

@Service
public class AnalyticServiceImpl implements AnalyticService {
	
	@Autowired
	MemberDao memberDao;
	
	@Override
	public int totalCount() {
		return memberDao.totalCount();
	}
	
	@Override
	public int regionCount(String region) {
		
		return memberDao.regionCount(region);
	}
	
	@Override
	public int genderCount(String gender) {
		return memberDao.genderCount(gender);
	}
	@Override
	public int diseaseCount(String disease) {
		return memberDao.diseaseCount(disease);
	}
	
	@Override
	public int featureCount(String disease) {
		return memberDao.featureCount(disease);
	}
	
}
