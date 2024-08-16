package com.java.service;

import java.util.ArrayList;

import com.java.dto.FacilityDto;

public interface FacilityService {

	ArrayList<FacilityDto> selectAll();
	
	ArrayList<FacilityDto> selectAD();

}
