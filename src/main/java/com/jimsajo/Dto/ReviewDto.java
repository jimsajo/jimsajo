package com.jimsajo.Dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReviewDto {
	private int  rNum;
	private String rImage;
	private String rReview;
	private LocalDateTime rDate;
	private String rTitle;
	private int rCnt;
	private Integer mNum;
	private int pNum;
	private String pCountry;
}
