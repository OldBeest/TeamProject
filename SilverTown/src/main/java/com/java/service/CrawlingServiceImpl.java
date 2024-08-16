package com.java.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.CrawlingDao;
import com.java.dto.CrawlingDto;

@Service
public class CrawlingServiceImpl implements CrawlingService {

	@Autowired CrawlingDao crawlingDao;
	
	public Elements test() {
		Document doc;
		try {
			doc = Jsoup.connect("https://news.naver.com/breakingnews/section/103/241").get();
			Elements crawl_list = doc.select(".sa_item");

//			for(int i=0; i<3; i++) {
//				System.out.println("제목 : " + crawl_list.get(i).select("strong").text());
//				System.out.println("본문 : " + crawl_list.get(i).select(".sa_text_lede").text() + "...");
//				System.out.println("링크 : " + crawl_list.get(i).select(".sa_text").select("a").attr("href"));				
//			}
			return crawl_list;



		} catch (IOException e) {

			e.printStackTrace();
			System.out.println("웹페이지 크롤링 실패!");

		}
		return null;


	}
	
	@Override
	public ArrayList<CrawlingDto> select() {
		return crawlingDao.select();
	}
	@Override
    public List<CrawlingDto> getAllVideos() {
        return crawlingDao.getAllVideos();
    }
    @Override
    public void updateVideoUrl(String oldVideoUrl, String newVideoUrl) {
        crawlingDao.updateVideoUrl(oldVideoUrl, newVideoUrl);
    }
	
	
}