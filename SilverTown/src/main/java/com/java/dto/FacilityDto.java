package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class FacilityDto {

	private String name;
	private String region_code;
	private String region_name;
	private String address;
	private String tel;
	private Timestamp reg_date;
	private int doc_count;
	private String disease;
	private String feature;
	private int price;
	private double y_cor;
	private double x_cor;
	private String image_path;
	private int ad_status;
	
}
