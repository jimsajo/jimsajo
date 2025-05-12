package com.jimsajo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jimsajo.Dto.PackageDto;
import com.jimsajo.Service.PackageService;

@Controller
public class PackageController {

    @Autowired
    private PackageService packageService;

    // 등록 폼

    @RequestMapping("/")
    public String uploadPage() {
        return "package/packageUpload"; // packageUpload.jsp
    }

    // 패키지 등록 처리
    @PostMapping("/write")
    public String packageWrite(PackageDto packageDto) throws Exception {
        packageService.registerPackage(packageDto);
        return "redirect:/packagelist"; // GET 요청으로 목록 보기로 이동
    }

    // 패키지 목록 보기
    @GetMapping("/packagelist")
    public String packageList(Model model) {
        List<PackageDto> list = packageService.selectPackage();
        model.addAttribute("packageList", list); // 올바른 모델명 사용
        return "package/packageList"; // packageList.jsp
    }
    //상세보기용
    @GetMapping("/package/detail")
    public String packageDetail(@RequestParam("pNum") Integer pNum, Model model) {
        PackageDto dto = packageService.selectPackageById(pNum);
        model.addAttribute("dto", dto);
        return "package/packageDetail";
    }
    // 수정 폼 보여주기
    @GetMapping("/package/edit")
    public String packageEdit(@RequestParam("pNum") Integer pNum, Model model) {
        PackageDto dto = packageService.selectPackageById(pNum);
        model.addAttribute("dto", dto);
        return "package/packageEdit";
    }

    // 실제 수정 처리
    @PostMapping("/package/update")
    public String updatePackage(PackageDto packageDto) throws Exception{
        packageService.updatePackage(packageDto);
        return "redirect:/package/detail?pNum=" + packageDto.getpNum();
    }

    // 삭제 처리
    @PostMapping("/package/delete")
    public String deletePackage(@RequestParam("pNum") Integer pNum) throws Exception {
        packageService.deletePackage(pNum);
        return "redirect:/packagelist";
    }
    @GetMapping("/packagelist/country")
    public String packageListByCountry(@RequestParam("pCountry") String pCountry, Model model) {
        List<PackageDto> list = packageService.selectPackageByCountry(pCountry);
        model.addAttribute("packageList", list);
        model.addAttribute("pCountry", pCountry);
        return "country/country"; // 새로운 JSP 페이지
    }

}
