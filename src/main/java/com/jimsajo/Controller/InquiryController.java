package com.jimsajo.Controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jimsajo.Dto.InquiryDto;
import com.jimsajo.Service.InquiryService;

@Controller
public class InquiryController {
	
	@Autowired
	private InquiryService inquiryService;

	@RequestMapping("/inquiry")
	public String inquiry() {
		return "inquiry/inquiryForm";
	}
	@RequestMapping("/inquiryList")
	public String inquiryWrite(InquiryDto inquiry) throws Exception{
		inquiryService.insertInquiry(inquiry);
			return "redirect:inquiry/inquiryList";
	}
		

	@RequestMapping("/inquiry/inquiryList")
	public String showInquiryList(Model model) {
		
		List<InquiryDto> list = inquiryService.getAllInquiries();
	    model.addAttribute("inquiry", list);
		
		return "inquiry/inquiryList";
	}
	// 상세보기
	@GetMapping("/inquiry/detail")
	public String detail(@RequestParam("iNum") Integer iNum, Model model) {
	    InquiryDto inquiry = inquiryService.getInquiryById(iNum);
	    model.addAttribute("inquiry", inquiry);
	    return "inquiry/inquiryDetail"; // 상세보기 페이지 뷰
	}
	 @GetMapping("/inquiry/edit")
	    public String edit(@RequestParam("iNum") Integer iNum, Model model) {
	        InquiryDto inquiry = inquiryService.getInquiryById(iNum);
	        model.addAttribute("inquiry", inquiry);
	        return "inquiry/inquiryEdit";  // 수정 페이지
	    }

	    // 수정 처리
	    @PostMapping("/inquiry/update")
	    public String update(InquiryDto inquiry) {
	    	inquiry.setiTime(LocalDateTime.now());
	    	
	    	inquiryService.updateInquiry(inquiry);  // 수정된 내용을 서비스로 전달하여 DB 업데이트
	        return "redirect:/inquiry/detail?iNum=" + inquiry.getiNum();  // 수정 후 상세보기 페이지로 이동
	    }

	    // 삭제 처리
	    @GetMapping("/inquiry/delete")
	    public String delete(@RequestParam("iNum") Integer iNum) {
	        inquiryService.deleteInquiry(iNum);  // 삭제 서비스 호출
	        return "redirect:/inquiry/inquiryList";  // 삭제 후 목록 페이지로 이동
	    }


	
}
