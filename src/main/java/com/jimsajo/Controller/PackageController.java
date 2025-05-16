package com.jimsajo.Controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jimsajo.Dto.PackageDto;
import com.jimsajo.Dto.memberDto;
import com.jimsajo.Service.PackageService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PackageController {

    @Autowired
    private PackageService packageService;
    

    @Value("${file.upload-dir}")
    private String uploadDir;

    // 메인 페이지 (추천 패키지 포함)
    @GetMapping("/")
    public String mainPage(Model model) {
        List<PackageDto> recommendedPackages = packageService.getRecommendedPackages();
        model.addAttribute("recommendedPackages", recommendedPackages);
        return "index";
    }


    // 패키지 등록 페이지
    @GetMapping("/package")
    public String uploadPage() {
        return "package/packageUpload";
    }

    // 패키지 등록 처리
    @PostMapping("/write")
    public String packageWrite(@ModelAttribute PackageDto packageDto) throws Exception {
        MultipartFile uploadFile = packageDto.getUploadFile();

        if (uploadFile != null && !uploadFile.isEmpty()) {
            String fileName = UUID.randomUUID().toString() + "_" + uploadFile.getOriginalFilename();
            File saveDir = new File(uploadDir);
            if (!saveDir.exists()) {
                saveDir.mkdirs();
            }

            try {
                File saveFile = new File(saveDir, fileName);
                uploadFile.transferTo(saveFile);
                packageDto.setpImage(fileName);
            } catch (Exception e) {
                e.printStackTrace();
                throw new Exception("파일 업로드 중 오류가 발생했습니다.");
            }
        }

        packageService.registerPackage(packageDto);
        return "redirect:/packagelist";
    }

    // 전체 패키지 목록
    @GetMapping("/packagelist")
    public String packageList(Model model) {
        List<PackageDto> list = packageService.selectPackage();
        model.addAttribute("packageList", list);
        return "package/packageList";
    }

    // 패키지 상세 보기
    @GetMapping("/package/detail/{pNum}")
    public String packageDetail(@PathVariable("pNum") Integer pNum, Model model) {
        PackageDto dto = packageService.getPackageById(pNum);
        model.addAttribute("dto", dto);
        return "package/packageDetail";
    }

    // 국가별 패키지 목록
    @RequestMapping("/packagelist/country")
    public String packageListByCountry(@RequestParam("pCountry") String pCountry, Model model) {
        List<PackageDto> list = packageService.getPackagesByCountry(pCountry);
        model.addAttribute("packageList", list);
        return "package/packageList";
    }

    // 패키지 수정 폼
    @GetMapping("/package/update/{pNum}")
    public String updatePackageForm(@PathVariable Integer pNum, Model model) {
        PackageDto packageDto = packageService.getPackageById(pNum);
        model.addAttribute("dto", packageDto);
        return "package/packageEdit";
    }

    // 패키지 수정 처리
    @PostMapping("/package/update")
    public String updatePackage(@ModelAttribute PackageDto packageDto, RedirectAttributes redirectAttributes) {
        MultipartFile uploadFile = packageDto.getUploadFile();

        if (uploadFile != null && !uploadFile.isEmpty()) {
            String filename = uploadFile.getOriginalFilename();
            File saveDir = new File(uploadDir);
            if (!saveDir.exists()) {
                saveDir.mkdirs();
            }

            try {
                if (packageDto.getpImage() != null && !packageDto.getpImage().isEmpty()) {
                    File oldFile = new File(uploadDir + "/" + packageDto.getpImage());
                    if (oldFile.exists()) {
                        oldFile.delete();
                    }
                }

                String newFileName = UUID.randomUUID().toString() + "_" + filename;
                File saveFile = new File(saveDir, newFileName);
                uploadFile.transferTo(saveFile);
                packageDto.setpImage(newFileName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        packageService.updatePackage(packageDto);
        redirectAttributes.addFlashAttribute("message", "패키지가 수정되었습니다.");
        return "redirect:/packagelist";
    }

    // 패키지 삭제
    @PostMapping("/package/delete")
    public String deletePackage(@RequestParam("pNum") Integer pNum, RedirectAttributes redirectAttributes) {
        packageService.deletePackage(pNum);
        redirectAttributes.addFlashAttribute("message", "패키지가 삭제되었습니다.");
        return "redirect:/packagelist";
    }

    // CKEditor 이미지 업로드용
    @PostMapping("/api/upload-package-image")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> uploadPackageImage(@RequestParam("upload") MultipartFile file) {
        Map<String, Object> response = new HashMap<>();

        if (file.isEmpty()) {
            response.put("error", "파일이 비어 있습니다.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }

        try {
            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            File saveDir = new File(uploadDir);
            if (!saveDir.exists()) {
                saveDir.mkdirs();
            }

            File saveFile = new File(saveDir, fileName);
            file.transferTo(saveFile);

            String fileUrl = "/assets/img/package/" + fileName;
            response.put("uploaded", true);
            response.put("url", fileUrl);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("uploaded", false);
            response.put("error", "업로드 중 오류 발생");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    // 추천 처리
    @PostMapping("/recommend/{pNum}")
    public String recommendPackage(@PathVariable Integer pNum) {
        try {
            packageService.recommendPackage(pNum);
            return "redirect:/package/detail/" + pNum;
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
     // 로그인한 사용자의 결제 패키지 중, 특정 국가 필터로 가져오기
    @GetMapping("/api/orderedPackagesByCountry")
    @ResponseBody
    public List<PackageDto> getOrderedPackagesByCountry(@RequestParam("country") String country, HttpSession session) {
        memberDto loginUser = (memberDto) session.getAttribute("loginUser");
        if (loginUser == null) return new ArrayList<>();

        int mNum = loginUser.getmNum();
        return packageService.getPackagesByMemberAndCountry(mNum, country);
    }
}
