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
	
	public boolean isGoodByUser(ReviewGoodDto reviewGoodDto)throws Exception{
		return iGoodMapper.isGood(reviewGoodDto) > 0;
	}
	
	public void toggleGood(ReviewGoodDto reviewGoodDto)throws Exception{
		if(isGoodByUser(reviewGoodDto)) {
			iGoodMapper.deleteGood(reviewGoodDto);
		}else {
			iGoodMapper.insertGood(reviewGoodDto);
		}
	}
}
