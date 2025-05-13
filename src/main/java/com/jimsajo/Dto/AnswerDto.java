package com.jimsajo.Dto;

import java.time.LocalDateTime;

import lombok.Data;
@Data
public class AnswerDto {
	private int aNum; //답변 번호
	private String aContent; //답변내용
	private int iNum; //1대1문의 번호
	private int mNum; //회원 번호
	private LocalDateTime aTime; //답변 작성시간
	private String mId; //답변자 (관리자) join으로 가져온다.
}
