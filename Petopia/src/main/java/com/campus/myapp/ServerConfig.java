package com.campus.myapp;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ServerConfig implements WebMvcConfigurer{
	@Bean 
	public CommonsMultipartResolver multipartResolver() {
	  CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
	  multipartResolver.setDefaultEncoding("UTF-8"); // 파일 인코딩 설정
	  multipartResolver.setMaxUploadSizePerFile(5 * 1024 * 1024); // 파일당 업로드 크기 제한 5mb
	  return multipartResolver; 
	}
}
