package com.java.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.dto.KakaoDto;
import com.java.dto.KakaoLogoutDto;
import com.java.dto.MemberDto;
import com.java.dto.OAuthTokenDto;
import com.java.service.MemberService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private HttpSession session;

	// @Autowired private JavaMailSender mailSender;

	private OAuthTokenDto oAuthTokenDto;

	// 로그인 페이지로 이동
	@GetMapping("/member/signin")
	public ModelAndView signin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("member/signin");
		String rememberedId = null;

		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("rememberedId".equals(cookie.getName())) {
					rememberedId = cookie.getValue();
				} else if ("autoLoginToken".equals(cookie.getName())) {
					MemberDto memberDto = memberService.findByAutoLoginToken(cookie.getValue());
					if (memberDto != null) {
						session.setAttribute("sessionId", memberDto.getId());
						mv.setViewName("redirect:/");
						return mv;
					}
				}
			}
		}
		mv.addObject("rememberedId", rememberedId);
		return mv;
	}

	// 로그인 처리
	@PostMapping("/member/signin")
	public ModelAndView signin(MemberDto memberDto, String rememberId, String autoLogin, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();

		// 로그인 시도
		MemberDto mDto = memberService.selectSignIn(memberDto);
		if (mDto == null) {
			// 임시 비밀번호로 로그인 시도
			mDto = memberService.findByUsername(memberDto.getId());
			if (mDto != null && memberDto.getPw().equals(mDto.getTempPw())) {
				memberService.updatePassword(memberDto);
			} else {
				mv.addObject("chkSignIn", 0);
				mv.setViewName("member/dosignin");
				return mv;
			}
		}
		// 세션 설정
		session.setAttribute("sessionId", mDto.getId());
		session.setAttribute("sessionPw", mDto.getPw());
		// 아이디 저장 처리
		handleRememberMe(rememberId, mDto.getId(), response);
		handleAutoLogin(autoLogin, mDto, response);
		// 로그인 처리
		mv.addObject("chkSignIn", 1);
		mv.setViewName("member/dosignin");
		return mv;
	}

	// 아이디 저장 처리 메서드
	private void handleRememberMe(String rememberId, String memberId, HttpServletResponse response) {
		Cookie rememberCookie = new Cookie("rememberedId", "remember".equals(rememberId) ? memberId : null);
		rememberCookie.setMaxAge("remember".equals(rememberId) ? 60 * 60 * 24 * 30 : 0);
		rememberCookie.setPath("/");
		response.addCookie(rememberCookie);
	}

	// 자동 로그인 처리 메서드
	private void handleAutoLogin(String autoLogin, MemberDto mDto, HttpServletResponse response) {
		String autoLoginToken = "autoLogin".equals(autoLogin) ? memberService.generateAutoLoginToken(mDto) : null;
		Cookie autoLoginCookie = new Cookie("autoLoginToken", autoLoginToken);
		autoLoginCookie.setMaxAge("autoLogin".equals(autoLogin) ? 60 * 60 * 24 * 30 : 0);
		autoLoginCookie.setPath("/");
		response.addCookie(autoLoginCookie);
	}

	// 로그아웃 처리
	@RequestMapping("/member/signout")
	public ModelAndView signout(HttpServletResponse response) {
		session.invalidate();

		Cookie autoLoginCookie = new Cookie("autoLoginToken", null);
		autoLoginCookie.setMaxAge(0);
		autoLoginCookie.setPath("/");
		response.addCookie(autoLoginCookie);

		ModelAndView mv = new ModelAndView("member/dosignin");
		mv.addObject("chkSignIn", 3);
		return mv;
	}

	// 비밀번호 찾기 페이지로 이동
	@GetMapping("/member/forgotPassword")
	public String forgotPasswordForm() {
		return "member/forgotPassword";
	}

	// 비밀번호 찾기 처리
	@PostMapping("/member/forgotPassword")
	public ModelAndView forgotPassword(@RequestParam("id") String id) {
		ModelAndView mv = new ModelAndView();
		// 사용자 정보 찾기
		MemberDto memberDto = memberService.findByUsername(id);
		if (memberDto == null) {
			mv.addObject("message", "해당 아이디가 존재하지 않습니다.");
			mv.setViewName("member/forgotPasswordForm");
			return mv;
		}
		// 임시 비밀번호 생성 및 업데이트
		String tempPassword = generateTempPassword();
		memberDto.setPw(tempPassword);
		memberService.updatePassword(memberDto);

		// 2024.07.30 이메일 잠시 비활성화
		// sendEmail(memberDto.getEmail(), "임시 비밀번호 발급", "임시 비밀번호: " + tempPassword);

		mv.addObject("message", "임시 비밀번호가 이메일로 전송되었습니다.");
		mv.setViewName("member/forgotPassword");
		return mv;
	}

	// 임시 비밀번호 생성 메서드
	private String generateTempPassword() {
		Random random = new Random();
		StringBuilder tempPassword = new StringBuilder();
		for (int i = 0; i < 8; i++) {
			tempPassword.append((char) (random.nextInt(26) + 'a'));
		}
		return tempPassword.toString();
	}

	// 카카오 로그인 처리
	@RequestMapping("/kakao/oauth")
	public String oauth(String code) {
		String oauthUrl = "https://kauth.kakao.com/oauth/token";
		OAuthTokenDto oAuthTokenDto = requestKakaoToken(oauthUrl, code);

		String oauthUserUrl = "https://kapi.kakao.com/v2/user/me";
		KakaoDto kakaoDto = requestKakaoUser(oauthUserUrl, oAuthTokenDto.getAccess_token());

		session.setAttribute("session_id", kakaoDto.getId());
		session.setAttribute("session_nickName", kakaoDto.getProperties().getNickname());

		return "redirect:/";
	}

	// 카카오 토큰 요청 메서드
	private OAuthTokenDto requestKakaoToken(String url, String code) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "19855f07670ed426b71b6c31e02bb899");
		params.add("redirect_uri", "http://localhost:8181/kakao/oauth");
		params.add("code", code);

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
		ResponseEntity<String> response = new RestTemplate().exchange(url, HttpMethod.POST, request, String.class);

		try {
			return new ObjectMapper().readValue(response.getBody(), OAuthTokenDto.class);
		} catch (Exception e) {
			throw new RuntimeException("Failed to get OAuth token", e);
		}
	}

	// 카카오 사용자 정보 요청 메서드
	private KakaoDto requestKakaoUser(String url, String accessToken) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + accessToken);
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(headers);
		ResponseEntity<String> response = new RestTemplate().exchange(url, HttpMethod.POST, request, String.class);

		try {
			return new ObjectMapper().readValue(response.getBody(), KakaoDto.class);
		} catch (Exception e) {
			throw new RuntimeException("Failed to get Kakao user", e);
		}
	}

	// 카카오 로그아웃 처리
	@RequestMapping("/kakao/logout")
	public String logout() {
		if (oAuthTokenDto != null && oAuthTokenDto.getAccess_token() != null) {
			String oauthLogoutUrl = "https://kapi.kakao.com/v1/user/unlink";
			logoutKakaoUser(oauthLogoutUrl, oAuthTokenDto.getAccess_token());
		}

		session.invalidate();
		return "redirect:/";
	}

	// 카카오 로그아웃 요청 메서드
	private void logoutKakaoUser(String url, String accessToken) {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + accessToken);

		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(headers);
		new RestTemplate().exchange(url, HttpMethod.POST, request, String.class);
	}

	/*
	 * 2024.07.30 이메일 잠시 비활성화 // 이메일 전송 메서드 private void sendEmail(String to, String
	 * subject, String text) { SimpleMailMessage message = new SimpleMailMessage();
	 * message.setTo(to); message.setSubject(subject); message.setText(text);
	 * mailSender.send(message); }
	 */

	// 회원가입 페이지로 이동
	@GetMapping("/member/signup1")
	public String signUp1() {
		return "member/signup1";
	}

	// 개인: 회원가입
	@GetMapping("/member/signup2")
	public String signup2() {
		return "/member/signup2";
	}

	// 주소 검색 팝업 페이지 요청
	@GetMapping("/member/addressSearch")
	public String addressSearchPopup() {
		return "member/addressSearch";
	}

	// 회원가입
	@PostMapping("/member/signup2")
	@ResponseBody
	public Map<String, String> signup(@RequestBody MemberDto memberDto) {
		Map<String, String> response = new HashMap<>();
		try {
			memberService.insertMember(memberDto);
			response.put("status", "success");
		} catch (Exception e) {
			e.printStackTrace();
			response.put("status", "fail");
		}
		return response;
	}

	// 단체,기업: 회원가입
	@GetMapping("/member/signup3")
	public String signup3() {
		return "/member/signup3";
	}

	// 단체,기업 회원정보 저장
	@PostMapping("/member/signup3")
	public String signup3(MemberDto memberDto) {
		memberDto.setAddress("");
		memberDto.setGender("");
		memberDto.setDisease("");
		memberDto.setFeature("");
		memberService.insertMember(memberDto);
		return "/member/signin";
	}

	// 아이디 중복체크
	@ResponseBody
	@GetMapping("/member/checkId")
	public Map<String, Boolean> checkId(@RequestParam("id") String id) {
//    	System.out.println("sessionID : "+);
		boolean isDuplicated = memberService.isIdDuplicated(id);
		Map<String, Boolean> response = new HashMap<>();
		response.put("isDuplicated", isDuplicated);
		return response;
	}

	// 회원정보 페이지
	@RequestMapping("/myinfo/myinfo")
	public ModelAndView myinfo() {
        ModelAndView mv = new ModelAndView();
        String id = (String) session.getAttribute("sessionId");
        MemberDto memberDto = memberService.selectOne(id);
        
     // 중복 제거를 위해 HashSet 사용
        List<String> selectedDiseases = memberDto.getDisease() != null ? 
                                        new ArrayList<>(new HashSet<>(Arrays.asList(memberDto.getDisease().split(",")))) : new ArrayList<>();
        List<String> selectedFeatures = memberDto.getFeature() != null ? 
                                        new ArrayList<>(new HashSet<>(Arrays.asList(memberDto.getFeature().split(",")))) : new ArrayList<>();
        mv.addObject("memberDto", memberDto);
        mv.addObject("selectedDiseases", selectedDiseases);
        mv.addObject("selectedFeatures", selectedFeatures);
        mv.setViewName("myinfo/myinfo");
		return mv;
	}
	
	@RequestMapping("/myinfo/myinfo2")
	public ModelAndView myinfo2() {
		ModelAndView mv = new ModelAndView();
		String id = (String) session.getAttribute("sessionId");
		MemberDto memberDto = memberService.selectOne(id);
		
		// 중복 제거를 위해 HashSet 사용
		List<String> selectedDiseases = memberDto.getDisease() != null ? 
				new ArrayList<>(new HashSet<>(Arrays.asList(memberDto.getDisease().split(",")))) : new ArrayList<>();
		List<String> selectedFeatures = memberDto.getFeature() != null ? 
				new ArrayList<>(new HashSet<>(Arrays.asList(memberDto.getFeature().split(",")))) : new ArrayList<>();
		mv.addObject("memberDto", memberDto);
		mv.addObject("selectedDiseases", selectedDiseases);
		mv.addObject("selectedFeatures", selectedFeatures);
		mv.setViewName("myinfo/myinfo2");
		return mv;
	}
		
	//회원정보 수정
	@PostMapping("/myinfo/update")
	public String updateMember(@ModelAttribute MemberDto memberDto) {
	    memberService.updateMember(memberDto);
	    return "redirect:/myinfo/myinfo";
	}
	
	// 주소 업데이트를 위한 메서드
    @PostMapping("/myinfo/updateAddress")
    @ResponseBody
    public Map<String, String> updateAddress(@RequestBody Map<String, String> requestData) {
        String newAddress = requestData.get("address");
        String id = (String) session.getAttribute("sessionId");
        MemberDto memberDto = memberService.selectOne(id);

        Map<String, String> response = new HashMap<>();
        try {
            memberDto.setAddress(newAddress);
            memberService.updateMember(memberDto);
            response.put("status", "success");
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "fail");
        }
        return response;
    }
	
	// 팝업창 페이지 요청
	@RequestMapping("/myinfo/updatePopup")
	public ModelAndView updatePopup(@RequestParam("field") String field, @RequestParam("value") String value) {
		ModelAndView mv = new ModelAndView("myinfo/updatePopup");
		mv.addObject("field", field);
		mv.addObject("value", value);
		return mv;
	}

	// 필드 업데이트 처리
	@PostMapping("/myinfo/updateField")
	public String updateField(@RequestParam("field") String field, @RequestParam("value") String[] values) {
		String sessionId = (String) session.getAttribute("sessionId");
		MemberDto memberDto = memberService.findByUsername(sessionId);

		String value = String.join(",", values);

		switch (field) {
		case "email":
			memberDto.setEmail(value);
			break;
		case "name":
			memberDto.setName(value);
			break;
		case "address":
			memberDto.setAddress(value);
			break;
		case "phone":
			memberDto.setPhone(value);
			break;
		case "disease":
			memberDto.setDisease(value);
			break;
		case "feature":
			memberDto.setFeature(value);
			break;
		}

		memberService.updateMemberInfo(memberDto);
		return "redirect:/myinfo/myinfo";
	}

	// 회원 탈퇴 확인 페이지로 이동
	@GetMapping("/myinfo/confirmDelete")
	public String confirmDelete() {
		return "myinfo/confirmDelete";
	}

	// 회원탈퇴
		@RequestMapping("/member/delete")
		public String delete(HttpSession session,HttpServletResponse response) {
			String id = (String) session.getAttribute("sessionId");
			memberService.deleteMember(id);
			 // 로그아웃 처리
	        session.invalidate();
	        Cookie autoLoginCookie = new Cookie("autoLoginToken", null);
	        autoLoginCookie.setMaxAge(0);
	        autoLoginCookie.setPath("/");
	        response.addCookie(autoLoginCookie);
			return "redirect:/index"; 
		}

	// 비밀번호 체크
	@RequestMapping("/myinfo/passwordCheck")
	public String passwordCheck() {
		return "myinfo/passwordCheck";
	}

	// 비밀번호 확인 처리
	@PostMapping("/myinfo/passwordCheck")
	public ModelAndView passwordCheck(@RequestParam("password") String password) {
		String id = (String) session.getAttribute("sessionId");
		MemberDto memberDto = memberService.findByUsername(id);
		ModelAndView mv = new ModelAndView();

		if (memberDto != null && memberDto.getPw().equals(password)) {
			mv.setViewName("redirect:/myinfo/myinfo3");
		} else {
			mv.addObject("errorMessage", "비밀번호가 일치하지 않습니다.");
			mv.setViewName("myinfo/passwordCheck");
		}

		return mv;
	}

	// 비밀번호 변경 페이지로 이동
	@RequestMapping("/myinfo/myinfo3")
	public String changePasswordForm() {
		return "myinfo/myinfo3";
	}

	// 비밀번호 변경
	@PostMapping("/myinfo/updatePassword")
	public ModelAndView updatePassword(@RequestParam("newPassword") String newPassword,
			@RequestParam("confirmPassword") String confirmPassword, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		String id = (String) session.getAttribute("sessionId");

		if (newPassword.equals(confirmPassword)) {
			MemberDto memberDto = memberService.findByUsername(id);
			if (memberDto != null) {
				memberDto.setPw(newPassword);
				memberService.updatePassword(memberDto);

				// 로그아웃 처리
				session.invalidate();
				Cookie autoLoginCookie = new Cookie("autoLoginToken", null);
				autoLoginCookie.setMaxAge(0);
				autoLoginCookie.setPath("/");
				response.addCookie(autoLoginCookie);

				mv.setViewName("redirect:/index");
			} else {
				mv.addObject("errorMessage", "사용자 정보를 찾을 수 없습니다.");
				mv.setViewName("myinfo/myinfo3");
			}
		} else {
			mv.addObject("errorMessage", "비밀번호가 일치하지 않습니다.");
			mv.setViewName("myinfo/myinfo3");
		}

		return mv;
	}

}