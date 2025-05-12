package com.jimsajo.Dto;

import java.time.LocalDate;

public class boardDto {
	
	private int bNum;
	private String bTitle; //제목 
	private String bContent; // 내용 
	private LocalDate bTime; // 작성시간 
	private int bCnt; // 조회수 
	private String bImage; // 이미지 
	private int mNum; // 작성자 번호(member table)
	private String mName; // 작성자 이름(관리자)
	
	
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public LocalDate getbTime() {
		return bTime;
	}
	public void setbTime(LocalDate bTime) {
		this.bTime = bTime;
	}
	public int getbCnt() {
		return bCnt;
	}
	public void setbCnt(int bCnt) {
		this.bCnt = bCnt;
	}
	public String getbImage() {
		return bImage;
	}
	public void setbImage(String bImage) {
		this.bImage = bImage;
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
	@Override
	public String toString() {
		return "boardDto [bNum=" + bNum + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bTime=" + bTime
				+ ", bCnt=" + bCnt + ", bImage=" + bImage + ", mNum=" + mNum + ", mName=" + mName + "]";
	}
	
	
}