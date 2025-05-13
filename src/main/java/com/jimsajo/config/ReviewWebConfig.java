package com.jimsajo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ReviewWebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // /images2/** 경로는 C:/upload/images2/로 매핑
        registry.addResourceHandler("/images2/**")
                .addResourceLocations("file:///C:/upload/images2/");
    }
}

