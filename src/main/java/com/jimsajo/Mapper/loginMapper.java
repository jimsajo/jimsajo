package com.jimsajo.Mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jimsajo.Dto.memberDto;

@Mapper
public interface loginMapper {

	memberDto login(@Param("mId") String mId, @Param("mPasswd") String mPasswd);
	
}
