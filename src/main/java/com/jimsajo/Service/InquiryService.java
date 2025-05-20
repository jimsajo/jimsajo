package com.jimsajo.Service;

import java.util.List;
import com.jimsajo.Dto.InquiryDto;

public interface InquiryService {
    void insertInquiry(InquiryDto inquiry);
    List<InquiryDto> getAllInquiries();  // 메서드 정의
	InquiryDto getInquiryById(Integer iNum);
	void updateInquiry(InquiryDto inquiry);  // 수정 메서드
    void deleteInquiry(Integer iNum);  // 삭제 메서드
}
