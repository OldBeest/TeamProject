package com.java.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.Customer2Dto;
import com.java.dto.FacilityDto;
import com.java.dto.MemberDto;
import com.java.dto.VisitorDto;
import com.java.service.AnalyticService;
import com.java.service.CrawlingService;
import com.java.service.Customer2Service;
import com.java.service.FacilityService;
import com.java.service.MemberService;
import com.java.service.VisitorService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	FacilityService facilityService;
	@Autowired
	VisitorService visitorService;
	@Autowired
	MemberService memberService;
	@Autowired 
	Customer2Service customer2Service;
	@Autowired
	CrawlingService crawlingService;
	@Autowired
	AnalyticService analyticService;
	
	@RequestMapping("/index")
	public ModelAndView index() {
		
		String today = visitorService.getCurrentDate();
		visitorService.checkAndInsertToday(today); // 오늘 날짜 없으면 추가
		VisitorDto vDto = visitorService.select(); // 오늘 날짜 방문자 수 조회
		
		//게시판 모든글 가져오기
		ArrayList<Customer2Dto> c2dto = customer2Service.selectAll1(); 
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("c2dtos", c2dto);
		mv.addObject("vDto", vDto); 
		mv.setViewName("/admin/index");
		return mv;
	}
	
	@RequestMapping("/boards/delete") // 게시글 삭제
	public String delete2(Customer2Dto c2dto) {
		customer2Service.delete2Post(c2dto);
		return "redirect:/admin/boards";
	}// delete

	//웹 크롤링 관리
	@RequestMapping("/crawling")
	public String crawlng_do() {
		return "/admin/crawling";
	}

	@RequestMapping("/crawling_do")
	public ModelAndView crawling() {
		Elements crawl_list = crawlingService.test();
		ModelAndView mv = new ModelAndView();

		mv.addObject("crawl_list", crawl_list);
		mv.setViewName("/admin/crawling_do");

		return mv;
	}

	
	//회원 정보 관리
	@RequestMapping("/members")
	public ModelAndView members() {
		
		ArrayList<MemberDto> list = memberService.selectAll();
		
		ModelAndView mv =  new ModelAndView();
		
		mv.addObject("list", list);
		mv.setViewName("/admin/members");
		return mv;
	}
	//시설 현황
	@RequestMapping("/facility")
	public ModelAndView facility1() {
		
		ArrayList<FacilityDto> list = facilityService.selectAll();
		
		ModelAndView mv =  new ModelAndView();
		
		mv.addObject("list", list);
		mv.setViewName("/admin/facility");
		return mv;
	}
	
	@RequestMapping("/countOne")
	public String countOne() {
		visitorService.countOne();
		return "redirect:/admin/index";
		
	}
	
	@RequestMapping("/countMinus")
	public String countMinus() {
		visitorService.countMinus();
		return "redirect:/admin/index";	
	}
	

	@RequestMapping("/boards")	//관리자 페이지에서 게시글 삭제
	public ModelAndView customer2_list() {
	
		ModelAndView mv = new ModelAndView();
		//게시판 모든글 가져오기
		ArrayList<Customer2Dto> c2dto = customer2Service.selectAll1(); 
		mv.addObject("c2dtos", c2dto);
		mv.setViewName("/admin/boards");
		return mv;
	}// list
	
	
	//db 관리
	@RequestMapping("/db")
	public String db() {
		return "/admin/db";
	}
	
	//분석
	@RequestMapping("/analytics")
	public ModelAndView traffic() {
		
		int total_cnt = analyticService.totalCount();
		int seoul_cnt = analyticService.regionCount("서울");
		int gyeonggi_cnt = analyticService.regionCount("경기");
		int incheon_cnt = analyticService.regionCount("인천");
		
		int seoul_per =  (int)(seoul_cnt / (double)total_cnt * 100);
		int gyeonggi_per =  (int)(gyeonggi_cnt / (double)total_cnt * 100);
		int incheon_per =  (int)(incheon_cnt / (double)total_cnt * 100);
		
		int male_cnt = analyticService.genderCount("남성");
		int female_cnt = analyticService.genderCount("여성");
		
		int male_per =  (int)(male_cnt / (double)total_cnt * 100);
		int female_per =  (int)(female_cnt / (double)total_cnt * 100);

		
		int cancer_cnt = analyticService.diseaseCount("암");
		int cva_cnt = analyticService.diseaseCount("뇌혈관질환");
		int cpr_cnt = analyticService.diseaseCount("심폐질환");
		int msd_cnt = analyticService.diseaseCount("근골격계질환");
		int cns_cnt = analyticService.diseaseCount("중추신경계질환");
		int dementia_cnt = analyticService.diseaseCount("치매");
		
		int cancer_per =  (int)(cancer_cnt / (double)total_cnt * 100);
		int cva_per =  (int)(cva_cnt / (double)total_cnt * 100);
		int cpr_per =  (int)(cpr_cnt / (double)total_cnt * 100);
		int msd_per =  (int)(msd_cnt / (double)total_cnt * 100);
		int cns_per =  (int)(cns_cnt / (double)total_cnt * 100);
		int dementia_per =  (int)(dementia_cnt / (double)total_cnt * 100);
		
		int city_p_cnt = analyticService.featureCount("도심위치");
		int bighospital_n_cnt = analyticService.featureCount("대형병원인접");
		int latest_f_cnt = analyticService.featureCount("최신시설");
		int female_s_cnt = analyticService.featureCount("여성전용");
		int cancer_s_cnt = analyticService.featureCount("암특화치료");
		int dementia_s_cnt = analyticService.featureCount("치매전문");
		
		int city_p_per =  (int)(city_p_cnt / (double)total_cnt * 100);
		int bighospital_n_per =  (int)(bighospital_n_cnt / (double)total_cnt * 100);
		int latest_f_per =  (int)(latest_f_cnt / (double)total_cnt * 100);
		int female_s_per =  (int)(female_s_cnt / (double)total_cnt * 100);
		int cancer_s_per =  (int)(cancer_s_cnt / (double)total_cnt * 100);
		int dementia_s_per =  (int)(dementia_s_cnt / (double)total_cnt * 100);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("total_cnt", total_cnt);
		mv.addObject("seoul_per", seoul_per);
		mv.addObject("gyeonggi_per", gyeonggi_per);
		mv.addObject("incheon_per", incheon_per);
		
		mv.addObject("male_per", male_per);
		mv.addObject("female_per", female_per);
		
		mv.addObject("cancer_per", cancer_per);
		mv.addObject("cva_per", cva_per);
		mv.addObject("cpr_per", cpr_per);
		mv.addObject("msd_per", msd_per);
		mv.addObject("cns_per", cns_per);
		mv.addObject("dementia_per", dementia_per);
		
		mv.addObject("city_p_per", city_p_per);
		mv.addObject("bighospital_n_per", bighospital_n_per);
		mv.addObject("latest_f_per", latest_f_per);
		mv.addObject("female_s_per", female_s_per);
		mv.addObject("cancer_s_per", cancer_s_per);
		mv.addObject("dementia_s_per", dementia_s_per);
		
		mv.setViewName("/admin/analytics");
		return mv;
	}
	
	
	// 월별 방문자 수
	@GetMapping("/api/get-monthly-data")
	@ResponseBody
	public List<VisitorDto> getMonthlyData(@RequestParam("month") int month){
//		System.out.println(visitorService.getMonthlyData(month));
		List<VisitorDto> list = visitorService.getMonthlyData(month);
		return list;
		
	};
	
	@RequestMapping("/tables")
	public String tables() {
		return "/admin/tables";
	}
	@RequestMapping("/charts")
	public String charts() {
		return "/admin/charts";
	}

}