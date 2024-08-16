package com.java.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;


import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.dto.CrawlingDto;
import com.java.dto.FacilityDto;
import com.java.dto.MemberDto;
import com.java.dto.OAuthTokenDto;
import com.java.service.CrawlingService;
import com.java.service.FacilityService;
import com.java.service.MemberService;
import com.java.service.RecommendService;
import com.java.service.VisitorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FrontController {

    @Autowired private MemberService memberService;
    @Autowired private VisitorService visitorService;
    @Autowired private HttpSession session;
    @Autowired private CrawlingService crawlingService;
    @Autowired private RecommendService recommendService;
    @Autowired private FacilityService facilityService;

    private OAuthTokenDto oAuthTokenDto;

    @RequestMapping({"/", "/index"})
    public ModelAndView index(HttpServletRequest request) {
        // 오늘 날짜 처리 및 방문자 수 체크
        String today = visitorService.getCurrentDate();
        visitorService.checkAndInsertToday(today);

        HttpSession session = request.getSession();
        if (session.getAttribute("visited") == null) {
            visitorService.countOne(); // DB 방문자 수 증가
            session.setAttribute("visited", true);
        }

        // 세션 ID 가져오기
        String sessionId = (String) session.getAttribute("sessionId");
        ModelAndView mv = new ModelAndView();

        if (sessionId != null) {
            MemberDto memberDto = memberService.findByUsername(sessionId);
            if (memberDto != null) {
                String fullAddress = memberDto.getAddress();
                String region = recommendService.extractRegion(fullAddress);
                ArrayList<Double> coordinates = recommendService.requestPoint(fullAddress);
                
                double my_y_cor = coordinates.get(0);
                double my_x_cor = coordinates.get(1);
                List<String> diseaseList = Arrays.asList(memberDto.getDisease().split(","));
                List<String> featureList = Arrays.asList(memberDto.getFeature().split(","));
                
                List<FacilityDto> nearbyFacilities = recommendService.getNearbyFacilities(my_y_cor, my_x_cor, diseaseList, featureList, 5);
                mv.addObject("my_y_cor", my_y_cor);
                mv.addObject("my_x_cor", my_x_cor);
                mv.addObject("nearbyFacilities", nearbyFacilities);
            }
        }else {
        	 String fullAddress = "서울특별시 구로구 디지털로34길 27";
             String region = recommendService.extractRegion(fullAddress);
             ArrayList<Double> coordinates = recommendService.requestPoint(fullAddress);
             
             double my_y_cor = coordinates.get(0);
             double my_x_cor = coordinates.get(1);
             List<String> diseaseList = Arrays.asList("암".split(","));
             List<String> featureList = Arrays.asList("최신시설".split(","));
             
             List<FacilityDto> nearbyFacilities = recommendService.getNearbyFacilities(my_y_cor, my_x_cor, diseaseList, featureList, 5);
             mv.addObject("my_y_cor", my_y_cor);
             mv.addObject("my_x_cor", my_x_cor);
             mv.addObject("nearbyFacilities", nearbyFacilities);
        }

        // 크롤링 데이터 추가
        Elements crawl_list = crawlingService.test();
        ArrayList<CrawlingDto> crawl_db = crawlingService.select();
        // 광고 시설 추가
        ArrayList<FacilityDto> listAD = facilityService.selectAD();
        
        mv.addObject("ad_list", listAD);
        mv.addObject("crawl_list", crawl_list);
        mv.addObject("crawl_db", crawl_db);
        mv.addObject("sessionId", sessionId);
        mv.setViewName("/index");

        return mv;
    }

    // 소개 페이지
    @RequestMapping("/intro")
    public String intro() {
        return "intro";
    }

    @RequestMapping("/introduce/introduce1")
    public String introduce1() {
        return "/introduce/introduce1";
    }

    @RequestMapping("/introduce/introduce2")
    public String introduce2() {
        return "/introduce/introduce2";
    }

    @RequestMapping("/introduce/introduce3")
    public String introduce3() {
        return "/introduce/introduce3";
    }

    // 검색 페이지
    @RequestMapping("/search/search1")
    public String search1() {
        return "/search/search1";
    }

    @RequestMapping("/search/search2")
    public String search2() {
        return "/search/search2";
    }

    // 정보 페이지
    @RequestMapping("/information/information1")
    public String information1() {
        return "information/information1";
    }

    @RequestMapping("/information/information2")
    public String information2() {
        return "information/information2";
    }

    @RequestMapping("/information/information3")
    public String information3() {
        return "information/information3";
    }

    // 시설검색 페이지
    @RequestMapping("/db_map")
    public String db_map() {
        return "db_map";
    }

    @RequestMapping("/map_test")
    public String map_test() {
        return "map_test";
    }

    @RequestMapping("/keyword_map")
    public String keyword_map() {
        return "keyword_map";
    }

    @RequestMapping("/keyword_map2")
    public String keyword_map2() {
        return "keyword_map2";
    }

    @RequestMapping("/mapmap")
    public String mapmap() {
        return "mapmap";
    }

    @RequestMapping("/customer/customer2")
    public String customer1() {
        return "customer/customer2_list";
    }

    // 챗봇 페이지
    @RequestMapping("/chatbot/index")
    public ModelAndView chatbot_index() {
        ModelAndView mav = new ModelAndView();

        String url = "http://127.0.0.1:5000/tospring";
        StringBuilder sb = new StringBuilder();
        try {
            HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }

            if (sb.toString().contains("ok")) {
                System.out.println("test");
            }
            br.close();

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        mav.addObject("test1", sb.toString());
        mav.addObject("fail", false);
        mav.setViewName("/chatbot/index");
        return mav;
    }

}
