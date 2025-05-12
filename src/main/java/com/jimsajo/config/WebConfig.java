package com.jimsajo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // /uploads/** URL 요청을 실제 로컬 uploads 폴더에 매핑
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:uploads/");
    }
}
