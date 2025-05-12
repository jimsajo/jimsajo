package com.jimsajo.Dto;

import java.time.LocalDate;

public class ordersDto {
	
	private int oNum;
	private LocalDate oStart;
	private LocalDate oReturn;
	private int oPeople;
	private int oPrice;
	private int mNum; // fk
	private int Pnum; // fk
	
	
	
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
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
	public int getPnum() {
		return Pnum;
	}
	public void setPnum(int pnum) {
		Pnum = pnum;
	}
	@Override
	public String toString() {
		return "ordersDto [oNum=" + oNum + ", oStart=" + oStart + ", oReturn=" + oReturn + ", oPeople=" + oPeople
				+ ", oPrice=" + oPrice + ", mNum=" + mNum + ", Pnum=" + Pnum + "]";
	}
	
	
}
