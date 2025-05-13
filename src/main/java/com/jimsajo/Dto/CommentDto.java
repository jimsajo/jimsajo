package com.jimsajo.Dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class CommentDto {
	private int cNum;          // 댓글 번호
    private int rNum;          // 리뷰 번호
    private int mNum;          // 작성자 번호
    private String mId;        // 작성자 ID
    private String cContent;   // 댓글 내용
    private LocalDateTime cCreate; // 작성 시간
    private int parentCNum;    // 부모 댓글 번호 (0이면 최상위)
    private int depth;         // JSP 들여쓰기용 (DB 저장 X)
}
