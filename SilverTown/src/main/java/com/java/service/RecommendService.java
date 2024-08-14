package com.java.service;

import java.util.ArrayList;
import java.util.List;

import com.java.dto.FacilityDto;

public interface RecommendService {
	ArrayList<Double> requestPoint(String address);
    double calculateDistance(double y1, double x1, double y2, double x2);
    String extractRegion(String fullAddress);
    List<FacilityDto> getNearbyFacilities(double y, double x, List<String> diseaseList, List<String> featureList, int limit);
}