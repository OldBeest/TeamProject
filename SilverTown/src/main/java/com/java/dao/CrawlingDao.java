package com.java.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.java.dto.CrawlingDto;

@Mapper
public interface CrawlingDao {
	
	ArrayList<CrawlingDto> select(); 
	
	List<CrawlingDto> getAllVideos();
    void updateVideoUrl(@Param("oldVideoUrl") String oldVideoUrl, @Param("newVideoUrl") String newVideoUrl);
}