package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.dao.RecommendDao;
import com.java.dao.RecommendDao;
import com.java.dto.FacilityDto;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class RecommendServiceImpl implements RecommendService {

    @Autowired
    private RecommendDao recommentDao; // DAO 주입
    
    //카카오api로 주소 -> 좌표로 변경
    @Override
    public ArrayList<Double> requestPoint(String address) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK 44102386908e102073a79562f84fbcf6");

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);

        ResponseEntity<String> response = new RestTemplate().exchange(
            "https://dapi.kakao.com/v2/local/search/address?query=" + address, 
            HttpMethod.GET, request, String.class
        );

        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode root = objectMapper.readTree(response.getBody());
            JsonNode documents = root.path("documents");
            JsonNode addressInfo = documents.get(0).path("road_address");

            double y_cor = addressInfo.path("y").asDouble();
            double x_cor = addressInfo.path("x").asDouble();
            
            ArrayList<Double> coordinates = new ArrayList<>();
            coordinates.add(y_cor);
            coordinates.add(x_cor);

            return coordinates;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
    
    @Override
    public double calculateDistance(double y1, double x1, double y2, double x2) {
        return Math.pow(y1 - y2, 2) + Math.pow(x1 - x2, 2);
    }
    
    //주소추출
    @Override
    public String extractRegion(String fullAddress) {
        if (fullAddress != null && !fullAddress.isEmpty()) {
            String[] addressParts = fullAddress.split(" ");
            if (addressParts.length > 0) {
                return addressParts[0]; // 예: "서울특별시"
            }
        }
        return "";
    }

    @Override
    public List<FacilityDto> getNearbyFacilities(double y, double x, List<String> diseaseList, List<String> featureList, int limit) {
        // DAO를 통해 근처 시설 목록을 가져옴
        return recommentDao.getNearbyFacilities(y, x, diseaseList, featureList, limit);
    }
}