package com.jimsajo.Dto;

import java.time.LocalDateTime;

public class PackageDto {
    private Integer pNum;
    private String pName;
    private String pCountry;
    private String pDescription;
    private LocalDateTime pCreate;
    private int pPrice;
    
    
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public Integer getpNum() {
		return pNum;
	}
	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpCountry() {
		return pCountry;
	}
	public void setpCountry(String pCountry) {
		this.pCountry = pCountry;
	}
	public String getpDescription() {
		return pDescription;
	}
	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}
	public LocalDateTime getpCreate() {
		return pCreate;
	}
	public void setpCreate(LocalDateTime pCreate) {
		this.pCreate = pCreate;
	}

   
}
