package com.java.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.CounselDto;
import com.java.dto.MemberDto;
import com.java.service.CounselService;
import com.java.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
public class Customer3Controller {
	
	@Autowired
	private MemberService memberService;
	@Autowired private HttpSession session;
	@Autowired private CounselService counselService;
	
	@RequestMapping("/customer/customer3_list")	// 게시판 페이지
	public ModelAndView customer3_list() {
		String sessionId = (String) session.getAttribute("sessionId");
		ModelAndView mv = new ModelAndView();
		if(sessionId != null) {
			MemberDto mDto = memberService.findByUsername(sessionId);
			mv.addObject("mDto", mDto);
			mv.setViewName("customer/customer3_list");
			return mv;			
		}
			mv.setViewName("/index");
			return mv; 
	}// list
//	
	@RequestMapping("/customer/customer3_send")
	public String insertData(CounselDto cdto) {
		counselService.insertData(cdto);
		return "redirect:/index";
	}
}
