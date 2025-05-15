package com.jimsajo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jimsajo.Dto.memberDto;
import com.jimsajo.Mapper.loginMapper;
import com.jimsajo.Service.CustomOAuth2User;

import jakarta.servlet.http.HttpSession;

@Controller
public class loginController {

	@Autowired
	private loginMapper mapper;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	// 로그인 폼 
	@RequestMapping("/login")
	public String login() {
		return "member/login"; 
	}
	// 로그인 처리
	@RequestMapping("/loginProcess")
	public String login(memberDto inputMember, HttpSession session, Model model) throws Exception {
	    // 아이디로 회원 조회
	    memberDto member = mapper.selectMemberById(inputMember.getmId());
	    System.out.println("mName: " + member.getmName()); // 🔍 콘솔 출력 확인

	    // 아이디가 있는지 체크
	    if (member == null || !passwordEncoder.matches(inputMember.getmPasswd(), member.getmPasswd())) {
	        return "member/login";
	    }

	    // 세션 저장
	    session.setAttribute("loginUser", member);
	    return "redirect:/myPage";
	}

	
	// 로그아웃
	@RequestMapping("/logout")
		public String logout(HttpSession session) {
		    if (session.getAttribute("mId") != null) {
		        session.invalidate(); // 세션 전체 제거
		    }
		    return "redirect:/login"; // 로그아웃 후 로그인 페이지로 이동
		}
	// 마이페이지
	@RequestMapping("/myPage")
	public String myPage(HttpSession session, Authentication authentication) {
		Object principal = authentication.getPrincipal();
	    //카카오 로그인 사용자
		if (principal instanceof CustomOAuth2User customUser) {
			session.setAttribute("loginUser", customUser.getMember());
	    }  else if (principal instanceof org.springframework.security.core.userdetails.User springUser) {
	        // 일반 로그인 사용자
	        String mId = springUser.getUsername();
	        memberDto member = mapper.selectMemberById(mId);

	    if (member != null) {
	    	session.setAttribute("loginUser", member);
	        }
	    }
	    return "member/myPage";
	}

	
//	
//	@RequestMapping("/myPage")
//	public String myPage(@AuthenticationPrincipal User user) {
//	    if (user == null) {
//	        return "redirect:/login";
//	    }
//
//	    
//	    return "member/myPage";
//	}

}

