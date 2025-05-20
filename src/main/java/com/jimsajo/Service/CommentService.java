package com.jimsajo.Service;

import java.util.List;

import com.jimsajo.Dto.CommentDto;

public interface CommentService {
	 List<CommentDto> getFlatCommentsWithDepth(int rNum);
	 void addComment(CommentDto commentDto);
	 void updateComment(CommentDto commentDto);
	 void deleteComment(int cNum, boolean isParent);
}
