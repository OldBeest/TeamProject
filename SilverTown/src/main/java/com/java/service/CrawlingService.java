package com.java.service;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.select.Elements;

import com.java.dto.CrawlingDto;

public interface CrawlingService {
	Elements test();
	
	ArrayList<CrawlingDto> select();
	
	List<CrawlingDto> getAllVideos();
    void updateVideoUrl(String oldVideoUrl, String newVideoUrl);
}