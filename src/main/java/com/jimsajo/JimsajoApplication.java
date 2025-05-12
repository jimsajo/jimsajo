package com.jimsajo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication

@MapperScan("com.jimsajo.Mapper") // <- 이거 꼭 있어야 함!
public class JimsajoApplication {

	public static void main(String[] args) {
		SpringApplication.run(JimsajoApplication.class, args);
	}

}
