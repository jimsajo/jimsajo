package com.jimsajo.Dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDto {
    private Integer rNum;         // 리뷰 번호 (primary key, auto increment)
    private String rImage;        // 이미지 파일명
    private String rReview;       // 리뷰 내용 (text)
    private Date rDate;  // 기본값 설정

    private String rTitle;        // 리뷰 제목
    private Integer rCnt = 0;        // 조회수
    private Integer mNum;         // 작성자 회원 번호 (foreign key)
    private Integer pNum;         // 패키지 번호 (foreign key)
    private String mId;        
    private String pCountry;
    private MultipartFile rFile;  // 업로드된 파일 (폼에서 사용)
	public Integer getrNum() {
		return rNum;
	}
	public void setrNum(Integer rNum) {
		this.rNum = rNum;
	}
	public String getrImage() {
		return rImage;
	}
	public void setrImage(String rImage) {
		this.rImage = rImage;
	}
	public String getrReview() {
		return rReview;
	}
	public void setrReview(String rReview) {
		this.rReview = rReview;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	public String getrTitle() {
		return rTitle;
	}
	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}
	public Integer getrCnt() {
		return rCnt;
	}
	public void setrCnt(Integer rCnt) {
		this.rCnt = rCnt;
	}
	public Integer getmNum() {
		return mNum;
	}
	public void setmNum(Integer mNum) {
		this.mNum = mNum;
	}
	public Integer getpNum() {
		return pNum;
	}
	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getpCountry() {
		return pCountry;
	}
	public void setpCountry(String pCountry) {
		this.pCountry = pCountry;
	}
	public MultipartFile getrFile() {
		return rFile;
	}
	public void setrFile(MultipartFile rFile) {
		this.rFile = rFile;
	}

    // 추가적으로 필요한 메서드들 (예: 이미지 파일 업로드 후 파일 이름을 세팅하는 메서드 등)
    
}
