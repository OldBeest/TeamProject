package com.java.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.FacilityDto;

@Mapper
public interface FacilityDao {

	ArrayList<FacilityDto> selectAll();

}
