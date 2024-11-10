package com.uragil.LMS;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class UragilLMsystem1Application extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(UragilLMsystem1Application.class, args);
	}
	
	  @Override
	   protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
	      // TODO Auto-generated method stub
	      return builder.sources(UragilLMsystem1Application.class);
	   }
	   
}
