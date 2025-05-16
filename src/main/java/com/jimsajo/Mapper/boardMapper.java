package com.jimsajo.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jimsajo.Dto.boardDto;

@Mapper
public interface boardMapper {

	int insertBoard(boardDto board) throws Exception;
	List<boardDto> selectBoard() throws Exception;
    boardDto selectBoardById(int bNum) throws Exception;
	int deleteBoard(int bNum) throws Exception;
	int updateBoard(boardDto board) throws Exception;
	int updateCnt(int bNum) throws Exception;
	int selectBoardCount();
	List<boardDto> selectBoardPage(@Param("startRow") int startRow, @Param("pageSize") int pageSize);
}
