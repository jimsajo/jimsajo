package com.jimsajo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
<<<<<<< HEAD

@MapperScan("com.jimsajo.Mapper") // <- 이거 꼭 있어야 함!
=======
@MapperScan("com.jimsajo.Mapper") // 이거 꼭 있어야 함!
>>>>>>> 29993824eaf82aaffb80e0e1017882867f085d25
public class JimsajoApplication {
    public static void main(String[] args) {
        SpringApplication.run(JimsajoApplication.class, args);
    }
}
