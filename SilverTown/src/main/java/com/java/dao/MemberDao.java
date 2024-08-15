package com.java.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.FacilityDto;
import com.java.dto.MemberDto;

@Mapper
public interface MemberDao {
	
	// 모든 사용자 정보 불러오기
	ArrayList<MemberDto> selectAll();

	// 로그인 시도
	MemberDto selectSignIn(MemberDto memberDto);

	// 자동 로그인 토큰으로 사용자 찾기
	MemberDto findByAutoLoginToken(String autoLoginToken);

	// 자동 로그인 토큰 업데이트
	void updateAutoLoginToken(String id, String autoLoginToken);

	// 아이디로 사용자 정보 찾기
	MemberDto findByUsername(String id);

	// 비밀번호 업데이트
	void updatePassword(MemberDto memberDto);

	// 임시 비밀번호 저장
	void saveTempPassword(MemberDto memberDto);

	// 임시 비밀번호 가져오기
	String getTempPassword(String id);

	// 회원정보 저장
	void insertMember(MemberDto memberDto);

	// 아이디 중복 체크
	int checkDuplicateId(String id);
	
	// 회원탈퇴
	void deleteMember(String id);

	// 회원정보 업데이트
    void updateMemberInfo(MemberDto memberDto);

	// 전체 질환 목록 가져오기
	List<String> selectAllDiseases();

	// 전체 특성 목록 가져오기
	List<String> selectAllFeatures();
	
	//추천서비스
	List<FacilityDto> getNearbyFacilities(Map<String, Object> params);
	
	// 회원정보 조회
	MemberDto selectOne(String id);
	
	// 회원정보 업데이트
	void updateMember(MemberDto memberDto);
	
	/*----------
	 분석 서비스
	 ----------*/
	//모든 회원 수 가져오기
	int totalCount();
	
	//지역명으로 회원 수 검색하기
	int regionCount(String region);
	
	// 성별로 회원 수 검색하기
	int genderCount(String gender);
	
	// 질병별 회원 수 검색
	int diseaseCount(String disease);

	// 특성별 회원 수 검색
	int featureCount(String disease);

	



}