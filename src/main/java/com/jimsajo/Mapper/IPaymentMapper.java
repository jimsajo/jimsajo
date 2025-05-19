package com.jimsajo.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jimsajo.Dto.PaymentDto;

@Mapper
public interface IPaymentMapper {
	public List<PaymentDto> selectPayment();
	void insertPayment(PaymentDto paymentDto);
	void updatePaymentStatus(@Param("impUid") String impUid, @Param("status") String status);
    public int paymentWrite(PaymentDto dto);// 결제 내역 삽입
    List<PaymentDto> selectPaymentsByMember(@Param("mNum") int mNum);

}
