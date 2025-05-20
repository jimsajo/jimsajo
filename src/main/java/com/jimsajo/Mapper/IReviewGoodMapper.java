package com.jimsajo.Mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface IReviewGoodMapper {
	int countGood(@Param("rNum") int rNum); //좋아요 수
	void insertGood(@Param("rNum") int rNum, @Param("mNum") int mNum); //좋아요 추가
	void deleteGood(@Param("rNum") int rNum, @Param("mNum") int mNum); //좋아요 취소
    boolean goodByUser(@Param("rNum") int rNum, @Param("mNum") int mNum); // 현재 로그인한 사용자가 좋아요 클릭했는지 여부
}
