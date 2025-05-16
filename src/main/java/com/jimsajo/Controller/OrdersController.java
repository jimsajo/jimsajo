package com.jimsajo.Controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jimsajo.Dto.PackageDto;
import com.jimsajo.Dto.memberDto;
import com.jimsajo.Dto.ordersDto;
import com.jimsajo.Service.OrdersService;
import com.jimsajo.Service.PackageService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/orders")  // 공통 prefix
public class OrdersController {

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private PackageService packageService;

    @PostMapping("/submit")
    public String submitOrder(@ModelAttribute ordersDto dto, HttpSession session, RedirectAttributes ra) throws Exception {
        memberDto loginUser = (memberDto) session.getAttribute("loginUser");
        if (loginUser == null) return "redirect:/loginForm";

        // 로그인 사용자 번호와 오늘 날짜 저장
        dto.setmNum(loginUser.getmNum());
        dto.setoDate(LocalDate.now());

        // 패키지 가격을 가져와 인원수와 곱하여 oPrice 설정
        PackageDto packageDto = packageService.getPackageById(dto.getpNum());
        if (packageDto == null) {
            ra.addFlashAttribute("msg", "패키지를 찾을 수 없습니다.");
            return "redirect:/packagelist";
        }
        int totalPrice = packageDto.getpPrice() * dto.getoPeople();
        dto.setoPrice(totalPrice); // 서버에서 안전하게 총 결제금액 계산

        // 주문 저장
        ordersService.insertOrders(dto);

        // 결제 페이지로 넘길 정보 설정
        ra.addAttribute("pNum", dto.getpNum());
        ra.addAttribute("oNum", dto.getoNum());

        return "redirect:/pay";
    }
    
    @GetMapping("/ordersform")
    public String showOrderForm(@RequestParam("pNum") int pNum, Model model, HttpSession session) {
        memberDto loginUser = (memberDto) session.getAttribute("loginUser");
        if (loginUser == null) return "redirect:/loginForm";

        PackageDto packageDto = packageService.getPackageById(pNum);
        if (packageDto == null) return "redirect:/packagelist";

        model.addAttribute("packageDto", packageDto);
        model.addAttribute("loginUser", loginUser);
        return "orders/ordersform";  // JSP 파일 경로
    }


    @GetMapping("/orderList")
    public String orderList(Model model) {
        List<ordersDto> orderList = ordersService.selectPaidOrders();
        model.addAttribute("orderList", orderList);
        return "orders/orderList"; // JSP 파일 경로
    }
}
