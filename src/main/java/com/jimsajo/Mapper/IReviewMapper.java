package com.jimsajo.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jimsajo.Dto.ReviewDto;
@Mapper
public interface IReviewMapper {
	List<ReviewDto> selectReviewList()throws Exception; //리뷰 전체보기
	ReviewDto reviewListDetail(int rNum); //리뷰 자세히 보기
	void insertReview(ReviewDto reviewDto); //리뷰 입력
	void updateReview(ReviewDto reviewDto); //리뷰 수정
	void deleteReview(int rNum); //리뷰 삭제
	void updateViewCount(int rNum); //조회수
	void updatePackageCountry(ReviewDto reviewDto);// 패키지의 나라 수정하기 
}
