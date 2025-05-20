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

import com.jimsajo.Dto.AnswerDto;
import com.jimsajo.Dto.InquiryDto;
import com.jimsajo.Service.AnswerService;
import com.jimsajo.Service.InquiryService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class InquiryController {

	@Autowired
	private AnswerService answerService;
	
    @Autowired
    private InquiryService inquiryService;

    @RequestMapping("/inquiry")
    public String inquiry(HttpServletRequest request) {
        if (request.isUserInRole("ROLE_admin")) {
            return "redirect:/inquiry/inquiryList"; // 관리자면 문의 목록으로
        }
        return "inquiry/inquiryForm"; // 일반 유저면 문의 작성 폼으로
    }

    @RequestMapping("/inquiryList")
    public String inquiryWrite(InquiryDto inquiry) throws Exception {
        inquiryService.insertInquiry(inquiry);
        return "redirect:/inquiry/inquiryList";
    }

    @RequestMapping("/inquiry/inquiryList")
    public String showInquiryList(Model model) {
        List<InquiryDto> list = inquiryService.getAllInquiries();
        model.addAttribute("list", list);
        return "inquiry/inquiryList";
    }

    @GetMapping("/inquiry/detail")
    public String detail(@RequestParam("iNum") Integer iNum, Model model) {
        InquiryDto inquiry = inquiryService.getInquiryById(iNum);
        model.addAttribute("inquiry", inquiry);

        List<AnswerDto> answerList = answerService.selectAnswerByINum(iNum);
        model.addAttribute("answerList", answerList);

        return "inquiry/inquiryDetail"; 
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
