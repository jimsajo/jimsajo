package com.jimsajo.Controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jimsajo.Dto.PaymentDto;
import com.jimsajo.Mapper.IPaymentMapper;
import com.jimsajo.Service.PaymentService;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jimsajo.Dto.MemberDto;
import com.jimsajo.Dto.PackageDto;
import com.jimsajo.Dto.PaymentDto;
import com.jimsajo.Mapper.IPaymentMapper;
import com.jimsajo.Service.PackageService;
import com.jimsajo.Service.PaymentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private IPaymentMapper iPaymentDao;
    
    @Autowired
    private PackageService packageService;
    
    @RequestMapping("/pay")
    public String goToPaymentPage(@RequestParam("pNum") Integer pNum,
                                  Model model,
                                  HttpSession session,
                                  RedirectAttributes ra) {
        MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");

        if (loginUser == null) {
            ra.addFlashAttribute("msg", "로그인이 필요합니다.");
            return "redirect:/loginForm";
        }

        PackageDto dto = packageService.selectPackageById(pNum);
        model.addAttribute("package", dto);
        model.addAttribute("loginUser", loginUser);

        return "payment/payment"; 
    }
    // 결제 내역 조회
    @RequestMapping("paymentList")
    public ModelAndView paymentList() throws Exception{
    	ModelAndView mv = new ModelAndView("paymentList");
    	
    	List<PaymentDto> list = iPaymentDao.selectPayment();
    	mv.addObject("payments",list);
    	return mv;
    }
    
//    //사용자 본인 결제 내역만 보이게 하기
//    @GetMapping("/paymentList")
//    public ModelAndView paymentList(HttpSession session) {
//        ModelAndView mv = new ModelAndView("paymentList");
//        MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
//        if (loginUser == null) {
//            mv.setViewName("redirect:/loginForm");
//            return mv;
//        }
//
//        List<PaymentDto> list = paymentService.selectPaymentsByMember(loginUser.getMNum());
//        mv.addObject("payments", list);
//        return mv;
//    }

    // 아임포트 결제 검증 후 DB 저장
    @ResponseBody
    @PostMapping("/api/payment/verify")
    public String verifyIamport(@RequestBody Map<String, String> param,HttpSession session) throws IOException {
        String impUid = param.get("imp_uid");
        int pNum = Integer.parseInt(param.get("pNum"));
        MemberDto loginUser = (MemberDto) session.getAttribute("loginUser");
        if (loginUser == null) return "로그인 필요";
        paymentService.verifyAndSave(impUid, pNum,loginUser.getMNum());
        return "결제 완료";
    }
}


