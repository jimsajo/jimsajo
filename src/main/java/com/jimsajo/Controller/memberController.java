package com.jimsajo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//회원가입 폼 페이지
	@RequestMapping("/join")
	public String joinForm() {
		return "member/join";
	}
	
	//가입처리 페이지 
	@RequestMapping("/save")
	public String processJoin(@ModelAttribute memberDto dto) throws Exception {
		// 1. 평문 비밀번호 꺼내기
		   String rawPassword = dto.getmPasswd();

		   // 2. 암호화
		   String encodedPassword = passwordEncoder.encode(rawPassword);

		   // 3. 다시 DTO에 저장
		   dto.setmPasswd(encodedPassword);

		   // 4. DB에 저장
		   mapper.insertMember(dto);

		   return "redirect:/memberList";
		}
		
		//	   mapper.insertMember(dto);            
//	   return "redirect:/memberList";       
//	}
	  
	//회원 리스트 페이지 
	@RequestMapping("/memberList")
	public String memberList(Model model) throws Exception {
		List<memberDto> members = mapper.selectMember();
		System.out.println("불러온 회원 수: " + members.size());
	    for (memberDto m : members) {
	        System.out.println("회원: " + m.getmId() + ", " + m.getmName());
	    }
		model.addAttribute("members", members);
		return "member/memberList";
	}
	//회원 정보 수정 페이지
	@RequestMapping("/memberUpdate")
	public String updateMember(Authentication auth, Model model) {
	    if (auth == null || !auth.isAuthenticated()) {
	        return "redirect:/login";
	    }

	    String loginUserId = ((User) auth.getPrincipal()).getUsername();
	    memberDto member = mapper.findBy(loginUserId);

	    model.addAttribute("member", member); // ← 기존에는 loginUser (String)만 넣었음
	    return "member/memberUpdate";
	}

	
	//회원정보 수정 처리
	@RequestMapping("/memberUpdateProcess")
	public String updateMemberProcess(@ModelAttribute memberDto member, HttpSession session) {
	    memberDto loginUser = (memberDto) session.getAttribute("loginUser");
	    
	    if (loginUser == null || !loginUser.getmId().equals(member.getmId())) {
	        return "redirect:/login";
	    }

	    mapper.updatePasswordAndTel(member);
	    return "redirect:/myPage";
	}


	
	//회원 탈퇴
	@RequestMapping("/memberDelete")
	public String deleteMember(HttpSession session) throws Exception {
	    memberDto loginUser = (memberDto) session.getAttribute("loginUser");

	    if (loginUser != null) {
	        Integer mNum = loginUser.getmNum(); // 세션에 저장된 객체에서 꺼냄
	        mapper.deleteMember(mNum);
	        session.invalidate();
	        return "redirect:/"; // 탈퇴 후 메인으로 이동
	    } else {
	        return "redirect:/login";
	    }
	}


}
