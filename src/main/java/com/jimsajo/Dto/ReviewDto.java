package com.jimsajo.Dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class ReviewDto {
    private Integer rNum;         // 리뷰 번호 (primary key, auto increment)
    private String rImage;        // 이미지 파일명
    private String rReview;       // 리뷰 내용 (text)
    private String rDate;         // 등록일 (datetime)
    private String rTitle;        // 리뷰 제목
    private Integer rCnt;         // 조회수
    private Integer mNum;         // 작성자 회원 번호 (foreign key)
    private Integer pNum;         // 패키지 번호 (foreign key)
    private MultipartFile rFile;  // 업로드된 파일 (폼에서 사용)

    // 추가적으로 필요한 메서드들 (예: 이미지 파일 업로드 후 파일 이름을 세팅하는 메서드 등)
}
