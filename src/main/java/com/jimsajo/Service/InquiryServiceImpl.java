package com.jimsajo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimsajo.Dto.InquiryDto;
import com.jimsajo.Mapper.InquiryMapper;

@Service
public class InquiryServiceImpl implements InquiryService {

    @Autowired
    private InquiryMapper inquiryMapper;

    @Override
    public void insertInquiry(InquiryDto inquiry) {
        inquiryMapper.insertInquiry(inquiry);
    }

    @Override
    public List<InquiryDto> getAllInquiries() {
        return inquiryMapper.selectAllInquiries();  // Mapper에서 데이터 가져오기
    }
    @Override
    public InquiryDto getInquiryById(Integer iNum) {
        return inquiryMapper.getInquiryById(iNum); // MyBatis Mapper를 통해 조회
    }
    @Override
    public void updateInquiry(InquiryDto inquiry) {
        inquiryMapper.updateInquiry(inquiry);  // MyBatis Mapper를 통해 DB 업데이트
    }

    @Override
    public void deleteInquiry(Integer iNum) {
        inquiryMapper.deleteInquiry(iNum);  // MyBatis Mapper를 통해 DB 삭제
    }
    
    @Override
    public List<InquiryDto> selectAllInquiryByAdmin(int mNum) {
        return inquiryMapper.selectAllInquiryByAdmin(mNum);
    }

  
    
}
