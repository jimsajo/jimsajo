package com.jimsajo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import com.jimsajo.config.FileStorageProperties;

@SpringBootApplication
public class JimsajoApplication {
    public static void main(String[] args) {
        SpringApplication.run(JimsajoApplication.class, args);
    }
}
