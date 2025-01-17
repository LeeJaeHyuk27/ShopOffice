package com.shop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
@ComponentScan(basePackages ="com.shop")
public class ShopOfficeApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShopOfficeApplication.class, args);
	}

}
