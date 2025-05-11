package com.jimsajo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jimsajo.Dto.CommentDto;
import com.jimsajo.Dto.MemberDto;
import com.jimsajo.Dto.ReviewDto;
import com.jimsajo.Service.CommentService;
import com.jimsajo.Service.GoodService;
import com.jimsajo.Service.ReviewService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {
	@Autowired //리뷰
	private ReviewService reviewService;
	
	@Autowired //댓글+대댓글
	private CommentService commentService;
	
	@Autowired //좋아요
	private GoodService goodService;
	
	@RequestMapping("/reviewForm")
	public String root() {
		return "review/reviewForm"; //리뷰 작성 홈
	}
	
	@RequestMapping("reviewSave")
	public String reviewSave(@ModelAttribute ReviewDto reviewDto,
							 @RequestParam("file") MultipartFile file,
							 HttpSession session) {
		
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		if(loginUser != null) {
			reviewDto.setMNum(loginUser.getMNum()); //로그인 사용자 ID설정
		}
		
		reviewService.saveReview(reviewDto, file);
		return "redirect:/review/reviewList"; //리뷰저장
	}
	
	@RequestMapping("reviewList")
	public String reviewList(Model model)throws Exception{
		model.addAttribute("reviews", reviewService.selectReviewList());
		return "review/reviewList"; //전체 리뷰 목록
	}
	
	@RequestMapping("commentAdd")
	public String  commentAdd(@ModelAttribute CommentDto commentDto,HttpSession session) throws Exception{
		MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
		if(loginUser != null) {
			commentDto.setMNum(loginUser.getMNum());
		}
		if(commentDto.getParentCNum() == 0) {
			commentDto.setParentCNum(0);
		}
		commentService.addComment(commentDto);
		return "redirect:/review/reviewDetail/"+commentDto.getRNum();
	}
	
	//댓글 수정
	@RequestMapping("commentUpdate")
	public String commentUpdate(@ModelAttribute CommentDto commentDto)throws Exception{
		commentService.updateComment(commentDto);
		return "redirect:/review/reviewDetail/"+commentDto.getRNum();
	}
	@RequestMapping("commentDelete/{cNum}/{rNum}/{isParent}")
	public String commentDelete(@PathVariable int cNum,
								@PathVariable int rNum,
								@PathVariable boolean isParent)throws Exception{
		commentService.deleteComment(cNum, isParent);
		return "redirect:/review/reviewDetail/"+rNum;
	}
	
	@RequestMapping("reviewDetail/{rNum}")
	public String reviewDetail(@PathVariable int rNum, Model model,HttpSession session)throws Exception{
		MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
		ReviewDto review = reviewService.reviewListDetail(rNum);

	    if (review == null) {
	        model.addAttribute("message", "해당 리뷰가 존재하지 않습니다.");
	        model.addAttribute("redirectUrl", "/review/reviewList");
	        return "review/errorPage"; // 사용자 정의 에러 JSP
	    }
		//조회수 증가
		reviewService.increaseViewCount(rNum);
		
		// 좋아요 수 및 사용자 좋아요 여부 조회 
		int goodCount = goodService.getGoodCnt(rNum);
	    boolean goodByUser = false;
	    if (loginUser != null) {
	        goodByUser = goodService.isGoodByUser(rNum, loginUser.getMNum());
	    }

	    // 댓글 리스트 가져오기
	    List<CommentDto> comments = commentService.getCommentByReview(rNum);
		
		// 모델에 데이터 추가
		model.addAttribute("goodCnt", goodCount);
		model.addAttribute("goodByUser", goodByUser);
		model.addAttribute("review",review);
		model.addAttribute("comments", comments);
		return "review/reviewDetail"; //리뷰 상세보기
	}
	
	@RequestMapping("updateReview/{rNum}")//리뷰 수정 폼
	public String updateReviewForm(@PathVariable int rNum, Model model)throws Exception{
		model.addAttribute("upReview",reviewService.reviewListDetail(rNum));
		return "review/updateReview"; 
	}
	
	@RequestMapping("updateReview")//리뷰 수정 처리
	public String updateReview(@ModelAttribute ReviewDto reviewDto, @RequestParam("file") MultipartFile file) {
		reviewService.updateReview(reviewDto, file);
		return "redirect:/review/reviewDetail/"+reviewDto.getRNum();
	}
	
	@RequestMapping("deleteReview/{rNum}")
	public String delete(@PathVariable int rNum)throws Exception{
		reviewService.deleteReview(rNum);
		return "redirect:/review/reviewList";
	}
	
	//좋아용
	@RequestMapping("toggleGood")
	public String toggleGood(@RequestParam int rNum, HttpSession session, RedirectAttributes ra) throws Exception{
		MemberDto loginUser = (MemberDto)session.getAttribute("loginUser");
		if(loginUser == null) {
			 ra.addFlashAttribute("msg", "로그인이 필요합니다.");
		        return "redirect:/loginForm";
		}
		int mNum = loginUser.getMNum();
		goodService.toggleGood(rNum, mNum);
	    return "redirect:/reviewDetail/" + rNum;
	}
	
}
