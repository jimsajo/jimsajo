package com.jimsajo.Service;

import java.util.List;

import com.jimsajo.Dto.AnswerDto;

public interface AnswerService {
	void insertAnswer(AnswerDto answerDto); //답변 등록 새로운 답변을 DB에 삽입합니다.
	void updateAnswer(AnswerDto answerDto); //기존 답변의 내용을 수정합니다.
	void deleteAnswer(int aNum); //답변삭제
	List<AnswerDto> selectAnswerByINum(int iNum); //특정 문의글(iNum)에 달린 모든 답변을 조회합니다.
	AnswerDto getAnswerById(int aNum); //특정 답변을 aNum으로 조회합니다. (수정 폼 등에서 사용)
}
