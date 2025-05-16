package com.jimsajo.Dto;

import java.time.LocalDateTime;

public class AnswerDto {
	private int aNum; //답변 번호
	private String aContent; //답변내용
	private int iNum; //1대1문의 번호
	private int mNum; //회원 번호
	private LocalDateTime aTime; //답변 작성시간
	private String mId; //답변자 (관리자) join으로 가져온다.
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public int getiNum() {
		return iNum;
	}
	public void setiNum(int iNum) {
		this.iNum = iNum;
	}
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public LocalDateTime getaTime() {
		return aTime;
	}
	public void setaTime(LocalDateTime aTime) {
		this.aTime = aTime;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	@Override
	public String toString() {
		return "AnswerDto [aNum=" + aNum + ", aContent=" + aContent + ", iNum=" + iNum + ", mNum=" + mNum + ", aTime="
				+ aTime + ", mId=" + mId + "]";
	}
	
	
}
