package com.jimsajo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jimsajo.Dto.InquiryDto;
import com.jimsajo.Dto.PaymentDto;
import com.jimsajo.Dto.memberDto;
import com.jimsajo.Mapper.IPaymentMapper;
import com.jimsajo.Mapper.OrdersMapper;
import com.jimsajo.Mapper.loginMapper;
import com.jimsajo.Service.CustomOAuth2User;
import com.jimsajo.Service.InquiryService;
import com.jimsajo.Service.PaymentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class loginController {

	@Autowired
	private loginMapper mapper;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired 
	private IPaymentMapper paymentMapper;
	@Autowired
	private OrdersMapper ordersMapper;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private InquiryService inquiryService;
	
	// 로그인 폼 
	@RequestMapping("/login")
	public String login() {
		return "member/login"; 
	}
	@RequestMapping("/loginProcess")
	public String login(memberDto inputMember, HttpSession session, Model model) throws Exception {
	    // 아이디로 회원 조회
	    memberDto member = mapper.selectMemberById(inputMember.getmId());
	    System.out.println("mName: " + (member != null ? member.getmName() : "null")); // null 방지

	    // 로그인 실패 시
	    if (member == null || !passwordEncoder.matches(inputMember.getmPasswd(), member.getmPasswd())) {
	        model.addAttribute("loginError", true); // ✅ 로그인 실패 여부 전달
	        return "login"; // login.jsp에서 alert 처리
	    }

	    // 로그인 성공
	    session.setAttribute("loginUser", member);
	    return "redirect:/";
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
	    if (session.getAttribute("mId") != null) {
	        session.invalidate(); // 세션 전체 제거
	    }
	    return "redirect:/login"; // 로그아웃 후 로그인 페이지로 이동
	}

	// 마이페이지 (결제 내역 및 1:1 문의 통합)
	@RequestMapping("/myPage")
	public String myPage(HttpSession session, Authentication authentication, Model model) {
	    Object principal = authentication.getPrincipal();

	    // 카카오 로그인 사용자
	    if (principal instanceof CustomOAuth2User customUser) {
	        session.setAttribute("loginUser", customUser.getMember());
	        model.addAttribute("member", customUser.getMember());
	    }  
	    // 일반 로그인 사용자
	    else if (principal instanceof org.springframework.security.core.userdetails.User springUser) {
	        String mId = springUser.getUsername();
	        memberDto member = mapper.selectMemberById(mId);
	        if (member != null) {
	            session.setAttribute("loginUser", member);
	            model.addAttribute("member", member);
	        }
	    }

	    // 세션에서 로그인한 사용자 정보 확인
	    memberDto loginUser = (memberDto) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        return "redirect:/login";
	    }

	    int mNum = loginUser.getmNum(); // 로그인한 회원 번호

	    // 결제 내역
	    List<PaymentDto> payments = paymentService.selectPaymentsByMember(mNum);
	    model.addAttribute("payments", payments);

	    // 1:1 문의 내역 (로그인한 사용자 기준)
	    List<InquiryDto> inquiries = inquiryService.selectAllInquiryByAdmin(mNum);
	    model.addAttribute("inquiries", inquiries);
	    return "member/myPage";
	}

}
