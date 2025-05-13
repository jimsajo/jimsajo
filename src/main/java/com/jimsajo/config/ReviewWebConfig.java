package com.jimsajo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ReviewWebConfig implements WebMvcConfigurer{
	 @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        // /images/** 로 접근하면 C:/upload/images 에 있는 파일을 보여줌
	        registry.addResourceHandler("/images2/**")
	                .addResourceLocations("file:///C:/upload/images2/");
	    }
}
