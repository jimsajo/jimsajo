package com.jimsajo.Mapper;

import java.util.List;

import com.jimsajo.Dto.CommentDto;


public interface ICommentMapper {
	List<CommentDto> selectCommentList(int rNum);
	void insertComment (CommentDto commentDto);
	void updateComment(CommentDto commentDto);
	void deleteComment(int cNum); //댓글 + 대댓글 함께 삭제
	void deleteReplies(int cNum); //대댓글 삭제
}
