package com.jimsajo.Service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.jimsajo.Dto.ReviewDto;
import com.jimsajo.Mapper.IReviewMapper;

@Service
public class ReviewService {
	@Value("${file.upload-dir}")
	private String uploadDir;
	
	@Autowired
	private IReviewMapper iReviewMapper;
	
	//전체보기
	public List<ReviewDto> selectReviewList()throws Exception{
		return iReviewMapper.selectReviewList();
	}
	//상세보기
	public ReviewDto reviewListDetail(int rNum)throws Exception{
		return iReviewMapper.reviewListDetail(rNum);
	}
	//작성한 리뷰 DB에 저장
	public void saveReview(ReviewDto reviewDto,MultipartFile file) {
		reviewDto.setRImage(saveFile(file));
		reviewDto.setRDate(LocalDateTime.now());
		reviewDto.setRCnt(0);
		iReviewMapper.insertReview(reviewDto);
	}
	//리뷰 수정
	@Transactional
	public void updateReview(ReviewDto reviewDto, MultipartFile file) {
		if(!file.isEmpty() && file.getContentType().startsWith("image/")) {
			deleteFile(reviewDto.getRImage());
			reviewDto.setRImage(saveFile(file));
		}
		iReviewMapper.updateReview(reviewDto); //review 수정
		iReviewMapper.updatePackageCountry(reviewDto); //package의 pCountry수정
	}
	//삭제
	public void deleteReview(int rNum)throws Exception{
		iReviewMapper.deleteReview(rNum);
	}
	//조회수
	public void increaseViewCount(int rNum) throws Exception{
		iReviewMapper.updateViewCount(rNum);
	}
	
	//파일 저장
	private String saveFile(MultipartFile file) {
	    if (file.isEmpty() || !file.getContentType().startsWith("image/")) return null;

	    String filename = UUID.randomUUID() + "_" + file.getOriginalFilename();
	    Path path = Paths.get(uploadDir, filename);

	    try {
	        Files.createDirectories(path.getParent());
	        Files.write(path, file.getBytes());
	        return filename;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}

	//파일 삭제
	private void deleteFile(String filename) {
		if(filename == null || filename.isBlank()) return;
		Path path = Paths.get(uploadDir,filename);
		try {
			Files.deleteIfExists(path);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
