package com.jimsajo.Mapper;

import org.apache.ibatis.annotations.Mapper;
import com.jimsajo.Dto.InquiryDto;
import java.util.List;

@Mapper  // 이 어노테이션 추가
public interface InquiryMapper {
    void insertInquiry(InquiryDto inquiry);
    List<InquiryDto> selectAllInquiries();
    InquiryDto getInquiryById(int iNum);//상세조회용
    // 수정 메서드 추가
    void updateInquiry(InquiryDto inquiry);
    
    // 삭제 메서드 추가
    void deleteInquiry(int iNum);
}
