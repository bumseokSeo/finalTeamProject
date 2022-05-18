package com.campus.myapp;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.campus.myapp.interceptor.LoginInterceptor;
import com.campus.myapp.interceptor.MasterInterceptor;


@Configuration
public class MvcConfiguration implements WebMvcConfigurer {

	
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(new LoginInterceptor())
		.excludePathPatterns("/","/img/**","/css/**","/js/**","/member/**","/map/**","/animalInfo/**","/board/adopt/adoptList"
				,"/board/adopt/adoptLists","/board/adopt/adoptListMethod");
		
		
		/*"/","/img/**","/css/**","/js/**","/member/**"*/
		/*"/master/**"*/
		
		registry.addInterceptor(new MasterInterceptor())
		.addPathPatterns("/admin/**");
	}
	
	
	
}

