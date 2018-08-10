package com.myspringboost;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@EnableTransactionManagement
//@ComponentScan({"com.myspringboost.entity","com.myspringboost.service","com.myspringboost.repository.*"})
//@MapperScan({"com.myspringboost.entity.*","com.myspringboost.service.*","com.myspringboost.repository.*"})
@MapperScan({"com.myspringboost.repository.*"})
public class WebApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebApplication.class, args);

	}
}
