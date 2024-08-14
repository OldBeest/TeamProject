package com.java.service;

public interface AnalyticService {
	
	int totalCount();
	
	int regionCount(String region);

	int genderCount(String gender);

	int diseaseCount(String string);

	int featureCount(String string);
	
}
