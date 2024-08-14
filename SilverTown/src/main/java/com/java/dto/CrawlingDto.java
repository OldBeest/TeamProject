package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class CrawlingDto {

	private String news_title;
	private String news_content;
	private String news_url;
	private String video_url;
}