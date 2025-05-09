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
}
