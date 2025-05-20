package com.jimsajo.Dto;

import java.time.LocalDate;

public class ordersDto {
	
	private int oNum;
	private LocalDate oDate; //결제일
	private LocalDate oStart; //출발날짜
	private LocalDate oReturn; //도착날짜
	private int oPeople; //패키지 여행 인원수
	private int oPrice;  //패키지 상품 가격
	private int mNum; // 로그인
	private int pNum; // 패키지
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public LocalDate getoDate() {
		return oDate;
	}
	public void setoDate(LocalDate oDate) {
		this.oDate = oDate;
	}
	public LocalDate getoStart() {
		return oStart;
	}
	public void setoStart(LocalDate oStart) {
		this.oStart = oStart;
	}
	public LocalDate getoReturn() {
		return oReturn;
	}
	public void setoReturn(LocalDate oReturn) {
		this.oReturn = oReturn;
	}
	public int getoPeople() {
		return oPeople;
	}
	public void setoPeople(int oPeople) {
		this.oPeople = oPeople;
	}
	public int getoPrice() {
		return oPrice;
	}
	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	@Override
	public String toString() {
		return "ordersDto [oNum=" + oNum + ", oDate=" + oDate + ", oStart=" + oStart + ", oReturn=" + oReturn
				+ ", oPeople=" + oPeople + ", oPrice=" + oPrice + ", mNum=" + mNum + ", pNum=" + pNum + "]";
	}
	
}
