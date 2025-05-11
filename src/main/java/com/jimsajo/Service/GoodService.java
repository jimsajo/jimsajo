package com.jimsajo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimsajo.Dto.ReviewGoodDto;
import com.jimsajo.Mapper.IReviewGoodMapper;

@Service
public class GoodService {
	@Autowired
	private IReviewGoodMapper iGoodMapper;
	
	public int getGoodCnt(int rNum) {
		return iGoodMapper.countGood(rNum);
	}
	
	public boolean isGoodByUser(int rNum, int mNum)throws Exception{
		return iGoodMapper.isGood(rNum, mNum) > 0;
	}
	
	public void toggleGood(int rNum, int mNum)throws Exception{
		if(isGoodByUser(rNum, mNum)) {
			iGoodMapper.deleteGood(rNum, mNum);
		}else {
			iGoodMapper.insertGood(rNum, mNum);
		}
	}
}
