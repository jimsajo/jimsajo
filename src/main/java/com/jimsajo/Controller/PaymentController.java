package com.jimsajo.Controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jimsajo.Dto.PackageDto;
import com.jimsajo.Dto.PaymentDto;
import com.jimsajo.Dto.memberDto;
import com.jimsajo.Dto.ordersDto;
import com.jimsajo.Mapper.IPaymentMapper;
import com.jimsajo.Service.OrdersService;
import com.jimsajo.Service.PackageService;
import com.jimsajo.Service.PaymentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private IPaymentMapper iPaymentMapper;
    
    @Autowired
    private PackageService packageService;
    
    @Autowired 
    private OrdersService ordersService;
    
    @RequestMapping("/pay")
    public String goToPaymentPage(@RequestParam("pNum") Integer pNum,
    							  @RequestParam("oNum") Integer oNum,
                                  Model model,
                                  HttpSession session,
                                  RedirectAttributes ra) {
    	memberDto loginUser = (memberDto) session.getAttribute("loginUser");

        if (loginUser == null) {
            ra.addFlashAttribute("msg", "로그인이 필요합니다.");
            return "redirect:/loginForm";
        }
        
        PackageDto dto = packageService.getPackageById(pNum);
        ordersDto orderDto = ordersService.getOrderById(oNum);
        if (dto == null) {
            ra.addFlashAttribute("msg", "해당 패키지를 찾을 수 없습니다.");
            return "redirect:/packagelist";
        }
        
        model.addAttribute("packageDto", dto);
        model.addAttribute("orderDto", orderDto);
        model.addAttribute("loginUser", loginUser);

        return "payment/payment"; 
    }
//    // 결제 내역 조회 : 전체 결제내역(관리자 필요시 사용)
//    @RequestMapping("/payment/paymentList")
//    public ModelAndView paymentList() throws Exception{
//    	ModelAndView mv = new ModelAndView("payment/paymentList");
//    	
//    	List<PaymentDto> list = iPaymentMapper.selectPayment();
//    	mv.addObject("payments",list);
//    	return mv;
//    }
    
    //사용자 본인 결제 내역만 보이게 하기
    @GetMapping("/payment/paymentList")
    public ModelAndView paymentList(HttpSession session, RedirectAttributes ra) {
        memberDto loginUser = (memberDto) session.getAttribute("loginUser");

        if (loginUser == null) {
            ra.addFlashAttribute("msg", "로그인이 필요합니다.");
            return new ModelAndView("redirect:/loginForm");
        }

        List<PaymentDto> list = paymentService.selectPaymentsByMember(loginUser.getmNum());
        ModelAndView mv = new ModelAndView("payment/paymentList");
        mv.addObject("payments", list);
        return mv;
    }

    // 아임포트 결제 검증 후 DB 저장
    @ResponseBody
    @PostMapping("/api/payment/verify")
    public String verifyIamport(@RequestBody Map<String, String> param,HttpSession session) throws IOException {
        String impUid = param.get("imp_uid");
        int pNum = Integer.parseInt(param.get("pNum"));
        int oNum = Integer.parseInt(param.get("oNum"));
        memberDto loginUser = (memberDto) session.getAttribute("loginUser");
        if (loginUser == null) return "로그인 필요";
        paymentService.verifyAndSave(impUid, pNum, loginUser.getmNum(), oNum);//이 안에서 DB에 insertPayment()실행
        return "결제 완료";
    }
    // 결제 취소
    @PostMapping("/payment/cancel")
    public String cancelPayment(@RequestParam("impUid") String impUid,
                                 @RequestParam("amount") int amount,
                                 HttpSession session,
                                 RedirectAttributes ra) throws IOException {
        memberDto loginUser = (memberDto) session.getAttribute("loginUser");
        if (loginUser == null) {
            ra.addFlashAttribute("msg", "로그인이 필요합니다.");
            return "redirect:/loginForm";
        }

        boolean result = paymentService.cancelPayment(impUid, amount);
        ra.addFlashAttribute("msg", result ? "결제 취소 완료" : "결제 취소 실패");
        return "redirect:/payment/paymentList";
    }
    
}


