package com.myspringboost;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
//@ComponentScan({"com.myspringboost.entity","com.myspringboost.service","com.myspringboost.repository.*"})
//@MapperScan({"com.myspringboost.entity.*","com.myspringboost.service.*","com.myspringboost.repository.*"})
@MapperScan({"com.myspringboost.repository.*"})
@EnableScheduling
public class WebApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebApplication.class, args);
	}
}
