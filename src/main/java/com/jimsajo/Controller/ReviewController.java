package com.jimsajo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jimsajo.Dto.CommentDto;
import com.jimsajo.Dto.ReviewDto;
import com.jimsajo.Dto.ReviewGoodDto;
import com.jimsajo.Dto.memberDto;
import com.jimsajo.Service.CommentService;
import com.jimsajo.Service.GoodService;
import com.jimsajo.Service.PackageService;
import com.jimsajo.Service.ReviewService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired //리뷰
	private ReviewService reviewService;
	
	@Autowired //댓글+대댓글
	private CommentService commentService;
	
	@Autowired //좋아요
	private GoodService goodService;
	
	@Autowired
	private PackageService packageService;
	
	@GetMapping("")
	public String root() {
		return "review/reviewForm"; //리뷰 작성 홈
	}
	
	@PostMapping("/reviewSave")
	public String reviewSave(@ModelAttribute ReviewDto reviewDto,
	                         @RequestParam("file") MultipartFile file,
	                         HttpSession session) {
	    // 세션에서 로그인된 사용자 정보 가져오기
	    memberDto loginUser = (memberDto) session.getAttribute("loginUser");

	    // 로그인되지 않은 사용자의 경우 로그인 페이지로 리다이렉트
	    if (loginUser == null) {
	        return "redirect:/login"; // 로그인 페이지로 리다이렉트
	    }

	    // 로그인된 사용자의 mNum을 리뷰 DTO에 설정
	    reviewDto.setmNum(loginUser.getmNum());
	    
	    // 리뷰 저장 서비스 호출
	    reviewService.saveReview(reviewDto, file);
	    
	    // 리뷰 목록 페이지로 리다이렉트
	    return "redirect:/review/reviewList"; 
	}


	
	@GetMapping("/reviewList")
	public String reviewList(Model model)throws Exception{
		model.addAttribute("reviews", reviewService.selectReviewList());
		return "review/reviewList"; //전체 리뷰 목록
	}
	
	@PostMapping("/commentAdd")
	public String  commentAdd(@ModelAttribute CommentDto commentDto,HttpSession session) throws Exception{
		if (commentDto.getParentCNum() == null) commentDto.setParentCNum(0);
		
		memberDto loginUser = (memberDto) session.getAttribute("loginUser");
		if(loginUser != null) {
			commentDto.setmNum(loginUser.getmNum());
		}
		if(commentDto.getParentCNum() == 0) {
			commentDto.setParentCNum(0);
		}
		commentService.addComment(commentDto);
		return "redirect:/review/reviewDetail/"+commentDto.getrNum();
	}
	
	//댓글 수정
	@PostMapping("/commentUpdate")
	public String commentUpdate(@ModelAttribute CommentDto commentDto)throws Exception{
		commentService.updateComment(commentDto);
		return "redirect:/review/reviewDetail/"+commentDto.getrNum();
	}
	//댓글 삭제
	@GetMapping("/commentDelete/{cNum}/{rNum}/{isParent}")
	public String commentDelete(@PathVariable("cNum") int cNum,
								@PathVariable("rNum") int rNum,
								@PathVariable("isParent") boolean isParent)throws Exception{
		commentService.deleteComment(cNum, isParent);
		return "redirect:/review/reviewDetail/"+rNum;
	}
	
	@GetMapping("/reviewDetail/{rNum}")
	public String reviewDetail(@PathVariable("rNum") int rNum, Model model,HttpSession session)throws Exception{
		memberDto loginUser = (memberDto) session.getAttribute("loginUser");
		
		reviewService.increaseViewCount(rNum);//조회수 증가
		ReviewDto review = reviewService.reviewListDetail(rNum);
        
		model.addAttribute("review",review);
		model.addAttribute("comments", commentService.getFlatCommentsWithDepth(rNum)); //댓글
		
	    if (review == null) {
	        model.addAttribute("message", "해당 리뷰가 존재하지 않습니다.");
	        model.addAttribute("redirectUrl", "/review/reviewList");
	        return "review/errorPage"; // 사용자 정의 에러 JSP
	    }
		
		//좋아요 
		ReviewGoodDto reviewGoodDto = new ReviewGoodDto();
		reviewGoodDto.setrNum(rNum);
		if(loginUser != null){
			reviewGoodDto.setmNum(loginUser.getmNum());
		}
		int goodCount = goodService.getGoodCnt(rNum);
		boolean goodByUser = loginUser != null && goodService.isGoodByUser(reviewGoodDto);
		
		model.addAttribute("goodCnt", goodCount);
		model.addAttribute("goodByUser", goodByUser);
		
		return "review/reviewDetail"; //리뷰 상세보기
	}
	
	@GetMapping("/updateReview/{rNum}")//리뷰 수정 폼
	public String updateReviewForm(@PathVariable("rNum") int rNum, Model model)throws Exception{
		model.addAttribute("upReview",reviewService.reviewListDetail(rNum));
		return "review/updateReview"; 
	}
	
	@PostMapping("/updateReview")//리뷰 수정 처리
	public String updateReview(@ModelAttribute ReviewDto reviewDto, @RequestParam("rfile") MultipartFile file) {
		reviewService.updateReview(reviewDto, file);
		return "redirect:/review/reviewDetail/"+reviewDto.getrNum();
	}
	
	@GetMapping("/deleteReview/{rNum}")
	public String delete(@PathVariable("rNum") int rNum)throws Exception{
		reviewService.deleteReview(rNum);
		return "redirect:/review/reviewList";
	}
	
	//좋아용
	@PostMapping("/toggleGood")
	public String toggleGood(@ModelAttribute ReviewGoodDto reviewGoodDto, HttpSession session) throws Exception{
		memberDto loginUser = (memberDto)session.getAttribute("loginUser");
		if(loginUser != null) {
			reviewGoodDto.setmNum(loginUser.getmNum());
			goodService.toggleGood(reviewGoodDto);
		}
		return "redirect:/review/reviewDetail/"+reviewGoodDto.getrNum();
	}
	
}
