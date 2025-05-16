package com.jimsajo.Dto;

import java.time.LocalDate;
import java.time.LocalDateTime;


public class memberDto {
	private int mNum;
	private String mId;
	private String mPasswd;
	private String mName;
	private	String mGender;  // M F 
	private String mTel;
	private	LocalDate mBirth; // YY-MM-DD
	private LocalDateTime mCreateTime;
	private String mRole; // user, admin
	
	private String socialType; // ex: "KAKAO"
	private String socialId;
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPasswd() {
		return mPasswd;
	}
	public void setmPasswd(String mPasswd) {
		this.mPasswd = mPasswd;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmGender() {
		return mGender;
	}
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	public String getmTel() {
		return mTel;
	}
	public void setmTel(String mTel) {
		this.mTel = mTel;
	}
	public LocalDate getmBirth() {
		return mBirth;
	}
	public void setmBirth(LocalDate mBirth) {
		this.mBirth = mBirth;
	}
	public LocalDateTime getmCreateTime() {
		return mCreateTime;
	}
	public void setmCreateTime(LocalDateTime mCreateTime) {
		this.mCreateTime = mCreateTime;
	}
	public String getmRole() {
		return mRole;
	}
	public void setmRole(String mRole) {
		this.mRole = mRole;
	}
	public String getSocialType() {
		return socialType;
	}
	public void setSocialType(String socialType) {
		this.socialType = socialType;
	}
	public String getSocialId() {
		return socialId;
	}
	public void setSocialId(String socialId) {
		this.socialId = socialId;
	}
	@Override
	public String toString() {
		return "memberDto [mNum=" + mNum + ", mId=" + mId + ", mPasswd=" + mPasswd + ", mName=" + mName + ", mGender="
				+ mGender + ", mTel=" + mTel + ", mBirth=" + mBirth + ", mCreateTime=" + mCreateTime + ", mRole="
				+ mRole + ", socialType=" + socialType + ", socialId=" + socialId + "]";
	}  
	
	
	
}
