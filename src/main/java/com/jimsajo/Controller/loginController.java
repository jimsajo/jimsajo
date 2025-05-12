package com.jimsajo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jimsajo.Dto.loginDto;
import com.jimsajo.Dto.memberDto;
import com.jimsajo.Mapper.loginMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class loginController {

	@Autowired
	private loginMapper mapper;
	
	// 로그인 폼 
	@RequestMapping("/login")
	public String login() {
		return "member/login"; 
	}
	@RequestMapping("/loginProcess")
    public String login(loginDto dto, HttpSession session, Model model) {
        memberDto member = mapper.login(dto.getmId(), dto.getmPasswd());

        if (member != null) {
            session.setAttribute("loginMember", member);
            return "redirect:/memberList";
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 틀렸습니다.");
            return "member/memberList";
        }
    }
}

