package com.bgs.reception;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.bgs.reception.dao")
public class ReceptionApplication {

	public static void main(String[] args) {
		SpringApplication.run(ReceptionApplication.class, args);
	}

}
