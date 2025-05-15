package com.jimsajo.Controller;

import java.io.File;
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
import com.jimsajo.Service.PackageService;

@Controller
public class PackageController {

	
    @Autowired
    private PackageService packageService;

    // application.properties에 설정된 실제 경로 사용
    @Value("${file.upload-dir}")
    private String uploadDir;

    // 패키지 등록 페이지로 이동
    @GetMapping("/package")
    public String uploadPage() {
    	
        return "package/packageUpload";
    }

    // 패키지 등록 처리
    @PostMapping("/write")
    public String packageWrite(@ModelAttribute PackageDto packageDto) throws Exception {
        MultipartFile uploadFile = packageDto.getUploadFile();

        if (uploadFile != null && !uploadFile.isEmpty()) {
            // 고유 파일명 생성
            String fileName = UUID.randomUUID().toString() + "_" + uploadFile.getOriginalFilename();
            File saveDir = new File(uploadDir);
            if (!saveDir.exists()) {
                saveDir.mkdirs();
            }

            // 파일 저장
            try {
                File saveFile = new File(saveDir, fileName);
                uploadFile.transferTo(saveFile);
                packageDto.setpImage(fileName);  // DTO에 저장된 파일명 저장
            } catch (Exception e) {
                // 예외 처리
                e.printStackTrace();
                throw new Exception("파일 업로드 중 오류가 발생했습니다.");
            }
        }

        // 패키지 등록
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
        PackageDto dto = packageService.getPackageById(pNum);  // 메소드 수정
        
        model.addAttribute("dto", dto);
        return "package/packageDetail";
    }

    // 국가별 패키지 조회
    @RequestMapping("/packagelist/country")
    public String packageListByCountry(@RequestParam("pCountry") String pCountry, Model model) {
        List<PackageDto> list = packageService.getPackagesByCountry(pCountry);
        model.addAttribute("packageList", list);
        return "package/packageList";
    }

    // 패키지 수정 폼
    @GetMapping("/package/update/{pNum}")
    public String updatePackageForm(@PathVariable Integer pNum, Model model) {
        PackageDto packageDto = packageService.getPackageById(pNum);  // 메소드 수정
        
        model.addAttribute("dto", packageDto);
        return "package/packageEdit"; // 수정 페이지로 이동
    }

    @PostMapping("/package/update")
    public String updatePackage(@ModelAttribute PackageDto packageDto, RedirectAttributes redirectAttributes) {
        // 업로드된 파일이 있는지 확인
        if (packageDto.getUploadFile() != null && !packageDto.getUploadFile().isEmpty()) {
            // 새로운 이미지 파일이 업로드된 경우
            String uploadDir = this.uploadDir; // application.properties에서 설정된 경로 사용
            String filename = packageDto.getUploadFile().getOriginalFilename();
            File saveDir = new File(uploadDir);

            // 디렉토리가 없으면 생성
            if (!saveDir.exists()) {
                saveDir.mkdirs();
            }

            try {
                // 기존 이미지 파일 삭제 (있는 경우에만)
                if (packageDto.getpImage() != null && !packageDto.getpImage().isEmpty()) {
                    File oldFile = new File(uploadDir + "/" + packageDto.getpImage()); // 경로 수정
                    if (oldFile.exists()) {
                        oldFile.delete();  // 기존 파일 삭제
                    }
                }

                // 새로운 파일 저장
                String newFileName = UUID.randomUUID().toString() + "_" + filename;
                File saveFile = new File(saveDir, newFileName);
                packageDto.getUploadFile().transferTo(saveFile);
                packageDto.setpImage(newFileName);  // DTO에 새로운 이미지 경로 저장
            } catch (Exception e) {
                e.printStackTrace();
                // 예외 처리
            }
        } else {
            // 이미지가 업로드되지 않으면 기존 이미지 경로 사용
            // 이 부분은 사실 필요없을 수 있음
        }

        // 패키지 업데이트 처리
        packageService.updatePackage(packageDto);
        redirectAttributes.addFlashAttribute("message", "패키지가 수정되었습니다.");
        return "redirect:/packagelist";  // 목록 페이지로 리다이렉트
    }



    // 패키지 삭제
    @PostMapping("/package/delete")
    public String deletePackage(@RequestParam("pNum") Integer pNum, RedirectAttributes redirectAttributes) {
        packageService.deletePackage(pNum);
        redirectAttributes.addFlashAttribute("message", "패키지가 삭제되었습니다.");
        return "redirect:/packagelist";  // 목록 페이지로 리다이렉트
    }
    @PostMapping("/api/upload-package-image")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> uploadPackageImage(@RequestParam("upload") MultipartFile file) {
        Map<String, Object> response = new HashMap<>();

        if (file.isEmpty()) {
            response.put("error", "파일이 비어 있습니다.");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }

        try {
            // 파일명 생성
            String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
            File saveDir = new File(uploadDir);  // 실제 저장 경로
            if (!saveDir.exists()) {
                saveDir.mkdirs();  // 디렉토리가 없으면 생성
            }

            File saveFile = new File(saveDir, fileName);
            file.transferTo(saveFile);  // 파일 저장

            // 웹 경로로 반환 (예: http://localhost:8080/uploads/images/{fileName})
            String fileUrl = "/uploads/images/" + fileName;  // 실제 파일 경로와 웹 경로 연결
            response.put("url", fileUrl);  // CKEditor와 같은 클라이언트에서 사용되는 경로
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("error", "업로드 중 오류 발생");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
    // 추천하기
    @PostMapping("/recommend/{pNum}")
    public String recommendPackage(@PathVariable Integer pNum) {
        try {
            packageService.recommendPackage(pNum);  // 서비스 계층에서 추천 등록
            return "redirect:/package/detail/" + pNum;  // 상세 페이지로 리다이렉트
        } catch (Exception e) {
            e.printStackTrace();
            return "error";  // 오류 발생 시 에러 페이지로 리다이렉트
        }
    }
}
