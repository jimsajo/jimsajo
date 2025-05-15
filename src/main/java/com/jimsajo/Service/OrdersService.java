package com.jimsajo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimsajo.Dto.ordersDto;
import com.jimsajo.Mapper.OrdersMapper;

@Service
public class OrdersService {
	@Autowired
	private OrdersMapper ordersMapper;
	
	// 주문 등록
    public int insertOrders(ordersDto dto) {
        return ordersMapper.insertOrders(dto);
    }

    // 전체 주문 목록 조회 (선택적 사용)
    public List<ordersDto> selectOrders() {
        return ordersMapper.selectOrders();
    }
    // 주문 번호로 예약 조회
    public ordersDto getOrderById(int oNum) {
        return ordersMapper.getOrderById(oNum);
    }
    // ✅ 결제 완료된 예약만 조회
    public List<ordersDto> selectPaidOrders() {
        return ordersMapper.selectPaidOrders();
    }

}
