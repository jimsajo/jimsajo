package com.jimsajo.Mapper;

import com.jimsajo.Dto.ReviewGoodDto;

public interface IReviewGoodMapper {
	int countGood(int rNum); //좋아요 수
	int isGood(ReviewGoodDto reviewGoodDto); //회원이 좋아요 눌렀는지 안눌렀는지
	void insertGood(ReviewGoodDto reviewGoodDto); //좋아요 추가
	void deleteGood(ReviewGoodDto reviewGoodDto); //좋아요 취소
}
