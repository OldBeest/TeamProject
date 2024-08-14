package com.java.controller;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.java.dto.Customer2Dto;
import com.java.service.Customer2Service;

@Controller
public class Customer2Controller {

	@Autowired Customer2Service customer2Service;
	
	@RequestMapping("/customer/customer2_list")	// 게시판 페이지
	public ModelAndView customer2_list(@RequestParam(defaultValue = "1")int page,
			String category, String sWord) {
		
		Map<String, Object> map = customer2Service.selectAll(page,category,sWord);
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.setViewName("customer/customer2_list");
		return mv;
	}// list
	
	@RequestMapping("/customer/customer2_view")	// 뷰페이지
	public ModelAndView customer2_view(Customer2Dto c2dto,@RequestParam(defaultValue = "1")int page) {
		
		Map<String, Object> map = customer2Service.selectOne(c2dto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("map",map);
		mv.setViewName("customer/customer2_view");
		return mv;
	}// view
	
	@GetMapping("/customer/customer2_write") // 글쓰기화면
	public String customer2_write() {
		return "customer/customer2_write";
	}// write
	
	@PostMapping("/customer/customer2_write") //글쓰기 저장
	public String customer2_write(Customer2Dto c2dto,@RequestPart MultipartFile files) {
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
		c2dto.setPost_file(uFile);
		
		customer2Service.insertPost(c2dto);
		
		return "redirect:/customer/customer2_list";
	}// write
	
	@RequestMapping("/customer/delete2") // 게시글 삭제
	public String delete2(Customer2Dto c2dto) {
		customer2Service.delete2Post(c2dto);
		return "redirect:/customer/customer2_list";
	}// delete
	
	@RequestMapping("/customer/update2") // 게시글 수정
	public ModelAndView update2(Customer2Dto c2dto) { 
		Customer2Dto customer2Dto = customer2Service.update2Post(c2dto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("customer2Dto",customer2Dto);
		mv.setViewName("/customer/customer2_modify");
		return mv;
		
	}// update

	@RequestMapping("/customer/doUpdate2") //게시글 수정저장
	public String doUpdate2(Customer2Dto c2dto,@RequestPart MultipartFile files) {
		
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
			c2dto.setPost_file(uFile);
			
		}//if
		
		customer2Service.doUpdate2Post(c2dto);
		return "redirect:/customer/customer2_list";
	}// doUpdate

	@RequestMapping("/customer/customer2_reply") //답글페이지
	public ModelAndView customer2_reply(Customer2Dto c2dto) {
		Map<String, Object> map = customer2Service.selectOne(c2dto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("customer2Dto",map.get("customer2Dto"));
		mv.setViewName("customer/customer2_reply");
		return mv;
		
	}//reply
	
	@RequestMapping("/customer/doReply") //답글페이지 저장
	public String doReply(Customer2Dto c2dto,@RequestPart MultipartFile files) {
		String uFile="";
		//파일이 존재할 시
		if(!files.isEmpty()) {
			long time = System.currentTimeMillis();
			System.out.println("time : "+time);
			
			uFile = String.format("%d_%s", time,files.getOriginalFilename());
			String saveUrl = "c:/upload/";
			File f = new File(saveUrl+uFile);
			try {
				files.transferTo(f);
			} catch (Exception e) {	e.printStackTrace();} //파일업로드
		}//if
		
		c2dto.setPost_file(uFile);
		
		customer2Service.insertReply(c2dto);
		
		return "redirect:/customer/customer2_list";
		
	}//doReply
	
}// class