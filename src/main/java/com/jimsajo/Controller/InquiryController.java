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
import com.jimsajo.Dto.memberDto;
import com.jimsajo.Service.AnswerService;
import com.jimsajo.Service.InquiryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class InquiryController {

    @Autowired
    private AnswerService answerService;

    @Autowired
    private InquiryService inquiryService;

    // 문의 작성 폼 이동
    @RequestMapping("/inquiry")
    public String inquiry(HttpServletRequest request) {
        if (request.isUserInRole("ROLE_admin")) {
            return "redirect:/inquiry/inquiryList"; // 관리자면 목록
        }
        return "inquiry/inquiryForm"; // 일반 유저면 작성 폼
    }

    // 문의 작성 처리
    @RequestMapping("/inquiry/write")
    public String insertInquiry(InquiryDto inquiry) throws Exception {
        inquiryService.insertInquiry(inquiry);
        return "redirect:/inquiry/inquiryList";
    }

    // 문의 리스트 (관리자/일반 사용자 분기)
    @RequestMapping("/inquiry/inquiryList")
    public String showInquiryList(HttpSession session, Model model) {
        memberDto loginUser = (memberDto) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login";
        }

        List<InquiryDto> list = "admin".equals(loginUser.getmRole())
            ? inquiryService.getAllInquiries()
            : inquiryService.getUserInquiries(loginUser.getmNum());

        model.addAttribute("list", list);
        return "inquiry/inquiryList";
    }

    // 문의 상세 보기
    @GetMapping("/inquiry/detail")
    public String detail(@RequestParam("iNum") Integer iNum, Model model) {
        InquiryDto inquiry = inquiryService.getInquiryById(iNum);
        model.addAttribute("inquiry", inquiry);

        List<AnswerDto> answerList = answerService.selectAnswerByINum(iNum);
        model.addAttribute("answerList", answerList);

        return "inquiry/inquiryDetail";
    }

    // 문의 수정 폼
    @GetMapping("/inquiry/edit")
    public String edit(@RequestParam("iNum") Integer iNum, HttpSession session, Model model) {
        InquiryDto inquiry = inquiryService.getInquiryById(iNum);
        memberDto loginUser = (memberDto) session.getAttribute("loginUser");

        if (!"admin".equals(loginUser.getmRole()) && loginUser.getmNum() != inquiry.getmNum()) {
            return "redirect:/inquiry/inquiryList";
        }

        model.addAttribute("inquiry", inquiry);
        return "inquiry/inquiryEdit";
    }

    // 문의 수정 처리
    @PostMapping("/inquiry/update")
    public String update(InquiryDto inquiry, HttpSession session) {
        memberDto loginUser = (memberDto) session.getAttribute("loginUser");

        if (!"admin".equals(loginUser.getmRole()) && loginUser.getmNum() != inquiry.getmNum()) {
            return "redirect:/inquiry/inquiryList";
        }

        inquiry.setiTime(LocalDateTime.now());
        inquiryService.updateInquiry(inquiry);
        return "redirect:/inquiry/detail?iNum=" + inquiry.getiNum();
    }

    // 문의 삭제
    @GetMapping("/inquiry/delete")
    public String delete(@RequestParam("iNum") Integer iNum, HttpSession session) {
        memberDto loginUser = (memberDto) session.getAttribute("loginUser");
        InquiryDto inquiry = inquiryService.getInquiryById(iNum);

        if (!"admin".equals(loginUser.getmRole()) && loginUser.getmNum() != inquiry.getmNum()) {
            return "redirect:/inquiry/inquiryList";
        }

        inquiryService.deleteInquiry(iNum);
        return "redirect:/inquiry/inquiryList";
    }
}
