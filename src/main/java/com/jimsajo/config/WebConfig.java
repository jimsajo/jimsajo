package com.jimsajo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    private final FileStorageProperties properties;

    @Autowired
    public WebConfig(FileStorageProperties properties) {
        this.properties = properties;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 이미지 업로드 디렉토리 매핑
        registry.addResourceHandler("/uploads/images/**")
                .addResourceLocations("file:" + properties.getUploadDir());
        // 일반 파일 업로드 디렉토리 매핑
        registry.addResourceHandler("/uploads/files/**")
                .addResourceLocations("file:" + properties.getFileUploadDir());
    }
}
