package com.jimsajo.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jimsajo.Dto.memberDto;

@Mapper
public interface memberMapper {
	
	int insertMember(memberDto member) throws Exception; // 회원 등록
	List<memberDto> selectMember() throws Exception; // 전체 회원 조회
	int deleteMember(int mNum) throws Exception; //회원 삭제 
	int updateMember(memberDto member) throws Exception; //회원 정보 수정
	memberDto findBy(String mId); // 회원 아이디로 조회
	int updatePasswordAndTel(memberDto member); // 비밀번호, 전화번호 수정
	memberDto selectMemberById(@Param ("mId") String mId);
	memberDto selectMemberByName(@Param("mName") String mName);
	int countById(@Param("mId") String mId);
}
