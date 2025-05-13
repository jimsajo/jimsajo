package com.jimsajo.Controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jimsajo.Dto.PackageDto;
import com.jimsajo.Service.PackageService;

import jakarta.servlet.ServletContext;
import jakarta.validation.Valid;

@Controller
public class PackageController {

    @Autowired
    private PackageService packageService;

    @Autowired
    private ServletContext servletContext;

    @Value("${file.upload-dir}")  // application.properties에서 파일 경로 읽기
    private String uploadDir;

    // 등록 폼
    @GetMapping("/package")
    public String uploadPage() {
        return "package/packageUpload";
    }

    // 패키지 등록 처리
    @PostMapping("/write")
    public String packageWrite(@Valid @ModelAttribute PackageDto packageDto, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            return "package/packageUpload";
        }

        MultipartFile file = packageDto.getUploadFile();

        if (file != null && !file.isEmpty()) {
            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            File saveDir = new File(uploadDir);
            if (!saveDir.exists()) {
                saveDir.mkdirs();
            }
            file.transferTo(new File(saveDir, fileName));
            packageDto.setpImage(fileName);
        }

        packageService.registerPackage(packageDto);
        return "redirect:/packagelist";
    }



    // 패키지 목록 보기
    @GetMapping("/packagelist")
    public String packageList(Model model) {
        List<PackageDto> list = packageService.selectPackage();
        model.addAttribute("packageList", list);
        return "package/packageList";
    }

    // 상세보기
    @GetMapping("/package/detail")
    public String packageDetail(@RequestParam("pNum") Integer pNum, Model model) {
        PackageDto dto = packageService.selectPackageById(pNum);
        if (dto == null) {
            model.addAttribute("errorMessage", "해당 패키지를 찾을 수 없습니다.");
            return "error/404";  // 사용자 정의 404 에러 페이지
        }
        model.addAttribute("dto", dto);
        return "package/packageDetail";
    }

    // 수정 폼
    @GetMapping("/package/edit")
    public String packageEdit(@RequestParam("pNum") Integer pNum, Model model) {
        PackageDto dto = packageService.selectPackageById(pNum);
        if (dto == null) {
            return "error/404";
        }
        model.addAttribute("dto", dto);
        return "package/packageEdit";
    }

    // 수정 처리
    @PostMapping("/package/update")
    public String updatePackage(PackageDto packageDto) throws Exception {
        packageService.updatePackage(packageDto);
        return "redirect:/package/detail?pNum=" + packageDto.getpNum();
    }

    // 삭제 처리
    @PostMapping("/package/delete")
    public String deletePackage(@RequestParam("pNum") Integer pNum) throws Exception {
        packageService.deletePackage(pNum);
        return "redirect:/packagelist";
    }

    // 국가별 필터링
    @GetMapping("/packagelist/country")
    public String packageListByCountry(@RequestParam("pCountry") String pCountry, Model model) {
        List<PackageDto> list = packageService.selectPackageByCountry(pCountry);
        model.addAttribute("packageList", list);
        model.addAttribute("pCountry", pCountry);
        return "country/country";
    }

    // 이미지 업로드 처리
 // 이미지 업로드 처리
 // 이미지 업로드 처리
    @PostMapping("/upload")
    @ResponseBody
    public Map<String, Object> uploadImage(@RequestParam("upload") MultipartFile file) {
        Map<String, Object> result = new HashMap<>();
        try {
            if (file.isEmpty()) {
                throw new IOException("파일이 비어 있습니다.");
            }

            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            File saveDir = new File(uploadDir);
            if (!saveDir.exists()) {
                saveDir.mkdirs();
            }

            File dest = new File(saveDir, fileName);
            file.transferTo(dest);

            result.put("url", "/uploads/" + fileName);  // 파일 경로를 /uploads/로 수정
        } catch (Exception e) {
            e.printStackTrace(); // 로그로 확인
            result.put("error", Map.of("message", "파일 업로드에 실패했습니다: " + e.getMessage()));
        }
        return result;
    }






}
