package com.jimsajo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimsajo.Dto.ReviewGoodDto;
import com.jimsajo.Mapper.IReviewGoodMapper;

@Service
public class GoodService {
    @Autowired
    private IReviewGoodMapper goodMapper;
    
    /** 리뷰 좋아요 총 개수 조회 */
    public int getGoodCnt(int rNum) {
        return goodMapper.countGood(rNum);
    }

    /** 특정 사용자가 해당 리뷰에 좋아요를 눌렀는지 여부 */
    public boolean isGoodByUser(int rNum, int mNum) {
        return goodMapper.goodByUser(rNum, mNum);
    }
    
    /** 좋아요 토글 (눌렀으면 해제, 안 눌렀으면 추가) */
    public void toggleGood(int rNum, int mNum) {
        if (isGoodByUser(rNum, mNum)) {
            goodMapper.deleteGood(rNum, mNum);
        } else {
            goodMapper.insertGood(rNum, mNum);
        }
    }

    /** DTO 버전: isGoodByUser 오버로드 */
    public boolean isGoodByUser(ReviewGoodDto dto) {
        return isGoodByUser(dto.getrNum(), dto.getmNum());
    }

    /** DTO 버전: toggleGood 오버로드 */
    public void toggleGood(ReviewGoodDto dto) {
        toggleGood(dto.getrNum(), dto.getmNum());
    }
}
