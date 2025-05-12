package com.jimsajo.Controller;

import java.io.IOException;
import java.nio.file.*;
import java.util.*;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class InquiryUploadController {

    @PostMapping("/upload-image")
    public Map<String, Object> uploadImage(@RequestParam("upload") MultipartFile file) {
        Map<String, Object> response = new HashMap<>();
        try {
            String fileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
            Path uploadPath = Paths.get("uploads/" + fileName); // 프로젝트 루트 기준 상대 경로

            Files.createDirectories(uploadPath.getParent());
            Files.copy(file.getInputStream(), uploadPath, StandardCopyOption.REPLACE_EXISTING);

            response.put("uploaded", true);
            response.put("url", "/uploads/" + fileName); // 프론트에서 접근 가능한 경로
        } catch (IOException e) {
            response.put("uploaded", false);
            response.put("error", Map.of("message", "이미지 업로드 실패"));
        }
        return response;
    }
}
