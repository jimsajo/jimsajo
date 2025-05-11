package com.jimsajo.Dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PaymentDto {
	private int paymentId; 
	private String impUid; //아임포트 결제 고유 ID
	private String merchantUid; //가맹점에서 정의한 주문번호
	private String payMethod; //결제수단
	//private String productName; //상품명
	private int payAmount;//결제 금액
	private String payStatus; //결제 상태
	private LocalDateTime paidAt; //결제 시각
	private LocalDateTime createAt; //시스템에서 결제 기록이 저장된 시간
	private int pNum; // 결제한 패키지 번호
	private int mNum; // 로그인한 사용자 번호
	private String pName;   // 패키지 이름 (상품명)
	private int pPrice;     // 패키지 가격
}
