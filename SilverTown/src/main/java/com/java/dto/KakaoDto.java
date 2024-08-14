package com.java.dto;

import com.java.dto.KakaoDto.Kakao_account;
import com.java.dto.KakaoDto.Properties;
import com.java.dto.KakaoDto.Kakao_account.Profile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KakaoDto {
	
	//KakaoDto 부분
	private long id;
	private String connected_at;
	private Properties properties; //class
	private Kakao_account kakao_account; //class
	
	//Properties 부분
	@Data
	public class Properties{
		public String nickname;
		public String profile_image;
		public String thumbnail_image;
	}
	
	//Kakao_account class부분
	@Data
	public class Kakao_account{
		public String profile_nickname_needs_agreement;
		public String profile_image_needs_agreement;
		public Profile profile;
		
		@Data
		public class Profile{
		public String nickname;
		public String thumbnail_image_url;
		public String profile_image_url;
		public String is_default_image;
		public String is_default_nickname;
	}
		
	}
}
