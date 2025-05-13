package com.jimsajo.Controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.*;
import java.util.*;

@RestController
@RequestMapping("/api")
public class ImageUploadController {

    @Value("${file.upload-dir}")
    private String imageUploadDir;

    @Value("${file.access-url-prefix:/uploads/images/}")
    private String imageAccessUrlPrefix;

    private static final List<String> ALLOWED_EXTENSIONS = List.of("jpg", "jpeg", "png", "gif", "webp");
    private static final long MAX_FILE_SIZE = 5 * 1024 * 1024; // 최대 파일 크기 5MB

    @PostMapping(value = "/upload-image", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public Map<String, Object> handleImageUpload(@RequestParam("upload") MultipartFile file) {
        Map<String, Object> response = new HashMap<>();

        // 파일이 비어 있는지 확인
        if (file.isEmpty()) {
            return errorResponse("파일이 비어 있습니다.");
        }

        // 파일 크기 체크
        if (file.getSize() > MAX_FILE_SIZE) {
            return errorResponse("파일 크기가 너무 큽니다. 최대 5MB까지 업로드할 수 있습니다.");
        }

        String originalFileName = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));
        String extension = getExtension(originalFileName).toLowerCase();

        // 허용되지 않은 파일 형식 체크
        if (!ALLOWED_EXTENSIONS.contains(extension)) {
            return errorResponse("허용되지 않은 파일 형식입니다.");
        }

        try {
            // 고유한 파일 이름 생성
            String storedFileName = UUID.randomUUID().toString() + "." + extension;
            Path uploadPath = Paths.get(imageUploadDir).toAbsolutePath().normalize();

            // 디렉토리 생성
            Files.createDirectories(uploadPath);

            // 파일 저장
            Path targetLocation = uploadPath.resolve(storedFileName);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

            // 성공 응답 반환
            response.put("uploaded", true);
            response.put("url", imageAccessUrlPrefix + storedFileName);
        } catch (IOException ex) {
            return errorResponse("파일 저장 중 오류가 발생했습니다: " + ex.getMessage());
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
