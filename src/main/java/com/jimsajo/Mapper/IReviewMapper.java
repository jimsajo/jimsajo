package com.jimsajo.Mapper;

import com.jimsajo.Dto.ReviewDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IReviewMapper {

    // 리뷰 삽입
    void insertReview(ReviewDto reviewDto);

    // 모든 리뷰 조회
    List<ReviewDto> selectAllReviews();

    // 리뷰 상세 조회
    ReviewDto selectReviewById(int rNum);

    // 리뷰 수정
    void updateReview(ReviewDto reviewDto);

    // 리뷰 삭제
    void deleteReview(int rNum);
}
