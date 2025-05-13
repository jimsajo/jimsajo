package com.jimsajo.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${file.upload-dir}")
    private String uploadDir;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 이미지 파일 처리 경로를 정적 리소스로 설정
        registry.addResourceHandler("/uploads/images/**")
                .addResourceLocations("file:/C:/uploads/images/");
    }
}
