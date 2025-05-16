package com.jimsajo.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
@Component
@ConfigurationProperties(prefix = "file")
public class FileStorageProperties {
    /** 이미지 업로드 디렉토리 */
    private String uploadDir;
    /** 일반 파일 업로드 디렉토리 */
    private String fileUploadDir;

    public String getUploadDir() {
        return uploadDir;
    }
    public void setUploadDir(String uploadDir) {
        this.uploadDir = uploadDir;
    }

    public String getFileUploadDir() {
        return fileUploadDir;
    }
    public void setFileUploadDir(String fileUploadDir) {
        this.fileUploadDir = fileUploadDir;
    }
}
