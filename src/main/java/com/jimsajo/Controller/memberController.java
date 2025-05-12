package com.jimsajo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jimsajo.Dto.memberDto;
import com.jimsajo.Mapper.memberMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class memberController {
	@Autowired
	private memberMapper mapper;
	
	//회원가입 폼 페이지
	@RequestMapping("/join")
	public String joinForm() {
		return "member/join";
	}
	
	//가입처리 페이지 
	@RequestMapping("/save")
	public String processJoin(@ModelAttribute memberDto dto) throws Exception {
	   mapper.insertMember(dto);            
	   return "redirect:/memberList";       
	}
	  
	//회원 리스트 페이지 
	@RequestMapping("/memberList")
	public String memberList(Model model) throws Exception {
		List<memberDto> members = mapper.selectMember();
		model.addAttribute("members", members);
		return "member/memberList";
	}
	
	//회원 탈퇴
	@RequestMapping("/memberDelete")
	public String deleteMember(HttpSession session) throws Exception {
	    memberDto loginMember = (memberDto) session.getAttribute("loginMember");
	    
	    if (loginMember != null) {
	        int mNum = loginMember.getmNum();
	        mapper.deleteMember(mNum);  // 회원 삭제
	        session.invalidate();       // 세션 무효화
	        return "redirect:/memberList";        // 메인 페이지로
	    } else {
	        return "redirect:/login";   // 로그인 안돼있으면 로그인 페이지로
	    }
	}

	
	// myPage 화면
	@RequestMapping("/myPage")
	public String myPage() {
		return "member/myPage";
	}
}
