package com.jimsajo.Controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jimsajo.Dto.ReviewDto;
import com.jimsajo.Service.ReviewService;

@Controller
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @Value("${file.upload-dir}")  // application.properties에서 파일 경로 읽기
    private String uploadDir;

    // 리뷰 작성 폼 페이지
    @RequestMapping("/review")
    public String root() {
        return "review/reviewForm"; // 리뷰 작성 홈
    }

    // 리뷰 저장 처리
    @RequestMapping("reviewSave")
    public String reviewSave(@ModelAttribute ReviewDto reviewDto,
                             @RequestParam("file") MultipartFile file) throws IOException {
        // 이미지 파일 처리
        if (!file.isEmpty()) {
            // 파일명 생성 (UUID 추가)
            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            File saveDir = new File(uploadDir);
            if (!saveDir.exists()) {
                saveDir.mkdirs(); // 디렉토리가 없으면 생성
            }
            // 파일 저장
            file.transferTo(new File(saveDir, fileName));
            reviewDto.setRImage(fileName); // 이미지 파일 경로를 DTO에 저장
        }

        // 리뷰 저장 서비스 호출
        reviewService.saveReview(reviewDto, file);
        return "redirect:/review/reviewList";
    }

    // 리뷰 목록 조회
    @RequestMapping("reviewList")
    public String reviewList(Model model) {
        model.addAttribute("reviews", reviewService.selectReviewList());
        return "review/reviewList"; // 전체 리뷰 목록
    }

    // 리뷰 상세 조회
    @RequestMapping("reviewDetail/{rNum}")
    public String reviewDetail(@PathVariable int rNum, Model model) {
        model.addAttribute("review", reviewService.reviewListDetail(rNum));
        return "review/reviewDetail"; // 리뷰 상세보기
    }
}
