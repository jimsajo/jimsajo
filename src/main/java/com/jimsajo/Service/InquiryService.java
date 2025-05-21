package com.jimsajo.Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jimsajo.Dto.InquiryDto;

public interface InquiryService {
    void insertInquiry(InquiryDto inquiry);
    List<InquiryDto> getAllInquiries();  // 메서드 정의
	InquiryDto getInquiryById(Integer iNum);
	void updateInquiry(InquiryDto inquiry);  // 수정 메서드
    void deleteInquiry(Integer iNum);  // 삭제 메서드
<<<<<<< HEAD
    List<InquiryDto> selectAllInquiryByAdmin(int mNum);

} 
=======

 // 특정 사용자의 문의 목록 조회 메서드 추가
    List<InquiryDto> getUserInquiries(int mNum);
}
>>>>>>> branch 'master' of https://github.com/jimsajo/jimsajo.git
