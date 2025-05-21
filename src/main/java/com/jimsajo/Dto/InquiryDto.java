package com.jimsajo.Dto;

import java.time.LocalDateTime;

public class InquiryDto {
	private Integer iNum;
	private String iTitle;
	private String iType;
	private String iContent;
	private LocalDateTime iTime;
	private String iAnswer;
	private String iImage;
	private int mNum;
	private String mName;
	public Integer getiNum() {
		return iNum;
	}
	public void setiNum(Integer iNum) {
		this.iNum = iNum;
	}
	public String getiTitle() {
		return iTitle;
	}
	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}
	public String getiType() {
		return iType;
	}
	public void setiType(String iType) {
		this.iType = iType;
	}
	public String getiContent() {
		return iContent;
	}
	public void setiContent(String iContent) {
		this.iContent = iContent;
	}
	public LocalDateTime getiTime() {
		return iTime;
	}
	public void setiTime(LocalDateTime iTime) {
		this.iTime = iTime;
	}
	public String getiAnswer() {
		return iAnswer;
	}
	public void setiAnswer(String iAnswer) {
		this.iAnswer = iAnswer;
	}
	public String getiImage() {
		return iImage;
	}
	public void setiImage(String iImage) {
		this.iImage = iImage;
	}
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	
	
}
