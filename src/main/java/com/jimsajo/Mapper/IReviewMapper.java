package com.jimsajo.Mapper;

import com.jimsajo.Dto.ReviewDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IReviewMapper {

	// 리뷰 삽입
    void insertReview(ReviewDto reviewDto);

    // 전체 리뷰 목록 조회 (리뷰 + 작성자 ID + 패키지 국가)
    List<ReviewDto> selectReviewList();

    // 리뷰 상세 조회 (작성자 ID, 이미지, 내용, 국가 포함)
    ReviewDto selectReviewById(int rNum);
    
    ReviewDto reviewListDetail(int rNum);

    // 리뷰 수정
    void updateReview(ReviewDto reviewDto);

    // 리뷰 삭제
    void deleteReview(int rNum);

    // 리뷰 조회수 증가
    void updateViewCount(int rNum);

    // (선택적) 리뷰와 연결된 패키지 국가 정보 업데이트
    void updatePackageCountry(ReviewDto reviewDto);
}
