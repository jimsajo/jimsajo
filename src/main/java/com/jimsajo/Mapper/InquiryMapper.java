package com.jimsajo.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jimsajo.Dto.InquiryDto;

@Mapper
public interface InquiryMapper {
    void insertInquiry(InquiryDto inquiry);
    List<InquiryDto> selectAllInquiries();
    InquiryDto getInquiryById(int iNum);//상세조회용
    // 수정 메서드 추가
    void updateInquiry(InquiryDto inquiry);
    // 삭제 메서드 추가
    void deleteInquiry(int iNum);
    List<InquiryDto>selectAllInquiryByAdmin(@Param("mNum") int mNum);
    // 특정 사용자의 문의 목록 조회 (mNum으로 조회)
    List<InquiryDto> selectUserInquiries(int mNum);
}

