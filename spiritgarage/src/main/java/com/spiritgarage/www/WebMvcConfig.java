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
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
}
