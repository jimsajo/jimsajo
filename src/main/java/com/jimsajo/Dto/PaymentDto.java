package com.jimsajo.Dto;

import java.time.LocalDate;
import java.time.LocalDateTime;


public class PaymentDto {
	private int paymentId; 
	private String impUid; //아임포트 결제 고유 ID
	private String merchantUid; //가맹점에서 정의한 주문번호
	private String payMethod; //결제수단
	private int payAmount;//결제 금액
	private String payStatus; //결제 상태
	private LocalDateTime paidAt; //결제 시각
	private LocalDateTime createdAt; //시스템에서 결제 기록이 저장된 시간
	private int pNum; // 결제한 패키지 번호
	private int mNum; // 로그인한 사용자 번호
	private String pName;   // 패키지 이름 (상품명)
	private int pPrice;     // 패키지 가격
	private int oNum;
	private LocalDate oStart;
	private LocalDate oReturn;
	public int getPaymentId() {
		return paymentId;
		
		
	}
	public String getImpUid() {
		return impUid;
	}
	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}
	public String getMerchantUid() {
		return merchantUid;
	}
	public void setMerchantUid(String merchantUid) {
	    this.merchantUid = merchantUid;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	public LocalDateTime getPaidAt() {
		return paidAt;
	}
	public void setPaidAt(LocalDateTime paidAt) {
		this.paidAt = paidAt;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
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
	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}
	@Override
	public String toString() {
		return "PaymentDto [paymentId=" + paymentId + ", impUid=" + impUid + ", merchantUid=" + merchantUid
				+ ", payMethod=" + payMethod + ", payAmount=" + payAmount + ", payStatus=" + payStatus + ", paidAt="
				+ paidAt + ", createdAt=" + createdAt + ", pNum=" + pNum + ", mNum=" + mNum + ", pName=" + pName
				+ ", pPrice=" + pPrice + ", oNum=" + oNum + ", oStart=" + oStart + ", oReturn=" + oReturn + "]";
	}
	
}