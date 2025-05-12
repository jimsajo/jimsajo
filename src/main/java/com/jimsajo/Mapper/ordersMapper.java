package com.jimsajo.Mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jimsajo.Dto.ordersDto;

@Mapper
public interface ordersMapper {
	int insertOrders(ordersDto orders) throws Exception;
}
