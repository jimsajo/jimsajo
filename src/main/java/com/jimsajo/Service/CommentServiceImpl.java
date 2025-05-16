package com.jimsajo.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimsajo.Dto.CommentDto;
import com.jimsajo.Mapper.ICommentMapper;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	ICommentMapper icommentMapper;
	
	public List<CommentDto> getFlatCommentsWithDepth(int rNum) {
	    List<CommentDto> original = icommentMapper.selectCommentList(rNum); // parent -> child 정렬되어 있다고 가정
	    List<CommentDto> flatList = new ArrayList<>();
	    for (CommentDto comment : original) {
	        addWithChildren(comment, original, flatList, 0);
	    }
	    return flatList;
	}

	private void addWithChildren(CommentDto parent, List<CommentDto> all, List<CommentDto> result, int depth) {
	    parent.setDepth(depth);
	    result.add(parent);
	    for (CommentDto child : all) {
	        if (child.getParentCNum() == parent.getcNum()) {
	            addWithChildren(child, all, result, depth + 1);
	        }
	    }
	}
	
	@Override
    public void addComment(CommentDto commentDto) {
        icommentMapper.insertComment(commentDto);
    }

    @Override
    public void updateComment(CommentDto commentDto) {
        icommentMapper.updateComment(commentDto);
    }

    @Override
    public void deleteComment(int cNum, boolean isParent) {
        if (isParent) {
            icommentMapper.deleteComment(cNum); // 부모 댓글 + 대댓글 모두 삭제
        } else {
            icommentMapper.deleteSingleComment(cNum); // 대댓글만 삭제
        }
    }
}
