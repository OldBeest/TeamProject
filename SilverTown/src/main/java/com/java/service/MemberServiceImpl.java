package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.MemberDao;
import com.java.dto.FacilityDto;
import com.java.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDao memberDao;

    @Override	// 모든 사용자 정보 가져오기
    public ArrayList<MemberDto> selectAll() {    	
    	return memberDao.selectAll();
    }

    @Override	// 로그인 시도
    public MemberDto selectSignIn(MemberDto memberDto) {
        return memberDao.selectSignIn(memberDto);
    }

    @Override	// 자동 로그인 토큰으로 사용자 찾기
    public MemberDto findByAutoLoginToken(String autoLoginToken) {
        return memberDao.findByAutoLoginToken(autoLoginToken);
    }

    @Override	// 자동 로그인 토큰 생성
    public String generateAutoLoginToken(MemberDto mDto) {
        String autoLoginToken = UUID.randomUUID().toString();
        memberDao.updateAutoLoginToken(mDto.getId(), autoLoginToken);
        return autoLoginToken;
    }

    @Override	// 아이디로 사용자 정보 찾기
    public MemberDto findByUsername(String id) {
        return memberDao.findByUsername(id);
    }

    @Override	// 비밀번호 업데이트
    public void updatePassword(MemberDto memberDto) {
        memberDao.updatePassword(memberDto);
    }

    @Override	// 임시 비밀번호 저장
    public void saveTempPassword(MemberDto memberDto) {
        memberDao.saveTempPassword(memberDto);
    }

    @Override	// 임시 비밀번호 가져오기
    public String getTempPassword(String id) {
        return memberDao.getTempPassword(id);
    }
    
    @Override	// 회원정보 저장
    public void insertMember(MemberDto memberDto) {
    	memberDao.insertMember(memberDto);
    }
    
    @Override	// 아이디 중복 체크
    public boolean isIdDuplicated(String id) {
    	return memberDao.checkDuplicateId(id) > 0;
    }
	
    @Override	// 회원탈퇴
	public void deleteMember(String id) {
		memberDao.deleteMember(id);
	}

    @Override
    public void updateMemberInfo(MemberDto memberDto) {
        memberDao.updateMemberInfo(memberDto);
    }


	@Override// 전체 질환 목록 가져오기
	public List<String> getAllDiseases() {
		return memberDao.selectAllDiseases();
	}

	@Override	// 전체 특성 목록 가져오기
	public List<String> getAllFeatures() {
		return memberDao.selectAllFeatures();
	}
	
	@Override
    public List<FacilityDto> getNearbyFacilities(double yCor, double xCor, List<String> diseaseList, List<String> featureList, int limit) {
        Map<String, Object> params = new HashMap<>();
        params.put("yCor", yCor);
        params.put("xCor", xCor);
        params.put("diseaseList", diseaseList);
        params.put("featureList", featureList);
        params.put("limit", limit);

        return memberDao.getNearbyFacilities(params);
    }
	@Override
	public MemberDto selectOne(String id) {
		return memberDao.selectOne(id);
	}
	@Override
	public void updateMember(MemberDto memberDto) {
		memberDao.updateMember(memberDto);
	}

}