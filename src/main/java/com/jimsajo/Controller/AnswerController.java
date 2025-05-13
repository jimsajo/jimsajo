package com.jimsajo.Controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jimsajo.Dto.AnswerDto;
import com.jimsajo.Dto.memberDto;
import com.jimsajo.Service.AnswerService;
import com.jimsajo.Service.InquiryService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AnswerController {
	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private InquiryService inquiryService;
	
	// 답변 등록
    @RequestMapping("/answer/add")
    public String addAnswer(AnswerDto answer, HttpSession session) {
        memberDto loginUser = (memberDto) session.getAttribute("loginUser");

        if (loginUser == null || !"admin".equals(loginUser.getmRole())) {
            return "redirect:/loginForm"; // 또는 접근 거부 페이지로 리다이렉트
        }

        answer.setMNum(loginUser.getmNum());
        answer.setMId(loginUser.getmId());
        answer.setATime(LocalDateTime.now());

        answerService.insertAnswer(answer);
        return "redirect:/inquiry/detail?iNum=" + answer.getINum();
    }
    
 // 답변 수정 폼
    @RequestMapping("/answer/edit")
    public String editAnswerForm(@RequestParam("aNum") int aNum, Model model, HttpSession session) {
        memberDto loginUser = (memberDto) session.getAttribute("loginUser");

        if (loginUser == null || !"admin".equals(loginUser.getmRole())) {
            return "redirect:/loginForm";
        }

        AnswerDto answer = answerService.getAnswerById(aNum);
        model.addAttribute("answer", answer);
        return "inquiry/answerEdit";
    }
    
 // 답변 수정 처리
    @RequestMapping("/answer/update")
    public String updateAnswer(AnswerDto answer, HttpSession session) {
        memberDto loginUser = (memberDto) session.getAttribute("loginUser");

        if (loginUser == null || !"admin".equals(loginUser.getmRole())) {
            return "redirect:/loginForm";
        }

        answer.setATime(LocalDateTime.now());
        answerService.updateAnswer(answer);
        return "redirect:/inquiry/detail?iNum=" + answer.getINum();
    }
    
 // 답변 삭제
    @RequestMapping("/answer/delete")
    public String deleteAnswer(@RequestParam("aNum") int aNum, @RequestParam("iNum") int iNum, HttpSession session) {
        memberDto loginUser = (memberDto) session.getAttribute("loginUser");

        if (loginUser == null || !"admin".equals(loginUser.getmRole())) {
            return "redirect:/loginForm";
        }

        answerService.deleteAnswer(aNum);
        return "redirect:/inquiry/detail?iNum=" + iNum;
    }
	
}
