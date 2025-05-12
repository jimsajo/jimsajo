package com.jimsajo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.jimsajo.Mapper") // Mapper 인터페이스가 위치한 패키지 경로
public class JimsajoApplication {
    public static void main(String[] args) {
        SpringApplication.run(JimsajoApplication.class, args);
    }
}
