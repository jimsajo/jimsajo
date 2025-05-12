package com.jimsajo.Dto;

import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;
@Data
public class CommentDto {
	private int cNum; //댓글 고유 번호
	private String cContent; //댓글 내용
	private LocalDateTime cCreate; //댓글 적은 날짜
	private int parentCNum; //대댓글 0이면 일반 댓글 1부터 대댓글
	private int mNum; //member테이블
	private int rNum; //review테이블
	private String mId; //댓글 작성자 아이디
	private List<CommentDto> replies; //대댓글
}
