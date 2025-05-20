package com.jimsajo.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jimsajo.Dto.InquiryDto;
import com.jimsajo.Dto.memberDto;

@Mapper
public interface loginMapper {

	memberDto login(@Param("mId") String mId, @Param("mPasswd") String mPasswd);
	memberDto selectMemberById(@Param ("mId") String mId);
	int insertMember(memberDto dto);
	int insertSocialMember(memberDto dto);
	List<InquiryDto> selectInquiriesByMemberNum(int mNum);

}
