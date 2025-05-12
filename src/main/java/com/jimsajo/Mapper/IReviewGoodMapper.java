package com.jimsajo.Mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface IReviewGoodMapper {
	int countGood(@Param("rNum") int rNum); //좋아요 수
	int isGood(@Param("rNum") int rNum, @Param("mNum") int mNum); //회원이 좋아요 눌렀는지 안눌렀는지
	void insertGood(@Param("rNum") int rNum, @Param("mNum") int mNum); //좋아요 추가
	void deleteGood(@Param("rNum") int rNum, @Param("mNum") int mNum); //좋아요 취소

}
