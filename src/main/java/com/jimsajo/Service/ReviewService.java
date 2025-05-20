package com.jimsajo.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jimsajo.Dto.ReviewDto;
import com.jimsajo.Mapper.IReviewMapper;

@Service
public class ReviewService {

    private final IReviewMapper reviewMapper;
    private final Path uploadPath;

    @Autowired
    public ReviewService(IReviewMapper reviewMapper,
                         @Value("${file.upload-dir}") String uploadDir) {
        this.reviewMapper = reviewMapper;
        this.uploadPath = Paths.get(uploadDir);
    }

    // 리뷰 저장
    public void saveReview(ReviewDto reviewDto, MultipartFile file) {
        String fileName = storeFile(file);
        reviewDto.setrImage(fileName);
        reviewDto.setrDate(new Date());
        reviewMapper.insertReview(reviewDto);
    }

    // 리뷰 수정
    public void updateReview(ReviewDto reviewDto, MultipartFile file) {
        String fileName = storeFile(file);
        if (fileName != null) {
            reviewDto.setrImage(fileName);
        }
        reviewDto.setrDate(new Date());
        reviewMapper.updateReview(reviewDto);
    }

    // 파일 저장 공통 로직
    private String storeFile(MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return null;
        }
        try {
            // 업로드 디렉터리 생성
            if (Files.notExists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            // 고유 파일명 생성
            String filename = UUID.randomUUID() + "_" + file.getOriginalFilename();
            Path target = uploadPath.resolve(filename);
            file.transferTo(target.toFile());
            return filename;
        } catch (IOException e) {
            throw new RuntimeException("파일 업로드 실패: " + e.getMessage(), e);
        }
    }

    // 나머지 메서드들은 그대로
    public List<ReviewDto> selectReviewList() {
        return reviewMapper.selectReviewList();
    }

    public ReviewDto reviewListDetail(int rNum) {
        return reviewMapper.selectReviewById(rNum);
    }

    public void deleteReview(int rNum) {
        reviewMapper.deleteReview(rNum);
    }

    public void increaseViewCount(int rNum) {
        reviewMapper.updateViewCount(rNum);
    }
 // 최근 리뷰 목록 조회 메서드 추가
    public List<ReviewDto> selectRecentReviews(int count) {
        return reviewMapper.selectRecentReviews(count);
    }
}
