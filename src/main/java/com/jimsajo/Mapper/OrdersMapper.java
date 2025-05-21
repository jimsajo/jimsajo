package com.jimsajo.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jimsajo.Dto.ordersDto;

@Mapper
public interface OrdersMapper {
	int insertOrders(ordersDto orders);
	List<ordersDto> selectOrders();
	ordersDto getOrderById(int oNum);
	List<ordersDto> selectPaidOrders();
	List<ordersDto> selectOrderDetailsByMember(int mNum);

}
