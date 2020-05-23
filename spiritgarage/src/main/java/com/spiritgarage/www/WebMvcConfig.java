package com.spiritgarage.www;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig  implements WebMvcConfigurer{
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new Interceptor()).addPathPatterns("/admin/mngrManagement");
		registry.addInterceptor(new Interceptor()).addPathPatterns("/admin/reservationManagement");
		registry.addInterceptor(new Interceptor()).addPathPatterns("/admin/noticeManagement");
		registry.addInterceptor(new Interceptor()).addPathPatterns("/admin/noticeReg");
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
}
