package com.jimsajo.Controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class InquiryUploadController {

    @Value("${file.upload-dir}")
    private String uploadDir;

    @Value("${file.access-url-prefix:/uploads/images/}")
    private String imageAccessUrlPrefix;

    private static final List<String> ALLOWED_EXTENSIONS = List.of("jpg", "jpeg", "png", "gif", "webp");

    // 이미지 업로드 API
    @PostMapping(value = "/api/upload-package-image", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public Map<String, Object> uploadPackageImage(@RequestParam("upload") MultipartFile file) {
        Map<String, Object> response = new HashMap<>();

        if (file.isEmpty()) {
            return errorResponse("업로드된 파일이 없습니다.");
        }

        String originalFileName = file.getOriginalFilename();
        String extension = getExtension(originalFileName).toLowerCase();

        if (!ALLOWED_EXTENSIONS.contains(extension)) {
            return errorResponse("허용되지 않은 파일 형식입니다.");
        }

        try {
            String storedFileName = UUID.randomUUID().toString() + "." + extension;
            Path saveDir = Paths.get(uploadDir).toAbsolutePath().normalize();
            Files.createDirectories(saveDir);

            Path targetPath = saveDir.resolve(storedFileName);
            Files.copy(file.getInputStream(), targetPath, StandardCopyOption.REPLACE_EXISTING);

            response.put("uploaded", true);
            response.put("url", imageAccessUrlPrefix + storedFileName);
        } catch (IOException e) {
            return errorResponse("이미지 업로드 중 오류 발생: " + e.getMessage());
        }

        return response;
    }

    private Map<String, Object> errorResponse(String message) {
        Map<String, Object> response = new HashMap<>();
        response.put("uploaded", false);
        response.put("error", Map.of("message", message));
        return response;
    }

    private String getExtension(String filename) {
        int dotIndex = filename.lastIndexOf('.');
        return (dotIndex == -1) ? "" : filename.substring(dotIndex + 1);
    }
}
