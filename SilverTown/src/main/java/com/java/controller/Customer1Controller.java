package com.java.controller;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.Customer1Dto;
import com.java.service.Customer1Service;

@Controller
public class Customer1Controller {
	
	@Autowired Customer1Service customer1Service;
	
	@RequestMapping("/customer/customer1_list")	// 게시판 페이지
	public ModelAndView customer1_list(@RequestParam(defaultValue = "1")int page,
			String category, String sWord) {
		
		Map<String, Object> map = null;
//		Map<String, Object> map = customer1Service.selectAll(page,category,sWord);
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.setViewName("customer/customer1_list");
		return mv;
	}// list
	
	@RequestMapping("/customer/customer1_view")	// 뷰페이지
	public ModelAndView customer1_view(Customer1Dto c1dto,@RequestParam(defaultValue = "1")int page) {
		
		Map<String, Object> map = customer1Service.selectOne(c1dto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.addObject("page",page);
		mv.setViewName("customer/customer1_view");
		return mv;
	}// view
	
	@GetMapping("/customer/customer1_write") // 글쓰기화면
	public String customer1_write() {
		return "customer/customer1_write";
	}// write
	
	@PostMapping("/customer/customer1_write") //글쓰기 저장
	public String customer1_write(Customer1Dto c1dto,@RequestHeader MultipartFile files) {
		String uFile="";
		//파일이 존재할 시
		if(!files.isEmpty()) {
			//jsp
			long time = System.currentTimeMillis();
			System.out.println("time : "+time);
			
			uFile = String.format("%d_%s", time,files.getOriginalFilename());
			String saveUrl = "c:/upload/";
			File f = new File(saveUrl+uFile);
			try {
				files.transferTo(f);
			} catch (Exception e) {	e.printStackTrace();} //파일업로드
		}//if
		
		//변경된 파일이름 저장
		c1dto.setBfile(uFile);
		customer1Service.insertBoard(c1dto);
		return "redirect:/customer/customer1_list";
		
	}// write
	
	@RequestMapping("/customer/delete") // 게시글 삭제
	public String delete(Customer1Dto c1dto) {
		customer1Service.deleteBoard(c1dto);
		return "redirect:/customer/customer1_list";
	}// delete
	
	@RequestMapping("/customer/update") // 게시글 수정
	public ModelAndView update(Customer1Dto c1dto) { 
		Customer1Dto customer1Dto = customer1Service.updateBoard(c1dto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("customer1Dto",customer1Dto);
		mv.setViewName("/customer/customer1_modify");
		return mv;
		
	}// update
	
	@RequestMapping("/customer/doUpdate1") //게시글 수정저장
	public String doUpdate(Customer1Dto c1dto,@RequestPart MultipartFile files) {
		
		String uFile="";
		//파일이 존재할 시
		if(!files.isEmpty()) {
			//jsp
			long time = System.currentTimeMillis();
			System.out.println("time : "+time);
			
			uFile = String.format("%d_%s", time,files.getOriginalFilename());
			String saveUrl = "c:/upload/";
			File f = new File(saveUrl+uFile);
			try {
				files.transferTo(f);
			} catch (Exception e) {	e.printStackTrace();} //파일업로드
			//변경된 파일이름 저장
			c1dto.setBfile(uFile);
			
		}//if
		
		customer1Service.doUpdateBoard(c1dto);
		return "redirect:/customer/customer1_list";
	}// doUpdate
	
}// class
