package com.java.service;

import java.util.ArrayList;
import java.util.List;

import com.java.dto.FacilityDto;
import com.java.dto.MemberDto;

public interface MemberService {

	// 모든 사용자 정보 가져오기
	ArrayList<MemberDto> selectAll();
	// 로그인 시도
	MemberDto selectSignIn(MemberDto memberDto);

	// 자동 로그인 토큰으로 사용자 찾기
	MemberDto findByAutoLoginToken(String autoLoginToken);

	// 자동 로그인 토큰 생성
	String generateAutoLoginToken(MemberDto mDto);

	// 아이디로 사용자 정보 찾기
	MemberDto findByUsername(String id);

	// 비밀번호 업데이트
	void updatePassword(MemberDto memberDto);

	// 임시 비밀번호 저장
	void saveTempPassword(MemberDto memberDto);

	// 임시 비밀번호 가져오기
	String getTempPassword(String id);
	
	// 회원 정보 저장
	void insertMember(MemberDto memberDto);
	
	// 아이디 중복 체크
	boolean isIdDuplicated(String id);
	
	// 회원 탈퇴
    void deleteMember(String id);

	// 회원정보 업데이트
    void updateMemberInfo(MemberDto memberDto);

	// 전체 질환 목록 가져오기
	List<String> getAllDiseases();
	
	// 전체 특성 목록 가져오기
	List<String> getAllFeatures();
	
	List<FacilityDto> getNearbyFacilities(double yCor, double xCor, List<String> diseaseList, List<String> featureList, int limit);
	
	//회원정보 가져오기
	MemberDto selectOne(String id);
	
	// 회원정보 수정
	void updateMember(MemberDto memberDto);


}