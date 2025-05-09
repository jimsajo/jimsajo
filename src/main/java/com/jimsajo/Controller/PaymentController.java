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

@Controller
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private IPaymentMapper iPaymentDao;

    @RequestMapping("/payment")
    public String root() {
        return "payment";
    }

//    @RequestMapping("paymentWrite")
//    public String paymentWrite(PaymentDto paymentDto) {
//    	iPaymentDao.insertPayment(paymentDto);
//    	return "redirect:paymentList";
//    }
    
    
    @RequestMapping("paymentList")
    public ModelAndView paymentList() throws Exception{
    	ModelAndView mv = new ModelAndView("paymentList");
    	
    	List<PaymentDto> list = iPaymentDao.selectPayment();
    	mv.addObject("payments",list);
    	return mv;
    }

    @ResponseBody
    @PostMapping("/api/payment/verify")
    public String verifyIamport(@RequestBody Map<String, String> param) throws IOException {
        paymentService.verifyAndSave(param.get("imp_uid"));
        return "결제 완료";
    }
}


