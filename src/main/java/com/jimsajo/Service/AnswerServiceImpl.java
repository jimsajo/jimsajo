package com.jimsajo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimsajo.Dto.AnswerDto;
import com.jimsajo.Mapper.IAnswerMapper;
@Service
public class AnswerServiceImpl implements AnswerService {
	@Autowired
	IAnswerMapper iAnswerMapper;
	
	@Override
    public void insertAnswer(AnswerDto answer) {
        iAnswerMapper.insertAnswer(answer);
    }
	
	@Override
	public List<AnswerDto> selectAnswerByINum(int iNum){
		return iAnswerMapper.selectAnswerByINum(iNum);
	}
	
	@Override
    public void updateAnswer(AnswerDto answer) {
        iAnswerMapper.updateAnswer(answer);
    }

    @Override
    public void deleteAnswer(int aNum) {
        iAnswerMapper.deleteAnswer(aNum);
    }

    @Override
    public AnswerDto getAnswerById(int aNum) {
        return iAnswerMapper.getAnswerById(aNum);
    }
}
