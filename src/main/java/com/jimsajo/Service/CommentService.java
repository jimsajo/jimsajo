package com.jimsajo.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimsajo.Dto.CommentDto;
import com.jimsajo.Mapper.ICommentMapper;

@Service
public class CommentService {
	@Autowired
	private ICommentMapper iCommentMapper;
	//댓글 데이터를 계층 구조(트리 형태)로 재정렬
	public void addComment(CommentDto commentDto)throws Exception{ //뎃글 추기
		iCommentMapper.insertComment(commentDto); //댓글 DB삽입
	}
	// 특정 리뷰(rNum)에 대한 댓글 트리를 반환하는 메서드
	public List<CommentDto> getCommentByReview(int rNum){
		 //1. DB에서 평탄한(계층 없는) 댓글 목록을 가져옴
		List<CommentDto> flatList = iCommentMapper.selectCommentList(rNum);
		//2. 댓글 ID(cNum)를 키로 하고, CommentDto 객체를 값으로 가지는 맵 (댓글을 빠르게 찾기 위함)
		Map<Integer,CommentDto> map = new HashMap<>();
		 //3. 최상위 댓글들(즉, 부모가 없는 댓글)만 모을 리스트
		List<CommentDto> roots = new ArrayList<>();
		
		// 4. 각 댓글 객체에 빈 replies 리스트 초기화 + map에 미리 저장
		for (CommentDto cd : flatList) {
            cd.setReplies(new ArrayList<>());// 대댓글 저장용 리스트 초기화
            map.put(cd.getCNum(), cd); // 댓글 ID 기준으로 map에 저장
        }
		 // 5. 댓글 리스트를 순회하면서 부모-자식 관계 구성
		for(CommentDto cd : flatList) {
			if(cd.getParentCNum() == 0) {
				// parentCNum이 0이면 부모가 없는 댓글 → roots에 추가
				roots.add(cd);
			}else {
				// 부모 댓글을 map에서 찾아서 replies에 추가 (대댓글 연결)
				CommentDto parent = map.get(cd.getParentCNum());
				if(parent != null) parent.getReplies().add(cd); // 부모 댓글의 replies에 자식 추가
			}
		}
		 // 6. 최상위 댓글 목록(그 안에 트리 구조로 대댓글 포함됨)을 반환
		return roots;
	}
	
	public void updateComment(CommentDto commentDto)throws Exception{
		iCommentMapper.updateComment(commentDto);
	}
	
	public void deleteComment(int cNum, boolean isParent) {
		if(isParent) iCommentMapper.deleteComment(cNum);
		else iCommentMapper.deleteReplies(cNum);
	}
}
