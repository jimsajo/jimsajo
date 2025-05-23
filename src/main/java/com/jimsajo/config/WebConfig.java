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
     	registry.addResourceHandler("/**")
        .addResourceLocations("classpath:/static/");

	    registry.addResourceHandler("/assets/css/**").addResourceLocations("classpath:/static/assets/css/");
	    registry.addResourceHandler("/assets/js/**").addResourceLocations("classpath:/static/assets/js/");
	    registry.addResourceHandler("/assets/img/**").addResourceLocations("classpath:/static/assets/img/");
	    registry.addResourceHandler("/assets/vendor/**").addResourceLocations("classpath:/static/assets/vendor/");
	    registry.addResourceHandler("/js/**").addResourceLocations("classpath:/static/js/");

        registry.addResourceHandler("/assets/img/package/**")
                .addResourceLocations("file:///" + uploadDir);

    }
}
