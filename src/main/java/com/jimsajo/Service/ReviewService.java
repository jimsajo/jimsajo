package com.jimsajo.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jimsajo.Dto.ReviewDto;
import com.jimsajo.Mapper.IReviewMapper;

@Service
public class ReviewService {

    @Autowired
    private IReviewMapper reviewMapper;

    // 리뷰 저장
    public void saveReview(ReviewDto reviewDto, MultipartFile file) {
        // 파일 처리
        String fileName = null;
        if (file != null && !file.isEmpty()) {
            fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            String uploadDir = "/path/to/your/upload/directory";  // 실제 파일 업로드 경로

            try {
                File saveFile = new File(uploadDir, fileName);
                file.transferTo(saveFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 리뷰 DTO에 파일명 저장
        reviewDto.setRImage(fileName);

        // 데이터베이스에 리뷰 저장
        reviewMapper.insertReview(reviewDto);
    }

    // 리뷰 목록 조회
    public List<ReviewDto> selectReviewList() {
        return reviewMapper.selectAllReviews();  // Mapper에서 데이터 조회
    }

    // 리뷰 상세 조회
    public ReviewDto reviewListDetail(int rNum) {
        return reviewMapper.selectReviewById(rNum);  // 리뷰 상세 조회
    }

    // 리뷰 수정
    public void updateReview(ReviewDto reviewDto, MultipartFile file) {
        // 파일 처리
        String fileName = null;
        if (file != null && !file.isEmpty()) {
            fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            String uploadDir = "/path/to/your/upload/directory";  // 실제 파일 업로드 경로

            try {
                File saveFile = new File(uploadDir, fileName);
                file.transferTo(saveFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 리뷰 DTO에 파일명 저장
        reviewDto.setRImage(fileName);

        // 데이터베이스에서 리뷰 수정
        reviewMapper.updateReview(reviewDto);
    }

    // 리뷰 삭제
    public void deleteReview(int rNum) {
        reviewMapper.deleteReview(rNum);  // 리뷰 삭제
    }

	public void increaseViewCount(int rNum) {
		
		
	}
}
