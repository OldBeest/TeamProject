package com.java.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.java.dto.FacilityDto;

@Mapper
public interface RecommendDao {
    // 좌표 기반으로 근처 시설 정보 가져오기
    List<FacilityDto> getNearbyFacilities(
        @Param("yCor") double yCor,
        @Param("xCor") double xCor,
        @Param("diseaseList") List<String> diseaseList,
        @Param("featureList") List<String> featureList,
        @Param("limit") int limit
    );
}